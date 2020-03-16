import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      final subtitle = Text('limit: ${configReport.remoteMaxDebt.inner}' +
          '\nrate: ${ratePercent.toStringAsFixed(2)}% + ${configReport.rate.add}');

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

String _currencyNameValidator(String currencyName) {
  if (currencyName.isEmpty) {
    return 'Currency name can not be empty!';
  }

  if (currencyName.length > 16) {
    return 'Currency name too long!';
  }

  if (currencyName.length > 16) {
    return 'Currency name too long!';
  }

  final validChars = RegExp(r'^[A-Z]+$');
  if (!validChars.hasMatch(currencyName)) {
    return 'Currency name must only contain capital letters';
  }
  return null;
}

String _creditLimitValidator(String creditLimitString) {
  if (creditLimitString.isEmpty) {
    return 'credit limit can not be empty!';
  }

  final BigInt creditLimit = BigInt.tryParse(creditLimitString);
  if (creditLimit == null) {
    return 'Invalid credit limit value';
  }

  if (creditLimit < BigInt.from(0)) {
    return 'Credit limit must be non negative!';
  }

  return null;
}

Widget _renderNewCurrency(NodeName nodeName, PublicKey friendPublicKey,
    FriendReport friendReport, Function(FriendSettingsAction) queueAction) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Currency _currency;
  U128 _creditLimit;

  final _submitForm = () {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      // Form is not valid
    } else {
      // Save form fields:
      form.save(); 
      final rate = Rate((b) => b
        ..mul = 0
        ..add = 0);

      queueAction(
          FriendSettingsAction.newCurrency(_currency, _creditLimit, rate));
    }
  };


  final body =
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    final form = Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.attach_money),
                hintText: 'Currency name',
                labelText: 'Name',
              ),
              inputFormatters: [LengthLimitingTextInputFormatter(16)],
              validator: _currencyNameValidator,
              keyboardType: TextInputType.text,
              onSaved: (currencyName) => _currency = Currency(currencyName),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.cake),
                hintText: 'Maximum amount friend can owe me',
                labelText: 'Credit limit',
              ),
              validator: _creditLimitValidator,
              keyboardType: TextInputType.number,
              onSaved: (creditLimitString) =>
                  _creditLimit = U128(BigInt.tryParse(creditLimitString)),
            ),
            Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Spacer(flex: 1),
                      Expanded(
                          flex: 2,
                          child: RaisedButton(
                            child: const Text('Ok'),
                            onPressed: _submitForm,
                          )),
                      Spacer(flex: 1),
                      Expanded(
                          flex: 2,
                          child: RaisedButton(
                            child: const Text('Cancel'),
                            onPressed: () =>
                                queueAction(FriendSettingsAction.back()),
                          )),
                      Spacer(flex: 1),
                    ])),
          ],
        ));

    return SafeArea(
        top: false,
        bottom: false,
        child: Center(
            child: Column(children: [
          Spacer(flex: 1),
          Expanded(
              flex: 1, child: Text('${nodeName.inner} / ${friendReport.name}')),
          Expanded(flex: 16, child: form),
        ])));
  });

  return frame(
      title: Text('New Currency'),
      body: body,
      backAction: () => queueAction(FriendSettingsAction.back()));
}
