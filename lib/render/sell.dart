import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:built_collection/built_collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../protocol/protocol.dart';
import '../state/state.dart';
import '../actions/actions.dart';
import '../utils/keys_store.dart';

import 'utils/amount.dart';

import 'frame.dart';

Widget renderSell(SellView sellView, BuiltMap<NodeName, NodeState> nodesStates,
    KeysStore keysStore, Function(SellAction) queueAction) {
  return sellView.match(
      selectCard: () => _renderSelectCard(nodesStates, queueAction),
      invoiceDetails: (nodeName) =>
          _renderInvoiceDetails(nodeName, nodesStates, keysStore, queueAction));
}

Widget _renderSelectCard(BuiltMap<NodeName, NodeState> nodesStates,
    Function(SellAction) queueAction) {
  final children = <Widget>[];

  for (final nodeName in nodesStates.keys.toList()..sort()) {
    final nodeState = nodesStates[nodeName];
    // We only card that can be used for payment.
    final canCardPay = nodeState.inner.match(
        closed: () => false,
        open: (openNode) {
          for (final entry in openNode.compactReport.friends.entries) {
            final res = entry.value.channelStatus.match(
                inconsistent: (_) => false,
                consistent: (channelConsistentReport) =>
                    channelConsistentReport.currencyReports.isNotEmpty);
            if (res == true) {
              return true;
            }
          }
          return false;
        });

    final cardEntry = canCardPay
        ? ListTile(
            leading: Icon(Icons.credit_card),
            key: Key(nodeName.inner),
            title: Text('${nodeName.inner}'),
            onTap: () => queueAction(SellAction.selectCard(nodeName)))
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
          // crossAxisAlignment: CrossAxisAlignment.start,
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
      title: Text('New Invoice'),
      body: body,
      backAction: () => queueAction(SellAction.back()));
}

String _amountValidator(String amountString) {
  if (!verifyAmountString(amountString)) {
    return 'Must be a non negative value, up to $ACCURACY digits after decimal dot';
  }

  return null;
}

/// Get all useable currencies for a given card
List<Currency> _loadCurrencies(NodeState nodeState) {
  final currencies = Set<Currency>();

  nodeState.inner.match(
      closed: () => null,
      open: (openNode) {
        for (final entry in openNode.compactReport.friends.entries) {
          entry.value.channelStatus.match(
              inconsistent: (_) => null,
              consistent: (channelConsistentReport) =>
                  channelConsistentReport.currencyReports.forEach(
                      (currency, _currencyReport) => currencies.add(currency)));
        }
      });
  return List.from(currencies)..sort();
}

Widget _renderInvoiceDetails(
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    KeysStore keysStore,
    Function(SellAction) queueAction) {
  final nodeState = nodesStates[nodeName];
  assert(nodeState != null);
  final currencies = _loadCurrencies(nodeState);
  assert(currencies.isNotEmpty);

  final _formKey = keysStore.formKey('_renderInvoiceDetails::$nodeName');

  Currency _currency;
  U128 _amount;
  String _description;

  final _submitForm = () {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      // Form is not valid
    } else {
      // Save form fields:
      form.save();
      queueAction(
          SellAction.createInvoice(nodeName, _currency, _amount, _description));
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
            ListTile(
                leading: const FaIcon(FontAwesomeIcons.creditCard),
                title: Text('${nodeName.inner}')),
            ListTile(
                leading: const FaIcon(FontAwesomeIcons.yenSign),
                title: DropdownButton<Currency>(
                    hint: Text('Select Currency'),
                    items: currencies
                        .map((currency) => DropdownMenuItem<Currency>(
                            key: Key(currency.inner),
                            child: Text('${currency.inner}'),
                            value: currency))
                        .toList(),
                    value: _currency,
                    onChanged: (newCurrency) =>
                        setState(() => _currency = newCurrency),
                    isExpanded: true)),
            ListTile(
                leading: const FaIcon(FontAwesomeIcons.coins),
                title: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Amount of currency units',
                    labelText: 'Amount',
                  ),
                  validator: _amountValidator,
                  keyboardType: TextInputType.number,
                  onSaved: (amountString) =>
                      _amount = stringToAmount(amountString),
                )),
            ListTile(
                leading: const FaIcon(FontAwesomeIcons.comment),
                title: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'What is this invoice for?',
                    labelText: 'Description',
                  ),
                  // TODO: Possibly add a validator?
                  keyboardType: TextInputType.text,
                  inputFormatters: [LengthLimitingTextInputFormatter(64)],
                  onSaved: (description) => _description = description,
                )),
            SizedBox(height: 24.0),
            Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              RaisedButton(
                child: const Text('Ok'),
                onPressed: _submitForm,
              ),
              FlatButton(
                child: const Text('Cancel'),
                onPressed: () => queueAction(SellAction.back()),
              )
            ])),
          ],
        ));

    return SafeArea(
        top: false,
        bottom: false,
        child: Padding(padding: EdgeInsets.only(top: 16.0), child: form));
  });

  return frame(
      title: Text('New invoice'),
      body: body,
      backAction: () => queueAction(SellAction.back()));
}

/*
Widget _renderSendInvoice(
    NodeName nodeName,
    InvoiceId invoiceId,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SellAction) queueAction) {
  final nodeState = nodesStates[nodeName];
  assert(nodeState != null);

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);
  assert(nodeOpen != null);

  final openInvoice = nodeOpen.compactReport.openInvoices[invoiceId];
  assert(openInvoice != null);

  final invoiceFile = InvoiceFile((b) => b
    ..invoiceId = invoiceId
    ..currency = openInvoice.currency
    ..destPublicKey = nodeOpen.compactReport.localPublicKey
    ..destPayment = openInvoice.totalDestPayment
    ..description = openInvoice.description);

  final body = Center(
      child: Column(children: [
    SizedBox(height: 20),
    Center(child: Text('Send invoice to buyer')),
    Center(child: qrShow<InvoiceFile>(invoiceFile)),
    SizedBox(height: 20),
    Center(
        child: RaisedButton(
            // TODO: Create a better name for the invoice file:
            onPressed: () async => await shareFile<InvoiceFile>(
                invoiceFile, 'invoice.$INVOICE_EXT'),
            child: Text('Send File'))),
    SizedBox(height: 20),
    Center(
        child: RaisedButton(
            onPressed: () =>
                queueAction(SellAction.viewTransaction(nodeName, invoiceId)),
            child: Text('Ok'))),
    SizedBox(height: 20),
    Center(
        child: RaisedButton(
            onPressed: () =>
                queueAction(SellAction.cancelInvoice(nodeName, invoiceId)),
            child: Text('Cancel Invoice'))),
  ]));

  return frame(
      title: Text('Send Invoice'),
      body: body,
      backAction: () => queueAction(SellAction.back()));
}
*/
