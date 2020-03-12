import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../../protocol/protocol.dart';
import '../../protocol/file.dart';
import '../../state/state.dart';
import '../../actions/actions.dart';

import '../utils/file_picker.dart';
import '../utils/qr_scan.dart';

import '../frame.dart';

Widget renderRelaysSettings(
    NodeName nodeName,
    RelaysSettingsView relaysSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(RelaysSettingsAction) queueAction) {
  return relaysSettingsView.match(
      home: () => _renderHome(nodeName, nodesStates, queueAction),
      newRelaySelect: () => _renderNewRelay(nodeName, nodesStates, queueAction),
      newRelayName: (relayAddress) =>
          _renderRelayName(nodeName, relayAddress, nodesStates, queueAction));
}

Widget _renderHome(NodeName nodeName, BuiltMap<NodeName, NodeState> nodesStates,
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

Widget _renderNewRelay(
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(RelaysSettingsAction) queueAction) {

  final Future<void> Function() scanQrCode = () async {
    final relayAddress = await qrScan<RelayAddress>()
        .catchError((e) => developer.log('qrScan error: $e'));
    if (relayAddress != null) {
      queueAction(RelaysSettingsAction.loadRelay(relayAddress));
    }
  };

  final Future<void> Function() openFileExplorer = () async {
    final relayAddress = await pickFromFile<RelayAddress>(RELAY_EXT)
        .catchError((e) => developer.log('pickFromFile error: $e'));
    if (relayAddress != null) {
      queueAction(RelaysSettingsAction.loadRelay(relayAddress));
    }
  };

  final body = Center(
      child: Column(children: [
    Spacer(flex: 1),
    Expanded(flex: 1, child: Text('How to add new relay?')),
    Expanded(
        flex: 2,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          RaisedButton(onPressed: scanQrCode, child: Text('QR code')),
          RaisedButton(onPressed: openFileExplorer, child: Text('File')),
        ])),
  ]));

  return frame(
      title: Text('${nodeName.inner}: New relay'),
      body: body,
      backAction: () => queueAction(RelaysSettingsAction.back()));
}

Widget _renderRelayName(
    NodeName nodeName,
    RelayAddress relayAddress,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(RelaysSettingsAction) queueAction) {

  // Saves current relay name:
  String _relayName = '';

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
                        onChanged: (newNodeName) => _relayName = newNodeName)),
              ])),
          Spacer(flex: 2),
          Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                        // TODO: Add some kind of validation, so that we won't have empty named relay.
                        onPressed: () => queueAction(
                            RelaysSettingsAction.newRelay(NamedRelayAddress((b) => b
                                    ..publicKey = relayAddress.publicKey
                                    ..address = relayAddress.address
                                    ..name = _relayName))),
                        child: Text('Ok')),
                    RaisedButton(
                        onPressed: () => queueAction(RelaysSettingsAction.back()),
                        child: Text('Cancel')),
                  ])),
        ])),
    Spacer(flex: 1),
  ]));

  return frame(
      title: Text('${nodeName.inner}: New relay name'),
      body: body,
      backAction: () => queueAction(RelaysSettingsAction.back()));
}
