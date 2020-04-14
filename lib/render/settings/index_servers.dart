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

final logger = createLogger('render::settings::index_servers');

Widget renderIndexServersSettings(
    NodeName nodeName,
    IndexServersSettingsView indexServersSettingsView,
    NodeState nodeState,
    Function(IndexServersSettingsAction) queueAction) {
  return indexServersSettingsView.match(
      home: () => _renderHome(nodeName, nodeState, queueAction),
      newIndexSelect: () =>
          _renderNewIndexServer(nodeName, nodeState, queueAction),
      newIndexName: (indexServerAddress) => IndexServerName(
          nodeName, indexServerAddress, nodeState, queueAction));
}

Widget _renderHome(NodeName nodeName, NodeState nodeState,
    Function(IndexServersSettingsAction) queueAction) {
  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  assert(nodeOpen != null);

  final children = <Widget>[];

  // Sort index servers by name:
  final indexServers = nodeOpen.compactReport.indexServers.toList();
  indexServers.sort((a, b) => a.name.compareTo(b.name));

  for (final namedIndexServerAddress in indexServers) {
    // Check if this is the currently connected index server:
    final iconColor = nodeOpen.compactReport.optConnectedIndexServer ==
            namedIndexServerAddress.publicKey
        ? Colors.green
        : null;

    children.add(ListTile(
      key: Key(namedIndexServerAddress.publicKey.inner),
      title: Text(namedIndexServerAddress.name),
      subtitle: Text(namedIndexServerAddress.address.inner),
      leading:
          FaIcon(FontAwesomeIcons.projectDiagram, size: 20.0, color: iconColor),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        FlatButton(
            child: Icon(Icons.delete),
            onPressed: () => queueAction(IndexServersSettingsAction.removeIndex(
                namedIndexServerAddress.publicKey)))
      ]),
    ));
  }

  final indexServersList = children.isNotEmpty
      ? ListView(children: children, padding: EdgeInsets.all(8))
      : Center(child: Text('No index servers configured'));

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
    Expanded(child: indexServersList),
  ]);

  final newIndexServerButton = FloatingActionButton.extended(
      onPressed: () => queueAction(IndexServersSettingsAction.selectNewIndex()),
      label: Text('New index server'),
      icon: Icon(Icons.add));

  return frame(
      title: Text('Index servers'),
      body: body,
      backAction: () => queueAction(IndexServersSettingsAction.back()),
      floatingActionButton: newIndexServerButton);
}

Widget _renderNewIndexServer(NodeName nodeName, NodeState nodeState,
    Function(IndexServersSettingsAction) queueAction) {
  final Future<void> Function() scanQrCode = () async {
    final indexServerFile = await qrScan<IndexServerFile>()
        .catchError((e) => logger.w('qrScan error: $e'));
    if (indexServerFile != null) {
      queueAction(IndexServersSettingsAction.loadIndexServer(indexServerFile));
    }
  };

  final Future<void> Function() openFileExplorer = () async {
    final indexServerAddress = await pickFromFile<IndexServerFile>(INDEX_EXT)
        .catchError((e) => logger.w('pickFromFile error: $e'));
    if (indexServerAddress != null) {
      queueAction(
          IndexServersSettingsAction.loadIndexServer(indexServerAddress));
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
      'How to add new Index server?',
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
          onTap: () => queueAction(IndexServersSettingsAction.newRandIndex()),
          title: Text('Random')),
    ])),
  ]);

  return frame(
      title: Text('New index server'),
      body: body,
      backAction: () => queueAction(IndexServersSettingsAction.back()));
}

class IndexServerName extends StatefulWidget {
  final NodeName nodeName;
  final IndexServerFile indexServerFile;
  final NodeState nodeState;
  final Function(IndexServersSettingsAction) queueAction;

  IndexServerName(
      this.nodeName, this.indexServerFile, this.nodeState, this.queueAction,
      {Key key})
      : super(key: key);

  @override
  _IndexServerNameState createState() => _IndexServerNameState();
}

class _IndexServerNameState extends State<IndexServerName> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Saves current indexServer name:
    String _indexServerName = '';

    final _submitForm = () {
      final FormState form = _formKey.currentState;

      if (!form.validate()) {
        // Form is not valid
      } else {
        // Save form fields:
        form.save();
        this.widget.queueAction(
            IndexServersSettingsAction.newIndex(NamedIndexServerAddress((b) => b
              ..publicKey = this.widget.indexServerFile.publicKey
              ..address = this.widget.indexServerFile.address
              ..name = _indexServerName)));
      }
    };

    final form = Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          children: <Widget>[
            ListTile(
                leading: const FaIcon(FontAwesomeIcons.projectDiagram),
                title: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'How do you want to call this server?',
                    labelText: 'Index server name',
                  ),
                  // TODO: Possibly add a validator?
                  keyboardType: TextInputType.text,
                  inputFormatters: [LengthLimitingTextInputFormatter(64)],
                  onSaved: (indexServerName) =>
                      _indexServerName = indexServerName,
                )),
            SizedBox(height: 24.0),
            Align(
                child: RaisedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.plus),
              label: const Text('Add index server'),
              onPressed: _submitForm,
            )),
          ],
        ));

    final body = SafeArea(
        top: false,
        bottom: false,
        child: Padding(padding: EdgeInsets.only(top: 16.0), child: form));

    return frame(
        title: Text('Index server name'),
        body: body,
        backAction: () =>
            this.widget.queueAction(IndexServersSettingsAction.back()));
  }
}
