import 'package:built_collection/built_collection.dart';
import 'dart:developer' as developer;
import 'dart:math';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

import 'handle_buy_action.dart';
import 'handle_sell_action.dart';
import 'handle_out_trans_action.dart';
import 'handle_in_trans_action.dart';
import 'handle_settings_action.dart';

AppState handleAction(AppState appState, AppAction appAction, Random rand) {
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

  BuyView buyView;
  SellView sellView;
  InTransactionsView inTransactionsView;
  OutTransactionsView outTransactionsView;
  SettingsView settingsView;

  appView.match(
      home: () => true,
      buy: (buyView0) => buyView = buyView0,
      sell: (sellView0) => sellView = sellView0,
      inTransactions: (inTransactionsView0) =>
          inTransactionsView = inTransactionsView0,
      outTransactions: (outTransactionsView0) =>
          outTransactionsView = outTransactionsView0,
      balances: () => true,
      settings: (settingsView0) => settingsView = settingsView0);

  return appAction.match(home: (homeAction) {
    if (appView.isHome) {
      return handleHomeAction(appState.nodesStates, homeAction);
    } else {
      developer
          .log('handleAction(): Received home action during incorrect view');
      return appState;
    }
  }, buy: (buyAction) {
    if (buyView != null) {
      return handleBuyAction(buyView, appState.nodesStates, buyAction, rand);
    } else {
      developer.log('handleAction(): Received buy action during incorrect view');
      return appState;
    }
  }, sell: (sellAction) {
    if (sellView != null) {
      return handleSellAction(sellView, appState.nodesStates, sellAction, rand);
    } else {
      developer
          .log('handleAction(): Received sell action during incorrect view');
      return appState;
    }
  }, inTransactions: (inTransactionsAction) {
    if (inTransactionsView != null) {
      return handleInTransactionsAction(
          inTransactionsView, appState.nodesStates, inTransactionsAction, rand);
    } else {
      developer.log(
          'handleAction(): Received inTransactions action during incorrect view');
      return appState;
    }
  }, outTransactions: (outTransactionsAction) {
    if (outTransactionsView != null) {
      return handleOutTransactionsAction(
          outTransactionsView, appState.nodesStates, outTransactionsAction);
    } else {
      developer.log(
          'handleAction(): Received outTransactions action during incorrect view');
      return appState;
    }
  }, balances: (balancesAction) {
    if (appView.isBalances) {
      return handleBalancesAction(appState.nodesStates, balancesAction);
    } else {
      developer.log(
          'handleAction(): Received balances action during incorrect view');
      return appState;
    }
  }, settings: (settingsAction) {
    if (settingsView != null) {
      return handleSettingsAction(settingsView, appState.nodesStates, settingsAction);
    } else {
      developer.log(
          'handleAction(): Received settings action during incorrect view');
      return appState;
    }
  });
}

AppState handleHomeAction(
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

AppState handleBalancesAction(
    BuiltMap<NodeName, NodeState> nodesStates, BalancesAction balancesAction) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return balancesAction.match(back: () => createState(AppView.home()));
}
