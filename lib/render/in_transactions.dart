import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../state/state.dart';
import '../actions/actions.dart';

import 'utils/share_file.dart';
import 'utils/qr_show.dart';

import 'frame.dart';

Widget renderInTransactions(
    InTransactionsView inTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(InTransactionsAction) queueAction) {
  return inTransactionsView.match(
      home: () => _renderHome(nodesStates, queueAction),
      transaction: (nodeName, invoiceId) =>
          _renderTransaction(nodeName, invoiceId, nodesStates, queueAction),
      sendInvoice: (nodeName, invoiceId) =>
          _renderSendInvoice(nodeName, invoiceId, nodesStates, queueAction),
      collected: (nodeName, invoiceFile) =>
          _renderCollected(nodeName, invoiceFile, nodesStates, queueAction),
      selectCardApplyCommit: (commit) =>
          _renderSelectCardApplyCommit(commit, nodesStates, queueAction));
}

/// A single outgoing transaction's information
class InTransaction {
  final NodeName nodeName;
  Currency currency;
  U128 totalDestPayment;
  final InvoiceId invoiceId;
  final String description;
  bool isCommited;
  Generation generation;

  InTransaction(
      {this.nodeName,
      this.currency,
      this.totalDestPayment,
      this.invoiceId,
      this.description,
      this.isCommited,
      this.generation});
}

List<InTransaction> _loadTransactions(
    BuiltMap<NodeName, NodeState> nodesStates) {
  final inTransactions = <InTransaction>[];

  nodesStates.forEach((nodeName, nodeState) {
    final nodeOpen =
        nodeState.inner.match(closed: () => null, open: (nodeOpen) => nodeOpen);

    if (nodeOpen == null) {
      return; // continue
    }

    final openInvoices = nodeOpen.compactReport.openInvoices;
    openInvoices.forEach((invoiceId, openInvoice) {
      final outTransaction = InTransaction(
          nodeName: nodeName,
          currency: openInvoice.currency,
          invoiceId: invoiceId,
          totalDestPayment: openInvoice.totalDestPayment,
          description: openInvoice.description,
          generation: openInvoice.generation,
          isCommited: openInvoice.isCommited);
      inTransactions.add(outTransaction);
    });
  });

  inTransactions.sort((a, b) {
    final cmpList = [
      // Sort chronologically
      a.generation.compareTo(b.generation),
      // Use invoiceId as tie breaker:
      a.invoiceId.compareTo(b.invoiceId)
    ];
    for (final val in cmpList) {
      if (val != 0) {
        return val;
      }
    }
    return 0;
  });

  return inTransactions;
}

Widget _renderHome(BuiltMap<NodeName, NodeState> nodesStates,
    Function(InTransactionsAction) queueAction) {
  final inTransactions = _loadTransactions(nodesStates);
  final children = <Widget>[];

  for (final inTransaction in inTransactions) {
    final statusString = inTransaction.isCommited ? 'Received' : 'Pending';
    final outEntry = Card(
        key: Key(inTransaction.invoiceId.inner),
        child: InkWell(
            onTap: () => queueAction(InTransactionsAction.selectInvoice(
                inTransaction.nodeName, inTransaction.invoiceId)),
            child: Text(
                '${inTransaction.nodeName.inner}: ${inTransaction.totalDestPayment.inner}\n' +
                    '${inTransaction.description}\n' +
                    'status: $statusString')));
    children.add(outEntry);
  }

  final listView = ListView(padding: EdgeInsets.all(8), children: children);

  return frame(
      title: Text('Incoming transactions'),
      body: listView,
      backAction: () => queueAction(InTransactionsAction.back()));
}

Widget _renderTransaction(
    NodeName nodeName,
    InvoiceId invoiceId,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(InTransactionsAction) queueAction) {
  final nodeState = nodesStates[nodeName];
  assert(nodeState != null);

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);
  assert(nodeOpen != null);

  final openInvoice = nodeOpen.compactReport.openInvoices[invoiceId];
  assert(openInvoice != null);

  final statusString = openInvoice.isCommited ? 'Received' : 'Pending';

  final buttons = openInvoice.isCommited
      ? (() => Center(
              child: Column(children: [
            Center(
                child: RaisedButton(
                    onPressed: () => queueAction(
                        InTransactionsAction.collectInvoice(
                            nodeName, invoiceId)),
                    child: Text('Collect'))),
            SizedBox(height: 15),
            Center(
                child: RaisedButton(
                    onPressed: () => queueAction(
                        InTransactionsAction.cancelInvoice(
                            nodeName, invoiceId)),
                    child: Text('Cancel Invoice'))),
          ])))()
      : (() => Center(
              child: Column(children: [
            Center(child: Text('How to receive commitment?')),
            SizedBox(height: 10),
            Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  RaisedButton(
                      child: Text('QR code'),
                      onPressed: () => throw UnimplementedError()),
                  SizedBox(height: 15),
                  RaisedButton(
                      child: Text('File'),
                      onPressed: () => throw UnimplementedError()),
                ])),
            RaisedButton(
                child: Text('Resend invoice'),
                onPressed: () => throw UnimplementedError()),
            SizedBox(height: 15),
            RaisedButton(
                child: Text('Cancel invoice'),
                onPressed: () => throw UnimplementedError()),
          ])))();

  // RaisedButton(onPressed: null, child: Text('Discard'))))();

  final List<Widget> buttonsChild = buttons != null ? [buttons] : [];

  final body = Center(
      child: Column(
          children: <Widget>[
                SizedBox(height: 10),
                Text('Card: ${nodeName.inner}'),
                SizedBox(height: 10),
                Text('Amount: ${openInvoice.totalDestPayment.inner}'),
                SizedBox(height: 10),
                Text('Description: ${openInvoice.description}'),
                SizedBox(height: 10),
                Text('Status: $statusString'),
                SizedBox(height: 20),
              ] +
              buttonsChild));

  return frame(
      title: Text('Outgoing transaction'),
      body: body,
      backAction: () => queueAction(InTransactionsAction.back()));
}

Widget _renderSendInvoice(
    NodeName nodeName,
    InvoiceId invoiceId,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(InTransactionsAction) queueAction) {
  final nodeState = nodesStates[nodeName];
  assert(nodeState != null);

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);
  assert(nodeOpen != null);

  final openInvoice = nodeOpen.compactReport.openInvoices[invoiceId];
  assert(openInvoice != null);

  final invoiceFile = InvoiceFile((b) => b
    ..invoiceId = invoiceId
    ..currency = openInvoice.currency
    ..destPublicKey = nodeOpen.compactReport.localPublicKey
    ..destPayment = openInvoice.totalDestPayment
    ..description = openInvoice.description);

  final body = Center(
      child: Column(children: [
    SizedBox(height: 20),
    Center(child: Text('Send invoice to buyer')),
    Center(child: qrShow<InvoiceFile>(invoiceFile)),
    SizedBox(height: 20),
    Center(
        child: RaisedButton(
            // TODO: Create a better name for the invoice file:
            onPressed: () async => await shareFile<InvoiceFile>(
                invoiceFile, 'invoice.$INVOICE_EXT'),
            child: Text('Send File'))),
  ]));

  return frame(
      title: Text('Send invoice'),
      body: body,
      backAction: () => queueAction(InTransactionsAction.back()));
}

Widget _renderCollected(
    NodeName nodeName,
    InvoiceFile invoiceFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(InTransactionsAction) queueAction) {
  final nodeState = nodesStates[nodeName];
  assert(nodeState != null);

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);
  assert(nodeOpen != null);

  final body = Center(
      child: Column(children: <Widget>[
    SizedBox(height: 10),
    Text('Card: ${nodeName.inner}'),
    SizedBox(height: 10),
    Text('Amount: ${invoiceFile.destPayment.inner}'),
    SizedBox(height: 10),
    Text('Description: ${invoiceFile.description}'),
    SizedBox(height: 20),
    Center(
        child: RaisedButton(
            onPressed: () async => await shareFile<InvoiceFile>(
                invoiceFile, 'invoice.$INVOICE_EXT'),
            child: Text('Save invoice'))),
  ]));

  return frame(
      title: Text('Payment collected'),
      body: body,
      backAction: () => queueAction(InTransactionsAction.back()));
}

Widget _renderSelectCardApplyCommit(
    Commit commit,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(InTransactionsAction) queueAction) {
  final children = <Widget>[];

  nodesStates.forEach((nodeName, nodeState) {
    // We only show open nodes. (We can not configure closed nodes):
    final cardEntry = nodeState.inner.isOpen
        ? ListTile(
            key: Key(nodeName.inner),
            title: Text('${nodeName.inner}'),
            onTap: () =>
                queueAction(InTransactionsAction.applyCommit(nodeName, commit)))
        : ListTile(
            key: Key(nodeName.inner),
            title: Text('${nodeName.inner}'),
            enabled: false);

    children.add(cardEntry);
  });

  final listView =
      ListView(padding: const EdgeInsets.all(8), children: children);

  return frame(
      title: Text('Apply Commit'),
      body: listView,
      backAction: () => queueAction(InTransactionsAction.back()));
}
