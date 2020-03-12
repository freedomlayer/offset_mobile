// import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../../protocol/protocol.dart';
// import '../../protocol/file.dart';
import '../../state/state.dart';
import '../../actions/actions.dart';

import '../frame.dart';

Widget renderRelaysSettings(
    NodeName nodeName,
    RelaysSettingsView relaysSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(RelaysSettingsAction) queueAction) {
  final nodeState = nodesStates[nodeName];
  assert(nodeState != null);

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  assert(nodeOpen != null);

  final children = <Widget>[];

  for (final namedRelayAddress in nodeOpen.compactReport.relays) {
    children.add(ListTile(
      key: Key(namedRelayAddress.publicKey.inner),
      title: Text(namedRelayAddress.name),
      trailing: Icon(Icons.remove),
    ));
  }

  final listView = ListView(children: children);

  final newRelayButton = FloatingActionButton.extended(
      onPressed: () => queueAction(RelaysSettingsAction.selectNewRelay()),
      label: Text('New Relay'),
      icon: Icon(Icons.add));


  return frame(
      title: Text('${nodeName.inner}: Relays'),
      body: listView,
      backAction: () => queueAction(RelaysSettingsAction.back()),
      floatingActionButton: newRelayButton);
}

