import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../state/state.dart';
import '../actions/actions.dart';

import 'utils/file_picker.dart';
import 'utils/qr_scan.dart';

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
          /*
      paymentProgress: (nodeName, paymentId) => _renderPaymentProgress(
          nodeName, paymentId, nodesStates, queueAction));
          */
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

  final body = Center(
      child: Column(children: [
    Spacer(flex: 1),
    Expanded(flex: 1, child: Text('How to load invoice')),
    Expanded(
        flex: 2,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          RaisedButton(onPressed: scanQrCode, child: Text('QR code')),
          RaisedButton(onPressed: openFileExplorer, child: Text('File')),
        ])),
  ]));

  return frame(
      title: Text('Select Invoice'),
      body: body,
      backAction: () => queueAction(BuyAction.back()));
}

Widget _renderInvoiceInfo(
    InvoiceFile invoiceFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(BuyAction) queueAction) {
  final body = Center(
      child: Column(children: <Widget>[
    SizedBox(height: 10),
    Text('Amount: ${invoiceFile.destPayment.inner}'),
    SizedBox(height: 10),
    Text('Description: ${invoiceFile.description}'),
    SizedBox(height: 10),
    Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      RaisedButton(
          child: Text('Pay'),
          onPressed: () => queueAction(BuyAction.confirmInfo())),
      RaisedButton(
          child: Text('Cancel'),
          onPressed: () => queueAction(BuyAction.back())),
    ]))
  ]));

  return frame(
      title: Text('Invoice info'),
      body: body,
      backAction: () => queueAction(BuyAction.back()));
}

Widget _renderSelectCard(
    InvoiceFile invoiceFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(BuyAction) queueAction) {
  final children = <Widget>[];

  nodesStates.forEach((nodeName, nodeState) {
    // We only show open nodes. (We can not configure closed nodes):
    final cardEntry = nodeState.inner.isOpen
        ? ListTile(
            key: Key(nodeName.inner),
            title: Text('${nodeName.inner}'),
            onTap: () => queueAction(BuyAction.selectCard(nodeName)))
        : ListTile(
            key: Key(nodeName.inner),
            title: Text('${nodeName.inner}'),
            enabled: false);

    children.add(cardEntry);
  });

  final listView =
      ListView(padding: const EdgeInsets.all(8), children: children);

  return frame(
      title: Text('Apply Commit'),
      body: listView,
      backAction: () => queueAction(BuyAction.back()));
}

/*
Widget _renderPaymentProgress(
    NodeName nodeName,
    PaymentId paymentId,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(BuyAction) queueAction) {

  final nodeState = nodesStates[nodeName];
  assert(nodeState != null);

  final nodeOpen = nodeState.inner.match(
      closed: () => null,
      open: (nodeOpen) => nodeOpen);
  assert(nodeOpen != null);

  final openPayment = nodeOpen.compactReport.openPayments[paymentId];
  return openPayment.status.match(
      searchingRoute: (_requestRoutesId) => throw UnimplementedError(),
      foundRoute: (confirmId, fees) => throw UnimplementedError(),
      sending: (fees) => throw UnimplementedError(),
      commit: (commit, fees) => throw UnimplementedError(),
      success: (receipt, fees, ackUid) => throw UnimplementedError(),
      failure: (ackUid) => throw UnimplementedError());
}
*/
