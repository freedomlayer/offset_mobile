import 'dart:math';

import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../state/state.dart';

import '../rand.dart';
import '../logger.dart';

final logger = createLogger('logic::handle_in_trans_action');

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
            collected: (_a, _b) =>
                createState(AppView.inTransactions(InTransactionsView.home())),
            selectCardApplyCommit: (_) => createState(AppView.home()));
      },
      selectInvoice: (nodeName, invoiceId) => createState(
          AppView.inTransactions(
              InTransactionsView.transaction(nodeName, invoiceId))),
      applyCommit: (nodeName, commit) => _handleApplyCommit(
          nodeName, commit, inTransactionsView, nodesStates, rand),
      collectInvoice: (nodeName, invoiceId) => _handleCollectInvoice(
          nodeName, invoiceId, inTransactionsView, nodesStates, rand),
      cancelInvoice: (nodeName, invoiceId) => _handleCancelInvoice(
          nodeName, invoiceId, inTransactionsView, nodesStates, rand));
}

AppState _handleApplyCommit(
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
    logger.w('_handleApplyCommit(): node $nodeName does not exist!');
    return createState(AppView.inTransactions(inTransactionsView));
  }

  final nodeId = nodeState.inner
      .match(open: (nodeOpen) => nodeOpen.nodeId, closed: () => null);

  if (nodeId == null) {
    logger.w('_handleApplyCommit(): node $nodeName is not open!');
    return createState(AppView.inTransactions(inTransactionsView));
  }

  // Send a RequestVerifyCommit message:

  // TODO: Possibly change the protocol in the future to work with a more
  // direct model (Attempt to upload commit instead of request/response model).
  final requestVerifyCommitId = genUid(rand);
  final requestVerifyCommit = RequestVerifyCommit((b) => b
    ..requestId = requestVerifyCommitId
    ..commit = commit.toBuilder());

  final userToCompact = UserToCompact.requestVerifyCommit(requestVerifyCommit);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.inTransactions(inTransactionsView);
  final newView = AppView.inTransactions(
      InTransactionsView.transaction(nodeName, commit.invoiceId));

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

AppState _handleCollectInvoice(
    NodeName nodeName,
    InvoiceId invoiceId,
    InTransactionsView inTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    logger.w('_handleCollectInvoice(): node $nodeName does not exist!');
    return createState(AppView.inTransactions(inTransactionsView));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final nodeId = nodeOpen.nodeId;
  if (nodeId == null) {
    logger.w('_handleCollectInvoice(): node $nodeName is not open!');
    return createState(AppView.inTransactions(inTransactionsView));
  }

  final userToCompact = UserToCompact.commitInvoice(invoiceId);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.inTransactions(inTransactionsView);
  // TODO: In the future we might want to be able to know the full `commit`
  // value at this point, so that we can later save an `invoice + commit` file.
  // This requires a change at the protocol level
  final openInvoice = nodeOpen.compactReport.openInvoices[invoiceId];
  assert(openInvoice != null);
  final invoiceFile = InvoiceFile((b) => b
    ..invoiceId = invoiceId
    ..currency = openInvoice.currency
    ..destPublicKey = nodeOpen.compactReport.localPublicKey
    ..destPayment = openInvoice.totalDestPayment
    ..description = openInvoice.description);

  final newView = AppView.inTransactions(
      InTransactionsView.collected(nodeName, invoiceFile));

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

AppState _handleCancelInvoice(
    NodeName nodeName,
    InvoiceId invoiceId,
    InTransactionsView inTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    logger.w('_handleCancelInvoice(): node $nodeName does not exist!');
    return createState(AppView.inTransactions(inTransactionsView));
  }

  final nodeId = nodeState.inner
      .match(open: (nodeOpen) => nodeOpen.nodeId, closed: () => null);

  if (nodeId == null) {
    logger.w('_handleCancelInvoice(): node $nodeName is not open!');
    return createState(AppView.inTransactions(inTransactionsView));
  }

  final userToCompact = UserToCompact.cancelInvoice(invoiceId);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.inTransactions(inTransactionsView);
  final newView = AppView.inTransactions(InTransactionsView.home());

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}
