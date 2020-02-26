import 'package:built_collection/built_collection.dart';
import 'dart:developer' as developer;

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

import 'handle_buy_action.dart';
import 'handle_sell_action.dart';
import 'handle_out_trans_action.dart';
import 'handle_in_trans_action.dart';
import 'handle_settings_action.dart';

AppState handleAction(AppState appState, AppAction appAction) {
  final appView = appState.viewState.match(
      view: (appView) => appView,
      transition: (_a, _b, _c, _d) {
        developer.log(
            'handleAction(): Received action $appAction during transition');
        return null;
      });

  if (appView == null) {
    // We are during a transition, so we can not handle user's actions
    return appState;
  }

  return appAction.match(
      home: (homeAction) =>
          handleHomeAction(appView, appState.nodesStates, homeAction),
      buy: (buyAction) =>
          handleBuyAction(appView, appState.nodesStates, buyAction),
      sell: (sellAction) =>
          handleSellAction(appView, appState.nodesStates, sellAction),
      inTransactions: (inTransactionsAction) => handleInTransactionsAction(
          appView, appState.nodesStates, inTransactionsAction),
      outTransactions: (outTransactionsAction) => handleOutTransactionsAction(
          appView, appState.nodesStates, outTransactionsAction),
      balances: (balancesAction) =>
          handleBalancesAction(appView, appState.nodesStates, balancesAction),
      settings: (settingsAction) =>
          handleSettingsAction(appView, appState.nodesStates, settingsAction));
}

AppState handleHomeAction(AppView appView,
    BuiltMap<NodeName, NodeState> nodesStates, HomeAction homeAction) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return homeAction.match(
      selectBuy: () => createState(AppView.buy(BuyView.invoiceSelect())),
      selectSell: () => createState(AppView.sell(SellView.selectCard())),
      selectInTransactions: () =>
          createState(AppView.inTransactions(InTransactionsView.home())),
      selectOutTransactions: () =>
          createState(AppView.outTransactions(OutTransactionsView.home())),
      selectBalances: () => createState(AppView.balances()),
      selectSettings: () => createState(AppView.settings(SettingsView.home())));
}


AppState handleBalancesAction(AppView appView,
    BuiltMap<NodeName, NodeState> nodesStates, BalancesAction balancesAction) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return balancesAction.match(
      back: () => createState(AppView.home()));
}
