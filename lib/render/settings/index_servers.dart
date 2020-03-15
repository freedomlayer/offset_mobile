import 'package:flutter/material.dart';

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
      newIndexSelect: () => _renderNewIndexServer(nodeName, nodeState, queueAction),
      newIndexName: (indexServerAddress) =>
          _renderIndexServerName(nodeName, indexServerAddress, nodeState, queueAction));
}

Widget _renderHome(NodeName nodeName, NodeState nodeState,
    Function(IndexServersSettingsAction) queueAction) {

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  assert(nodeOpen != null);

  final children = <Widget>[];

  for (final namedIndexServerAddress in nodeOpen.compactReport.indexServers) {
    children.add(ListTile(
      key: Key(namedIndexServerAddress.publicKey.inner),
      title: Text(namedIndexServerAddress.name),
      trailing: FlatButton(
          child: Icon(Icons.remove),
          onPressed: () => queueAction(
              IndexServersSettingsAction.removeIndex(namedIndexServerAddress.publicKey))),
    ));
  }

  final listView = ListView(children: children);

  final newIndexServerButton = FloatingActionButton.extended(
      onPressed: () => queueAction(IndexServersSettingsAction.selectNewIndex()),
      label: Text('New index server'),
      icon: Icon(Icons.add));

  return frame(
      title: Text('${nodeName.inner}: Index Servers'),
      body: listView,
      backAction: () => queueAction(IndexServersSettingsAction.back()),
      floatingActionButton: newIndexServerButton);
}

Widget _renderNewIndexServer(
    NodeName nodeName,
    NodeState nodeState,
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
      queueAction(IndexServersSettingsAction.loadIndexServer(indexServerAddress));
    }
  };

  final body = Center(
      child: Column(children: [
    Spacer(flex: 1),
    Expanded(flex: 1, child: Text('How to add new indexServer?')),
    Expanded(
        flex: 2,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          RaisedButton(onPressed: scanQrCode, child: Text('QR code')),
          RaisedButton(onPressed: openFileExplorer, child: Text('File')),
        ])),
  ]));

  return frame(
      title: Text('${nodeName.inner}: New Index Server'),
      body: body,
      backAction: () => queueAction(IndexServersSettingsAction.back()));
}

Widget _renderIndexServerName(
    NodeName nodeName,
    IndexServerFile indexServerFile,
    NodeState nodeState,
    Function(IndexServersSettingsAction) queueAction) {
  // Saves current indexServer name:
  String _indexServerName = '';

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
                        onChanged: (newNodeName) => _indexServerName = newNodeName)),
              ])),
          Spacer(flex: 2),
          Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                        // TODO: Add some kind of validation, so that we won't have empty named indexServer.
                        onPressed: () => queueAction(
                            IndexServersSettingsAction.newIndex(
                                NamedIndexServerAddress((b) => b
                                  ..publicKey = indexServerFile.publicKey
                                  ..address = indexServerFile.address
                                  ..name = _indexServerName))),
                        child: Text('Ok')),
                    RaisedButton(
                        onPressed: () =>
                            queueAction(IndexServersSettingsAction.back()),
                        child: Text('Cancel')),
                  ])),
        ])),
    Spacer(flex: 1),
  ]));

  return frame(
      title: Text('${nodeName.inner}: New Index Server name'),
      body: body,
      backAction: () => queueAction(IndexServersSettingsAction.back()));
}
