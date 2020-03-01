import 'dart:math';
import 'dart:developer' as developer;
import 'package:built_collection/built_collection.dart';

import '../../actions/actions.dart';
import '../../protocol/protocol.dart';
import '../../protocol/file.dart';
import '../../state/state.dart';

import '../../rand.dart';

AppState handleIndexServersSettings(
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

  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    developer.log('_handleRemoveIndex(): node $nodeName does not exist!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final nodeId = nodeOpen.nodeId;
  if (nodeId == null) {
    developer.log('_handleRemoveIndex(): node $nodeName is not open!');
    return createState(AppView.settings(SettingsView.home()));
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

  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    developer.log('_handleNewIndex(): node $nodeName does not exist!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final nodeId = nodeOpen.nodeId;
  if (nodeId == null) {
    developer.log('_handleNewIndex(): node $nodeName is not open!');
    return createState(AppView.settings(SettingsView.home()));
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
