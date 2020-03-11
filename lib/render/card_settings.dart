// import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
// import '../protocol/file.dart';
import '../state/state.dart';
import '../actions/actions.dart';

// import 'frame.dart';

Widget renderCardSettings(
    CardSettingsView cardSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(CardSettingsAction) queueAction) {
  final nodeName = cardSettingsView.nodeName;
  return cardSettingsView.inner.match(
      home: () => _renderCardSettingsHome(nodeName, nodesStates, queueAction),
      friends: (friendsSettingsView) => _renderFriendsSettings(
          nodeName, friendsSettingsView, nodesStates, queueAction),
      relays: (relaysSettingsView) => _renderRelaysSettings(
          nodeName, relaysSettingsView, nodesStates, queueAction),
      indexServers: (indexServersSettingsView) => _renderIndexServersSettings(
          nodeName, indexServersSettingsView, nodesStates, queueAction));
}

Widget _renderCardSettingsHome(
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(CardSettingsAction) queueAction) {
  throw UnimplementedError();
}

  /*
  final children = <Widget>[];
  for (final entry in nodesStates.entries) {
    final nodeName = entry.key;
    final nodeState = entry.value;

    // We only show open nodes. (We can not configure closed nodes):
    if (!nodeState.inner.isOpen) {
      continue;
    }

    final cardEntry = ListTile(
        key: Key(nodeName.inner),
        title: Text('${nodeName.inner}'),
        onTap: () => queueAction(SettingsAction.selectCardSharedIndex(nodeName, indexServerFile)));
    children.add(cardEntry);
  }

  final listView =
      ListView(padding: const EdgeInsets.all(8), children: children);


  return frame(
      title: Text('Card settings'),
      body: listView,
      backAction: () => queueAction(SettingsAction.back()));
  */

Widget _renderFriendsSettings(
    NodeName nodeName,
    FriendsSettingsView friendsSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(CardSettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderRelaysSettings(
    NodeName nodeName,
    RelaysSettingsView relaysSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(CardSettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderIndexServersSettings(
    NodeName nodeName,
    IndexServersSettingsView indexServersSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(CardSettingsAction) queueAction) {
  throw UnimplementedError();
}
