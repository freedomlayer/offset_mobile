import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../protocol/protocol.dart';
// import '../../protocol/file.dart';
import '../../state/state.dart';
import '../../actions/actions.dart';

import '../utils/amount.dart';

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
        child: Column(children: [
      SizedBox(height: 20),
      Text('Inconsistency'),
      SizedBox(height: 20),
      RaisedButton(
          child: Text('Resolve inconsistency'),
          onPressed: () => queueAction(FriendSettingsAction.selectResolve())),
    ]));
  }, consistent: (channelConsistentReport) {
    final currencyReports = channelConsistentReport.currencyReports;

    final List<Widget> children = [];
    // TODO: Sort list here before iteration begins:
    for (final entry in currencyConfigs.entries) {
      final currency = entry.key;
      final ConfigReport configReport = entry.value;

      final currencyReport = currencyReports[currency];
      Widget title;
      Widget trailing;
      if (currencyReport != null) {
        title = Text('${currency.inner}: ${currencyReport.balance.inner}');
        trailing = FlatButton(
            child: Icon(Icons.edit),
            onPressed: friendReport.status.isEnabled
                ? () =>
                    queueAction(FriendSettingsAction.selectCurrency(currency))
                : null);
      } else {
        title = Text('${currency.inner} (Pending)');
        trailing = FlatButton(
            child: Icon(Icons.delete),
            onPressed: friendReport.status.isEnabled
                ? () =>
                    queueAction(FriendSettingsAction.removeCurrency(currency))
                : null);
      }

      final double ratePercent = (configReport.rate.mul / (1 << 32)) * 100;
      final subtitle = Text('limit: ${configReport.remoteMaxDebt.inner}' +
          '\nrate: ${ratePercent.toStringAsFixed(2)}% + ${configReport.rate.add}');

      children.add(ListTile(
        key: Key(currency.inner),
        title: title,
        subtitle: subtitle,
        enabled: friendReport.status.isEnabled,
        trailing: trailing,
      ));
    }
    return Column(children: [
      Text('Currencies'),
      Expanded(child: ListView(children: children)),
    ]);
  });

  final body = Center(
      child: Column(children: [
    Expanded(
        flex: 1,
        child: ListTile(
            title: Center(
                child: Text('${nodeName.inner} / ${friendReport.name}')))),
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
    Expanded(flex: 10, child: channelInfo),
  ]));

  // TODO: Possibly move "New Currency" to a place where it is less likely to be clicked
  // on accidentally? Maybe some drawer that opens when three dots are clicked?
  final newCurrencyButton = friendReport.channelStatus.isConsistent
      ? FloatingActionButton.extended(
          onPressed: () =>
              queueAction(FriendSettingsAction.selectNewCurrency()),
          label: Text('New Currency'),
          icon: Icon(Icons.add))
      : null;

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
      title: Text('Friend Settings'),
      body: body,
      backAction: () => queueAction(FriendSettingsAction.back()),
      floatingActionButton:
          friendReport.status.isEnabled ? newCurrencyButton : null,
      actions: <Widget>[popupMenuButton]);
}

Widget _renderResolve(NodeName nodeName, PublicKey friendPublicKey,
    FriendReport friendReport, Function(FriendSettingsAction) queueAction) {
  final channelInconsistentReport = friendReport.channelStatus.match(
      inconsistent: (channelInconsistentReport) => channelInconsistentReport,
      consistent: (_) => null);

  final localResetTerms = channelInconsistentReport.localResetTerms;
  final optRemoteProposal =
      channelInconsistentReport.optRemoteResetTerms?.balanceForReset?.toMap();
  Map<Currency, I128> optRemoteProposalMap;
  if (optRemoteProposal != null) {
    optRemoteProposalMap = Map<Currency, I128>.from(optRemoteProposal);
  }

  final List<DataRow> rows = [];
  for (final entry in friendReport.currencyConfigs.entries) {
    final currency = entry.key;
    final configReport = entry.value;

    Widget localData;

    final localBalance = localResetTerms[currency];
    if (localBalance != null) {
      localData = Text('${currency.inner}: ${localBalance.inner}\n' +
          'limit: ${configReport.remoteMaxDebt.inner}');
    } else {
      localData = Text('${currency.inner} (Pending)\n' +
          'limit: ${configReport.remoteMaxDebt.inner}');
    }

    Widget remoteData;
    if (optRemoteProposalMap == null) {
      remoteData = Text('?');
    } else {
      final remoteProposalMap = optRemoteProposalMap;
      assert(remoteProposalMap != null);

      final remoteBalance = remoteProposalMap.remove(currency);
      if (remoteBalance == null) {
        remoteData = Text('Empty');
      } else {
        remoteData = Text('${remoteBalance.inner}');
      }
    }

    rows.add(DataRow(cells: [DataCell(localData), DataCell(remoteData)]));
  }

  if (optRemoteProposalMap != null) {
    final remoteProposalMap = optRemoteProposal;
    for (final entry in remoteProposalMap.entries) {
      final currency = entry.key;
      final remoteBalance = entry.value;

      Widget remoteData;

      remoteData = Text('${currency.inner}: ${remoteBalance.inner}');
      rows.add(DataRow(cells: [DataCell(Text('Empty')), DataCell(remoteData)]));
    }
  }

  final dataTable = DataTable(columns: [
    DataColumn(label: Text('Local')),
    DataColumn(label: Text('Remote'))
  ], rows: rows);

  final body = SafeArea(
      top: false,
      bottom: false,
      child: Center(
          child: Column(children: [
        SizedBox(height: 10),
        Text('${nodeName.inner} / ${friendReport.name}'),
        SizedBox(height: 20),
        dataTable,
        SizedBox(height: 20),
        Container(
            padding: EdgeInsets.only(top: 20.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Spacer(flex: 1),
                  Expanded(
                      flex: 2,
                      child: RaisedButton(
                        child: const Text('Accept'),
                        onPressed: optRemoteProposal != null
                            ? () => queueAction(FriendSettingsAction.resolve())
                            : null,
                      )),
                  Spacer(flex: 1),
                ])),
      ])));

  return frame(
      title: Text('Resolve inconsistency'),
      body: body,
      backAction: () => queueAction(FriendSettingsAction.back()));
}

String _percentValidator(String percentString) {
  if (percentString.isEmpty) {
    return 'Can not be empty!';
  }

  final percent = double.parse(percentString);
  if (percent == null) {
    return 'Invalid percent value!';
  }

  if (percent < 0.0 || percent > 100.0) {
    return 'Value out of bounds';
  }
  return null;
}

String _addValidator(String addString) {

  if (!verifyAmountString(addString)) {
    return 'Must be a non negative value, up to $ACCURACY digits after decimal dot';
  }

  final amount = stringToAmount(addString);
  if (!amount.inner.isValidInt) {
    return 'Please select a smaller value';
  }

  final intAmount = amount.inner.toInt();
  if (intAmount >= (1 << 32)) {
    return 'Please select a smaller value';
  }

  return null;
}

Widget _renderCurrencySettings(
    NodeName nodeName,
    PublicKey friendPublicKey,
    Currency currency,
    FriendReport friendReport,
    Function(FriendSettingsAction) queueAction) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TODO: Possibly take more specific arguments for this function,
  // so that the following logic will be done on the outside?
  final currencyConfig = friendReport.currencyConfigs[currency];
  assert(currencyConfig != null);

  final channelConsistentReport = friendReport.channelStatus.match(
      consistent: (channelConsistentReport) => channelConsistentReport,
      inconsistent: (_) => null);

  assert(channelConsistentReport != null);

  final currencyReport = channelConsistentReport.currencyReports[currency];
  assert(currencyReport != null);

  int _mul = currencyConfig.rate.mul;
  int _add = currencyConfig.rate.add;
  U128 _creditLimit = currencyConfig.remoteMaxDebt;

  final _submitForm = () {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      // Form is not valid
    } else {
      // Save form fields:
      form.save();
      final rate = Rate((b) => b
        ..mul = _mul
        ..add = _add);

      queueAction(
          FriendSettingsAction.updateCurrency(currency, _creditLimit, rate));
    }
  };

  final formBody =
      StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.cake),
                hintText: 'Maximum amount friend can owe me',
                labelText: 'Credit limit',
              ),
              initialValue: '${_creditLimit.inner}',
              validator: _creditLimitValidator,
              keyboardType: TextInputType.number,
              onSaved: (creditLimitString) =>
                  _creditLimit = U128(BigInt.tryParse(creditLimitString)),
            ),
            Row(children: [
              Expanded(
                  flex: 8,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.cake),
                      hintText: 'Percent commission',
                      labelText: 'Percent',
                    ),
                    initialValue:
                        ((_mul / (1 << 32)) * 100.0).toStringAsFixed(2),
                    validator: _percentValidator,
                    keyboardType: TextInputType.number,
                    onSaved: (percentString) => _mul =
                        ((double.parse(percentString) / 100.0) * (1 << 32))
                            .ceil(),
                  )),
              Expanded(flex: 1, child: Text('% + ')),
              Expanded(
                  flex: 8,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.cake),
                      hintText: 'Constant commission',
                      labelText: 'Constant',
                    ),
                    initialValue: '$_add',
                    validator: _addValidator,
                    keyboardType: TextInputType.number,
                    onSaved: (addString) => _add = stringToAmount(addString).inner.toInt(),
                  )),
            ]),
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
  });

  final body = SafeArea(
      top: false,
      bottom: false,
      child: Center(
          child: Column(children: [
        Spacer(flex: 1),
        Expanded(
            flex: 1,
            child: Text(
                '${nodeName.inner} / ${friendReport.name} / ${currency.inner}')),
        Expanded(
            flex: 2,
            child: SwitchListTile(
                title: Text('Open'),
                value: currencyConfig.isOpen,
                onChanged: (bool newValue) {
                  if (newValue == true) {
                    queueAction(FriendSettingsAction.openCurrency(currency));
                  } else {
                    queueAction(FriendSettingsAction.closeCurrency(currency));
                  }
                })),
        Expanded(
            flex: 2,
            child: ListTile(
                title: Text('Balance: ${currencyReport.balance.inner}'))),
        Expanded(flex: 16, child: formBody),
      ])));

  return frame(
      title: Text('Currency Settings'),
      body: body,
      backAction: () => queueAction(FriendSettingsAction.back()));
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
  if (!verifyAmountString(creditLimitString)) {
    return 'Must be a non negative value, up to $ACCURACY digits after decimal dot';
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
                  _creditLimit = stringToAmount(creditLimitString),
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
