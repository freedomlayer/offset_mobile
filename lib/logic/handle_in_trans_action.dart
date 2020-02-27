import 'dart:math';
import 'dart:developer' as developer;

import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

import '../rand.dart';

AppState handleInTransactionsAction(
    InTransactionsView inTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    InTransactionsAction inTransactionsAction,
    Random rand) {
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
      applyCommit: (nodeName, commit) => handleInTransactionsApplyCommitAction(nodeName, commit, inTransactionsView, nodesStates, rand),
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
    NodeName nodeName,
    Commit commit,
    InTransactionsView inTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Random rand) {

  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    developer.log(
        'handleInTransactionsApplyCommitAction(): node $nodeName does not exist!');
    return createState(AppView.inTransactions(inTransactionsView));
  }

  final nodeId = nodeState.inner.match(
      open: (nodeOpen) => nodeOpen.nodeId,
      closed: () => null);

  if (nodeId == null) {
    developer.log(
        'handleInTransactionsApplyCommitAction(): node $nodeName is not open!');
    return createState(AppView.inTransactions(inTransactionsView));
  }

  // Send a RequestVerifyCommit message:

  // TODO: Possibly change the protocol in the future to work with a more
  // direct model (Attempt to upload commit instead of request/response model).
  final requestVerifyCommitId = genUid(rand);
  final requestVerifyCommit = RequestVerifyCommit((b) => b..requestId = requestVerifyCommitId
                                                          ..commit = commit.toBuilder());

  final userToCompact = UserToCompact.requestVerifyCommit(requestVerifyCommit);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.inTransactions(inTransactionsView);
  final newView = AppView.inTransactions(InTransactionsView.transaction(nodeName, commit.invoiceId));

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
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


