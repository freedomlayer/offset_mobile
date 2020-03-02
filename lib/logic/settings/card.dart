import 'dart:math';
import 'dart:developer' as developer;
import 'package:built_collection/built_collection.dart';

import '../../actions/actions.dart';
import '../../protocol/protocol.dart';
// import '../../protocol/file.dart';
import '../../state/state.dart';

import 'friends.dart';
import 'index_servers.dart';
import 'relays.dart';

import '../../rand.dart';

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
      enable: () => _handleEnable(
          cardSettingsView.nodeName, cardSettingsView, nodesStates, rand),
      disable: () => _handleDisable(
          cardSettingsView.nodeName, cardSettingsView, nodesStates, rand),
      friendsSettings: (friendsSettingsAction) {
        final friendsSettingsView = cardSettingsView.inner.match(
            home: () => null,
            friends: (friendsSettingsView) => friendsSettingsView,
            relays: (_) => null,
            indexServers: (_) => null);

        if (friendsSettingsView == null) {
          developer
              .log('handleCardSettingsAction: friendsSettings: Incorrect view');
          return createState(
              AppView.settings(SettingsView.cardSettings(cardSettingsView)));
        }

        return handleFriendsSettings(cardSettingsView.nodeName,
            friendsSettingsView, nodesStates, friendsSettingsAction, rand);
      },
      relaysSettings: (relaysSettingsAction) {
        final relaysSettingsView = cardSettingsView.inner.match(
            home: () => null,
            friends: (_) => null,
            relays: (relaysSettingsView) => relaysSettingsView,
            indexServers: (_) => null);

        if (relaysSettingsView == null) {
          developer
              .log('handleCardSettingsAction: relaysSettings: Incorrect view');
          return createState(
              AppView.settings(SettingsView.cardSettings(cardSettingsView)));
        }

        return handleRelaysSettings(cardSettingsView.nodeName,
            relaysSettingsView, nodesStates, relaysSettingsAction, rand);
      },
      indexServersSettings: (indexServersSettingsAction) {
        final indexServersSettingsView = cardSettingsView.inner.match(
            home: () => null,
            friends: (_) => null,
            relays: (_) => null,
            indexServers: (indexServersSettingsView) =>
                indexServersSettingsView);

        if (indexServersSettingsView == null) {
          developer.log(
              'handleCardSettingsAction: indexServersSettings: Incorrect view');
          return createState(
              AppView.settings(SettingsView.cardSettings(cardSettingsView)));
        }

        return handleIndexServersSettings(
            cardSettingsView.nodeName,
            indexServersSettingsView,
            nodesStates,
            indexServersSettingsAction,
            rand);
      });
}

AppState _handleEnable(NodeName nodeName, CardSettingsView cardSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates, Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    developer.log('_handleEnable(): node $nodeName does not exist!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final userToServer = UserToServer.enableNode(nodeName);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.settings(SettingsView.cardSettings(cardSettingsView));
  final newView = oldView;

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

AppState _handleDisable(NodeName nodeName, CardSettingsView cardSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates, Random rand) {

  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    developer.log('_handleDisable(): node $nodeName does not exist!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final userToServer = UserToServer.disableNode(nodeName);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.settings(SettingsView.cardSettings(cardSettingsView));
  final newView = oldView;

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}
