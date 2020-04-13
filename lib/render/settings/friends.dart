import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    final connColor = friendReport.liveness.isOnline
        ? Colors.green
        : friendReport.status.isEnabled ? Colors.orange : Colors.red;

    final connIcon = friendReport.channelStatus.isConsistent
        ? FontAwesomeIcons.handshake
        : FontAwesomeIcons.handshakeSlash;

    children.add(ListTile(
      key: Key(publicKey.inner),
      title: Text(friendReport.name),
      leading: Icon(Icons.person),
      trailing: FaIcon(connIcon, color: connColor),
      onTap: () => queueAction(FriendsSettingsAction.selectFriend(publicKey)),
    ));
  }

  final listView = children.isNotEmpty
      ? ListView(children: children, padding: EdgeInsets.all(8))
      : Center(child: Text('No friends configured'));

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

  final newFriendButton = FloatingActionButton.extended(
      onPressed: () => queueAction(FriendsSettingsAction.selectNewFriend()),
      label: Text('New Friend'),
      icon: Icon(Icons.add));

  final shareButton = nodeOpen.compactReport.relays.isNotEmpty
      ? IconButton(
          icon: Icon(Icons.share),
          onPressed: () => queueAction(FriendsSettingsAction.shareInfo()),
        )
      : IconButton(
          icon: Icon(Icons.share, color: Colors.grey),
          onPressed: null,
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
      'How to add new friend?',
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
    ])),
  ]);

  return frame(
      title: Text('New friend'),
      body: body,
      backAction: () => queueAction(NewFriendAction.back()));
}

Widget _renderNewFriendName(NodeName nodeName, FriendFile friendFile,
    NodeState nodeState, Function(NewFriendAction) queueAction) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Saves current relay name:
  String _friendName = '';

  final _submitForm = () {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      // Form is not valid
    } else {
      // Save form fields:
      form.save();
      queueAction(NewFriendAction.addFriend(_friendName, friendFile));
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
                leading: const FaIcon(FontAwesomeIcons.creditCard),
                title: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'How do you want to call this friend?',
                    labelText: 'Friend name',
                  ),
                  // TODO: Possibly add a validator?
                  keyboardType: TextInputType.text,
                  inputFormatters: [LengthLimitingTextInputFormatter(64)],
                  onSaved: (friendName) => _friendName = friendName,
                )),
            SizedBox(height: 24.0),
            Align(
                child: RaisedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.plus),
              label: const Text('Add friend'),
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
      title: Text('Friend name'),
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
    qrShow<FriendFile>(friendFile),
    SizedBox(height: 20.0),
    RaisedButton.icon(
        icon: FaIcon(FontAwesomeIcons.shareAlt),
        label: Text('Send card'),
        onPressed: () async =>
            await shareFile<FriendFile>(friendFile, 'local.friend')),
  ]);

  return frame(
      title: Text('Share card'),
      body: body,
      backAction: () => queueAction(FriendsSettingsAction.back()));
}
