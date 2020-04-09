import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  children.add(ListTile(
      leading: FaIcon(FontAwesomeIcons.creditCard),
      title: Text('${nodeName.inner}')));

  // Node type:
  final cardType = nodeState.info.isLocal
      ? ListTile(
          leading: FaIcon(FontAwesomeIcons.mobileAlt),
          title: Text('Local card'))
      : ListTile(
          leading: FaIcon(FontAwesomeIcons.networkWired),
          title: Text('Remote card'));
  children.add(cardType);

  // Node status (Is node connected?)
  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);
  final nodeStatus = nodeOpen != null
      ? ListTile(
          leading: FaIcon(FontAwesomeIcons.satelliteDish, color: Colors.green), title: Text('Connected'))
      : ListTile(
          leading: FaIcon(FontAwesomeIcons.satelliteDish, color: Colors.red), title: Text('Disconnected'));

  children.add(nodeStatus);

  children.add(Divider(color: Colors.grey));
  // children.add(ListTile(title: Divider(color: Colors.grey)));

  children.add(SwitchListTile(
      value: nodeState.isEnabled,
      secondary: FaIcon(FontAwesomeIcons.powerOff),
      title: Text("Enable"),
      onChanged: (bool newValue) {
        if (newValue == true) {
          queueAction(CardSettingsAction.enable());
        } else {
          queueAction(CardSettingsAction.disable());
        }
      }));

  children.add(ListTile(
      leading: FaIcon(FontAwesomeIcons.userFriends),
      title: Text('Friends'),
      enabled: nodeState.inner.isOpen,
      onTap: () => queueAction(CardSettingsAction.selectFriends())));

  children.add(Divider(color: Colors.grey));

  if (nodeOpen != null) {
    // If node is open and there are no relays and index servers,
    // add an option to automatically add random relays and index servers
    if (nodeOpen.compactReport.relays.isEmpty &&
        nodeOpen.compactReport.indexServers.isEmpty) {
      children.add(ListTile(
          leading: FaIcon(FontAwesomeIcons.hatWizard, color: Colors.blue),
          title: Text('Configure servers automatically', style: TextStyle(color: Colors.blue)),
          onTap: () => queueAction(CardSettingsAction.addRandRelayIndex())));
    }
  }


  children.add(ListTile(
      leading: FaIcon(FontAwesomeIcons.satellite),
      title: Text('Relays'),
      enabled: nodeState.inner.isOpen,
      onTap: () => queueAction(CardSettingsAction.selectRelays())));
  children.add(ListTile(
      leading: FaIcon(FontAwesomeIcons.projectDiagram),
      title: Text('Index servers'),
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
              child: ListTile(leading: Icon(Icons.delete), title: Text('Remove')),
              enabled: !nodeState.isEnabled,
            )
          ]);

  return frame(
      title: Text('Card settings'),
      body: listView,
      backAction: () => queueAction(CardSettingsAction.back()),
      actions: <Widget>[popupMenuButton]);
}
