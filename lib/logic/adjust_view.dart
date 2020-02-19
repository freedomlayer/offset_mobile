import '../protocol/protocol.dart';
import '../state/state.dart';


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

// ------------------------------------------------------------
// ------------------------------------------------------------


// Adjust application's view given appState.
// Relevant mostly for cases where an element is removed or becomes inactive, and the view
// needs to be adjusted accordingly.
AppView adjustAppView(AppView appView, AppState appState) {
  return appView.match(
    home: () => appView,
    buy: (buyView) => adjustBuyView(buyView, appState),
    sell: (sellView) => adjustSellView(sellView, appState),
    outTransactions: (outTransactionsView) => AppView.outTransactions(
        adjustOutTransactionsView(outTransactionsView, appState)),
    inTransactions: (inTransactionsView) => AppView.inTransactions(
        adjustInTransactionsView(inTransactionsView, appState)),
    balances: () => appView,
    settings: (settingsView) =>
        AppView.settings(adjustSettingsView(settingsView, appState)),
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

OutTransactionsView adjustOutTransactionsView(
    OutTransactionsView outTransactionsView, AppState appState) {
  return outTransactionsView.match(
      home: () => outTransactionsView,
      transaction: (nodeName, paymentId) =>
          paymentExists(appState, nodeName, paymentId)
              ? outTransactionsView
              : OutTransactionsView.home(),
      sendProof: (nodeName, paymentId) =>
          paymentExists(appState, nodeName, paymentId)
              ? outTransactionsView
              : OutTransactionsView.home());
}

InTransactionsView adjustInTransactionsView(
    InTransactionsView inTransactionsView, AppState appState) {
  final calcView = (nodeName, invoiceId) =>
      invoiceExists(appState, nodeName, invoiceId)
          ? inTransactionsView
          : InTransactionsView.home();

  return inTransactionsView.match(
      home: () => inTransactionsView,
      transaction: (nodeName, invoiceId) => calcView(nodeName, invoiceId),
      sendInvoice: (nodeName, invoiceId) => calcView(nodeName, invoiceId),
      collected: (nodeName, invoiceId) => calcView(nodeName, invoiceId));
}

SettingsView adjustSettingsView(SettingsView settingsView, AppState appState) {
  return settingsView.match(
      home: () => settingsView,
      cardSettings: (cardSettingsView) {
        final nodeState = appState.nodesStates[cardSettingsView.nodeName];
        if (nodeState == null) {
          return SettingsView.home();
        }

        final cardSettingsInnerView =
            adjustCardSettingsInnerView(cardSettingsView.inner, nodeState);
        final newCardSettingsView = CardSettingsView((b) => b
          ..nodeName = cardSettingsView.nodeName
          ..inner = cardSettingsInnerView);
        return SettingsView.cardSettings(newCardSettingsView);
      },
      newCard: (_newCardView) => settingsView,
      selectCardAddRelay: () => settingsView,
      selectCardAddIndex: () => settingsView);
}

CardSettingsInnerView adjustCardSettingsInnerView(
    CardSettingsInnerView cardSettingsInnerView, NodeState nodeState) {
  final compactReport = nodeState.inner.match(
    closed: () => null,
    preOpen: () => null,
    open: (nodeName, nodeId, appPermissions, compactReport) => compactReport,
  );

  if (compactReport == null) {
    return CardSettingsInnerView.home();
  }

  return cardSettingsInnerView.match(
      home: () => cardSettingsInnerView,
      friends: (friendsSettings) => CardSettingsInnerView.friends(
          adjustFriendsSettingsView(friendsSettings, compactReport)),
      relays: (relaysSettings) => CardSettingsInnerView.relays(
          adjustRelaysSettingsView(relaysSettings, compactReport)),
      indexServers: (indexServersSettingsView) =>
          CardSettingsInnerView.indexServers(adjustIndexServersSettingsView(
              indexServersSettingsView, compactReport)));
}

FriendsSettingsView adjustFriendsSettingsView(
    FriendsSettingsView friendsSettings, CompactReport compactReport) {
  return friendsSettings.match(
      home: () => friendsSettings,
      friendSettings: (friendSettings) {
        final friendReport =
            compactReport.friends[friendSettings.friendPublicKey];
        if (friendReport == null) {
          return FriendsSettingsView.home();
        }
        final newFriendSettingsInner =
            adjustFriendSettingsInnerView(friendSettings.inner, friendReport);
        final newFriendSettings = FriendSettingsView((b) => b
          ..inner = newFriendSettingsInner
          ..friendPublicKey = friendSettings.friendPublicKey);
        return FriendsSettingsView.friendSettings(newFriendSettings);
      },
      newFriend: (_newFriend) => friendsSettings,
      shareInfo: () => friendsSettings);
}

RelaysSettingsView adjustRelaysSettingsView(
    RelaysSettingsView relaysSettings, CompactReport compactReport) {
  return relaysSettings.match(
      home: () => relaysSettings,
      newRelaySelect: () => relaysSettings,
      newRelayName: (_a, _b) => relaysSettings);
}

IndexServersSettingsView adjustIndexServersSettingsView(
    IndexServersSettingsView indexServersSettings,
    CompactReport compactReport) {
  return indexServersSettings.match(
      home: () => indexServersSettings,
      newIndexSelect: () => indexServersSettings,
      newIndexName: (_a, _b) => indexServersSettings);
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

