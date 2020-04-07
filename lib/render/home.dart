import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        leading: FaIcon(FontAwesomeIcons.shoppingCart),
        title: Text('Buy'),
        subtitle: Text('Pay an invoice'),
        enabled: someCardActive,
        onTap: () => queueAction(HomeAction.selectBuy())),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.store),
        title: Text('Sell'),
        subtitle: Text('Create a new invoice'),
        enabled: someCardActive,
        onTap: () => queueAction(HomeAction.selectSell())),
    ListTile(
        leading: Icon(Icons.call_made),
        title: Text('Outgoing'),
        subtitle: Text('View outgoing transactions'),
        enabled: someCardActive,
        onTap: () => queueAction(HomeAction.selectOutTransactions())),
    ListTile(
        leading: Icon(Icons.call_received),
        title: Text('Incoming'),
        subtitle: Text('View incoming transactions'),
        enabled: someCardActive,
        onTap: () => queueAction(HomeAction.selectInTransactions())),
    ListTile(
        leading: FaIcon(FontAwesomeIcons.balanceScale),
        title: Text('Balances'),
        subtitle: Text('View card balances'),
        enabled: someCardActive,
        onTap: () => queueAction(HomeAction.selectBalances())),
    ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        subtitle: Text('Configure cards'),
        onTap: () => queueAction(HomeAction.selectSettings()))
  ]);
  return frame(title: Text(APP_TITLE), body: listView);
}
