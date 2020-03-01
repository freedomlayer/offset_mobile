import 'dart:math';
import 'dart:developer' as developer;
import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../state/state.dart';

import '../rand.dart';

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
          developer
              .log('handleCardSettingsAction: friendsSettings: Incorrect view');
          return createState(
              AppView.settings(SettingsView.cardSettings(cardSettingsView)));
        }

        return _handleFriendsSettings(cardSettingsView.nodeName,
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

        return _handleRelaysSettings(cardSettingsView.nodeName,
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

        return _handleIndexServersSettings(
            cardSettingsView.nodeName,
            indexServersSettingsView,
            nodesStates,
            indexServersSettingsAction,
            rand);
      });
}

AppState _handleFriendsSettings(
    NodeName nodeName,
    FriendsSettingsView friendsSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    FriendsSettingsAction friendsSettingsAction,
    Random rand) {
  throw UnimplementedError();
}

// ---------------------------------------------------------
// --------------- relays settings -------------------------
// ---------------------------------------------------------

AppState _handleRelaysSettings(
    NodeName nodeName,
    RelaysSettingsView relaysSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    RelaysSettingsAction relaysSettingsAction,
    Random rand) {
  final createStateInner = (CardSettingsInnerView cardSettingsInnerView) =>
      AppState((b) => b
        ..nodesStates = nodesStates.toBuilder()
        ..viewState = ViewState.view(
            AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b
              ..nodeName = nodeName
              ..inner = cardSettingsInnerView)))));

  return relaysSettingsAction.match(
      back: () => relaysSettingsView.match(
          home: () => createStateInner(CardSettingsInnerView.home()),
          newRelaySelect: () => createStateInner(
              CardSettingsInnerView.relays(RelaysSettingsView.home())),
          newRelayName: (relayAddress) => createStateInner(
              CardSettingsInnerView.relays(RelaysSettingsView.home()))),
      removeRelay: (relayPublicKey) =>
          _handleRemoveRelay(nodeName, relayPublicKey, nodesStates, rand),
      selectNewRelay: () => createStateInner(
          CardSettingsInnerView.relays(RelaysSettingsView.newRelaySelect())),
      newRelay: (namedRelayAddress) =>
          _handleNewRelay(nodeName, namedRelayAddress, nodesStates, rand));
}

AppState _handleRemoveRelay(NodeName nodeName, PublicKey relayPublicKey,
    BuiltMap<NodeName, NodeState> nodesStates, Random rand) {

  final createStateInner = (CardSettingsInnerView cardSettingsInnerView) =>
      AppState((b) => b
        ..nodesStates = nodesStates.toBuilder()
        ..viewState = ViewState.view(
            AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b
              ..nodeName = nodeName
              ..inner = cardSettingsInnerView)))));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    developer.log('_handleRemoveRelay(): node $nodeName does not exist!');
    return createStateInner(CardSettingsInnerView.relays(RelaysSettingsView.home()));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final nodeId = nodeOpen.nodeId;
  if (nodeId == null) {
    developer.log('_handleRemoveRelay(): node $nodeName is not open!');
    return createStateInner(CardSettingsInnerView.relays(RelaysSettingsView.home()));
  }

  final userToCompact = UserToCompact.removeRelay(relayPublicKey);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b..nodeName = nodeName
                ..inner = CardSettingsInnerView.relays(RelaysSettingsView.home()))));
  final newView = oldView;

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

AppState _handleNewRelay(NodeName nodeName, NamedRelayAddress namedRelayAddress,
    BuiltMap<NodeName, NodeState> nodesStates, Random rand) {

  final createStateInner = (CardSettingsInnerView cardSettingsInnerView) =>
      AppState((b) => b
        ..nodesStates = nodesStates.toBuilder()
        ..viewState = ViewState.view(
            AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b
              ..nodeName = nodeName
              ..inner = cardSettingsInnerView)))));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    developer.log('_handleNewRelay(): node $nodeName does not exist!');
    return createStateInner(CardSettingsInnerView.relays(RelaysSettingsView.home()));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final nodeId = nodeOpen.nodeId;
  if (nodeId == null) {
    developer.log('_handleNewRelay(): node $nodeName is not open!');
    return createStateInner(CardSettingsInnerView.relays(RelaysSettingsView.home()));
  }

  final userToCompact = UserToCompact.addRelay(namedRelayAddress);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);
  
  final relayAddress = RelayAddress((b) => b..publicKey = namedRelayAddress.publicKey
                                            ..address = namedRelayAddress.address);
  final relaysSettingsView = RelaysSettingsView.newRelayName(relayAddress);
  final oldView = AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b..nodeName = nodeName
                ..inner = CardSettingsInnerView.relays(relaysSettingsView))));
  final newView = AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b..nodeName = nodeName
                ..inner = CardSettingsInnerView.relays(RelaysSettingsView.home()))));


  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

// -------------------------------------------------
// ------------ index servers settings -------------
// -------------------------------------------------

AppState _handleIndexServersSettings(
    NodeName nodeName,
    IndexServersSettingsView indexServersSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    IndexServersSettingsAction indexServersSettingsAction,
    Random rand) {

  final createStateInner = (CardSettingsInnerView cardSettingsInnerView) =>
      AppState((b) => b
        ..nodesStates = nodesStates.toBuilder()
        ..viewState = ViewState.view(
            AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b
              ..nodeName = nodeName
              ..inner = cardSettingsInnerView)))));

  return indexServersSettingsAction.match(
      back: () => indexServersSettingsView.match(
          home: () => createStateInner(CardSettingsInnerView.home()),
          newIndexSelect: () => createStateInner(
              CardSettingsInnerView.indexServers(IndexServersSettingsView.home())),
          newIndexName: (_indexServerFile) => createStateInner(
              CardSettingsInnerView.indexServers(IndexServersSettingsView.home()))),
      removeIndex: (indexPublicKey) =>
          _handleRemoveIndex(nodeName, indexPublicKey, nodesStates, rand),
      selectNewIndex: () => createStateInner(
          CardSettingsInnerView.indexServers(IndexServersSettingsView.newIndexSelect())),
      newIndex: (namedIndexServerAddress) =>
          _handleNewIndex(nodeName, namedIndexServerAddress, nodesStates, rand));
}

AppState _handleRemoveIndex(NodeName nodeName, PublicKey indexPublicKey,
    BuiltMap<NodeName, NodeState> nodesStates, Random rand) {

  final createStateInner = (CardSettingsInnerView cardSettingsInnerView) =>
      AppState((b) => b
        ..nodesStates = nodesStates.toBuilder()
        ..viewState = ViewState.view(
            AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b
              ..nodeName = nodeName
              ..inner = cardSettingsInnerView)))));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    developer.log('_handleRemoveIndex(): node $nodeName does not exist!');
    return createStateInner(CardSettingsInnerView.indexServers(IndexServersSettingsView.home()));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final nodeId = nodeOpen.nodeId;
  if (nodeId == null) {
    developer.log('_handleRemoveIndex(): node $nodeName is not open!');
    return createStateInner(CardSettingsInnerView.indexServers(IndexServersSettingsView.home()));
  }

  final userToCompact = UserToCompact.removeIndexServer(indexPublicKey);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b..nodeName = nodeName
                ..inner = CardSettingsInnerView.indexServers(IndexServersSettingsView.home()))));
  final newView = oldView;

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

AppState _handleNewIndex(NodeName nodeName, NamedIndexServerAddress namedIndexServerAddress,
    BuiltMap<NodeName, NodeState> nodesStates, Random rand) {

  final createStateInner = (CardSettingsInnerView cardSettingsInnerView) =>
      AppState((b) => b
        ..nodesStates = nodesStates.toBuilder()
        ..viewState = ViewState.view(
            AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b
              ..nodeName = nodeName
              ..inner = cardSettingsInnerView)))));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    developer.log('_handleNewIndex(): node $nodeName does not exist!');
    return createStateInner(CardSettingsInnerView.indexServers(IndexServersSettingsView.home()));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final nodeId = nodeOpen.nodeId;
  if (nodeId == null) {
    developer.log('_handleNewIndex(): node $nodeName is not open!');
    return createStateInner(CardSettingsInnerView.indexServers(IndexServersSettingsView.home()));
  }

  final userToCompact = UserToCompact.addIndexServer(namedIndexServerAddress);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);
  
  final indexServerFile = IndexServerFile((b) => b..publicKey = namedIndexServerAddress.publicKey
                                            ..address = namedIndexServerAddress.address);
  final indexServersSettingsView = IndexServersSettingsView.newIndexName(indexServerFile);
  final oldView = AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b..nodeName = nodeName
                ..inner = CardSettingsInnerView.indexServers(indexServersSettingsView))));
  final newView = AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b..nodeName = nodeName
                ..inner = CardSettingsInnerView.indexServers(IndexServersSettingsView.home()))));


  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}
