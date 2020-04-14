import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../protocol/protocol.dart';
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
      currencySettings: (currency) => CurrencySettings(
          nodeName, friendPublicKey, currency, friendReport, queueAction),
      newCurrency: () =>
          NewCurrency(nodeName, friendPublicKey, friendReport, queueAction));
}

Widget _renderChannelInfoInconsistent(
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
      localData = Text('${balanceToString(localBalance)}');
      // 'Limit: ${amountToString(configReport.remoteMaxDebt)}');
    } else {
      localData = Text('Balance: (Pending)\n' +
          'Limit: ${amountToString(configReport.remoteMaxDebt)}');
    }

    DataCell remoteData;
    I128 remoteBalance;
    if (optRemoteProposalMap == null) {
      remoteData = DataCell(Text('?'));
    } else {
      final remoteProposalMap = optRemoteProposalMap;
      assert(remoteProposalMap != null);

      remoteBalance = remoteProposalMap.remove(currency);
      if (remoteBalance == null) {
        remoteData = DataCell(Text('Empty'), placeholder: true);
      } else {
        remoteData = DataCell(Text('${remoteBalance.inner}'));
      }
    }

    if ((localBalance == null) && (remoteBalance == null)) {
      continue;
    }

    rows.add(DataRow(cells: [
      DataCell(Text('${currency.inner}')),
      DataCell(localData),
      remoteData
    ]));
  }

  if (optRemoteProposalMap != null) {
    final remoteProposalMap = optRemoteProposal;
    for (final entry in remoteProposalMap.entries) {
      final currency = entry.key;
      final remoteBalance = entry.value;

      Widget remoteData;

      remoteData = Text('${balanceToString(remoteBalance)}');
      rows.add(DataRow(cells: [
        DataCell(Text('${currency.inner}')),
        DataCell(Text('Empty'), placeholder: true),
        DataCell(remoteData)
      ]));
    }
  }

  final dataTable = DataTable(
      columns: [
        DataColumn(label: Text('Currency')),
        DataColumn(label: Text('Local')),
        DataColumn(label: Text('Remote'))
      ],
      rows: rows);

  final scrollDataTable =
      SingleChildScrollView(scrollDirection: Axis.vertical, child: dataTable);

  return Column(children: [
    Expanded(child: scrollDataTable),
    SizedBox(height: 20.0),
    Container(
        color: Colors.blue.shade50,
        child: Column(children: [
          Divider(height: 0, color: Colors.grey),
          SizedBox(height: 10.0),
          Align(
              child: RaisedButton.icon(
            icon: FaIcon(FontAwesomeIcons.handshake),
            label: const Text('Accept'),
            onPressed: optRemoteProposal != null
                ? () => queueAction(FriendSettingsAction.resolve())
                : null,
          )),
          SizedBox(height: 10.0),
        ])),
  ]);
}

Widget _renderChannelInfoConsistent(
    FriendReport friendReport, Function(FriendSettingsAction) queueAction) {
  final channelConsistentReport = friendReport.channelStatus.match(
      inconsistent: (_) => null,
      consistent: (channelConsistentReport) => channelConsistentReport);

  final currencyReports = channelConsistentReport.currencyReports;

  final List<Widget> children = [];
  // TODO: Sort list here before iteration begins:
  for (final currency in friendReport.currencyConfigs.keys.toList()..sort()) {
    final configReport = friendReport.currencyConfigs[currency];
    final currencyReport = currencyReports[currency];
    Widget title;
    Widget trailing;
    if (currencyReport != null) {
      title = Text('${currency.inner}');
    } else {
      title = Text('${currency.inner}');
      trailing = FlatButton(
          child: Icon(Icons.delete),
          onPressed: friendReport.status.isEnabled
              ? () => queueAction(FriendSettingsAction.removeCurrency(currency))
              : null);
    }

    final balanceStr = currencyReport != null
        ? balanceToString(currencyReport.balance)
        : '(Pending)';

    final double ratePercent = (configReport.rate.mul / (1 << 32)) * 100;
    final addStr = amountToString(U128(BigInt.from(configReport.rate.add)));
    final subtitle = Text('balance: $balanceStr'
            '\nlimit: ${amountToString(configReport.remoteMaxDebt)}' +
        '\nrate: ${ratePercent.toStringAsFixed(2)}% + $addStr');

    final currencyColor = currencyReport == null
        ? Colors.grey
        : configReport.isOpen ? Colors.green : Colors.red;

    children.add(ListTile(
      key: Key(currency.inner),
      onTap: friendReport.status.isEnabled
          ? () => queueAction(FriendSettingsAction.selectCurrency(currency))
          : null,
      title: title,
      subtitle: subtitle,
      enabled: friendReport.status.isEnabled,
      leading: FaIcon(FontAwesomeIcons.coins, color: currencyColor),
      trailing: trailing,
    ));
  }

  return children.isNotEmpty
      ? ListView(padding: EdgeInsets.all(8), children: children)
      : Center(child: Text('No currencies configured'));
}

Widget _renderChannelInfo(
    FriendReport friendReport, Function(FriendSettingsAction) queueAction) {
  return friendReport.channelStatus.match(
      inconsistent: (channelInconsistentReport) =>
          _renderChannelInfoInconsistent(friendReport, queueAction),
      consistent: (channelConsistentReport) =>
          _renderChannelInfoConsistent(friendReport, queueAction));
}

/// Possible options for friend popup menu:
enum FriendPopup { unfriend }

Widget _renderFriendHome(NodeName nodeName, PublicKey friendPublicKey,
    FriendReport friendReport, Function(FriendSettingsAction) queueAction) {
  final friendColor = friendReport.liveness.isOnline
      ? Colors.green
      : friendReport.status.isEnabled ? Colors.orange : Colors.red;

  final body = Column(children: [
    Container(
        width: double.infinity,
        child: Column(children: [
          Container(
              width: double.infinity,
              color: Colors.blue.shade50,
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: ListTile(
                  leading: const FaIcon(FontAwesomeIcons.creditCard),
                  title: Text('${nodeName.inner}',
                      style: TextStyle(fontSize: 16.0)))),
          Divider(height: 0, color: Colors.grey),
          Container(
              width: double.infinity,
              color: Colors.blue.shade50,
              padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: SwitchListTile(
                  secondary: FaIcon(FontAwesomeIcons.user, color: friendColor),
                  title: Text('${friendReport.name}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0)),
                  value: friendReport.status.isEnabled,
                  onChanged: (bool newValue) {
                    if (newValue == true) {
                      queueAction(FriendSettingsAction.enableFriend());
                    } else {
                      queueAction(FriendSettingsAction.disableFriend());
                    }
                  })),
          Divider(height: 0, color: Colors.grey),
        ])),
    SizedBox(height: 16.0),
    Expanded(child: _renderChannelInfo(friendReport, queueAction)),
  ]);

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
              child: ListTile(
                  leading: Icon(Icons.delete), title: Text('Unfriend')),
            )
          ]);

  return frame(
      title: Text('Friend settings'),
      body: body,
      backAction: () => queueAction(FriendSettingsAction.back()),
      floatingActionButton:
          friendReport.status.isEnabled ? newCurrencyButton : null,
      actions: <Widget>[popupMenuButton]);
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

class CurrencySettings extends StatefulWidget {
  final NodeName nodeName;
  final PublicKey friendPublicKey;
  final Currency currency;
  final FriendReport friendReport;
  final Function(FriendSettingsAction) queueAction;

  CurrencySettings(this.nodeName, this.friendPublicKey, this.currency,
      this.friendReport, this.queueAction,
      {Key key})
      : super(key: key);

  @override
  _CurrencySettingsState createState() => _CurrencySettingsState();
}

class _CurrencySettingsState extends State<CurrencySettings> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: Possibly take more specific arguments for this function,
    // so that the following logic will be done on the outside?
    final currencyConfig =
        this.widget.friendReport.currencyConfigs[this.widget.currency];
    assert(currencyConfig != null);

    final channelConsistentReport = this
        .widget
        .friendReport
        .channelStatus
        .match(
            consistent: (channelConsistentReport) => channelConsistentReport,
            inconsistent: (_) => null);

    assert(channelConsistentReport != null);

    final currencyReport =
        channelConsistentReport.currencyReports[this.widget.currency];

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

        this.widget.queueAction(FriendSettingsAction.updateCurrency(
            this.widget.currency, _creditLimit, rate));
      }
    };

    final balanceStr = currencyReport != null
        ? balanceToString(currencyReport.balance)
        : '(Pending)';

    final formBody = StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) => Form(
            key: _formKey,
            autovalidate: true,
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: <Widget>[
                ListTile(
                    leading: FaIcon(FontAwesomeIcons.balanceScale),
                    title: Text('$balanceStr')),
                ListTile(
                    leading: FaIcon(FontAwesomeIcons.exchangeAlt),
                    title: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Maximum amount friend can owe me',
                        labelText: 'Credit limit',
                      ),
                      initialValue: '${amountToString(_creditLimit)}',
                      validator: _creditLimitValidator,
                      keyboardType: TextInputType.number,
                      onSaved: (creditLimitString) =>
                          _creditLimit = stringToAmount(creditLimitString),
                    )),
                ListTile(
                    leading: FaIcon(FontAwesomeIcons.percent),
                    title: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Percent commission',
                          labelText: 'Percent commission',
                        ),
                        initialValue:
                            ((_mul / (1 << 32)) * 100.0).toStringAsFixed(2),
                        validator: _percentValidator,
                        keyboardType: TextInputType.number,
                        onSaved: (percentString) => _mul =
                            ((double.parse(percentString) / 100.0) * (1 << 32))
                                .ceil())),
                ListTile(
                    leading: FaIcon(FontAwesomeIcons.plus),
                    title: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Constant commission',
                          labelText: 'Constant commission',
                        ),
                        initialValue:
                            '${amountToString(U128(BigInt.from(_add)))}',
                        validator: _addValidator,
                        keyboardType: TextInputType.number,
                        onSaved: (addString) =>
                            _add = stringToAmount(addString).inner.toInt())),
                SizedBox(height: 20.0),
                ListTile(
                    title: Align(
                        child: RaisedButton.icon(
                  icon: FaIcon(FontAwesomeIcons.check),
                  label: const Text('Apply'),
                  onPressed: _submitForm,
                ))),
              ],
            )));

    final friendColor = this.widget.friendReport.liveness.isOnline
        ? Colors.green
        : this.widget.friendReport.status.isEnabled
            ? Colors.orange
            : Colors.red;

    final currencyColor = currencyReport == null
        ? Colors.grey
        : currencyConfig.isOpen ? Colors.green : Colors.red;

    final body = SafeArea(
        top: false,
        bottom: false,
        child: Column(children: [
          Container(
              width: double.infinity,
              child: Column(children: [
                Container(
                    width: double.infinity,
                    color: Colors.blue.shade50,
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: ListTile(
                        leading: const FaIcon(FontAwesomeIcons.creditCard),
                        title: Text('${this.widget.nodeName.inner}',
                            style: TextStyle(fontSize: 16.0)))),
                Divider(height: 0, color: Colors.grey),
                Container(
                    width: double.infinity,
                    color: Colors.blue.shade50,
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: ListTile(
                        leading:
                            FaIcon(FontAwesomeIcons.user, color: friendColor),
                        title: Text('${this.widget.friendReport.name}'))),
                Divider(height: 0, color: Colors.grey),
                Container(
                    width: double.infinity,
                    color: Colors.blue.shade50,
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: SwitchListTile(
                        secondary: FaIcon(FontAwesomeIcons.coins,
                            color: currencyColor),
                        title: Text('${this.widget.currency.inner}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        value: currencyConfig.isOpen,
                        onChanged: (bool newValue) {
                          if (newValue == true) {
                            this.widget.queueAction(
                                FriendSettingsAction.openCurrency(
                                    this.widget.currency));
                          } else {
                            this.widget.queueAction(
                                FriendSettingsAction.closeCurrency(
                                    this.widget.currency));
                          }
                        })),
                Divider(height: 0, color: Colors.grey),
              ])),
          Expanded(child: formBody),
        ]));

    return frame(
        title: Text('Currency Settings'),
        body: body,
        backAction: () => this.widget.queueAction(FriendSettingsAction.back()));
  }
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

class NewCurrency extends StatefulWidget {
  final NodeName nodeName;
  final PublicKey friendPublicKey;
  final FriendReport friendReport;
  final Function(FriendSettingsAction) queueAction;

  NewCurrency(
      this.nodeName, this.friendPublicKey, this.friendReport, this.queueAction,
      {Key key})
      : super(key: key);

  @override
  _NewCurrencyState createState() => _NewCurrencyState();
}

class _NewCurrencyState extends State<NewCurrency> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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

        this.widget.queueAction(
            FriendSettingsAction.newCurrency(_currency, _creditLimit, rate));
      }
    };

    final formBody =
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return Form(
          key: _formKey,
          autovalidate: true,
          child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              ListTile(
                  leading: const FaIcon(FontAwesomeIcons.coins),
                  title: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Currency name',
                      labelText: 'Currency name',
                    ),
                    inputFormatters: [LengthLimitingTextInputFormatter(16)],
                    validator: _currencyNameValidator,
                    keyboardType: TextInputType.text,
                    onSaved: (currencyName) =>
                        _currency = Currency(currencyName),
                  )),
              ListTile(
                  leading: const FaIcon(FontAwesomeIcons.exchangeAlt),
                  title: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Maximum amount friend can owe me',
                      labelText: 'Credit limit',
                    ),
                    validator: _creditLimitValidator,
                    keyboardType: TextInputType.number,
                    onSaved: (creditLimitString) =>
                        _creditLimit = stringToAmount(creditLimitString),
                  )),
              SizedBox(height: 20.0),
              Align(
                  child: RaisedButton.icon(
                icon: FaIcon(FontAwesomeIcons.plus),
                label: const Text('Add currency'),
                onPressed: _submitForm,
              )),
            ],
          ));
    });

    final friendColor = this.widget.friendReport.liveness.isOnline
        ? Colors.green
        : this.widget.friendReport.status.isEnabled
            ? Colors.orange
            : Colors.red;

    final body = SafeArea(
        top: false,
        bottom: false,
        child: Column(children: [
          Container(
              width: double.infinity,
              child: Column(children: [
                Container(
                    width: double.infinity,
                    color: Colors.blue.shade50,
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: ListTile(
                        leading: const FaIcon(FontAwesomeIcons.creditCard),
                        title: Text('${this.widget.nodeName.inner}',
                            style: TextStyle(fontSize: 16.0)))),
                Divider(height: 0, color: Colors.grey),
                Container(
                    width: double.infinity,
                    color: Colors.blue.shade50,
                    padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: ListTile(
                        leading:
                            FaIcon(FontAwesomeIcons.user, color: friendColor),
                        title: Text('${this.widget.friendReport.name}'))),
                Divider(height: 0, color: Colors.grey),
              ])),
          Expanded(child: formBody)
        ]));

    return frame(
        title: Text('New Currency'),
        body: body,
        backAction: () => this.widget.queueAction(FriendSettingsAction.back()));
  }
}
