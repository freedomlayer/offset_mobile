import 'dart:developer' as developer;
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
      newCard: (newCardAction) {
        final newCardView = settingsView.match(
            home: () => null,
            cardSettings: (_) => null,
            newCard: (newCardView) => newCardView,
            selectCardAddRelay: (_) => null,
            selectCardAddIndex: (_) => null,
            selectCardAddFriend: (_) => null);

        if (newCardView == null) {
          developer.log('handleSettingsAction: newCard: Incorrect view');
          return createState(AppView.settings(settingsView));
        }

        return _handleNewCard(newCardView, nodesStates, newCardAction);
      },
      cardSettings: (cardSettingsAction) {
        final cardSettingsView = settingsView.match(
            home: () => null,
            cardSettings: (cardSettingsView) => cardSettingsView,
            newCard: (_) => null,
            selectCardAddRelay: (_) => null,
            selectCardAddIndex: (_) => null,
            selectCardAddFriend: (_) => null);

        if (cardSettingsView == null) {
          developer.log('handleSettingsAction: cardSettings: Incorrect view');
          return createState(AppView.settings(settingsView));
        }

        return _handleCardSettings(
            cardSettingsView, nodesStates, cardSettingsAction);
      },
      selectCard: (nodeName) {
        final cardSettingsView = CardSettingsView((b) => b
          ..nodeName = nodeName
          ..inner = CardSettingsInnerView.home());
        return createState(
            AppView.settings(SettingsView.cardSettings(cardSettingsView)));
      });
}

AppState _handleNewCard(NewCardView newCardView,
    BuiltMap<NodeName, NodeState> nodesStates, NewCardAction newCardAction) {
  throw UnimplementedError();
}

AppState _handleCardSettings(
    CardSettingsView cardSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    CardSettingsAction cardSettingsAction) {
  throw UnimplementedError();
}
