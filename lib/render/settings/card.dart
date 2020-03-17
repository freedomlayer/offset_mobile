import 'package:flutter/material.dart';

import '../../protocol/protocol.dart';
// import '../../protocol/file.dart';
import '../../state/state.dart';
import '../../actions/actions.dart';

import '../frame.dart';

import 'relays.dart';
import 'friends.dart';
import 'index_servers.dart';

Widget renderCardSettings(CardSettingsView cardSettingsView,
    NodeState nodeState, Function(CardSettingsAction) queueAction) {
  final nodeName = cardSettingsView.nodeName;
  return cardSettingsView.inner.match(
      home: () => _renderCardSettingsHome(nodeName, nodeState, queueAction),
      friends: (friendsSettingsView) => renderFriendsSettings(
          nodeName,
          friendsSettingsView,
          nodeState,
          (FriendsSettingsAction friendsSettingsAction) => queueAction(
              CardSettingsAction.friendsSettings(friendsSettingsAction))),
      relays: (relaysSettingsView) => renderRelaysSettings(
          nodeName,
          relaysSettingsView,
          nodeState,
          (RelaysSettingsAction relaysSettingsAction) => queueAction(
              CardSettingsAction.relaysSettings(relaysSettingsAction))),
      indexServers: (indexServersSettingsView) => renderIndexServersSettings(
          nodeName,
          indexServersSettingsView,
          nodeState,
          (IndexServersSettingsAction indexServersSettingsAction) =>
              queueAction(CardSettingsAction.indexServersSettings(
                  indexServersSettingsAction))));
}

enum CardPopup { remove }

Widget _renderCardSettingsHome(NodeName nodeName, NodeState nodeState,
    Function(CardSettingsAction) queueAction) {
  final children = <Widget>[];
  // Node name:
  children.add(ListTile(title: Text(nodeName.inner)));

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

  final listView =
      ListView(padding: const EdgeInsets.all(8), children: children);

  final popupMenuButton = PopupMenuButton<CardPopup>(
      onSelected: (CardPopup _result) => 
          queueAction(CardSettingsAction.remove()),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<CardPopup>>[
            PopupMenuItem<CardPopup>(
              value: CardPopup.remove,
              child: Text('Remove'),
              enabled: !nodeState.isEnabled,
            )
          ]);

  return frame(
      title: Text('Card settings'),
      body: listView,
      backAction: () => queueAction(CardSettingsAction.back()),
      actions: <Widget>[popupMenuButton]);
}
