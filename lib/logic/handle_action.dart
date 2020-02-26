import '../actions/actions.dart';
// import '../protocol/protocol.dart';
import '../state/state.dart';

AppState handleAction(AppState appState, AppAction appAction) {
  return appAction.match(
      home: (homeAction) => handleHomeAction(appState, homeAction),
      buy: (buyAction) => handleBuyAction(appState, buyAction),
      sell: (sellAction) => handleSellAction(appState, sellAction),
      inTransactions: (inTransactionsAction) => handleInTransactionsAction(appState, inTransactionsAction),
      outTransactions: (outTransactionsAction) => handleOutTransactionsAction(appState, outTransactionsAction),
      balances: (balancesAction) => handleBalancesAction(appState, balancesAction),
      settings: (settingsAction) => handleSettingsAction(appState, settingsAction));
}


AppState handleHomeAction(AppState appState, HomeAction homeAction) {
  throw UnimplementedError();
}

AppState handleBuyAction(AppState appState, BuyAction buyAction) {
  throw UnimplementedError();
}

AppState handleSellAction(AppState appState, SellAction sellAction) {
  throw UnimplementedError();
}

AppState handleInTransactionsAction(AppState appState, InTransactionsAction inTransactionsAction) {
  throw UnimplementedError();
}

AppState handleOutTransactionsAction(AppState appState, OutTransactionsAction outTransactionsAction) {
  throw UnimplementedError();
}

AppState handleBalancesAction(AppState appState, BalancesAction balancesAction) {
  throw UnimplementedError();
}

AppState handleSettingsAction(AppState appState, SettingsAction settingsAction) {
  throw UnimplementedError();
}

