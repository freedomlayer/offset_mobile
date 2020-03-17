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

Map<Currency, I128> calcBalances(BuiltMap<PublicKey, FriendReport> friends) {
  // TODO:
  return Map<Currency, I128>();
}

Widget _renderCardBalances(
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(BalancesAction) queueAction) {
  final nodeState = nodesStates[nodeName];
  assert(nodeState != null);

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);
  assert(nodeOpen != null);

  final balances = calcBalances(nodeOpen.compactReport.friends);
  final sortedCurrencies = balances.keys.toList()..sort();
  final rows = <DataRow>[];
  for (final currency in sortedCurrencies) {
    final balance = balances[currency];
    rows.add(DataRow(cells: [
      DataCell(Text('${currency.inner}')),
      DataCell(Text('${balance.inner}'))
    ]));
  }

  final body = Center(
      child: Column(children: [
    SizedBox(height: 10),
    Text('${nodeName.inner}'),
    SizedBox(height: 10),
    DataTable(columns: [
      DataColumn(label: Text('Currency')),
      DataColumn(label: Text('Balance')),
    ], rows: rows)
  ]));

  return frame(
      title: Text('Card Balances'),
      body: body,
      backAction: () => queueAction(BalancesAction.back()));
}
