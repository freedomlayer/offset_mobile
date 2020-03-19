import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../state/state.dart';
import '../actions/actions.dart';

import 'utils/share_file.dart';
import 'utils/qr_show.dart';

import 'frame.dart';

Widget renderOutTransactions(
    OutTransactionsView outTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(OutTransactionsAction) queueAction) {
  return outTransactionsView.match(
      home: () => _renderHome(nodesStates, queueAction),
      transaction: (nodeName, paymentId) =>
          _renderTransaction(nodeName, paymentId, nodesStates, queueAction));
}

/// A single outgoing transaction's information
class OutTransaction {
  final NodeName nodeName;
  Currency currency;
  final PaymentId paymentId;
  U128 destPayment;
  final String description;
  Generation generation;
  String status;

  OutTransaction(
      {this.nodeName,
      this.currency,
      this.paymentId,
      this.destPayment,
      this.description,
      this.generation,
      this.status});
}

String _statusAsString(OpenPaymentStatus openPaymentStatus) {
  return openPaymentStatus.match(
      searchingRoute: (_) => 'searching route',
      foundRoute: (_a, _b) => 'found route',
      sending: (_) => 'sending',
      commit: (_a, _b) => 'commit',
      success: (_a, _b, _c) => 'success',
      failure: (_) => 'failure');
}

List<OutTransaction> _loadTransactions(
    BuiltMap<NodeName, NodeState> nodesStates) {
  final outTransactions = <OutTransaction>[];

  nodesStates.forEach((nodeName, nodeState) {
    final nodeOpen =
        nodeState.inner.match(closed: () => null, open: (nodeOpen) => nodeOpen);

    if (nodeOpen == null) {
      return; // continue
    }

    final openPayments = nodeOpen.compactReport.openPayments;
    openPayments.forEach((paymentId, openPayment) {
      final outTransaction = OutTransaction(
          nodeName: nodeName,
          currency: openPayment.currency,
          paymentId: paymentId,
          destPayment: openPayment.destPayment,
          description: openPayment.description,
          generation: openPayment.generation,
          status: _statusAsString(openPayment.status));
      outTransactions.add(outTransaction);
    });
  });

  outTransactions.sort((a, b) {
    final cmpList = [
      // Sort chronologically
      a.generation.compareTo(b.generation),
      // Use PaymentId as tie breaker:
      a.paymentId.compareTo(b.paymentId)
    ];
    for (final val in cmpList) {
      if (val != 0) {
        return val;
      }
    }
    return 0;
  });

  return outTransactions;
}

Widget _renderHome(BuiltMap<NodeName, NodeState> nodesStates,
    Function(OutTransactionsAction) queueAction) {
  final outTransactions = _loadTransactions(nodesStates);
  final children = <Widget>[];

  for (final outTransaction in outTransactions) {
    final outEntry = Card(
        key: Key(outTransaction.paymentId.inner),
        child: InkWell(
            onTap: () => queueAction(OutTransactionsAction.selectPayment(
                outTransaction.nodeName, outTransaction.paymentId)),
            child: Text(
                '${outTransaction.nodeName.inner}: ${outTransaction.destPayment.inner}\n' +
                    '${outTransaction.description}\n' +
                    'status: ${outTransaction.status}')));
    children.add(outEntry);
  }

  final listView = ListView(padding: EdgeInsets.all(8), children: children);

  return frame(
      title: Text('Outgoing transactions'),
      body: listView,
      backAction: () => queueAction(OutTransactionsAction.back()));
}

Widget _renderTransaction(
    NodeName nodeName,
    PaymentId paymentId,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(OutTransactionsAction) queueAction) {
  final nodeState = nodesStates[nodeName];
  assert(nodeState != null);

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);
  assert(nodeOpen != null);

  final openPayment = nodeOpen.compactReport.openPayments[paymentId];
  assert(openPayment != null);

  return openPayment.status.match(
      searchingRoute: (_) =>
          _renderSearchingRoute(nodeName, paymentId, openPayment, queueAction),
      foundRoute: (_, fees) => _renderFoundRoute(
          fees, nodeName, paymentId, openPayment, queueAction),
      sending: (fees) =>
          _renderSending(fees, nodeName, paymentId, openPayment, queueAction),
      commit: (commit, fees) => _renderCommit(
          commit, fees, nodeName, paymentId, openPayment, queueAction),
      success: (receipt, fees, _) => _renderSuccess(
          receipt, fees, nodeName, paymentId, openPayment, queueAction),
      failure: (_) =>
          _renderFailure(nodeName, paymentId, openPayment, queueAction));
}

Widget _renderSearchingRoute(NodeName nodeName, PaymentId paymentId,
    OpenPayment openPayment, Function(OutTransactionsAction) queueAction) {
  final body = Center(
      child: Column(children: <Widget>[
    Center(child: Text('Searching route')),
    SizedBox(height: 10),
    Text('Card: ${nodeName.inner}'),
    SizedBox(height: 10),
    Text('Amount: ${openPayment.destPayment.inner}'),
    SizedBox(height: 10),
    Text('Description: ${openPayment.description}'),
    Center(child: CircularProgressIndicator(value: null)),
    SizedBox(height: 20),
    Center(
        child: RaisedButton(
            onPressed: () => queueAction(OutTransactionsAction.cancelPayment(nodeName, paymentId)),
            child: Text('Cancel'))),
  ]));

  return frame(
      title: Text('Outgoing transaction'),
      body: body,
      backAction: () => queueAction(OutTransactionsAction.back()));
}

Widget _renderFoundRoute(U128 fees, NodeName nodeName, PaymentId paymentId,
    OpenPayment openPayment, Function(OutTransactionsAction) queueAction) {
  final body = Center(
      child: Column(children: <Widget>[
    SizedBox(height: 10),
    Center(child: Text('Confirm payment')),
    SizedBox(height: 10),
    Text('Card: ${nodeName.inner}'),
    SizedBox(height: 10),
    Text('Amount: ${openPayment.destPayment.inner}'),
    SizedBox(height: 10),
    Text('Description: ${openPayment.description}'),
    SizedBox(height: 10),
    Text('Fees: ${fees.inner}'),
    SizedBox(height: 20),
    Center(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      RaisedButton(
          onPressed: queueAction(
              OutTransactionsAction.confirmFees(nodeName, paymentId)),
          child: Text('Confirm')),
      RaisedButton(
          onPressed: queueAction(
              OutTransactionsAction.cancelPayment(nodeName, paymentId)),
          child: Text('Cancel')),
    ]))
  ]));

  return frame(
      title: Text('Outgoing transaction'),
      body: body,
      backAction: () => queueAction(OutTransactionsAction.back()));
}

Widget _renderSending(U128 fees, NodeName nodeName, PaymentId paymentId,
    OpenPayment openPayment, Function(OutTransactionsAction) queueAction) {
  final body = Center(
      child: Column(children: <Widget>[
    Center(child: Text('Payment in progress')),
    SizedBox(height: 10),
    Text('Card: ${nodeName.inner}'),
    SizedBox(height: 10),
    Text('Amount: ${openPayment.destPayment.inner}'),
    SizedBox(height: 10),
    Text('Description: ${openPayment.description}'),
    SizedBox(height: 10),
    Text('Fees: ${fees.inner}'),
    Center(child: CircularProgressIndicator(value: null)),
    SizedBox(height: 20),
    Center(
        child: RaisedButton(
            onPressed: () => queueAction(OutTransactionsAction.cancelPayment(nodeName, paymentId)),
            child: Text('Cancel'))),
  ]));

  return frame(
      title: Text('Outgoing transaction'),
      body: body,
      backAction: () => queueAction(OutTransactionsAction.back()));
}

Widget _renderCommit(
    Commit commit,
    U128 fees,
    NodeName nodeName,
    PaymentId paymentId,
    OpenPayment openPayment,
    Function(OutTransactionsAction) queueAction) {
  final body = Center(
      child: Column(children: <Widget>[
    SizedBox(height: 10),
    Center(child: Text('Send commitment')),
    SizedBox(height: 10),
    Text('Card: ${nodeName.inner}'),
    SizedBox(height: 10),
    Text('Amount: ${openPayment.destPayment.inner}'),
    SizedBox(height: 10),
    Text('Description: ${openPayment.description}'),
    SizedBox(height: 10),
    Text('Fees: ${fees.inner}'),
    SizedBox(height: 20),
    Center(
        child: Text(
            'Payment is only complete when the seller receives the commitment')),
    Center(child: qrShow<Commit>(commit)),
    SizedBox(height: 20),
    Center(
        child: RaisedButton(
            // TODO: Create a better name for the commitment file:
            onPressed: () async =>
                await shareFile<Commit>(commit, 'commit.$COMMIT_EXT'),
            child: Text('Send File'))),
  ]));

  return frame(
      title: Text('Outgoing transaction'),
      body: body,
      backAction: () => queueAction(OutTransactionsAction.back()));
}

Widget _renderSuccess(
    Receipt receipt,
    U128 fees,
    NodeName nodeName,
    PaymentId paymentId,
    OpenPayment openPayment,
    Function(OutTransactionsAction) queueAction) {
  final body = Center(
      child: Column(children: <Widget>[
    SizedBox(height: 10),
    Center(child: Text('Success')),
    SizedBox(height: 10),
    Text('Card: ${nodeName.inner}'),
    SizedBox(height: 10),
    Text('Amount: ${openPayment.destPayment.inner}'),
    SizedBox(height: 10),
    Text('Description: ${openPayment.description}'),
    SizedBox(height: 10),
    Text('Fees: ${fees.inner}'),
    SizedBox(height: 20),
    Center(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      RaisedButton(
          // TODO: Create a better name for the produced receipt file:
          onPressed: () async =>
              await shareFile<Receipt>(receipt, 'receipt.receipt'),
          child: Text('Send Receipt')),
      RaisedButton(
          onPressed: queueAction(
              OutTransactionsAction.discardPayment(nodeName, paymentId)),
          child: Text('Discard')),
    ]))
  ]));

  return frame(
      title: Text('Outgoing transaction'),
      body: body,
      backAction: () => queueAction(OutTransactionsAction.back()));
}

Widget _renderFailure(NodeName nodeName, PaymentId paymentId,
    OpenPayment openPayment, Function(OutTransactionsAction) queueAction) {
  final body = Center(
      child: Column(children: <Widget>[
    SizedBox(height: 10),
    Center(child: Text('Failure')),
    SizedBox(height: 10),
    Text('Card: ${nodeName.inner}'),
    SizedBox(height: 10),
    Text('Amount: ${openPayment.destPayment.inner}'),
    SizedBox(height: 10),
    Text('Description: ${openPayment.description}'),
    SizedBox(height: 20),
    Center(
        child: RaisedButton(
            onPressed: queueAction(
                OutTransactionsAction.discardPayment(nodeName, paymentId)),
            child: Text('Discard')))
  ]));

  return frame(
      title: Text('Outgoing transaction'),
      body: body,
      backAction: () => queueAction(OutTransactionsAction.back()));
}

