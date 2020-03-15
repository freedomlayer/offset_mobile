import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../../protocol/protocol.dart';
// import '../../protocol/file.dart';
import '../../state/state.dart';
import '../../actions/actions.dart';

import '../frame.dart';

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
  final nodeState = nodesStates[nodeName];
  assert(nodeState != null);

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  assert(nodeOpen != null);

  final children = <Widget>[];

  for (final entry in nodeOpen.compactReport.friends.entries) {
    final publicKey = entry.key;
    final friendReport = entry.value;

    children.add(ListTile(
      key: Key(publicKey.inner),
      title: Text(friendReport.name),
      trailing: Icon(friendReport.liveness.isOnline
          ? Icons.bluetooth_connected
          : Icons.bluetooth_disabled),
      onTap: () => queueAction(FriendsSettingsAction.selectFriend(publicKey)),
    ));
  }

  final listView = ListView(children: children);

  final body = Column(children: [
    Spacer(flex: 1),
    Expanded(flex: 2, child: RaisedButton(
        child: Text('Share info'),
        onPressed: () => queueAction(FriendsSettingsAction.shareInfo()))),
    Spacer(flex: 1),
    Expanded(flex: 18, child: listView),
  ]);

  final newFriendButton = FloatingActionButton.extended(
      onPressed: () => queueAction(FriendsSettingsAction.selectNewFriend()),
      label: Text('New Friend'),
      icon: Icon(Icons.add));

  return frame(
      title: Text('${nodeName.inner}: Friends'),
      body: body,
      backAction: () => queueAction(FriendsSettingsAction.back()),
      floatingActionButton: newFriendButton);
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
