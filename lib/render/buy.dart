import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../state/state.dart';
import '../actions/actions.dart';

Widget renderBuy(BuyView buyView, BuiltMap<NodeName, NodeState> nodesStates,
    Function(BuyAction) queueAction) {
  return buyView.match(
      invoiceSelect: () => _renderInvoiceSelect(nodesStates, queueAction),
      invoiceInfo: (invoiceFile) =>
          _renderInvoiceInfo(invoiceFile, nodesStates, queueAction),
      selectCard: (invoiceFile) =>
          _renderSelectCard(invoiceFile, nodesStates, queueAction),
      paymentProgress: (nodeName, paymentId) =>
          _renderPaymentProgress(nodesStates, queueAction));
}

Widget _renderInvoiceSelect(BuiltMap<NodeName, NodeState> nodesStates,
    Function(BuyAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderInvoiceInfo(
    InvoiceFile invoiceFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(BuyAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderSelectCard(
    InvoiceFile invoiceFile,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(BuyAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderPaymentProgress(BuiltMap<NodeName, NodeState> nodesStates,
    Function(BuyAction) queueAction) {
  throw UnimplementedError();
}
