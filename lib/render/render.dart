import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:built_collection/built_collection.dart';

import '../state/state.dart';
import '../protocol/protocol.dart';
// import '../protocol/serialize.dart';
import '../actions/actions.dart';

import 'consts.dart';
import 'home.dart';
import 'buy.dart';
import 'sell.dart';
import 'in_transactions.dart';
import 'out_transactions.dart';
import 'balances.dart';
import 'settings.dart';
import 'frame.dart';
// import '../error.dart';


/// This is what we show to the user before we open the process
Widget renderNotReady() {
  return frame(
      title: Text(APP_TITLE),
      body: Center(child: CircularProgressIndicator(value: null)));
}

/// Rendering when we are connected to the process
Widget render(AppState appState, Function(AppAction) queueAction) {
  return appState.viewState.match(
      view: (appView) => renderAppView(appView, appState.nodesStates, queueAction),
      transition: (oldView, newView, nextRequests, optPendingRequest) =>
          renderTransition(oldView, appState.nodesStates));
}

Widget renderAppView(
    AppView appView, BuiltMap<NodeName, NodeState> nodesStates, Function(AppAction) queueAction) {
  return appView.match(
      home: () => renderHome(
          nodesStates, (homeAction) => queueAction(AppAction.home(homeAction))),
      buy: (buyView) => renderBuy(buyView, nodesStates,
          (buyAction) => queueAction(AppAction.buy(buyAction))),
      sell: (sellView) => renderSell(sellView, nodesStates,
          (sellAction) => queueAction(AppAction.sell(sellAction))),
      inTransactions: (inTransactionsView) => renderInTransactions(
          inTransactionsView,
          nodesStates,
          (inTransactionsAction) =>
              queueAction(AppAction.inTransactions(inTransactionsAction))),
      outTransactions: (outTransactionsView) => renderOutTransactions(outTransactionsView, nodesStates,
          (outTransactionsAction) => queueAction(AppAction.outTransactions(outTransactionsAction))),
      balances: (balancesView) => renderBalances(balancesView, nodesStates,
          (balancesAction) => queueAction(AppAction.balances(balancesAction))),
      settings: (settingsView) => renderSettings(settingsView, nodesStates,
          (settingsAction) => queueAction(AppAction.settings(settingsAction))),
);
}

/// A transition view: We are waiting for some operations to complete
Widget renderTransition(AppView oldView, BuiltMap<NodeName, NodeState> nodesStates) {
  final noQueueAction = (AppAction appAction) {
    developer.log('Received action $appAction during transition.');
  };
  // TODO: Possibly add some kind of shading over the old view, to let the user know
  // something is in progress.
  return renderAppView(oldView, nodesStates, noQueueAction);
}
