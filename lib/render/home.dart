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
  Widget body;
  if (!isAnyCardActive(nodesStates)) {
    // No active cards:
    body = Center(child: Column(children: [
      Text('No active cards!'),
      RaisedButton(
          onPressed: () => queueAction(HomeAction.selectSettings()),
          child: Text('Settings')),
    ]));
  } else {
    body = Center(child: Column(children: [
      RaisedButton(
          onPressed: () => queueAction(HomeAction.selectBuy()),
          child: Text('Buy')),
      RaisedButton(
          onPressed: () => queueAction(HomeAction.selectSell()),
          child: Text('Sell')),
      RaisedButton(
          onPressed: () => queueAction(HomeAction.selectOutTransactions()),
          child: Text('Outgoing')),
      RaisedButton(
          onPressed: () => queueAction(HomeAction.selectInTransactions()),
          child: Text('Incoming')),
      RaisedButton(
          onPressed: () => queueAction(HomeAction.selectBalances()),
          child: Text('Balances')),
      RaisedButton(
          onPressed: () => queueAction(HomeAction.selectSettings()),
          child: Text('Settings')),
    ]));
  }
  return frame(title: Text(APP_TITLE), body: body);
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
