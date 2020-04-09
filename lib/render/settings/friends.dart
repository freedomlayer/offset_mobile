import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../protocol/protocol.dart';
import '../../protocol/file.dart';
import '../../state/state.dart';
import '../../actions/actions.dart';
import '../utils/qr_show.dart';
import '../utils/share_file.dart';

import '../utils/file_picker.dart';
import '../utils/qr_scan.dart';

import '../../logger.dart';

import '../frame.dart';

import 'friend.dart';

final logger = createLogger('render::settings::friends');

Widget renderFriendsSettings(
    NodeName nodeName,
    FriendsSettingsView friendsSettingsView,
    NodeState nodeState,
    Function(FriendsSettingsAction) queueAction) {
  return friendsSettingsView.match(
      home: () => _renderHome(nodeName, nodeState, queueAction),
      friendSettings: (friendSettingsView) {
        final nodeOpen = nodeState.inner
            .match(open: (nodeOpen) => nodeOpen, closed: () => null);

        assert(nodeOpen != null);

        final friendReport =
            nodeOpen.compactReport.friends[friendSettingsView.friendPublicKey];
        assert(friendReport != null);

        friendSettingsView.friendPublicKey;
        return renderFriendSettings(
            nodeName,
            friendSettingsView,
            friendReport,
            (FriendSettingsAction friendSettingsAction) => queueAction(
                FriendsSettingsAction.friendSettings(
                    friendSettingsView.friendPublicKey, friendSettingsAction)));
      },
      newFriend: (newFriendView) => _renderNewFriend(
          nodeName,
          newFriendView,
          nodeState,
          (NewFriendAction newFriendAction) =>
              queueAction(FriendsSettingsAction.newFriend(newFriendAction))),
      shareInfo: () => _renderShareInfo(nodeName, nodeState, queueAction));
}

Widget _renderHome(NodeName nodeName, NodeState nodeState,
    Function(FriendsSettingsAction) queueAction) {
  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  assert(nodeOpen != null);

  final children = <Widget>[];

  for (final publicKey in nodeOpen.compactReport.friends.keys.toList()
    ..sort()) {
    final friendReport = nodeOpen.compactReport.friends[publicKey];

    children.add(ListTile(
      key: Key(publicKey.inner),
      title: Text(friendReport.name),
      leading: Icon(Icons.person),
      trailing: Icon(friendReport.liveness.isOnline
          ? Icons.bluetooth_connected
          : Icons.bluetooth_disabled),
      onTap: () => queueAction(FriendsSettingsAction.selectFriend(publicKey)),
    ));
  }

  final listView = ListView(children: children);

  final body = Container(
      child: Column(children: [
    Container(
        width: double.infinity,
        color: Colors.blue.shade50,
        padding: EdgeInsets.all(8),
        child: ListTile(
            leading: const FaIcon(FontAwesomeIcons.creditCard),
            title: Text('${nodeName.inner}',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)))),
    Expanded(child: listView),
  ]));

  final newFriendButton = FloatingActionButton.extended(
      onPressed: () => queueAction(FriendsSettingsAction.selectNewFriend()),
      label: Text('New Friend'),
      icon: Icon(Icons.add));

  final shareButton = IconButton(
    icon: Icon(Icons.share),
    onPressed: () => queueAction(FriendsSettingsAction.shareInfo()),
  );

  return frame(
      title: Text('Friends'),
      body: body,
      backAction: () => queueAction(FriendsSettingsAction.back()),
      floatingActionButton: newFriendButton,
      actions: <Widget>[shareButton]);
}

Widget _renderNewFriend(NodeName nodeName, NewFriendView newFriendView,
    NodeState nodeState, Function(NewFriendAction) queueAction) {
  return newFriendView.match(
      select: () => _renderSelectNewFriend(nodeName, nodeState, queueAction),
      name: (friendFile) =>
          _renderNewFriendName(nodeName, friendFile, nodeState, queueAction));
}

Widget _renderSelectNewFriend(NodeName nodeName, NodeState nodeState,
    Function(NewFriendAction) queueAction) {
  final Future<void> Function() scanQrCode = () async {
    final friendFile = await qrScan<FriendFile>()
        .catchError((e) => logger.w('qrScan error: $e'));
    if (friendFile != null) {
      queueAction(NewFriendAction.loadFriend(friendFile));
    }
  };

  final Future<void> Function() openFileExplorer = () async {
    final friendFile = await pickFromFile<FriendFile>(FRIEND_EXT)
        .catchError((e) => logger.w('pickFromFile error: $e'));
    if (friendFile != null) {
      queueAction(NewFriendAction.loadFriend(friendFile));
    }
  };

  final body = Center(
      child: Column(children: [
    Spacer(flex: 1),
    Expanded(flex: 1, child: Text('How to add new Friend?')),
    Expanded(
        flex: 2,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          RaisedButton(onPressed: scanQrCode, child: Text('QR code')),
          RaisedButton(onPressed: openFileExplorer, child: Text('File')),
        ])),
  ]));

  return frame(
      title: Text('${nodeName.inner}: New Friend'),
      body: body,
      backAction: () => queueAction(NewFriendAction.back()));
}

Widget _renderNewFriendName(NodeName nodeName, FriendFile friendFile,
    NodeState nodeState, Function(NewFriendAction) queueAction) {
  // Saves current relay name:
  String _friendName = '';

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
                        onChanged: (newNodeName) => _friendName = newNodeName)),
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
                            NewFriendAction.addFriend(_friendName, friendFile)),
                        child: Text('Ok')),
                    RaisedButton(
                        onPressed: () => queueAction(NewFriendAction.back()),
                        child: Text('Cancel')),
                  ])),
        ])),
    Spacer(flex: 1),
  ]));

  return frame(
      title: Text('${nodeName.inner}: New friend name'),
      body: body,
      backAction: () => queueAction(NewFriendAction.back()));
}

Widget _renderShareInfo(NodeName nodeName, NodeState nodeState,
    Function(FriendsSettingsAction) queueAction) {
  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  assert(nodeOpen != null);

  final relaysList = nodeOpen.compactReport.relays
      .map((namedRelayAddress) => RelayAddress((b) => b
        ..publicKey = namedRelayAddress.publicKey
        ..address = namedRelayAddress.address))
      .toList();
  final relays = BuiltList<RelayAddress>(relaysList);

  final friendFile = FriendFile((b) => b
    ..publicKey = nodeOpen.compactReport.localPublicKey
    ..relays = relays.toBuilder());

  final body = Center(
      child: Column(children: [
    Spacer(flex: 1),
    Expanded(flex: 10, child: qrShow<FriendFile>(friendFile)),
    Spacer(flex: 1),
    Expanded(
        flex: 1,
        child: RaisedButton(
            child: Text('Share file'),
            onPressed: () async =>
                await shareFile<FriendFile>(friendFile, 'local.friend'))),
    Spacer(flex: 2),
  ]));

  return frame(
      title: Text('${nodeName.inner}: Share'),
      body: body,
      backAction: () => queueAction(FriendsSettingsAction.back()));
}
