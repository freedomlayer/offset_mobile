import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../state/state.dart';
import '../actions/actions.dart';

import 'utils/share_file.dart';
import 'utils/qr_show.dart';

import 'utils/file_picker.dart';
import 'utils/qr_scan.dart';
import 'utils/amount.dart';

import 'select_card.dart';

import 'frame.dart';

import '../logger.dart';

final logger = createLogger('render::in_transactions');

Widget renderInTransactions(
    InTransactionsView inTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(InTransactionsAction) queueAction) {
  return inTransactionsView.match(
      home: () => _renderHome(nodesStates, queueAction),
      transaction: (nodeName, invoiceId) =>
          _renderTransaction(nodeName, invoiceId, nodesStates, queueAction),
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
  bool isCommitted;
  Generation generation;

  InTransaction(
      {this.nodeName,
      this.currency,
      this.totalDestPayment,
      this.invoiceId,
      this.description,
      this.isCommitted,
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
          isCommitted: openInvoice.isCommitted);
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

  return inTransactions.reversed.toList();
}

Widget _renderHome(BuiltMap<NodeName, NodeState> nodesStates,
    Function(InTransactionsAction) queueAction) {
  final inTransactions = _loadTransactions(nodesStates);
  final children = <Widget>[];

  for (final inTransaction in inTransactions) {
    final trailing = inTransaction.isCommitted
        ? FaIcon(FontAwesomeIcons.thermometerFull, color: Colors.green)
        : FaIcon(FontAwesomeIcons.thermometerHalf, color: Colors.orange);
    final outEntry = ListTile(
        key: Key(inTransaction.invoiceId.inner),
        leading: Icon(Icons.call_received),
        title: InkWell(
            onTap: () => queueAction(InTransactionsAction.selectInvoice(
                inTransaction.nodeName, inTransaction.invoiceId)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${inTransaction.nodeName.inner}'),
              Text(
                  '${amountToString(inTransaction.totalDestPayment)} ${inTransaction.currency.inner}',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('${inTransaction.description}'),
            ])),
        trailing: trailing);

    children.add(outEntry);
  }

  final listView = ListView.separated(
      padding: EdgeInsets.all(8),
      itemCount: children.length,
      separatorBuilder: (context, index) => Divider(
            color: Colors.grey,
          ),
      itemBuilder: (context, index) => children[index]);

  return frame(
      title: Text('Incoming'),
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

  return openInvoice.isCommitted
      ? _renderCommittedTransaction(
          nodeName, invoiceId, openInvoice, queueAction)
      : _renderUncommittedTransaction(nodeOpen.compactReport.localPublicKey,
          nodeName, invoiceId, openInvoice, queueAction);
}

Widget _renderCommittedTransaction(NodeName nodeName, InvoiceId invoiceId,
    OpenInvoice openInvoice, Function(InTransactionsAction) queueAction) {
  final body = ListView(padding: EdgeInsets.all(8), children: <Widget>[
    ListTile(
        leading: FaIcon(FontAwesomeIcons.creditCard),
        title: Text('${nodeName.inner}')),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.coins),
        title: Text(
            '${amountToString(openInvoice.totalDestPayment)} ${openInvoice.currency.inner}')),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.comment),
        title: Text('${openInvoice.description}')),
    ListTile(
        leading:
            const FaIcon(FontAwesomeIcons.thermometerFull, color: Colors.green),
        title: Text('Received'),
        trailing: FlatButton(
            child: const Icon(Icons.cancel, color: Colors.red),
            onPressed: () => queueAction(
                InTransactionsAction.cancelInvoice(nodeName, invoiceId)))),
    SizedBox(height: 16.0),
    Center(
        child: RaisedButton.icon(
            icon: const FaIcon(FontAwesomeIcons.truck, color: Colors.green),
            onPressed: () => queueAction(
                InTransactionsAction.collectInvoice(nodeName, invoiceId)),
            label: Text('Collect'))),
  ]);

  return frame(
      title: Text('Incoming transaction'),
      body: body,
      backAction: () => queueAction(InTransactionsAction.back()));
}

Widget _renderUncommittedTransaction(
    PublicKey localPublicKey,
    NodeName nodeName,
    InvoiceId invoiceId,
    OpenInvoice openInvoice,
    Function(InTransactionsAction) queueAction) {
  final Future<void> Function() scanQrCode = () async {
    final commitFile =
        await qrScan<Commit>().catchError((e) => logger.w('qrScan error: $e'));
    if (commitFile != null) {
      queueAction(InTransactionsAction.applyCommit(nodeName, commitFile));
    }
  };

  final Future<void> Function() openFileExplorer = () async {
    final commitFile = await pickFromFile<Commit>(COMMIT_EXT)
        .catchError((e) => logger.w('pickFromFile error: $e'));
    if (commitFile != null) {
      queueAction(InTransactionsAction.applyCommit(nodeName, commitFile));
    }
  };

  final invoiceFile = InvoiceFile((b) => b
    ..invoiceId = invoiceId
    ..currency = openInvoice.currency
    ..destPublicKey = localPublicKey
    ..destPayment = openInvoice.totalDestPayment
    ..description = openInvoice.description);

  final baseChildren = <Widget>[
    ListTile(
        leading: FaIcon(FontAwesomeIcons.creditCard),
        title: Text('${nodeName.inner}')),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.coins),
        title: Text(
            '${amountToString(openInvoice.totalDestPayment)} ${openInvoice.currency.inner}')),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.comment),
        title: Text('${openInvoice.description}')),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.thermometerHalf,
            color: Colors.orange),
        title: Text('Pending'),
        trailing: FlatButton(
            child: const Icon(Icons.cancel, color: Colors.red),
            onPressed: () => queueAction(
                InTransactionsAction.cancelInvoice(nodeName, invoiceId)))),
  ];

  final invoiceBody = ListView(
      padding: EdgeInsets.all(8),
      children: baseChildren +
          [
            Center(
                child: Text('Invoice',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0))),
            ListTile(
              title: Center(child: qrShow<InvoiceFile>(invoiceFile)),
            ),
            ListTile(
                title: Align(
                    child: RaisedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.shareAlt),
              label: Text('Send Invoice'),
              // TODO: Create a better name for the invoice file:
              onPressed: () async => await shareFile<InvoiceFile>(
                  invoiceFile, 'invoice.$INVOICE_EXT'),
            ))),
          ]);

  final commitBody = ListView(padding: EdgeInsets.all(8), children: [
    ListTile(
        title: Center(
            child: Text('How to receive commitment?',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)))),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.qrcode),
        onTap: scanQrCode,
        title: Text('QR code')),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.file),
        onTap: openFileExplorer,
        title: Text('File')),
  ]);

  return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              title: Text('Incoming transaction'),
              leading: BackButton(
                onPressed: () => queueAction(InTransactionsAction.back()),
              ),
              bottom: TabBar(tabs: [
                Tab(
                    icon: const FaIcon(FontAwesomeIcons.fileInvoiceDollar),
                    text: 'Invoice'),
                Tab(icon: const FaIcon(FontAwesomeIcons.stamp), text: 'Commit'),
              ])),
          body: TabBarView(children: [
            invoiceBody,
            commitBody,
          ])));
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
    Text('Amount: ${amountToString(invoiceFile.destPayment)}'),
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
  final canCardPay = (nodeName) => nodesStates[nodeName].inner.match(
      closed: () => false,
      open: (openNode) {
        for (final entry in openNode.compactReport.friends.entries) {
          final res = entry.value.channelStatus.match(
              inconsistent: (_) => false,
              consistent: (channelConsistentReport) =>
                  channelConsistentReport.currencyReports.isNotEmpty);
          if (res == true) {
            return true;
          }
        }
        return false;
      });

  final body = renderSelectCard(
      nodesStates.keys,
      List.from(nodesStates.keys)
        ..removeWhere((nodeName) => !canCardPay(nodeName)),
      (nodeName) =>
          queueAction(InTransactionsAction.applyCommit(nodeName, commit)));

  return frame(
      title: Text('Apply commit'),
      body: body,
      backAction: () => queueAction(InTransactionsAction.back()));
}
