import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../../protocol/protocol.dart';
// import '../../protocol/file.dart';
import '../../state/state.dart';
import '../../actions/actions.dart';

// import '../frame.dart';

Widget renderFriendsSettings(
    NodeName nodeName,
    FriendsSettingsView friendsSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(FriendsSettingsAction) queueAction) {
  return friendsSettingsView.match(
      home: () => _renderHome(nodeName, nodesStates, queueAction),
      friendSettings: (friendSettingsView) => _renderFriendSettings(
          nodeName,
          friendSettingsView,
          nodesStates,
          (FriendSettingsAction friendSettingsAction) => queueAction(
              FriendsSettingsAction.friendSettings(friendSettingsAction))),
      newFriend: (newFriendView) => _renderNewFriend(
          nodeName,
          newFriendView,
          nodesStates,
          (NewFriendAction newFriendAction) =>
              queueAction(FriendsSettingsAction.newFriend(newFriendAction))),
      shareInfo: () => _renderShareInfo(nodeName, nodesStates, queueAction));
}

Widget _renderHome(NodeName nodeName, BuiltMap<NodeName, NodeState> nodesStates,
    Function(FriendsSettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderFriendSettings(
    NodeName nodeName,
    FriendSettingsView friendSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(FriendSettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderNewFriend(
    NodeName nodeName,
    NewFriendView newFriendView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(NewFriendAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderShareInfo(
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(FriendsSettingsAction) queueAction) {
  throw UnimplementedError();
}
