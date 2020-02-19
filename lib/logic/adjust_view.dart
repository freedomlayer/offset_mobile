import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

import 'types.dart';
import 'handle_shared_file.dart';
import 'handle_action.dart';

/// Does the view rely on a card that is both existent and active?
bool isViewValid(AppView appView, Set<NodeName> openNodes) {
  return appView.match(
      home: () => true,
      buy: (buyView) => isBuyViewValid(buyView, openNodes),
      sell: (sellView) => isSellViewValid(sellView, openNodes),
      outTransactions: (outTransactionsView) => isOutTransactionsViewValid(outTransactionsView, openNodes),
      inTransactions: (inTransactionsView) => isInTransactionsViewValid(inTransactionsView, openNodes),
      balances: () => true,
      settings: (settingsView) => isSettingsViewValid(settingsView, openNodes),
      );
}

bool isBuyViewValid(BuyView buyView, Set<NodeName> openNodes) {
  throw UnimplementedError();
}

bool isSellViewValid(SellView sellView, Set<NodeName> openNodes) {
  throw UnimplementedError();
}

bool isOutTransactionsViewValid(OutTransactionsView outTransactionsView, Set<NodeName> openNodes) {
  throw UnimplementedError();
}

bool isInTransactionsViewValid(InTransactionsView inTransactionsView, Set<NodeName> openNodes) {
  throw UnimplementedError();
}

bool isSettingsViewValid(SettingsView settingsView, Set<NodeName> openNodes) {
  throw UnimplementedError();
}




/*
AppState adjustView(AppState appState) {
  for (final closedNodeName in closedNodes) {
    appState.viewState.match(
  }
}
*/
