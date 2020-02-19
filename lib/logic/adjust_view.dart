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
  return buyView.match(
      invoiceSelect: () => true,
      invoiceInfo: (_invoiceFile) => true,
      selectCard: (_invoiceFile) => true,
      paymentProgress: (nodeName, _invoiceFile) => !openNodes.contains(nodeName));
}

bool isSellViewValid(SellView sellView, Set<NodeName> openNodes) {
  return sellView.match(
      selectCard: () => true,
      invoiceDetails: (nodeName) => !openNodes.contains(nodeName),
      sendInvoice: (nodeName, _invoiceId) => !openNodes.contains(nodeName));
}

bool isOutTransactionsViewValid(OutTransactionsView outTransactionsView, Set<NodeName> openNodes) {
  return outTransactionsView.match(
      home: () => true,
      transaction: (nodeName, paymentId) => !openNodes.contains(nodeName),
      sendProof: (nodeName, paymentId) => !openNodes.contains(nodeName));
}

bool isInTransactionsViewValid(InTransactionsView inTransactionsView, Set<NodeName> openNodes) {
  return inTransactionsView.match(
      home: () => true,
      transaction: (nodeName, invoiceId) => !openNodes.contains(nodeName),
      sendInvoice: (nodeName, invoiceId) => !openNodes.contains(nodeName),
      collected: (nodeName, invoiceId) => !openNodes.contains(nodeName));
}

bool isSettingsViewValid(SettingsView settingsView, Set<NodeName> openNodes) {
  return settingsView.match(
      cardSettings: (cardSettingsView) => !openNodes.contains(cardSettingsView.nodeName),
      newCard: (_newCardView) => true,
      selectCardAddRelay: () => true,
      selectCardAddIndex: () => true);
}


/*
AppState adjustView(AppState appState) {
  for (final closedNodeName in closedNodes) {
    appState.viewState.match(
  }
}
*/
