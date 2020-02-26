import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

AppState handleSellAction(SellView sellView,
    BuiltMap<NodeName, NodeState> nodesStates, SellAction sellAction) {

  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return sellAction.match(
      back: () => createState(AppView.home()),
      selectCard: (nodeName) => createState(AppView.sell(SellView.invoiceDetails(nodeName))),
      createInvoice: (currency, amount, description) => throw UnimplementedError(),
      viewTransaction: () => throw UnimplementedError(),
      cancelInvoice: (invoiceId) => throw UnimplementedError());
}

