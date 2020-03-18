import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../state/state.dart';
import '../actions/actions.dart';

import 'frame.dart';

Widget renderSell(SellView sellView, BuiltMap<NodeName, NodeState> nodesStates,
    Function(SellAction) queueAction) {
  return sellView.match(
      selectCard: () => _renderSelectCard(nodesStates, queueAction),
      invoiceDetails: (nodeName) =>
          _renderInvoiceDetails(nodeName, nodesStates, queueAction),
      sendInvoice: (nodeName, invoiceId) =>
          _renderSendInvoice(nodeName, invoiceId, nodesStates, queueAction));
}

Widget _renderSelectCard(BuiltMap<NodeName, NodeState> nodesStates,
    Function(SellAction) queueAction) {
  final children = <Widget>[];

  nodesStates.forEach((nodeName, nodeState) {
    // We only show open nodes. (We can not configure closed nodes):
    final cardEntry = nodeState.inner.isOpen
        ? ListTile(
            key: Key(nodeName.inner),
            title: Text('${nodeName.inner}'),
            onTap: () => queueAction(SellAction.selectCard(nodeName)))
        : ListTile(
            key: Key(nodeName.inner),
            title: Text('${nodeName.inner}'),
            enabled: false);

    children.add(cardEntry);
  });

  final listView =
      ListView(padding: const EdgeInsets.all(8), children: children);

  return frame(
      title: Text('New Invoice: Select card'),
      body: listView,
      backAction: () => queueAction(SellAction.back()));
}

String _amountValidator(String amountString) {
  if (amountString.isEmpty) {
    return 'Can not be empty!';
  }

  final BigInt amount = BigInt.tryParse(amountString);
  if (amount == null) {
    return 'Invalid value';
  }

  if (amount < BigInt.from(0)) {
    return 'Must be non negative!';
  }

  return null;
}

Widget _renderInvoiceDetails(
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SellAction) queueAction) {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          SellAction.createInvoice(_currency, _amount, _description));
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
            /*
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
            */
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.payment),
                hintText: 'Amount of currency units',
                labelText: 'Amount',
              ),
              validator: _amountValidator,
              keyboardType: TextInputType.number,
              onSaved: (amountString) =>
                  _amount = U128(BigInt.tryParse(amountString)),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.description),
                hintText: 'What is this invoice for?',
                labelText: 'Description',
              ),
              validator: _amountValidator,
              keyboardType: TextInputType.text,
              inputFormatters: [LengthLimitingTextInputFormatter(32)],
              onSaved: (description) => _description = description,
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
                                queueAction(SellAction.back()),
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
              flex: 1, child: Text('Card: ${nodeName.inner}')),
          Expanded(flex: 16, child: form),
        ])));
  });

  return frame(
      title: Text('New invoice'),
      body: body,
      backAction: () => queueAction(SellAction.back()));

}

Widget _renderSendInvoice(
    NodeName nodeName,
    InvoiceId invoiceId,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SellAction) queueAction) {
  throw UnimplementedError();
}
