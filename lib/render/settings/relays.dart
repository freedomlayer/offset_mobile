import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../protocol/protocol.dart';
import '../../protocol/file.dart';
import '../../state/state.dart';
import '../../actions/actions.dart';

import '../utils/file_picker.dart';
import '../utils/qr_scan.dart';

import '../frame.dart';

import '../../logger.dart';

final logger = createLogger('render::settings::relays');

Widget renderRelaysSettings(
    NodeName nodeName,
    RelaysSettingsView relaysSettingsView,
    NodeState nodeState,
    Function(RelaysSettingsAction) queueAction) {
  return relaysSettingsView.match(
      home: () => _renderHome(nodeName, nodeState, queueAction),
      newRelaySelect: () => _renderNewRelay(nodeName, nodeState, queueAction),
      newRelayName: (relayAddress) =>
          _renderRelayName(nodeName, relayAddress, nodeState, queueAction));
}

Widget _renderHome(NodeName nodeName, NodeState nodeState,
    Function(RelaysSettingsAction) queueAction) {
  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  assert(nodeOpen != null);

  final children = <Widget>[];

  // Sort relays by name:
  final relays = nodeOpen.compactReport.relays.toList();
  relays.sort((a, b) => a.name.compareTo(b.name));

  for (final namedRelayAddress in relays) {
    children.add(ListTile(
      key: Key(namedRelayAddress.publicKey.inner),
      title: Text(namedRelayAddress.name),
      leading: FaIcon(FontAwesomeIcons.satellite),
      trailing: FlatButton(
          child: Icon(Icons.delete),
          onPressed: () => queueAction(
              RelaysSettingsAction.removeRelay(namedRelayAddress.publicKey))),
    ));
  }

  final listView = ListView(children: children, padding: EdgeInsets.all(8));

  final newRelayButton = FloatingActionButton.extended(
      onPressed: () => queueAction(RelaysSettingsAction.selectNewRelay()),
      label: Text('New Relay'),
      icon: Icon(Icons.add));

  final body = Column(children: [
    Container(
        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
        width: double.infinity,
        color: Colors.blue.shade50,
        child: ListTile(
            leading: const FaIcon(FontAwesomeIcons.creditCard),
            title: Text('${nodeName.inner}',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)))),
    Divider(height: 0, color: Colors.grey),
    Expanded(child: listView),
  ]);

  return frame(
      title: Text('Relays'),
      body: body,
      backAction: () => queueAction(RelaysSettingsAction.back()),
      floatingActionButton: newRelayButton);
}

Widget _renderNewRelay(NodeName nodeName, NodeState nodeState,
    Function(RelaysSettingsAction) queueAction) {
  final Future<void> Function() scanQrCode = () async {
    final relayAddress = await qrScan<RelayAddress>()
        .catchError((e) => logger.w('qrScan error: $e'));
    if (relayAddress != null) {
      queueAction(RelaysSettingsAction.loadRelay(relayAddress));
    }
  };

  final Future<void> Function() openFileExplorer = () async {
    final relayAddress = await pickFromFile<RelayAddress>(RELAY_EXT)
        .catchError((e) => logger.w('pickFromFile error: $e'));
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

Widget _renderRelayName(NodeName nodeName, RelayAddress relayAddress,
    NodeState nodeState, Function(RelaysSettingsAction) queueAction) {
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
                            RelaysSettingsAction.newRelay(
                                NamedRelayAddress((b) => b
                                  ..publicKey = relayAddress.publicKey
                                  ..address = relayAddress.address
                                  ..name = _relayName))),
                        child: Text('Ok')),
                    RaisedButton(
                        onPressed: () =>
                            queueAction(RelaysSettingsAction.back()),
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
