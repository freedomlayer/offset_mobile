import 'dart:developer' as developer;
import 'dart:math';

import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';
import '../rand.dart';

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
      confirmInvoice: () {
        final invoiceFile = buyView.match(
            invoiceSelect: () => null,
            invoiceInfo: (invoiceFile) => invoiceFile,
            selectCard: (_) => null,
            paymentProgress: (_a, _b) => null);

        if (invoiceFile != null) {
          return createState(AppView.buy(BuyView.selectCard(invoiceFile)));
        } else {
          developer.log(
              'handleBuyAction(): Received confirmInvoice action during incorrect view');
          return createState(AppView.buy(buyView));
        }
      },
      selectCard: (nodeName) {
        final nodeId = nodeIdByNodeName(nodeName, nodesStates);
        if (nodeId == null) {
          developer
              .log('handleBuyAction(): selectCard: node $nodeName is not open');
          return createState(AppView.home());
        }

        final invoiceFile = buyView.match(
            invoiceSelect: () => null,
            invoiceInfo: (_) => null,
            selectCard: (invoiceFile) => invoiceFile,
            paymentProgress: (_a, _b) => null);

        if (invoiceFile == null) {
          developer.log(
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
        final newView =
            AppView.buy(BuyView.paymentProgress(nodeName, paymentId));

        final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
        final optPendingRequest = OptPendingRequest.none();

        return AppState((b) => b
          ..nodesStates = nodesStates.toBuilder()
          ..viewState = ViewState.transition(
              oldView, newView, nextRequests, optPendingRequest));
      },
      cancelPayment: () {

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
          developer.log(
              'handleBuyAction(): Received cancelPayment action during incorrect view');
          return createState(AppView.buy(buyView));

        }

        final nodeId = nodeIdByNodeName(nodeName, nodesStates);
        if (nodeId == null) {
          developer
              .log('handleBuyAction(): cancelPayment: node $nodeName is not open');
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

      });
}
