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

class BalanceRow {
  final Currency currency;
  final String local;
  final String remote;

  BalanceRow(this.currency, this.local, this.remote);
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

  final balanceRows = <BalanceRow>[];

  for (final entry in friendReport.currencyConfigs.entries) {
    final currency = entry.key;
    // final configReport = entry.value;

    final localBalance = localResetTerms[currency];
    final localData =
        localBalance != null ? '${balanceToString(localBalance)}' : '(Pending)';

    String remoteData;
    I128 remoteBalance;
    if (optRemoteProposalMap == null) {
      remoteData = '?';
    } else {
      final remoteProposalMap = optRemoteProposalMap;
      assert(remoteProposalMap != null);

      remoteBalance = remoteProposalMap.remove(currency);
      if (remoteBalance == null) {
        remoteData = '(Empty)';
      } else {
        remoteData = '${remoteBalance.inner}';
      }
    }

    balanceRows.add(BalanceRow(currency, localData, remoteData));
  }

  // Possibly add remaining entries from the remote proposal:
  if (optRemoteProposalMap != null) {
    final remoteProposalMap = optRemoteProposal;
    for (final entry in remoteProposalMap.entries) {
      final currency = entry.key;
      final remoteBalance = entry.value;

      final String remoteData = '${balanceToString(remoteBalance)}';
      balanceRows.add(BalanceRow(currency, '(Empty)', remoteData));
    }
  }

  balanceRows.sort((a, b) => a.currency.compareTo(b.currency));

  final dataTable = DataTable(
      columns: [
        DataColumn(label: Text('Currency')),
        DataColumn(label: Text('Local')),
        DataColumn(label: Text('Remote'))
      ],
      rows: balanceRows
          .map((balanceRow) => DataRow(cells: [
                DataCell(Text('${balanceRow.currency.inner}')),
                DataCell(Text(balanceRow.local)),
                DataCell(Text(balanceRow.remote))
              ]))
          .toList());

  final scrollDataTable =
      SingleChildScrollView(scrollDirection: Axis.vertical, child: dataTable);

  final acceptDialog = (BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Accept?'),
            content: Text('Accept remote proposal?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text("No", style: TextStyle(color: Colors.red)),
              ),
              // SizedBox(height: 32),
              FlatButton(
                onPressed: () {
                  queueAction(FriendSettingsAction.resolve());
                  Navigator.pop(context, true);
                },
                child: Text("Yes", style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ) ??
        false;
  };

  return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) =>
          Column(children: [
            Expanded(child: scrollDataTable),
            SizedBox(height: 20.0),
            Container(
                color: Theme.of(context).accentColor,
                child: Column(children: [
                  Divider(height: 0, color: Colors.grey),
                  SizedBox(height: 10.0),
                  Align(
                      child: RaisedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.handshake),
                    label: const Text('Accept'),
                    onPressed: optRemoteProposal != null
                        ? () async => await acceptDialog(context)
                        : null,
                  )),
                  SizedBox(height: 10.0),
                ])),
          ]));
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

    final ratePercentStr = mulRateToPercentString(configReport.rate.mul);

    final addStr = amountToString(U128(BigInt.from(configReport.rate.add)));
    final subtitle = Text('balance: $balanceStr'
            '\nlimit: ${amountToString(configReport.remoteMaxDebt)}' +
        '\nrate: $ratePercentStr% + $addStr');

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

  final body = Builder(
      builder: (BuildContext context) => Column(children: [
            Container(
                width: double.infinity,
                child: Column(children: [
                  Container(
                      width: double.infinity,
                      color: Theme.of(context).accentColor,
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: ListTile(
                          leading: const FaIcon(FontAwesomeIcons.creditCard),
                          title: Text('${nodeName.inner}',
                              style: TextStyle(fontSize: 16.0)))),
                  Divider(height: 0, color: Colors.grey),
                  Container(
                      width: double.infinity,
                      // color: Theme.of(context).accentColor,
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: SwitchListTile(
                          secondary:
                              FaIcon(FontAwesomeIcons.user, color: friendColor),
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
          ]));

  // TODO: Possibly move "New Currency" to a place where it is less likely to be clicked
  // on accidentally? Maybe some drawer that opens when three dots are clicked?
  final newCurrencyButton = friendReport.channelStatus.isConsistent
      ? FloatingActionButton.extended(
          onPressed: () =>
              queueAction(FriendSettingsAction.selectNewCurrency()),
          label: Text('New currency'),
          icon: Icon(Icons.add))
      : null;

  final unfriendDialog = (BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Unfriend?'),
            content: Text('Unfriend ${friendReport.name}?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text("No", style: TextStyle(color: Colors.red)),
              ),
              // SizedBox(height: 32),
              FlatButton(
                onPressed: () {
                  queueAction(FriendSettingsAction.removeFriend());
                  Navigator.pop(context, true);
                },
                child: Text("Yes", style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ) ??
        false;
  };

  final popupMenuButton = StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) =>
          PopupMenuButton<FriendPopup>(
              // TODO: Do we connect sync and async correctly here?
              // unfriendDialog is async function!
              onSelected: (FriendPopup _result) => unfriendDialog(context),
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<FriendPopup>>[
                    const PopupMenuItem<FriendPopup>(
                      value: FriendPopup.unfriend,
                      child: ListTile(
                          leading: Icon(Icons.delete), title: Text('Unfriend')),
                    )
                  ]));

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

  try { 
    final _ = percentStringToMulRate(percentString);
  } on AmountError {
    return 'Invalid value!';
  }

  return null;
}

String _addValidator(String addString) {
  if (!verifyAmountString(addString)) {
    return 'Invalid value';
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

  int _mul;
  String _percentString;
  int _add;
  U128 _creditLimit;

  @override
  void initState() {
    super.initState();

    final currencyConfig =
        this.widget.friendReport.currencyConfigs[this.widget.currency];
    assert(currencyConfig != null);

    _mul = currencyConfig.rate.mul;
    _percentString = mulRateToPercentString(_mul);
    _add = currencyConfig.rate.add;
    _creditLimit = currencyConfig.remoteMaxDebt;
  }

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

    final formBody = Form(
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
                    initialValue: mulRateToPercentString(_mul),
                    validator: _percentValidator,
                    keyboardType: TextInputType.number,
                    onSaved: (percentString) {
                        // We only update _mul if the new string is different than the old one.
                        // In the protocol, _mul is represented as 32 bits fixed fraction, and therefore
                        // usually can not be represented as a short decimal fraction.
                        //
                        // If we update every time, the value will probably
                        // change every time the user clicks on `Apply`.
                        if (percentString != _percentString) {
                          _percentString = percentString;
                          _mul = percentStringToMulRate(percentString);
                        }
                    })),
            ListTile(
                leading: FaIcon(FontAwesomeIcons.plus),
                title: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Constant commission',
                      labelText: 'Constant commission',
                    ),
                    initialValue: '${amountToString(U128(BigInt.from(_add)))}',
                    validator: _addValidator,
                    keyboardType: TextInputType.number,
                    onSaved: (addString) =>
                        _add = stringToAmount(addString).inner.toInt())),
            SizedBox(height: 20.0),
            ListTile(
                title: Align(
                    child: RaisedButton.icon(
              icon: FaIcon(FontAwesomeIcons.check, color: Colors.green),
              label: const Text('Apply'),
              onPressed: _submitForm,
            ))),
          ],
        ));

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
        child: Builder(
            builder: (BuildContext context) => Column(children: [
                  Container(
                      width: double.infinity,
                      child: Column(children: [
                        Container(
                            width: double.infinity,
                            color: Theme.of(context).accentColor,
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: ListTile(
                                leading:
                                    const FaIcon(FontAwesomeIcons.creditCard),
                                title: Text('${this.widget.nodeName.inner}',
                                    style: TextStyle(fontSize: 16.0)))),
                        Divider(height: 0, color: Colors.grey),
                        Container(
                            width: double.infinity,
                            color: Theme.of(context).accentColor,
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: ListTile(
                                leading: FaIcon(FontAwesomeIcons.user,
                                    color: friendColor),
                                title:
                                    Text('${this.widget.friendReport.name}'))),
                        Divider(height: 0, color: Colors.grey),
                        Container(
                            width: double.infinity,
                            // color: Theme.of(context).accentColor,
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: SwitchListTile(
                                secondary: FaIcon(FontAwesomeIcons.coins,
                                    color: currencyColor),
                                title: Text('${this.widget.currency.inner}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
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
                ])));

    return frame(
        title: Text('Currency settings'),
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
    return 'Invalid value';
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
  Currency _currency;
  U128 _creditLimit;

  @override
  Widget build(BuildContext context) {
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

    final formBody = Form(
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
                  textCapitalization: TextCapitalization.characters,
                  inputFormatters: [LengthLimitingTextInputFormatter(16)],
                  validator: _currencyNameValidator,
                  keyboardType: TextInputType.text,
                  onSaved: (currencyName) => _currency = Currency(currencyName),
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

    final friendColor = this.widget.friendReport.liveness.isOnline
        ? Colors.green
        : this.widget.friendReport.status.isEnabled
            ? Colors.orange
            : Colors.red;

    final body = SafeArea(
        top: false,
        bottom: false,
        child: Builder(
            builder: (BuildContext context) => Column(children: [
                  Container(
                      width: double.infinity,
                      child: Column(children: [
                        Container(
                            width: double.infinity,
                            color: Theme.of(context).accentColor,
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: ListTile(
                                leading:
                                    const FaIcon(FontAwesomeIcons.creditCard),
                                title: Text('${this.widget.nodeName.inner}',
                                    style: TextStyle(fontSize: 16.0)))),
                        Divider(height: 0, color: Colors.grey),
                        Container(
                            width: double.infinity,
                            color: Theme.of(context).accentColor,
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: ListTile(
                                leading: FaIcon(FontAwesomeIcons.user,
                                    color: friendColor),
                                title:
                                    Text('${this.widget.friendReport.name}'))),
                        Divider(height: 0, color: Colors.grey),
                      ])),
                  Expanded(child: formBody)
                ])));

    return frame(
        title: Text('New currency'),
        body: body,
        backAction: () => this.widget.queueAction(FriendSettingsAction.back()));
  }
}
