import 'dart:math';

import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

import '../rand.dart';
import '../logger.dart';

final logger = createLogger('logic::handle_sell_action');

AppState handleSellAction(
    SellView sellView,
    BuiltMap<NodeName, NodeState> nodesStates,
    SellAction sellAction,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return sellAction.match(
      back: () => createState(AppView.home()),
      selectCard: (nodeName) =>
          createState(AppView.sell(SellView.invoiceDetails(nodeName))),
      createInvoice: (nodeName, currency, amount, description) =>
          _handleCreateInvoice(nodeName, currency, amount, description,
              sellView, nodesStates, rand));
}

AppState _handleCreateInvoice(
    NodeName nodeName,
    Currency currency,
    U128 amount,
    String description,
    SellView sellView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  // Find nodeId (Make sure that the node is open):
  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    logger.w('_handleCreateInvoice(): node $nodeName does not exist!');
    return createState(AppView.home());
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  if (nodeOpen == null) {
    logger.w(
        '_handleCreateInvoice(): createInvoice: node $nodeName is not open!');
    return createState(AppView.home());
  }

  final nodeId = nodeOpen.nodeId;

  final invoiceId = genInvoiceId(rand);
  final addInvoice = AddInvoice((b) => b
    ..invoiceId = invoiceId
    ..currency = currency
    ..totalDestPayment = amount
    ..description = description);

  final userToCompact = UserToCompact.addInvoice(addInvoice);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.sell(sellView);
  final newView = AppView.inTransactions(
      InTransactionsView.transaction(nodeName, invoiceId));

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

/*
AppState _handleCancelInvoice(
    SellView sellView,
    NodeName nodeName,
    InvoiceId invoiceId,
    BuiltMap<NodeName, NodeState> nodesStates,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    logger.w('_handleCancelInvoice(): node $nodeName does not exist!');
    return createState(AppView.home());
  }

  final nodeId = nodeState.inner
      .match(open: (nodeOpen) => nodeOpen.nodeId, closed: () => null);

  if (nodeId == null) {
    logger.w('_handleCancelInvoice(): node $nodeName is closed!');
    return createState(AppView.home());
  }

  final userToCompact = UserToCompact.cancelInvoice(invoiceId);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.sell(sellView);
  final newView = AppView.sell(SellView.sendInvoice(nodeName, invoiceId));

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}
*/
