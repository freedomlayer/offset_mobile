import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../state/state.dart';
import '../actions/actions.dart';

import 'frame.dart';

Widget renderOutTransactions(
    OutTransactionsView outTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(OutTransactionsAction) queueAction) {
  return outTransactionsView.match(
      home: () => _renderHome(nodesStates, queueAction),
      transaction: (nodeName, paymentId) =>
          _renderTransaction(nodeName, paymentId, nodesStates, queueAction),
      sendCommit: (nodeName, paymentId) =>
          _renderSendCommit(nodeName, paymentId, nodesStates, queueAction));
}

class OutTransaction {
  final NodeName nodeName;
  Currency currency;
  final PaymentId paymentId;
  U128 destPayment;
  final String description;
  Generation generation;

  OutTransaction(
      {this.nodeName,
      this.currency,
      this.paymentId,
      this.destPayment,
      this.description,
      this.generation});
}

List<OutTransaction> loadTransactions(
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
          generation: openPayment.generation);
      outTransactions.add(outTransaction);
    });
  });

  throw UnimplementedError();
}

Widget _renderHome(BuiltMap<NodeName, NodeState> nodesStates,
    Function(OutTransactionsAction) queueAction) {
  /*
  final children = <Widget>[];
  final sortedNodeNames = balances.keys.toList()
    ..sort((c1, c2) => c1.inner.compareTo(c2.inner));

  for (final nodeEntry in nodesStates.entries) {
    final nodeName = nodeEntry.key;
    final nodeState = nodeEntry.value;

    final nodeOpen = nodeState.inner.match(
        closed: () => null,
        open: (nodeOpen) => nodeOpen);

    if (nodeOpen == null) {
      continue;
    }

    final openPayments = nodeOpen.compactReport.openPayments;

    final outEntry = Card();
    children.add(outEntry);
  }

  final listView = ListView(padding: EdgeInsets.all(8), children: children);

  return frame(
      title: Text('Outgoing transactions'),
      body: listView,
      backAction: () => queueAction(BalancesAction.back()));
    */
  throw UnimplementedError();
}

Widget _renderTransaction(
    NodeName nodeName,
    PaymentId paymentId,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(OutTransactionsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderSendCommit(
    NodeName nodeName,
    PaymentId paymentId,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(OutTransactionsAction) queueAction) {
  throw UnimplementedError();
}
