import 'dart:math';
import 'dart:developer' as developer;
import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
// import '../protocol/file.dart';
import '../state/state.dart';

// import '../rand.dart';

AppState handleCardSettingsAction(
    CardSettingsView cardSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    CardSettingsAction cardSettingsAction,
    Random rand) {

  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return cardSettingsAction.match(
      back: () => createState(AppView.home()),
      friendsSettings: (friendsSettingsAction) {
        final friendsSettingsView = cardSettingsView.inner.match(
            home: () => null,
            friends: (friendsSettingsView) => friendsSettingsView,
            relays: (_) => null,
            indexServers: (_) => null);

        if (friendsSettingsView == null) {
          developer.log('handleCardSettingsAction: friendsSettings: Incorrect view');
          return createState(AppView.settings(SettingsView.cardSettings(cardSettingsView)));
        }

        return _handleFriendsSettings(friendsSettingsView, nodesStates, friendsSettingsAction, rand);
      },
      relaysSettings: (relaysSettingsAction) {
        final relaysSettingsView = cardSettingsView.inner.match(
            home: () => null,
            friends: (_) => null,
            relays: (relaysSettingsView) => relaysSettingsView,
            indexServers: (_) => null);

        if (relaysSettingsView == null) {
          developer.log('handleCardSettingsAction: relaysSettings: Incorrect view');
          return createState(AppView.settings(SettingsView.cardSettings(cardSettingsView)));
        }

        return _handleRelaysSettings(relaysSettingsView, nodesStates, relaysSettingsAction, rand);
      },
      indexServersSettings: (indexServersSettingsAction) {
        final indexServersSettingsView = cardSettingsView.inner.match(
            home: () => null,
            friends: (_) => null,
            relays: (_) => null,
            indexServers: (indexServersSettingsView) => indexServersSettingsView);

        if (indexServersSettingsView == null) {
          developer.log('handleCardSettingsAction: indexServersSettings: Incorrect view');
          return createState(AppView.settings(SettingsView.cardSettings(cardSettingsView)));
        }

        return _handleIndexServersSettings(indexServersSettingsView, nodesStates, indexServersSettingsAction, rand);
      });
}

AppState _handleFriendsSettings(
    FriendsSettingsView friendsSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    FriendsSettingsAction friendsSettingsAction,
    Random rand) {
  throw UnimplementedError();
}

AppState _handleRelaysSettings(
    RelaysSettingsView relaysSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    RelaysSettingsAction relaysSettingsAction,
    Random rand) {
  throw UnimplementedError();
}

AppState _handleIndexServersSettings(
    IndexServersSettingsView indexServersSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    IndexServersSettingsAction indexServersSettingsAction,
    Random rand) {
  throw UnimplementedError();
}
