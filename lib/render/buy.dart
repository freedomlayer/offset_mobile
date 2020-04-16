import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../state/state.dart';
import '../actions/actions.dart';

import 'utils/file_picker.dart';
import 'utils/qr_scan.dart';
import 'utils/amount.dart';

import 'frame.dart';

import '../logger.dart';

final logger = createLogger('render::buy');

Widget renderBuy(BuyView buyView, BuiltMap<NodeName, NodeState> nodesStates,
    Function(BuyAction) queueAction) {
  return buyView.match(
      invoiceSelect: () => _renderInvoiceSelect(nodesStates, queueAction),
      invoiceInfo: (invoiceFile) =>
          _renderInvoiceInfo(invoiceFile, nodesStates, queueAction),
      selectCard: (invoiceFile) =>
          _renderSelectCard(invoiceFile, nodesStates, queueAction));
}

Widget _renderInvoiceSelect(BuiltMap<NodeName, NodeState> nodesStates,
    Function(BuyAction) queueAction) {
  final Future<void> Function() scanQrCode = () async {
    final invoiceFile = await qrScan<InvoiceFile>()
        .catchError((e) => logger.w('qrScan error: $e'));
    if (invoiceFile != null) {
      queueAction(BuyAction.loadInvoice(invoiceFile));
    }
  };

  final Future<void> Function() openFileExplorer = () async {
    final invoiceFile = await pickFromFile<InvoiceFile>(INVOICE_EXT)
        .catchError((e) => logger.w('pickFromFile error: $e'));
    if (invoiceFile != null) {
      queueAction(BuyAction.loadInvoice(invoiceFile));
    }
  };

  final body = Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Center(
          child: Column(children: [
        Text(
          'How to load invoice?',
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
      title: Text('Buy'),
      body: body,
      backAction: () => queueAction(BuyAction.back()));
}

Widget _renderInvoiceInfo(
    InvoiceFile invoiceFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(BuyAction) queueAction) {
  final listView = ListView(padding: EdgeInsets.all(8), children: <Widget>[
    Center(
        child: ListTile(
            leading: FaIcon(FontAwesomeIcons.coins),
            title: Text(
                '${amountToString(invoiceFile.destPayment)} ${invoiceFile.currency.inner}'))),
    ListTile(
        leading: const FaIcon(FontAwesomeIcons.comment),
        title: Text('${invoiceFile.description}')),
    SizedBox(height: 24.0),
    Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      RaisedButton.icon(
        icon: Icon(Icons.done, color: Colors.green),
        label: const Text('Select card'),
        onPressed: () => queueAction(BuyAction.confirmInfo()),
      ),
      SizedBox(width: 20.0),
      FlatButton.icon(
        icon: Icon(Icons.cancel, color: Colors.red),
        label: const Text('Cancel'),
        onPressed: () => queueAction(BuyAction.back()),
      )
    ])),
  ]);

  final body = Builder(
      builder: (BuildContext context) => Column(children: [
            Container(
                color: Theme.of(context).accentColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                        leading: FaIcon(FontAwesomeIcons.info),
                        title: Text('Invoice details')))),
            Divider(height: 0, color: Colors.grey),
            Expanded(child: listView),
          ]));

  return frame(
      title: Text('Buy'),
      body: body,
      backAction: () => queueAction(BuyAction.back()));
}

Widget _renderSelectCard(
    InvoiceFile invoiceFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(BuyAction) queueAction) {
  final children = <Widget>[];

  for (final nodeName in nodesStates.keys.toList()..sort()) {
    final nodeState = nodesStates[nodeName];
    // We only show open nodes. (We can not configure closed nodes):
    final cardEntry = nodeState.inner.isOpen
        ? ListTile(
            key: Key(nodeName.inner),
            leading: Icon(Icons.credit_card),
            title: Text('${nodeName.inner}'),
            onTap: () => queueAction(BuyAction.selectCard(nodeName)))
        : ListTile(
            key: Key(nodeName.inner),
            leading: Icon(Icons.credit_card),
            title: Text('${nodeName.inner}'),
            enabled: false);

    children.add(cardEntry);
  }

  final listView =
      ListView(padding: const EdgeInsets.all(8), children: children);

  return frame(
      title: Text('Select payment card'),
      body: listView,
      backAction: () => queueAction(BuyAction.back()));
}
