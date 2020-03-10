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
        title: Text('$nodeName'),
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

Widget _renderNewCard(NewCardView newCardView, BuiltMap<NodeName, NodeState> nodesStates,
    Function(NewCardAction) queueAction) {

  final body = Column(children: []);

  return frame(
      title: Text('New card'),
      body: body,
      backAction: () => queueAction(NewCardAction.back()));
}

Widget _renderCardSettings(CardSettingsView cardSettingsView, BuiltMap<NodeName, NodeState> nodesStates,
    Function(CardSettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderSelectCardAddRelay(RelayAddress relayAddress, BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderSelectCardAddIndex(IndexServerFile indexServerFile, BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderSelectCardAddFriend(FriendFile friendFile, BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {
  throw UnimplementedError();
}
