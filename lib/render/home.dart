import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../state/state.dart';
import '../actions/actions.dart';
import 'consts.dart';
import 'frame.dart';

bool isAnyCardActive(BuiltMap<NodeName, NodeState> nodesStates) {
  for (final entry in nodesStates.asMap().entries) {
    final nodeState = entry.value;
    if (nodeState.inner.isOpen) {
      return true;
    }
  }
  return false;
}

Widget renderHome(BuiltMap<NodeName, NodeState> nodesStates,
    Function(HomeAction) queueAction) {
  final someCardActive = isAnyCardActive(nodesStates);

  final listView = ListView(children: [
    ListTile(
        leading: Icon(Icons.burst_mode),
        title: Text('Buy'),
        subtitle: Text('Pay an invoice'),
        enabled: someCardActive,
        onTap: () => queueAction(HomeAction.selectBuy())),
    ListTile(
        leading: Icon(Icons.signal_cellular_4_bar),
        title: Text('Sell'),
        subtitle: Text('Create a new invoice'),
        enabled: someCardActive,
        onTap: () => queueAction(HomeAction.selectSell())),
    ListTile(
        leading: Icon(Icons.zoom_out),
        title: Text('Outgoing'),
        subtitle: Text('View outgoing transactions'),
        enabled: someCardActive,
        onTap: () => queueAction(HomeAction.selectOutTransactions())),
    ListTile(
        leading: Icon(Icons.zoom_in),
        title: Text('Incoming'),
        subtitle: Text('View incoming transactions'),
        enabled: someCardActive,
        onTap: () => queueAction(HomeAction.selectInTransactions())),
    ListTile(
        leading: Icon(Icons.account_balance),
        title: Text('Balances'),
        subtitle: Text('View current card balances'),
        enabled: someCardActive,
        onTap: () => queueAction(HomeAction.selectBalances())),
    ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        onTap: () => queueAction(HomeAction.selectSettings()))
  ]);
  return frame(title: Text(APP_TITLE), body: listView);
}

/*
  return MaterialApp(
    title: APP_TITLE,
    home: Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child: Container(
                  child: BackButton(), alignment: Alignment.centerLeft),
              flex: 1),
          Expanded(child: Center(child: Text(APP_TITLE)), flex: 3),
          Spacer(flex: 1),
        ]),
      ),
    ),
  );
*/
