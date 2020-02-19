import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

import 'types.dart';
import 'handle_shared_file.dart';
import 'handle_action.dart';

bool nodeActive(AppState appState, NodeName nodeName) {
  final nodeState = appState.nodesStates[nodeName];
  if (nodeState == null) {
    return false;
  }
  return nodeState.inner.isOpen;
}

bool nodeExists(AppState appState, NodeName nodeName) {
  return appState.nodesStates.containsKey(nodeName);
}

CompactReport getCompactReport(AppState appState, NodeName nodeName) {
  final nodeState = appState.nodesStates[nodeName];
  if (nodeState == null) {
    return null;
  }
  return nodeState.inner.match(
    closed: () => null,
    preOpen: () => null,
    open: (nodeName, nodeId, appPermissions, compactReport) => compactReport,
  );
}

bool invoiceExists(AppState appState, NodeName nodeName, InvoiceId invoiceId) {
  final compactReport = getCompactReport(appState, nodeName);
  if (compactReport == null) {
    return false;
  }
  final openInvoice = compactReport.openInvoices[invoiceId];
  return openInvoice != null;
}

bool paymentExists(AppState appState, NodeName nodeName, PaymentId paymentId) {
  final compactReport = getCompactReport(appState, nodeName);
  if (compactReport == null) {
    return false;
  }
  final openPayment = compactReport.openPayments[paymentId];
  return openPayment != null;
}

FriendReport getFriendReport(
    AppState appState, NodeName nodeName, PublicKey friendPublicKey) {
  final compactReport = getCompactReport(appState, nodeName);
  if (compactReport == null) {
    return null;
  }
  return compactReport.friends[friendPublicKey];
}

/*
bool relayExists(AppState appState, NodeName nodeName, PublicKey relayPublicKey) {
  throw UnimplementedError();
}

bool indexServerExists(AppState appState, NodeName nodeName, PublicKey indexServerPublicKey) {
  throw UnimplementedError();
}
*/

/// Does the view rely on a card that is both existent and active?
AppView adjustAppView(AppView appView, AppState appState) {
  return appView.match(
    home: () => appView,
    buy: (buyView) => adjustBuyView(buyView, appState),
    sell: (sellView) => adjustSellView(sellView, appState),
    outTransactions: (outTransactionsView) =>
        adjustOutTransactionsView(outTransactionsView, appState),
    inTransactions: (inTransactionsView) =>
        adjustInTransactionsView(inTransactionsView, appState),
    balances: () => appView,
    settings: (settingsView) => adjustSettingsView(settingsView, appState),
  );
}

AppView adjustBuyView(BuyView buyView, AppState appState) {
  return buyView.match(
      invoiceSelect: () => AppView.buy(buyView),
      invoiceInfo: (_invoiceFile) => AppView.buy(buyView),
      selectCard: (_invoiceFile) => AppView.buy(buyView),
      paymentProgress: (nodeName, _invoiceFile) {
        return nodeActive(appState, nodeName)
            ? AppView.buy(buyView)
            : AppView.home();
      });
}

AppView adjustSellView(SellView sellView, AppState appState) {
  return sellView.match(
      selectCard: () => AppView.sell(sellView),
      invoiceDetails: (nodeName) => nodeActive(appState, nodeName)
          ? AppView.sell(sellView)
          : AppView.home(),
      sendInvoice: (nodeName, invoiceId) =>
          invoiceExists(appState, nodeName, invoiceId)
              ? AppView.sell(sellView)
              : AppView.home());
}

AppView adjustOutTransactionsView(
    OutTransactionsView outTransactionsView, AppState appState) {
  return outTransactionsView.match(
      home: () => AppView.outTransactions(outTransactionsView),
      transaction: (nodeName, paymentId) =>
          paymentExists(appState, nodeName, paymentId)
              ? AppView.outTransactions(outTransactionsView)
              : AppView.home(),
      sendProof: (nodeName, paymentId) =>
          paymentExists(appState, nodeName, paymentId)
              ? AppView.outTransactions(outTransactionsView)
              : AppView.home());
}

AppView adjustInTransactionsView(
    InTransactionsView inTransactionsView, AppState appState) {
  final calcView = (nodeName, invoiceId) =>
      invoiceExists(appState, nodeName, invoiceId)
          ? AppView.inTransactions(inTransactionsView)
          : AppView.home();

  return inTransactionsView.match(
      home: () => AppView.inTransactions(inTransactionsView),
      transaction: (nodeName, invoiceId) => calcView(nodeName, invoiceId),
      sendInvoice: (nodeName, invoiceId) => calcView(nodeName, invoiceId),
      collected: (nodeName, invoiceId) => calcView(nodeName, invoiceId));
}

AppView adjustSettingsView(SettingsView settingsView, AppState appState) {
  return settingsView.match(
      home: () => AppView.settings(settingsView),
      cardSettings: (cardSettingsView) =>
          adjustCardSettingsView(cardSettingsView, appState),
      newCard: (_newCardView) => AppView.settings(settingsView),
      selectCardAddRelay: () => AppView.settings(settingsView),
      selectCardAddIndex: () => AppView.settings(settingsView));
}

AppView adjustCardSettingsView(
    CardSettingsView cardSettingsView, AppState appState) {
  final homeView = AppView.settings(SettingsView.home());
  if (!nodeExists(appState, cardSettingsView.nodeName)) {
    return homeView;
  }

  final unchangedView =
      AppView.settings(SettingsView.cardSettings(cardSettingsView));

  return cardSettingsView.inner.match(
      home: () => unchangedView,
      friends: (friendSettings) {
        final friendReport = getFriendReport(appState,
            cardSettingsView.nodeName, friendSettings.friendPublicKey);
        if (friendReport == null) {
          return homeView;
        }
        final friendSettingsInnerView =
            adjustFriendSettingsInnerView(friendSettings.inner, friendReport);
        final friendSettingsView = FriendSettingsView((b) => b
          ..friendPublicKey = friendSettings.friendPublicKey
          ..inner = friendSettingsInnerView);
        final cardSettingsInnerView =
            CardSettingsInnerView.friends(friendSettingsView);
        return AppView.settings(SettingsView.cardSettings(
            cardSettingsView.rebuild((b) => b..inner = cardSettingsInnerView)));
      },
      relays: (relaysSettings) => throw UnimplementedError(),
      indexServers: (indexServersSettingsView) => throw UnimplementedError());
}

FriendSettingsInnerView adjustFriendSettingsInnerView(
    FriendSettingsInnerView friendSettingsInner, FriendReport friendReport) {
  return friendSettingsInner.match(
      home: () => friendSettingsInner,
      resolve: () => friendReport.channelStatus.isInconsistent
          ? friendSettingsInner
          : FriendSettingsInnerView.home(),
      currencySettings: (currency) {
        return friendReport.channelStatus.match(
            inconsistent: (_) => FriendSettingsInnerView.home(),
            consistent: (channelConsistentReport) =>
                channelConsistentReport.currencyReports[currency] != null
                    ? friendSettingsInner
                    : FriendSettingsInnerView.home());
      },
      newCurrency: () => friendSettingsInner);
}

/*
AppState adjustView(AppState appState) {
  for (final closedNodeName in closedNodes) {
    appState.viewState.match(
  }
}
*/
