import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:built_collection/built_collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'utils/file_picker.dart';
import 'utils/qr_scan.dart';

import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../state/state.dart';
import '../actions/actions.dart';
import '../utils/keys_store.dart';

import 'settings/card.dart';

import 'frame.dart';

import '../logger.dart';

final logger = createLogger('render::settings');

Widget renderSettings(
    SettingsView settingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    KeysStore keysStore,
    Function(SettingsAction) queueAction) {
  return settingsView.match(
      home: () => _renderHome(nodesStates, queueAction),
      cardSettings: (cardSettingsView) {
        final nodeState = nodesStates[cardSettingsView.nodeName];
        assert(nodeState != null);
        return renderCardSettings(
            cardSettingsView,
            nodeState,
            keysStore,
            (CardSettingsAction cardSettingsAction) => queueAction(
                SettingsAction.cardSettings(
                    cardSettingsView.nodeName, cardSettingsAction)));
      },
      newCard: (newCardView) => _renderNewCard(
          newCardView,
          nodesStates,
          keysStore,
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
  for (final nodeName in nodesStates.keys.toList()..sort()) {
    final nodeState = nodesStates[nodeName];

    final trailing = !nodeState.isEnabled
        ? FaIcon(FontAwesomeIcons.satelliteDish, color: Colors.red)
        : nodeState.inner.isOpen
            ? FaIcon(FontAwesomeIcons.satelliteDish, color: Colors.green)
            : FaIcon(FontAwesomeIcons.satelliteDish, color: Colors.orange);

    final cardEntry = ListTile(
      key: Key(nodeName.inner),
      title: Text('${nodeName.inner}'),
      leading: Icon(Icons.credit_card),
      trailing: trailing,
      onTap: () => queueAction(SettingsAction.selectCard(nodeName)),
    );

    children.add(cardEntry);
  }

  final listView = children.isNotEmpty
      ? ListView(children: children, padding: EdgeInsets.all(8))
      : Center(
          child: Text('No cards configured'));
              

  final newCardButton = FloatingActionButton.extended(
      onPressed: () => queueAction(SettingsAction.selectNewCard()),
      label: Text('New card'),
      icon: Icon(Icons.add));

  final body = Padding(
      padding: EdgeInsets.only(top: 14.0),
      child: Column(children: [
        Text(
          'Please select a card',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        Expanded(child: listView),
      ]));

  return frame(
      title: Text('Settings'),
      body: body,
      backAction: () => queueAction(SettingsAction.back()),
      floatingActionButton: newCardButton);
}

Widget _renderNewCard(
    NewCardView newCardView,
    BuiltMap<NodeName, NodeState> nodesStates,
    KeysStore keysStore,
    Function(NewCardAction) queueAction) {
  return newCardView.match(
      select: () => _renderNewCardSelect(nodesStates, queueAction),
      newLocal: () => _renderNewCardLocal(nodesStates, keysStore, queueAction),
      newRemote: () => _renderNewCardRemote(nodesStates, queueAction),
      newRemoteName: (remoteCardFile) =>
          _renderNewRemoteName(remoteCardFile, nodesStates, keysStore, queueAction));
}

Widget _renderNewCardSelect(BuiltMap<NodeName, NodeState> nodesStates,
    Function(NewCardAction) queueAction) {
  final body = ListView(padding: const EdgeInsets.all(8), children: <Widget>[
    SizedBox(height: 16.0),
    Center(
        child: Text('Select card type',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))),
    SizedBox(height: 20.0),
    ListTile(
      leading: FaIcon(FontAwesomeIcons.mobileAlt, size: 36),
      title: Text('Local card'),
      subtitle: Text('Create a new card inside this device'),
      onTap: () => queueAction(NewCardAction.selectLocal()),
    ),
    ListTile(
      leading: FaIcon(FontAwesomeIcons.networkWired),
      title: Text('Remote card'),
      subtitle: Text('Connect to a remote card'),
      onTap: () => queueAction(NewCardAction.selectRemote()),
    )
  ]);

  return frame(
      title: Text('New card'),
      body: body,
      backAction: () => queueAction(NewCardAction.back()));
}

Widget _renderNewCardLocal(BuiltMap<NodeName, NodeState> nodesStates,
    KeysStore keysStore, Function(NewCardAction) queueAction) {
  final _formKey = keysStore.formKey('_renderNewCardLocal');

  // Saves current node name:
  String _nodeName = '';

  final _submitForm = () {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      // Form is not valid
    } else {
      // Save form fields:
      form.save();

      queueAction(NewCardAction.newCardLocal(NodeName(_nodeName)));
    }
  };

  final body =
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    final form = Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          // padding: const EdgeInsets.symmetric(horizontal: 8.0),
          children: <Widget>[
            ListTile(
                leading: const FaIcon(FontAwesomeIcons.creditCard),
                title: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'How do you want to call this card?',
                    labelText: 'Card name',
                  ),
                  // TODO: Possibly add a validator?
                  keyboardType: TextInputType.text,
                  inputFormatters: [LengthLimitingTextInputFormatter(64)],
                  onSaved: (nodeName) => _nodeName = nodeName,
                )),
            SizedBox(height: 24.0),
            Align(
                child: RaisedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.plus),
              label: const Text('Add card'),
              onPressed: _submitForm,
            )),
          ],
        ));

    return SafeArea(
        top: false,
        bottom: false,
        child: Padding(padding: EdgeInsets.all(8.0), child: form));
  });

  return frame(
      title: Text('New local card'),
      body: body,
      backAction: () => queueAction(NewCardAction.back()));
}

Widget _renderNewCardRemote(BuiltMap<NodeName, NodeState> nodesStates,
    Function(NewCardAction) queueAction) {
  final Future<void> Function() scanQrCode = () async {
    final remoteCardFile = await qrScan<RemoteCardFile>()
        .catchError((e) => logger.w('qrScan error: $e'));
    if (remoteCardFile != null) {
      // Load the remote card file:
      queueAction(NewCardAction.loadCardRemote(remoteCardFile));
    }
  };

  final Future<void> Function() openFileExplorer = () async {
    final remoteCardFile = await pickFromFile<RemoteCardFile>(REMOTE_CARD_EXT)
        .catchError((e) => logger.w('pickFromFile error: $e'));
    if (remoteCardFile != null) {
      // Load the remote card file:
      queueAction(NewCardAction.loadCardRemote(remoteCardFile));
    }
  };

  final body = Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Center(
          child: Column(children: [
        Text(
          'How to add remote card?',
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
      ])));

  return frame(
      title: Text('New remote card'),
      body: body,
      backAction: () => queueAction(NewCardAction.back()));
}

Widget _renderNewRemoteName(
    RemoteCardFile remoteCardFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    KeysStore keysStore,
    Function(NewCardAction) queueAction) {
  final _formKey = keysStore.formKey('_renderNewRemoteName::${remoteCardFile.nodePublicKey}');

  // Saves current node name:
  String _nodeName = '';

  final _submitForm = () {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      // Form is not valid
    } else {
      // Save form fields:
      form.save();
      queueAction(
          NewCardAction.newCardRemote(NodeName(_nodeName), remoteCardFile));
    }
  };

  final body =
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    final form = Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          // padding: const EdgeInsets.symmetric(horizontal: 8.0),
          children: <Widget>[
            ListTile(
                leading: const FaIcon(FontAwesomeIcons.creditCard),
                title: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'How do you want to call this card?',
                    labelText: 'Card name',
                  ),
                  // TODO: Possibly add a validator?
                  keyboardType: TextInputType.text,
                  inputFormatters: [LengthLimitingTextInputFormatter(64)],
                  onSaved: (nodeName) => _nodeName = nodeName,
                )),
            SizedBox(height: 24.0),
            Align(
                child: RaisedButton.icon(
              icon: const FaIcon(FontAwesomeIcons.plus),
              label: const Text('Add card'),
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
      title: Text('Remote card name'),
      body: body,
      backAction: () => queueAction(NewCardAction.back()));
}

Widget _renderSelectCardAddRelay(
    RelayAddress relayAddress,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {
  final children = <Widget>[];

  for (final nodeName in nodesStates.keys.toList()..sort()) {
    final nodeState = nodesStates[nodeName];

    // Only open cards can be chosen:
    final cardEntry = nodeState.inner.isOpen
        ? ListTile(
            leading: Icon(Icons.credit_card),
            key: Key(nodeName.inner),
            title: Text('${nodeName.inner}'),
            onTap: () => queueAction(
                SettingsAction.selectCardSharedRelay(nodeName, relayAddress)))
        : ListTile(
            leading: Icon(Icons.credit_card),
            key: Key(nodeName.inner),
            title: Text('${nodeName.inner}'),
            enabled: false);

    children.add(cardEntry);
  }

  final body = Padding(
      padding: EdgeInsets.only(top: 14.0),
      child: Column(
          children: <Widget>[
            Text(
              'Please select a card',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            Expanded(
                child: ListView(
                    padding: const EdgeInsets.all(8), children: children))
          ]));

  return frame(
      title: Text('Import relay'),
      body: body,
      backAction: () => queueAction(SettingsAction.back()));
}

Widget _renderSelectCardAddIndex(
    IndexServerFile indexServerFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {

  final children = <Widget>[];

  for (final nodeName in nodesStates.keys.toList()..sort()) {
    final nodeState = nodesStates[nodeName];

    // Only open cards can be chosen:
    final cardEntry = nodeState.inner.isOpen
        ? ListTile(
            leading: Icon(Icons.credit_card),
            key: Key(nodeName.inner),
            title: Text('${nodeName.inner}'),
            onTap: () => queueAction(
                SettingsAction.selectCardSharedIndex(nodeName, indexServerFile)))
        : ListTile(
            leading: Icon(Icons.credit_card),
            key: Key(nodeName.inner),
            title: Text('${nodeName.inner}'),
            enabled: false);

    children.add(cardEntry);
  }

  final body = Padding(
      padding: EdgeInsets.only(top: 14.0),
      child: Column(
          children: <Widget>[
            Text(
              'Please select a card',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            Expanded(
                child: ListView(
                    padding: const EdgeInsets.all(8), children: children))
          ]));

  return frame(
      title: Text('Import index server'),
      body: body,
      backAction: () => queueAction(SettingsAction.back()));
}

Widget _renderSelectCardAddFriend(
    FriendFile friendFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {

  final children = <Widget>[];

  for (final nodeName in nodesStates.keys.toList()..sort()) {
    final nodeState = nodesStates[nodeName];

    // Only open cards can be chosen:
    final cardEntry = nodeState.inner.isOpen
        ? ListTile(
            leading: Icon(Icons.credit_card),
            key: Key(nodeName.inner),
            title: Text('${nodeName.inner}'),
            onTap: () => queueAction(
                SettingsAction.selectCardSharedFriend(nodeName, friendFile)))
        : ListTile(
            leading: Icon(Icons.credit_card),
            key: Key(nodeName.inner),
            title: Text('${nodeName.inner}'),
            enabled: false);

    children.add(cardEntry);
  }

  final body = Padding(
      padding: EdgeInsets.only(top: 14.0),
      child: Column(
          children: <Widget>[
            Text(
              'Please select a card',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            Expanded(
                child: ListView(
                    padding: const EdgeInsets.all(8), children: children))
          ]));

  return frame(
      title: Text('Import friend'),
      body: body,
      backAction: () => queueAction(SettingsAction.back()));
}
