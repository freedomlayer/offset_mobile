import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../state/state.dart';
import '../actions/actions.dart';

import 'utils/amount.dart';

import 'select_card.dart';

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

  final body = renderSelectCard(
      nodesStates.keys,
      List.from(nodesStates.keys)
        ..removeWhere((nodeName) => !nodesStates[nodeName].inner.isOpen),
      (nodeName) => queueAction(
          BalancesAction.selectCard(nodeName)));

  return frame(
      title: Text('Balances'),
      body: body,
      backAction: () => queueAction(BalancesAction.back()));
}

/// Obtain balances for a single friend
Map<Currency, BigInt> calcFriendBalances(FriendReport friendReport) {
  return friendReport.channelStatus.match(
      consistent: (channelConsistentReport) {
    return channelConsistentReport.currencyReports.asMap().map(
        (currency, currencyReport) =>
            MapEntry<Currency, BigInt>(currency, currencyReport.balance.inner));
  }, inconsistent: (channelInconsistentReport) {
    return channelInconsistentReport.localResetTerms.asMap().map(
        (currency, i128) => MapEntry<Currency, BigInt>(currency, i128.inner));
  });
}

/// Calc balances total for a card
Map<Currency, BigInt> calcBalances(BuiltMap<PublicKey, FriendReport> friends) {
  final balances = Map<Currency, BigInt>();

  for (final entry in friends.entries) {
    final friendReport = entry.value;
    final friendBalances = calcFriendBalances(friendReport);
    for (final balanceEntry in friendBalances.entries) {
      final currency = balanceEntry.key;
      final balance = balanceEntry.value;

      if (balances.containsKey(currency)) {
        balances[currency] += balance;
      } else {
        balances[currency] = balance;
      }
    }
  }

  return balances;
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
    final balanceStr = balanceToString(I128(balances[currency]));
    rows.add(DataRow(cells: [
      DataCell(Text('${currency.inner}')),
      DataCell(Text('$balanceStr'))
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
