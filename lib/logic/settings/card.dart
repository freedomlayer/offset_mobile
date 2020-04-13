import 'dart:math';
import 'package:built_collection/built_collection.dart';

import '../../servers/index.dart';
import '../../servers/relay.dart';
import '../../actions/actions.dart';
import '../../protocol/protocol.dart';
import '../../state/state.dart';

import 'friends.dart';
import 'index_servers.dart';
import 'relays.dart';
import '../../logger.dart';

import '../../rand.dart';

final logger = createLogger('logic::settings::card');

AppState handleCardSettingsAction(
    CardSettingsView cardSettingsView,
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    CardSettingsAction cardSettingsAction,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return cardSettingsAction.match(
      back: () => createState(AppView.settings(SettingsView.home())),
      enable: () =>
          _handleEnable(nodeName, cardSettingsView, nodesStates, rand),
      disable: () =>
          _handleDisable(nodeName, cardSettingsView, nodesStates, rand),
      remove: () =>
          _handleRemove(nodeName, cardSettingsView, nodesStates, rand),
      addRandRelayIndex: () =>
          _handleRandRelayIndex(nodeName, cardSettingsView, nodesStates, rand),
      selectFriends: () => createState(AppView.settings(
          SettingsView.cardSettings(cardSettingsView.rebuild((b) => b
            ..inner =
                CardSettingsInnerView.friends(FriendsSettingsView.home()))))),
      selectRelays: () => createState(AppView.settings(SettingsView.cardSettings(
          cardSettingsView.rebuild((b) => b..inner = CardSettingsInnerView.relays(RelaysSettingsView.home()))))),
      selectIndexServers: () => createState(AppView.settings(SettingsView.cardSettings(cardSettingsView.rebuild((b) => b..inner = CardSettingsInnerView.indexServers(IndexServersSettingsView.home()))))),
      friendsSettings: (friendsSettingsAction) {
        final friendsSettingsView = cardSettingsView.inner.match(
            home: () => null,
            friends: (friendsSettingsView) => friendsSettingsView,
            relays: (_) => null,
            indexServers: (_) => null);

        if (friendsSettingsView == null) {
          logger.w('handleCardSettingsAction: friendsSettings: Incorrect view');
          return createState(
              AppView.settings(SettingsView.cardSettings(cardSettingsView)));
        }

        return handleFriendsSettings(nodeName, friendsSettingsView, nodesStates,
            friendsSettingsAction, rand);
      },
      relaysSettings: (relaysSettingsAction) {
        final relaysSettingsView = cardSettingsView.inner.match(
            home: () => null,
            friends: (_) => null,
            relays: (relaysSettingsView) => relaysSettingsView,
            indexServers: (_) => null);

        if (relaysSettingsView == null) {
          logger.w('handleCardSettingsAction: relaysSettings: Incorrect view');
          return createState(
              AppView.settings(SettingsView.cardSettings(cardSettingsView)));
        }

        return handleRelaysSettings(nodeName, relaysSettingsView, nodesStates,
            relaysSettingsAction, rand);
      },
      indexServersSettings: (indexServersSettingsAction) {
        final indexServersSettingsView = cardSettingsView.inner.match(
            home: () => null,
            friends: (_) => null,
            relays: (_) => null,
            indexServers: (indexServersSettingsView) =>
                indexServersSettingsView);

        if (indexServersSettingsView == null) {
          logger.w(
              'handleCardSettingsAction: indexServersSettings: Incorrect view');
          return createState(
              AppView.settings(SettingsView.cardSettings(cardSettingsView)));
        }

        return handleIndexServersSettings(nodeName, indexServersSettingsView,
            nodesStates, indexServersSettingsAction, rand);
      });
}

AppState _handleEnable(NodeName nodeName, CardSettingsView cardSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates, Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    logger.w('_handleEnable(): node $nodeName does not exist!');
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
    logger.w('_handleDisable(): node $nodeName does not exist!');
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

AppState _handleRemove(NodeName nodeName, CardSettingsView cardSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates, Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    logger.w('_handleRemove(): node $nodeName does not exist!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final userToServer = UserToServer.removeNode(nodeName);
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

AppState _handleRandRelayIndex(
    NodeName nodeName,
    CardSettingsView cardSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    logger.w('_handleRandRelayIndex(): node $nodeName does not exist!');
    return createState(AppView.settings(SettingsView.home()));
  }

  // Node must be open to handle this action:
  final nodeId = nodeState.inner
      .match(closed: () => null, open: (nodeOpen) => nodeOpen.nodeId);

  if (nodeId == null) {
    return createState(
        AppView.settings(SettingsView.cardSettings(cardSettingsView)));
  }

  // We only get here when the node is open.

  // List of requests to send:
  final nextRequestsList = <UserToServerAck>[];

  // Add a maximum of two random relays:
  final relays = List<NamedRelayAddress>.from(knownRelays);
  relays.shuffle(rand);

  for (var i = 0; i < min(2, relays.length); ++i) {
    // Add relay:
    nextRequestsList.add((() {
      final userToCompact = UserToCompact.addRelay(relays[i]);
      final userToServer = UserToServer.node(nodeId, userToCompact);
      final requestId = genUid(rand);
      return UserToServerAck((b) => b
        ..requestId = requestId
        ..inner = userToServer);
    })());
  }

  // Add a maximum of two index servers:
  final indexServers = List<NamedIndexServerAddress>.from(knownIndexServers);
  indexServers.shuffle(rand);

  for (var i = 0; i < min(2, indexServers.length); ++i) {
    // Add index server:
    nextRequestsList.add((() {
      final userToCompact = UserToCompact.addIndexServer(indexServers[i]);
      final userToServer = UserToServer.node(nodeId, userToCompact);
      final requestId = genUid(rand);
      return UserToServerAck((b) => b
        ..requestId = requestId
        ..inner = userToServer);
    })());
  }

  final nextRequests = BuiltList<UserToServerAck>(nextRequestsList);
  final optPendingRequest = OptPendingRequest.none();

  final oldView = AppView.settings(SettingsView.cardSettings(cardSettingsView));
  final newView = oldView;

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}
