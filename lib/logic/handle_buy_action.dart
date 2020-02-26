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
      confirmInvoice: () => throw UnimplementedError(),
      selectCard: (nodeName) => throw UnimplementedError(),
      cancelPayment: () => throw UnimplementedError());
}
