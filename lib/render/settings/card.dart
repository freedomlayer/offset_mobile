import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../protocol/protocol.dart';
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
  // Node status (Is node connected?)
  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final children = <Widget>[];

  final connColor = nodeOpen != null ? Colors.green : Colors.red;

  // Node type:
  final cardType = nodeState.info.isLocal
      ? ListTile(
          leading: FaIcon(FontAwesomeIcons.mobileAlt, color: connColor),
          title: Text('Local card'))
      : ListTile(
          leading: FaIcon(FontAwesomeIcons.networkWired, color: connColor),
          title: Text('Remote card'));
  children.add(cardType);

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
      trailing: nodeOpen?.compactReport?.friends?.isEmpty ?? false
          ? FaIcon(FontAwesomeIcons.exclamationTriangle, color: Colors.orange)
          : null,
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
          title: Text('Configure servers automatically',
              style: TextStyle(color: Colors.blue)),
          onTap: () => queueAction(CardSettingsAction.addRandRelayIndex())));
    }
  }

  children.add(ListTile(
      leading: FaIcon(FontAwesomeIcons.satellite),
      trailing: nodeOpen?.compactReport?.relays?.isEmpty ?? false
          ? FaIcon(FontAwesomeIcons.exclamationTriangle, color: Colors.orange)
          : null,
      title: Text('Relays'),
      enabled: nodeState.inner.isOpen,
      onTap: () => queueAction(CardSettingsAction.selectRelays())));
  children.add(ListTile(
      leading: FaIcon(FontAwesomeIcons.projectDiagram),
      trailing: nodeOpen?.compactReport?.indexServers?.isEmpty ?? false
          ? FaIcon(FontAwesomeIcons.exclamationTriangle, color: Colors.orange)
          : null,
      title: Text('Index servers'),
      enabled: nodeState.inner.isOpen,
      onTap: () => queueAction(CardSettingsAction.selectIndexServers())));

  final listView =
      ListView(padding: const EdgeInsets.all(8), children: children);

  final body = Builder(
      builder: (BuildContext context) => Column(children: [
            Container(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                width: double.infinity,
                color: Theme.of(context).accentColor,
        child: ListTile(
            leading: const FaIcon(FontAwesomeIcons.creditCard),
            title: Text('${nodeName.inner}',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)))),
    Divider(height: 0, color: Colors.grey),
    Expanded(child: listView),
  ]));

  final removeCardDialog = (BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Remove?'),
            content: Text('Remove card ${nodeName.inner}?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text("No", style: TextStyle(color: Colors.red)),
              ),
              // SizedBox(height: 32),
              FlatButton(
                onPressed: () {
                  queueAction(CardSettingsAction.remove());
                  Navigator.pop(context, true);
                },
                child: Text("Yes", style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ) ??
        false;
  };

  final popupMenuButton = StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) =>
          PopupMenuButton<CardPopup>(
              onSelected: (CardPopup _result) => removeCardDialog(context),
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<CardPopup>>[
                    PopupMenuItem<CardPopup>(
                      value: CardPopup.remove,
                      child: ListTile(
                          leading: Icon(Icons.delete), title: Text('Remove')),
                      enabled: !nodeState.isEnabled,
                    )
                  ]));

  return frame(
      title: Text('Card settings'),
      body: body,
      backAction: () => queueAction(CardSettingsAction.back()),
      actions: <Widget>[popupMenuButton]);
}
