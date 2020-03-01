import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';


AppState handleSettingsAction(SettingsView settingsView,
    BuiltMap<NodeName, NodeState> nodesStates, SettingsAction settingsAction) {

  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return settingsAction.match(
      back: () => createState(AppView.home()),
      newCard: (_newCardAction) => throw UnimplementedError(),
      cardSettings: (_cardSettingsAction) => throw UnimplementedError(),
      selectCard: (nodeName) {
        final cardSettingsView = CardSettingsView((b) => b..nodeName = nodeName
                                                          ..inner = CardSettingsInnerView.home());
        return createState(AppView.settings(SettingsView.cardSettings(cardSettingsView)));
      });
}
