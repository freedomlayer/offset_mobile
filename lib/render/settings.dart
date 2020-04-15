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

import 'settings/card.dart';
import 'select_card.dart';

import 'frame.dart';

import '../logger.dart';

final logger = createLogger('render::settings');

Widget renderSettings(
    SettingsView settingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {
  return settingsView.match(
      home: () => _renderHome(nodesStates, queueAction),
      cardSettings: (cardSettingsView) {
        final nodeState = nodesStates[cardSettingsView.nodeName];
        assert(nodeState != null);
        return renderCardSettings(
            cardSettingsView,
            nodeState,
            (CardSettingsAction cardSettingsAction) => queueAction(
                SettingsAction.cardSettings(
                    cardSettingsView.nodeName, cardSettingsAction)));
      },
      newCard: (newCardView) => _renderNewCard(
          newCardView,
          nodesStates,
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
      : Center(child: Text('No cards configured'));

  final newCardButton = FloatingActionButton.extended(
      onPressed: () => queueAction(SettingsAction.selectNewCard()),
      label: Text('New card'),
      icon: Icon(Icons.add));

  final body = Padding(padding: EdgeInsets.only(top: 8.0), child: listView);

  return frame(
      title: Text('Settings'),
      body: body,
      backAction: () => queueAction(SettingsAction.back()),
      floatingActionButton: newCardButton);
}

Widget _renderNewCard(
    NewCardView newCardView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(NewCardAction) queueAction) {
  return newCardView.match(
      select: () => _renderNewCardSelect(nodesStates, queueAction),
      newLocal: () => NewCardLocal(nodesStates, queueAction),
      newRemote: () => _renderNewCardRemote(nodesStates, queueAction),
      newRemoteName: (remoteCardFile) =>
          NewRemoteName(remoteCardFile, nodesStates, queueAction));
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

class NewCardLocal extends StatefulWidget {
  final BuiltMap<NodeName, NodeState> nodesStates;
  final Function(NewCardAction) queueAction;

  NewCardLocal(this.nodesStates, this.queueAction, {Key key}) : super(key: key);

  @override
  _NewCardLocalState createState() => _NewCardLocalState();
}

class _NewCardLocalState extends State<NewCardLocal> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Saves current node name:
    String _nodeName = '';

    final _submitForm = () {
      final FormState form = _formKey.currentState;

      if (!form.validate()) {
        // Form is not valid
      } else {
        // Save form fields:
        form.save();

        this
            .widget
            .queueAction(NewCardAction.newCardLocal(NodeName(_nodeName)));
      }
    };

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

    final body = SafeArea(
        top: false,
        bottom: false,
        child: Padding(padding: EdgeInsets.all(8.0), child: form));

    return frame(
        title: Text('New local card'),
        body: body,
        backAction: () => this.widget.queueAction(NewCardAction.back()));
  }
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

class NewRemoteName extends StatefulWidget {
  final RemoteCardFile remoteCardFile;
  final BuiltMap<NodeName, NodeState> nodesStates;
  final Function(NewCardAction) queueAction;

  NewRemoteName(this.remoteCardFile, this.nodesStates, this.queueAction,
      {Key key})
      : super(key: key);

  @override
  _NewRemoteNameState createState() => _NewRemoteNameState();
}

class _NewRemoteNameState extends State<NewRemoteName> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Saves current node name:
    String _nodeName = '';

    final _submitForm = () {
      final FormState form = _formKey.currentState;

      if (!form.validate()) {
        // Form is not valid
      } else {
        // Save form fields:
        form.save();
        this.widget.queueAction(NewCardAction.newCardRemote(
            NodeName(_nodeName), this.widget.remoteCardFile));
      }
    };

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

    final body = SafeArea(
        top: false,
        bottom: false,
        child: Padding(padding: EdgeInsets.only(top: 16.0), child: form));

    return frame(
        title: Text('Remote card name'),
        body: body,
        backAction: () => this.widget.queueAction(NewCardAction.back()));
  }
}

Widget _renderSelectCardAddRelay(
    RelayAddress relayAddress,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {

  final body = renderSelectCard(
      nodesStates.keys,
      List.from(nodesStates.keys)
        ..removeWhere((nodeName) => !nodesStates[nodeName].inner.isOpen),
      (nodeName) => queueAction(
          SettingsAction.selectCardSharedRelay(nodeName, relayAddress)));

  return frame(
      title: Text('Import relay'),
      body: body,
      backAction: () => queueAction(SettingsAction.back()));
}

Widget _renderSelectCardAddIndex(
    IndexServerFile indexServerFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {

  final body = renderSelectCard(
      nodesStates.keys,
      List.from(nodesStates.keys)
        ..removeWhere((nodeName) => !nodesStates[nodeName].inner.isOpen),
      (nodeName) => queueAction(
          SettingsAction.selectCardSharedIndex(nodeName, indexServerFile)));

  return frame(
      title: Text('Import index server'),
      body: body,
      backAction: () => queueAction(SettingsAction.back()));
}

Widget _renderSelectCardAddFriend(
    FriendFile friendFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SettingsAction) queueAction) {

  final body = renderSelectCard(
      nodesStates.keys,
      List.from(nodesStates.keys)
        ..removeWhere((nodeName) => !nodesStates[nodeName].inner.isOpen),
      (nodeName) => queueAction(
          SettingsAction.selectCardSharedFriend(nodeName, friendFile)));

  return frame(
      title: Text('Import friend'),
      body: body,
      backAction: () => queueAction(SettingsAction.back()));
}
