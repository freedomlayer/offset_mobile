// import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
// import '../protocol/file.dart';
import '../state/state.dart';
import '../actions/actions.dart';

import 'frame.dart';

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
  final children = <Widget>[];
  // Node name:
  children.add(ListTile(title: Text(nodeName.inner)));

  final nodeState = nodesStates[nodeName];
  // Must be non null:
  assert(nodeState != null);

  // Node type:
  final cardType = nodeState.info.isLocal ? 'local' : 'remote';
  children.add(ListTile(title: Text('Card type: $cardType')));

  // Node status (Is node connected?)
  final nodeStatus = nodeState.inner.isOpen ? 'connected' : 'disconnected';
  children.add(ListTile(title: Text('Node status: $nodeStatus')));

  children.add(SwitchListTile(
      value: nodeState.isEnabled,
      title: Text("Enable"),
      onChanged: (bool newValue) {
        if (newValue == true) {
          queueAction(CardSettingsAction.enable());
        } else {
          queueAction(CardSettingsAction.disable());
        }
      }));

  children.add(ListTile(title: Text('')));
  children.add(ListTile(
      title: Text('Friends'),
      enabled: nodeState.inner.isOpen,
      onTap: () => queueAction(CardSettingsAction.selectFriends())));
  children.add(ListTile(
      title: Text('Relays'),
      enabled: nodeState.inner.isOpen,
      onTap: () => queueAction(CardSettingsAction.selectRelays())));
  children.add(ListTile(
      title: Text('Index Servers'),
      enabled: nodeState.inner.isOpen,
      onTap: () => queueAction(CardSettingsAction.selectIndexServers())));

  final onPressed = nodeState.isEnabled
      ? null
      : () {
          queueAction(CardSettingsAction.remove());
        };
  children.add(Center(child: RaisedButton(onPressed: onPressed, child: Text('Remove card'))));

  final listView =
      ListView(padding: const EdgeInsets.all(8), children: children);

  return frame(
      title: Text('Card settings'),
      body: listView,
      backAction: () => queueAction(CardSettingsAction.back()));
}

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
