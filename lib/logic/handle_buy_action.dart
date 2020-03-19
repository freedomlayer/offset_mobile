import 'dart:math';

import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';
import '../rand.dart';

import '../logger.dart';

final logger = createLogger('logic::handle_buy_action');

NodeId nodeIdByNodeName(
    NodeName nodeName, BuiltMap<NodeName, NodeState> nodesStates) {
  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    return null;
  }
  return nodeState.inner
      .match(closed: () => null, open: (nodeOpen) => nodeOpen.nodeId);
}

AppState handleBuyAction(
    BuyView buyView,
    BuiltMap<NodeName, NodeState> nodesStates,
    BuyAction buyAction,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return buyAction.match(
      back: () => createState(AppView.home()),
      loadInvoice: (invoiceFile) =>
          createState(AppView.buy(BuyView.invoiceInfo(invoiceFile))),
      confirmInfo: () {
        final invoiceFile = buyView.match(
            invoiceSelect: () => null,
            invoiceInfo: (invoiceFile) => invoiceFile,
            selectCard: (_) => null);

        if (invoiceFile != null) {
          return createState(AppView.buy(BuyView.selectCard(invoiceFile)));
        } else {
          logger.w(
              'handleBuyAction(): Received confirmInvoice action during incorrect view');
          return createState(AppView.buy(buyView));
        }
      },
      selectCard: (nodeName) =>
          _handleSelectCard(nodeName, buyView, nodesStates, buyAction, rand));
}

AppState _handleSelectCard(
    NodeName nodeName,
    BuyView buyView,
    BuiltMap<NodeName, NodeState> nodesStates,
    BuyAction buyAction,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeId = nodeIdByNodeName(nodeName, nodesStates);
  if (nodeId == null) {
    logger.w('handleBuyAction(): selectCard: node $nodeName is not open');
    return createState(AppView.home());
  }

  final invoiceFile = buyView.match(
      invoiceSelect: () => null,
      invoiceInfo: (_) => null,
      selectCard: (invoiceFile) => invoiceFile);

  if (invoiceFile == null) {
    logger.w(
        'handleBuyAction(): Received selectCard action during incorrect view');
    return createState(AppView.buy(buyView));
  }

  // Send an InitPayment message:
  final requestId = genUid(rand);
  final paymentId = genPaymentId(rand);
  final initPayment = InitPayment((b) => b
    ..paymentId = paymentId
    ..invoiceId = invoiceFile.invoiceId
    ..currency = invoiceFile.currency
    ..destPublicKey = invoiceFile.destPublicKey
    ..destPayment = invoiceFile.destPayment
    ..description = invoiceFile.description);
  final userToCompact = UserToCompact.initPayment(initPayment);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.buy(BuyView.selectCard(invoiceFile));
  final newView = AppView.outTransactions(OutTransactionsView.transaction(nodeName, paymentId));

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

/*
AppState _handleConfirmFees(
    BuyView buyView,
    BuiltMap<NodeName, NodeState> nodesStates,
    BuyAction buyAction,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  PaymentId paymentId;
  NodeName nodeName;

  buyView.match(
      invoiceSelect: () => null,
      invoiceInfo: (_) => null,
      selectCard: (_) => null,
      paymentProgress: (nodeName0, paymentId0) {
        nodeName = nodeName0;
        paymentId = paymentId0;
        return null;
      });

  if (nodeName == null) {
    logger.w(
        '_handleConfirmFees(): Received confirmFees action during incorrect view');
    return createState(AppView.buy(buyView));
  }

  // At this point paymentId and nodeName should be non null.

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
      return createState(AppView.buy(buyView));
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

  final oldView = AppView.buy(BuyView.paymentProgress(nodeName, paymentId));
  final newView = AppView.home();

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}
*/

/*
AppState _handleCancelPayment(
    BuyView buyView,
    BuiltMap<NodeName, NodeState> nodesStates,
    BuyAction buyAction,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  PaymentId paymentId;
  NodeName nodeName;

  buyView.match(
      invoiceSelect: () => null,
      invoiceInfo: (_) => null,
      selectCard: (_) => null,
      paymentProgress: (nodeName0, paymentId0) {
        nodeName = nodeName0;
        paymentId = paymentId0;
        return null;
      });

  if (nodeName == null) {
    logger.w(
        '_handleCancelPayment(): Received cancelPayment action during incorrect view');
    return createState(AppView.buy(buyView));
  }

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

  final oldView = AppView.buy(BuyView.paymentProgress(nodeName, paymentId));
  final newView = AppView.home();

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}
*/
