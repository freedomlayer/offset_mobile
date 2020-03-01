import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

AppState handleBalancesAction(
    BuiltMap<NodeName, NodeState> nodesStates, BalancesAction balancesAction) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return balancesAction.match(
      back: () => createState(AppView.home()),
      selectCard: (nodeName) =>
          createState(AppView.balances(BalancesView.cardBalances(nodeName))));
}
