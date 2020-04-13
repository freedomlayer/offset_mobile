import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  // Do not allow to remove the last relay if the card has configured friends.
  final removeRelayFunc = ((relays.length <= 1) &&
          nodeOpen.compactReport.friends.isNotEmpty)
      ? (relayPublicKey) => null
      : (relayPublicKey) =>
          () => queueAction(RelaysSettingsAction.removeRelay(relayPublicKey));

  for (final namedRelayAddress in relays) {
    children.add(ListTile(
      key: Key(namedRelayAddress.publicKey.inner),
      title: Text(namedRelayAddress.name),
      subtitle: Text('${namedRelayAddress.address.inner}'),
      leading: FaIcon(FontAwesomeIcons.satellite),
      trailing: FlatButton(
          child: Icon(Icons.delete),
          onPressed: removeRelayFunc(namedRelayAddress.publicKey)),
    ));
  }

  final relaysList = children.isNotEmpty
      ? ListView(children: children, padding: EdgeInsets.all(8))
      : Center(child: Text('No relays configured'));

  final newRelayButton = FloatingActionButton.extended(
      onPressed: () => queueAction(RelaysSettingsAction.selectNewRelay()),
      label: Text('New relay'),
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
    Expanded(child: relaysList),
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
    SizedBox(height: 20.0),
    Text(
      'How to add new relay?',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
    ),
    Expanded(
        child: ListView(padding: EdgeInsets.all(8), children: [
      ListTile(
          leading: FaIcon(FontAwesomeIcons.qrcode),
          onTap: scanQrCode,
          title: Text('QR code')),
      ListTile(
          leading: FaIcon(FontAwesomeIcons.file),
          onTap: openFileExplorer,
          title: Text('File')),
      ListTile(
          leading: FaIcon(FontAwesomeIcons.hatWizard, color: Colors.blue),
          onTap: () => queueAction(RelaysSettingsAction.newRandRelay()),
          title: Text('Random')),
    ])),
  ]);

  return frame(
      title: Text('New relay'),
      body: body,
      backAction: () => queueAction(RelaysSettingsAction.back()));
}

Widget _renderRelayName(NodeName nodeName, RelayAddress relayAddress,
    NodeState nodeState, Function(RelaysSettingsAction) queueAction) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Saves current relay name:
  String _relayName = '';

  final _submitForm = () {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      // Form is not valid
    } else {
      // Save form fields:
      form.save();
      queueAction(RelaysSettingsAction.newRelay(NamedRelayAddress((b) => b
        ..publicKey = relayAddress.publicKey
        ..address = relayAddress.address
        ..name = _relayName)));
    }
  };

  final body =
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    final form = Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          children: <Widget>[
            ListTile(
                leading: const FaIcon(FontAwesomeIcons.satellite),
                title: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'How do you want to call this relay?',
                    labelText: 'Relay name',
                  ),
                  // TODO: Possibly add a validator?
                  keyboardType: TextInputType.text,
                  inputFormatters: [LengthLimitingTextInputFormatter(64)],
                  onSaved: (relayName) => _relayName = relayName,
                )),
            SizedBox(height: 24.0),
            Align(
                child: RaisedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.plus),
              label: const Text('Add relay'),
              onPressed: _submitForm,
            )),
          ],
        ));

    return SafeArea(
        top: false,
        bottom: false,
        child: Padding(padding: EdgeInsets.only(top: 16.0), child: form));
  });

  return frame(
      title: Text('Relay name'),
      body: body,
      backAction: () => queueAction(RelaysSettingsAction.back()));
}
