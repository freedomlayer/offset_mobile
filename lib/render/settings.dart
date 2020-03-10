import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../state/state.dart';
import '../actions/actions.dart';

import 'frame.dart';

Widget renderSettings(
    SettingsView settingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
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
