import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../state/state.dart';
import '../actions/actions.dart';

import 'frame.dart';

Widget renderBalances(
    BalancesView balancesView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(BalancesAction) queueAction) {
  return balancesView.match(
      selectCard: () => _renderSelectCard(nodesStates, queueAction),
      cardBalances: (nodeName) =>
          _renderCardBalances(nodeName, nodesStates, queueAction));
}

Widget _renderSelectCard(BuiltMap<NodeName, NodeState> nodesStates,
    Function(BalancesAction) queueAction) {
  final children = <Widget>[];
  for (final entry in nodesStates.entries) {
    final nodeName = entry.key;
    final nodeState = entry.value;
    final cardEntry = ListTile(
      key: Key(nodeName.inner),
      title: Text('${nodeName.inner}'),
      enabled: nodeState.inner.isOpen,
      leading: Icon(Icons.credit_card),
      onTap: nodeState.inner.isOpen
          ? () => queueAction(BalancesAction.selectCard(nodeName))
          : null,
    );

    children.add(cardEntry);
  }

  final listView = ListView(padding: EdgeInsets.all(8), children: children);

  return frame(
      title: Text('Balances'),
      body: listView,
      backAction: () => queueAction(BalancesAction.back()));
}

Widget _renderCardBalances(
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(BalancesAction) queueAction) {
  throw UnimplementedError();
}
