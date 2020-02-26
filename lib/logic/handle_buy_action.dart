import 'dart:developer' as developer;

import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

AppState handleBuyAction(BuyView buyView,
    BuiltMap<NodeName, NodeState> nodesStates, BuyAction buyAction) {

  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return buyAction.match(
      back: () => createState(AppView.home()),
      loadInvoice: (invoiceFile) => createState(AppView.buy(BuyView.invoiceInfo(invoiceFile))),
      confirmInvoice: () {
        final invoiceFile = buyView.match(
            invoiceSelect: () => null,
            invoiceInfo: (invoiceFile) => invoiceFile,
            selectCard: (_) => null,
            paymentProgress: (_a, _b) => null);

        if (invoiceFile != null) {
          return createState(AppView.buy(BuyView.selectCard(invoiceFile)));
        } else {
          developer.log('handleBuyAction(): Received confirmInvoice action during incorrect view');
          return createState(AppView.buy(buyView));
        }
      },
      selectCard: (nodeName) {
        final invoiceFile = buyView.match(
            invoiceSelect: () => null,
            invoiceInfo: (_) => null,
            selectCard: (invoiceFile) => invoiceFile,
            paymentProgress: (_a, _b) => null);

        if (invoiceFile != null) {
          /*
          final requestId = genRequestId();
          final serverToUser = ServerToUser.node(nodeId, compactToUser);
          final userToServerAck = UserToServerAck((b) => b..requestId = requetId
                                                       ..inner = serverToUser);
          return createState(AppView.buy(BuyView.paymentProgress(nodeName, paymentId)));
          */
          throw UnimplementedError();
        } else {
          developer.log('handleBuyAction(): Received selectCard action during incorrect view');
          return createState(AppView.buy(buyView));
        }

      },
      cancelPayment: () => throw UnimplementedError());
}
