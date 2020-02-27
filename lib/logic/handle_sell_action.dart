import 'dart:math';
import 'dart:developer' as developer;

import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

import '../rand.dart';

AppState handleSellAction(SellView sellView,
    BuiltMap<NodeName, NodeState> nodesStates, SellAction sellAction, Random rand) {

  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return sellAction.match(
      back: () => createState(AppView.home()),
      selectCard: (nodeName) => createState(AppView.sell(SellView.invoiceDetails(nodeName))),
      createInvoice: (currency, amount, description) {

        // Find nodeName:
        final nodeName = sellView.match(
            selectCard: () => null,
            invoiceDetails: (nodeName) => nodeName,
            sendInvoice: (_a, _b) => null);

        if (nodeName == null) {
          developer.log(
              'handleSellAction(): createInvoice: Received confirmInvoice action during incorrect view');
          return createState(AppView.sell(sellView));
        }

        // Find nodeId (Make sure that the node is open):
        final nodeState = nodesStates[nodeName];
        if (nodeState == null) {
          developer.log(
              'handleSellAction(): createInvoice: node $nodeName does not exist!');
          return createState(AppView.sell(sellView));
        }

        final nodeOpen = nodeState.inner.match(
            open: (nodeOpen) => nodeOpen,
            closed: () => null);
        
        if (nodeOpen == null) {
          developer.log(
              'handleSellAction(): createInvoice: node $nodeName is not open!');
          return createState(AppView.sell(sellView));
        }

        final nodeId = nodeOpen.nodeId;

        final invoiceId = genInvoiceId(rand);
        final addInvoice = AddInvoice((b) => b
          ..invoiceId = invoiceId
          ..currency = currency
          ..totalDestPayment = amount
          ..description = description);

        final userToCompact =
            UserToCompact.addInvoice(addInvoice);
        final userToServer = UserToServer.node(nodeId, userToCompact);
        final requestId = genUid(rand);
        final userToServerAck = UserToServerAck((b) => b
          ..requestId = requestId
          ..inner = userToServer);

        final oldView =
            AppView.sell(sellView);
        final newView = AppView.sell(SellView.sendInvoice(nodeName, invoiceId));

        final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
        final optPendingRequest = OptPendingRequest.none();

        return AppState((b) => b
          ..nodesStates = nodesStates.toBuilder()
          ..viewState = ViewState.transition(
              oldView, newView, nextRequests, optPendingRequest));
      },
      viewTransaction: () => throw UnimplementedError(),
      cancelInvoice: (invoiceId) => throw UnimplementedError());
}

