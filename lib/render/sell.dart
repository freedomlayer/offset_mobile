import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../state/state.dart';
import '../actions/actions.dart';

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
  throw UnimplementedError();
}

Widget _renderInvoiceDetails(
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SellAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderSendInvoice(
    NodeName nodeName,
    InvoiceId invoiceId,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(SellAction) queueAction) {
  throw UnimplementedError();
}
