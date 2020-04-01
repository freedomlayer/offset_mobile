import 'dart:math';
import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';
import '../rand.dart';

import '../logger.dart';

final logger = createLogger('logic::handle_out_trans_action');

NodeId nodeIdByNodeName(
    NodeName nodeName, BuiltMap<NodeName, NodeState> nodesStates) {
  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    return null;
  }
  return nodeState.inner
      .match(closed: () => null, open: (nodeOpen) => nodeOpen.nodeId);
}

AppState handleOutTransactionsAction(
    OutTransactionsView outTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    OutTransactionsAction outTransactionsAction,
    Random rand) {
  return outTransactionsAction.match(
      back: () => _handleBack(outTransactionsView, nodesStates),
      selectPayment: (nodeName, paymentId) => _handleSelectPayment(
          nodeName, paymentId, outTransactionsView, nodesStates),
      confirmFees: (nodeName, paymentId) => _handleConfirmFees(
          nodeName, paymentId, outTransactionsView, nodesStates, rand),
      cancelPayment: (nodeName, paymentId) => _handleCancelPayment(
          nodeName, paymentId, outTransactionsView, nodesStates, rand),
      discardPayment: (nodeName, paymentId) => _handleDiscardPayment(
          nodeName, paymentId, outTransactionsView, nodesStates, rand));
}

AppState _handleBack(OutTransactionsView outTransactionsView, nodesStates) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return outTransactionsView.match(
      home: () => createState(AppView.home()),
      transaction: (nodeName, paymentId) =>
          createState(AppView.outTransactions(OutTransactionsView.home())));
}

AppState _handleSelectPayment(
    NodeName nodeName,
    PaymentId paymentId,
    OutTransactionsView outTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return createState(AppView.outTransactions(
      OutTransactionsView.transaction(nodeName, paymentId)));
}

AppState _handleConfirmFees(
    NodeName nodeName,
    PaymentId paymentId,
    OutTransactionsView outTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  // Send a ConfirmPaymentFees message:

  // nodeState is not null because we managed to get nodeId earlier
  NodeId nodeId;
  Uid confirmId;

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    logger
        .w('_handleConfirmFees(): confirmFees: node $nodeName does not exist!');
    return createState(AppView.home());
  }

  final newState = nodeState.inner.match(closed: () {
    logger.w('_handleConfirmFees(): confirmFees: node $nodeName is closed!');
    return createState(AppView.home());
  }, open: (nodeOpen) {
    final openPayment = nodeOpen.compactReport.openPayments[paymentId];
    nodeId = nodeOpen.nodeId;
    if (openPayment == null) {
      logger.w(
          '_handleConfirmFees(): confirmFees: payment $paymentId does not exist!');
      return createState(AppView.home());
    }

    openPayment.status.match(
        searchingRoute: (_) => null,
        foundRoute: (confirmId0, _fees) {
          confirmId = confirmId0;
          return null;
        },
        sending: (_) => null,
        commit: (_a, _b) => null,
        success: (_a, _b, _c) => null,
        failure: (_) => null);

    if (confirmId == null) {
      logger.w(
          '_handleConfirmFees(): confirmFees: payment $paymentId is not waiting for confirmation!');
      return createState(AppView.outTransactions(outTransactionsView));
    }
    return null;
  });

  // If any error occured, we return early:
  if (newState != null) {
    return newState;
  }

  final confirmPaymentFees = ConfirmPaymentFees((b) => b
    ..paymentId = paymentId
    ..confirmId = confirmId);
  final userToCompact = UserToCompact.confirmPaymentFees(confirmPaymentFees);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.outTransactions(outTransactionsView);
  final newView = oldView;

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

AppState _handleCancelPayment(
    NodeName nodeName,
    PaymentId paymentId,
    OutTransactionsView outTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeId = nodeIdByNodeName(nodeName, nodesStates);
  if (nodeId == null) {
    logger
        .w('_handleCancelPayment(): cancelPayment: node $nodeName is not open');
    return createState(AppView.home());
  }

  // At this point paymentId and nodeName should be non null.

  // Send a CancelPayment message:
  final userToCompact = UserToCompact.cancelPayment(paymentId);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.outTransactions(outTransactionsView);
  final newView = oldView;

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

AppState _handleDiscardPayment(
    NodeName nodeName,
    PaymentId paymentId,
    OutTransactionsView outTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    logger.w('_handleDiscardPayment(): node $nodeName does not exist!');
    return createState(AppView.outTransactions(OutTransactionsView.home()));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  if (nodeOpen == null) {
    logger.w('_handleDiscardPayment(): node $nodeName is not open!');
    return createState(AppView.outTransactions(OutTransactionsView.home()));
  }

  final openPayment = nodeOpen.compactReport.openPayments[paymentId];
  if (openPayment == null) {
    logger.w('_handleDiscardPayment(): payment $paymentId is not open!');
    return createState(AppView.outTransactions(OutTransactionsView.home()));
  }

  final ackUid = openPayment.status.match(
      searchingRoute: (_) => null,
      foundRoute: (_a, _b) => null,
      sending: (_) => null,
      commit: (_a, _b) => null,
      success: (_receipt, _fees, ackUid) => ackUid,
      failure: (ackUid) => ackUid);

  final userToCompact = UserToCompact.ackPaymentDone(paymentId, ackUid);
  final userToServer = UserToServer.node(nodeOpen.nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.outTransactions(outTransactionsView);
  final newView = AppView.outTransactions(OutTransactionsView.home());

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

/*
AppState _handleResendCommit(OutTransactionsView outTransactionsView,
    BuiltMap<NodeName, NodeState> nodesStates) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  NodeName nodeName;
  PaymentId paymentId;

  outTransactionsView.match(
      home: () => null,
      transaction: (nodeName0, paymentId0) {
        nodeName = nodeName0;
        paymentId = paymentId0;
        return null;
      });

  if (nodeName == null) {
    logger.w('_handleResendCommit(): Incorrect view!');
    return createState(AppView.outTransactions(outTransactionsView));
  }

  return createState(AppView.outTransactions(
      OutTransactionsView.sendCommit(nodeName, paymentId)));
}
*/
