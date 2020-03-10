import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../state/state.dart';
import '../actions/actions.dart';

import 'frame.dart';

Widget renderSettings(
    SettingsView settingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {
  return settingsView.match(
      home: () => _renderHome(nodesStates, queueAction),
      cardSettings: (cardSettingsView) => _renderCardSettings(
          cardSettingsView,
          nodesStates,
          (CardSettingsAction cardSettingsAction) =>
              queueAction(SettingsAction.cardSettings(cardSettingsAction))),
      newCard: (newCardView) => _renderNewCard(
          newCardView,
          nodesStates,
          (NewCardAction newCardAction) =>
              queueAction(SettingsAction.newCard(newCardAction))),
      selectCardAddRelay: (relayAddress) =>
          _renderSelectCardAddRelay(relayAddress, nodesStates, queueAction),
      selectCardAddIndex: (indexServerFile) =>
          _renderSelectCardAddIndex(indexServerFile, nodesStates, queueAction),
      selectCardAddFriend: (friendFile) =>
          _renderSelectCardAddFriend(friendFile, nodesStates, queueAction));
}

Widget _renderHome(BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {
  final children = <Widget>[];
  for (final entry in nodesStates.entries) {
    final nodeName = entry.key;
    // final nodeState = entry.value;
    final cardEntry = ListTile(
        key: Key(nodeName.inner),
        title: Text('${nodeName.inner}'),
        onTap: () => queueAction(SettingsAction.selectCard(nodeName)));
    children.add(cardEntry);
  }

  final listView =
      ListView(padding: const EdgeInsets.all(8), children: children);

  final newCardButton = FloatingActionButton.extended(
      onPressed: () => queueAction(SettingsAction.selectNewCard()),
      label: Text('New card'),
      icon: Icon(Icons.add));

  return frame(
      title: Text('Settings'),
      body: listView,
      backAction: () => queueAction(SettingsAction.back()),
      floatingActionButton: newCardButton);
}

Widget _renderNewCard(
    NewCardView newCardView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(NewCardAction) queueAction) {
  return newCardView.match(
      select: () => _renderNewCardSelect(nodesStates, queueAction),
      newLocal: () => _renderNewCardLocal(nodesStates, queueAction),
      newRemote: () => _renderNewCardRemote(nodesStates, queueAction),
      newRemoteName: (remoteCardFile) =>
          _renderNewRemoteName(remoteCardFile, nodesStates, queueAction));
}

Widget _renderNewCardSelect(BuiltMap<NodeName, NodeState> nodesStates,
    Function(NewCardAction) queueAction) {
  final body = Center(
      child: Column(children: [
    RaisedButton(
        onPressed: () => queueAction(NewCardAction.selectLocal()),
        child: Text('Local card')),
    RaisedButton(
        onPressed: () => queueAction(NewCardAction.selectRemote()),
        child: Text('Remote card')),
  ]));

  return frame(
      title: Text('New card'),
      body: body,
      backAction: () => queueAction(NewCardAction.back()));
}

Widget _renderNewCardLocal(BuiltMap<NodeName, NodeState> nodesStates,
    Function(NewCardAction) queueAction) {
  // Saves current node name:
  String _nodeName = '';

  // TODO: Add the ability to pick name:
  final body = Center(
      child: Row(children: [
    Spacer(flex: 1),
    Expanded(
        flex: 4,
        child: Column(children: [
          Expanded(
              flex: 1,
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text('Name:'),
                Expanded(
                    child: TextField(
                        onChanged: (newNodeName) => _nodeName = newNodeName)),
              ])),
          Spacer(flex: 2),
          Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                        onPressed: () => queueAction(
                            NewCardAction.newCardLocal(NodeName(_nodeName))),
                        child: Text('Ok')),
                    RaisedButton(
                        onPressed: () => queueAction(NewCardAction.back()),
                        child: Text('Cancel')),
                  ])),
        ])),
    Spacer(flex: 1),
  ]));

  return frame(
      title: Text('New local card'),
      body: body,
      backAction: () => queueAction(NewCardAction.back()));
}

Widget _renderNewCardRemote(BuiltMap<NodeName, NodeState> nodesStates,
    Function(NewCardAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderNewRemoteName(
    RemoteCardFile remoteCardFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(NewCardAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderCardSettings(
    CardSettingsView cardSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(CardSettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderSelectCardAddRelay(
    RelayAddress relayAddress,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderSelectCardAddIndex(
    IndexServerFile indexServerFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderSelectCardAddFriend(
    FriendFile friendFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {
  throw UnimplementedError();
}
