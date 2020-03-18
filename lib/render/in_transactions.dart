import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../state/state.dart';
import '../actions/actions.dart';

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
      collected: (nodeName, invoiceId) =>
          _renderCollected(nodeName, invoiceId, nodesStates, queueAction),
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
  throw UnimplementedError();
}

Widget _renderSendInvoice(
    NodeName nodeName,
    InvoiceId invoiceId,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(InTransactionsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderCollected(
    NodeName nodeName,
    InvoiceId invoiceId,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(InTransactionsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderSelectCardApplyCommit(
    Commit commit,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(InTransactionsAction) queueAction) {
  throw UnimplementedError();
}
