import 'dart:math';
import 'dart:developer' as developer;
import 'package:built_collection/built_collection.dart';

import '../../actions/actions.dart';
import '../../protocol/protocol.dart';
// import '../../protocol/file.dart';
import '../../state/state.dart';

import '../../rand.dart';

AppState handleRelaysSettings(
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
