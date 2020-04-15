import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';


AppState handleAboutAction(
    BuiltMap<NodeName, NodeState> nodesStates,
    AboutAction aboutAction) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return aboutAction.match(
      back: () => createState(AppView.home()));
}
