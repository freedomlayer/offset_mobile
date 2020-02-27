import 'dart:developer' as developer;

import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

AppState handleInTransactionsAction(
    InTransactionsView inTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    InTransactionsAction inTransactionsAction) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return inTransactionsAction.match(
      back: () {
        return inTransactionsView.match(
            home: () => createState(AppView.home()),
            transaction: (_a, _b) =>
                createState(AppView.inTransactions(InTransactionsView.home())),
            sendInvoice: (nodeName, invoiceId) => createState(
                AppView.inTransactions(
                    InTransactionsView.transaction(nodeName, invoiceId))),
            collected: (nodeName, invoiceId) =>
                createState(AppView.inTransactions(InTransactionsView.home())),
            selectCardApplyCommit: (_) => createState(AppView.home()));
      },
      selectInvoice: (nodeName, invoiceId) => createState(
          AppView.inTransactions(
              InTransactionsView.transaction(nodeName, invoiceId))),
      applyCommit: (commit) => handleInTransactionsApplyCommitAction(commit, inTransactionsView, nodesStates),
      resendInvoice: () {
        final newAppState = inTransactionsView.match(
            home: () => null,
            transaction: (nodeName, invoiceId) => createState(
                AppView.inTransactions(
                    InTransactionsView.sendInvoice(nodeName, invoiceId))),
            sendInvoice: (_nodeName, _invoiceId) => null,
            collected: (_nodeName, _invoiceId) => null,
            selectCardApplyCommit: (_) => null);

        if (newAppState == null) {
          developer.log(
              'handleInTransactionsAction(): Received action resendInvoice during wrong view');

          return createState(AppView.inTransactions(inTransactionsView));
        } else {
          return newAppState;
        }
      },
      collectInvoice: () => handleInTransactionsCollectInvoiceAction(inTransactionsView, nodesStates),
      cancelInvoice: () => handleInTransactionsCancelInvoiceAction(inTransactionsView, nodesStates));
}

AppState handleInTransactionsApplyCommitAction(
    Commit commit,
    InTransactionsView inTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates) {
  throw UnimplementedError();
}

AppState handleInTransactionsCollectInvoiceAction(
    InTransactionsView inTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates) {
  throw UnimplementedError();
}

AppState handleInTransactionsCancelInvoiceAction(
    InTransactionsView inTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates) {
  throw UnimplementedError();
}


