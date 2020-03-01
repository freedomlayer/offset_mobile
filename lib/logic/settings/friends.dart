import 'dart:math';
import 'dart:developer' as developer;
import 'package:built_collection/built_collection.dart';

import '../../actions/actions.dart';
import '../../protocol/protocol.dart';
import '../../protocol/file.dart';
import '../../state/state.dart';

import '../../rand.dart';

AppState handleFriendsSettings(
    NodeName nodeName,
    FriendsSettingsView friendsSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    FriendsSettingsAction friendsSettingsAction,
    Random rand) {
  final createStateInner = (CardSettingsInnerView cardSettingsInnerView) =>
      AppState((b) => b
        ..nodesStates = nodesStates.toBuilder()
        ..viewState = ViewState.view(
            AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b
              ..nodeName = nodeName
              ..inner = cardSettingsInnerView)))));

  return friendsSettingsAction.match(
      back: () => friendsSettingsView.match(
          home: () => createStateInner(CardSettingsInnerView.home()),
          friendSettings: (_) => createStateInner(
              CardSettingsInnerView.friends(FriendsSettingsView.home())),
          newFriend: (_) => createStateInner(
              CardSettingsInnerView.friends(FriendsSettingsView.home())),
          shareInfo: () => createStateInner(
              CardSettingsInnerView.friends(FriendsSettingsView.home()))),
      selectNewFriend: () => createStateInner(CardSettingsInnerView.friends(
          FriendsSettingsView.newFriend(NewFriendView.select()))),
      newFriend: (newFriendAction) =>
          _handleNewFriend(nodeName, nodesStates, newFriendAction, rand),
      selectFriend: (friendPublicKey) => createStateInner(
          CardSettingsInnerView.friends(
              FriendsSettingsView.friendSettings(FriendSettingsView((b) => b
                ..friendPublicKey = friendPublicKey
                ..inner = FriendSettingsInnerView.home())))),
      friendSettings: (friendSettingsAction) =>
          _handleFriendSettings(nodeName, nodesStates, friendSettingsAction, rand),
      shareInfo: () => createStateInner(CardSettingsInnerView.friends(FriendsSettingsView.shareInfo())));
}

AppState _handleNewFriend(
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    NewFriendAction newFriendAction,
    Random rand) {
  final createStateInner = (CardSettingsInnerView cardSettingsInnerView) =>
      AppState((b) => b
        ..nodesStates = nodesStates.toBuilder()
        ..viewState = ViewState.view(
            AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b
              ..nodeName = nodeName
              ..inner = cardSettingsInnerView)))));

  return newFriendAction.match(
      back: () => createStateInner(
          CardSettingsInnerView.friends(FriendsSettingsView.home())),
      loadFriend: (friendFile) => createStateInner(
          CardSettingsInnerView.friends(FriendsSettingsView.newFriend(
              NewFriendView.name(friendFile.publicKey, friendFile.relays)))),
      addFriend: (friendName, friendFile) => _handleAddFriend(
          nodeName, nodesStates, friendName, friendFile, rand));
}

AppState _handleAddFriend(
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    String friendName,
    FriendFile friendFile,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    developer.log('_handleAddFriend(): node $nodeName does not exist!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final nodeId = nodeOpen.nodeId;
  if (nodeId == null) {
    developer.log('_handleAddFriend(): node $nodeName is not open!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final addFriend = AddFriend((b) => b
    ..friendPublicKey = friendFile.publicKey
    ..relays = friendFile.relays.toBuilder()
    ..name = friendName);

  final userToCompact = UserToCompact.addFriend(addFriend);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final newFriendView =
      NewFriendView.name(friendFile.publicKey, friendFile.relays);
  final oldView = AppView.settings(SettingsView.cardSettings(CardSettingsView(
      (b) => b
        ..nodeName = nodeName
        ..inner = CardSettingsInnerView.friends(
            FriendsSettingsView.newFriend(newFriendView)))));
  final newView =
      AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b
        ..nodeName = nodeName
        ..inner = CardSettingsInnerView.friends(FriendsSettingsView.home()))));

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

AppState _handleFriendSettings(
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    FriendSettingsAction friendSettingsAction,
    Random rand) {
  throw UnimplementedError();
}
