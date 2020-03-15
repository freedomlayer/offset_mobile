import 'package:flutter/material.dart';

import '../../protocol/protocol.dart';
// import '../../protocol/file.dart';
import '../../state/state.dart';
import '../../actions/actions.dart';
// import '../utils/qr_show.dart';
// import '../utils/share_file.dart';

// import '../utils/file_picker.dart';
// import '../utils/qr_scan.dart';

// import '../../logger.dart';

import '../frame.dart';

Widget renderFriendSettings(
    NodeName nodeName,
    FriendSettingsView friendSettingsView,
    FriendReport friendReport,
    Function(FriendSettingsAction) queueAction) {
  final friendPublicKey = friendSettingsView.friendPublicKey;
  return friendSettingsView.inner.match(
      home: () => _renderFriendHome(
          nodeName, friendPublicKey, friendReport, queueAction),
      resolve: () =>
          _renderResolve(nodeName, friendPublicKey, friendReport, queueAction),
      currencySettings: (currency) => _renderCurrencySettings(
          nodeName, friendPublicKey, currency, friendReport, queueAction),
      newCurrency: () => _renderNewCurrency(
          nodeName, friendPublicKey, friendReport, queueAction));
}

Widget _renderFriendHome(NodeName nodeName, PublicKey friendPublicKey,
    FriendReport friendReport, Function(FriendSettingsAction) queueAction) {
  // TODO:
  final listView = ListView(children: []);

  final body = Center(
      child: Column(children: [
    Expanded(flex: 1, child: ListTile(title: Text(friendReport.name))),
    Expanded(
        flex: 1,
        child: SwitchListTile(
            value: friendReport.status.isEnabled,
            title: Text("Enable"),
            onChanged: (bool newValue) {
              if (newValue == true) {
                queueAction(FriendSettingsAction.enableFriend());
              } else {
                queueAction(FriendSettingsAction.disableFriend());
              }
            })),

    // TODO: Possibly move "unfriend" to a place where it is less likely to be clicked
    // on accidentally? Maybe some drawer that opens when three dots are clicked?
    Expanded(
        flex: 1,
        child: ListTile(
            title: Text('Unfriend'),
            onTap: () => queueAction(FriendSettingsAction.removeFriend()))),
    Expanded(flex: 1, child: ListTile(title: Text('Currencies'))),
    Expanded(flex: 10, child: listView),
  ]));

  // TODO: Possibly move "New Currency" to a place where it is less likely to be clicked
  // on accidentally? Maybe some drawer that opens when three dots are clicked?
  final newCurrencyButton = FloatingActionButton.extended(
      onPressed: () => queueAction(FriendSettingsAction.selectNewCurrency()),
      label: Text('New Currency'),
      icon: Icon(Icons.add));

  return frame(
      title: Text('${nodeName.inner}: Friend Settings'),
      body: body,
      backAction: () => queueAction(FriendSettingsAction.back()),
      floatingActionButton: friendReport.status.isEnabled ? newCurrencyButton : null);
}

Widget _renderResolve(NodeName nodeName, PublicKey friendPublicKey,
    FriendReport friendReport, Function(FriendSettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderCurrencySettings(
    NodeName nodeName,
    PublicKey friendPublicKey,
    Currency currency,
    FriendReport friendReport,
    Function(FriendSettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderNewCurrency(NodeName nodeName, PublicKey friendPublicKey,
    FriendReport friendReport, Function(FriendSettingsAction) queueAction) {
  throw UnimplementedError();
}
