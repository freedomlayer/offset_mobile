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

/// Possible options for friend popup menu:
enum FriendPopup { unfriend }

Widget _renderFriendHome(NodeName nodeName, PublicKey friendPublicKey,
    FriendReport friendReport, Function(FriendSettingsAction) queueAction) {
  final currencyConfigs = friendReport.currencyConfigs;
  final Widget channelInfo = friendReport.channelStatus.match(
      inconsistent: (_channelInconsistentReport) {
    return Center(
        child: Row(children: [
      Expanded(flex: 1, child: Text('Inconsistency')),
      Spacer(flex: 1),
      Expanded(
          flex: 1,
          child: RaisedButton(
              child: Text('Resolve inconsistency'),
              onPressed: () =>
                  queueAction(FriendSettingsAction.selectResolve()))),
    ]));
  }, consistent: (channelConsistentReport) {
    final currencyReports = channelConsistentReport.currencyReports;

    final List<Widget> children = [];
    for (final entry in currencyConfigs.entries) {
      final currency = entry.key;
      final ConfigReport configReport = entry.value;

      final currencyReport = currencyReports[currency];
      Widget title;
      if (currencyReport != null) {
        title = Text('${currency.inner}: ${currencyReport.balance.inner}');
      } else {
        title = Text('${currency.inner} (Pending)');
      }

      final double ratePercent = (configReport.rate.mul / (1 << 32)) * 100;
      final subtitle = Text('limit: ${configReport.remoteMaxDebt}, ' +
          'rate: ${ratePercent.toStringAsFixed(2)}% + configReport.rate.add');

      children.add(ListTile(
        key: Key(currency.inner),
        title: title,
        subtitle: subtitle,
        enabled: friendReport.status.isEnabled,
      ));
    }
    return ListView(children: children);
  });

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
    Expanded(flex: 1, child: ListTile(title: Text('Currencies'))),
    Expanded(flex: 10, child: channelInfo),
  ]));

  // TODO: Possibly move "New Currency" to a place where it is less likely to be clicked
  // on accidentally? Maybe some drawer that opens when three dots are clicked?
  final newCurrencyButton = FloatingActionButton.extended(
      onPressed: () => queueAction(FriendSettingsAction.selectNewCurrency()),
      label: Text('New Currency'),
      icon: Icon(Icons.add));

  final popupMenuButton = PopupMenuButton<FriendPopup>(
      onSelected: (FriendPopup _result) =>
          queueAction(FriendSettingsAction.removeFriend()),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<FriendPopup>>[
            const PopupMenuItem<FriendPopup>(
              value: FriendPopup.unfriend,
              child: Text('Unfriend'),
            )
          ]);

  return frame(
      title: Text('${nodeName.inner}: Friend Settings'),
      body: body,
      backAction: () => queueAction(FriendSettingsAction.back()),
      floatingActionButton:
          friendReport.status.isEnabled ? newCurrencyButton : null,
      actions: <Widget>[popupMenuButton]);
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
