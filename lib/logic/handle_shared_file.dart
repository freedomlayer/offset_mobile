import 'dart:io';
import 'dart:developer' as developer;

import 'package:built_value/serializer.dart';
import 'package:path/path.dart' as path;

import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../protocol/serialize.dart';

import '../state/state.dart';


// Types of shared file extensions we know how to handle
const String INVOICE_EXT = '.invoice';
const String COMMIT_EXT = '.commit';
const String FRIEND_EXT = '.friend';
const String RELAY_EXT = '.relay';
const String INDEX_EXT = '.index';
const String REMOTE_CARD_EXT = '.rcard';


/// May we interrupt a certain AppView?
bool isInterruptible(AppView appView) {
  return appView.match(
      home: () => true,
      buy: (buyView) => buyView.match(
          invoiceSelect: () => true,
          invoiceInfo: (_) => true,
          selectCard: (_) => true,
          paymentProgress: (_a, _b) => false,
      ),
      sell: (sellView) => true,
      outTransactions: (_) => true,
      inTransactions: (_) => true,
      balances: () => true,
      settings: (_) => true,
  );
}


/// Handle a shared file event
/// This event happens when another application shares a file with this
/// application
AppState handleSharedFile(AppState appState, String filePath) {
  // Are we in a state that may be interrupted? If not, return early.
  AppView oldAppView;
  final interruptible = appState.viewState.match(
      view: (appView) {
        oldAppView = appView;
        return isInterruptible(appView);
      },
      transition: (_a, _b, _c, _d) => false
  );

  if (!interruptible) {
    return appState;
  }

  // Read file contents:
  String data = File(filePath).readAsStringSync();

  // Get file extension:
  final extension = path.extension(filePath);

  AppView newAppView;
  switch (extension) {
    case INVOICE_EXT: {
      newAppView = handleSharedInvoice(oldAppView, data);
    }
    break;

    case COMMIT_EXT: {
      newAppView = handleSharedCommit(oldAppView, data);
    }
    break;

    case FRIEND_EXT: {
      newAppView = handleSharedFriend(oldAppView, data);
    }
    break;

    case RELAY_EXT: {
      newAppView = handleSharedRelay(oldAppView, data);
    }
    break;

    case INDEX_EXT: {
      newAppView = handleSharedIndex(oldAppView, data);
    }
    break;

    case REMOTE_CARD_EXT: {
      newAppView = handleSharedRemoteCard(oldAppView, data);
    }
    break;

    default: {
      developer.log('Unrecognized shared file extension: $extension');
      newAppView = oldAppView;
    }
    break;
  }
    return appState.rebuild((b) => b..viewState = ViewState.view(newAppView));
}

AppView handleSharedInvoice(AppView oldAppView, String data) {
  try {
    final invoiceFile = deserializeMsg<InvoiceFile>(data);
    return AppView.buy(BuyView.invoiceInfo(invoiceFile));
  } on SerializeError {
    return oldAppView;
  }
}

AppView handleSharedCommit(AppView oldAppView, String data) {
  try {
    final commit = deserializeMsg<Commit>(data);
    return AppView.inTransactions(InTransactionsView.selectCardApplyCommit(commit));
  } on SerializeError {
    return oldAppView;
  }
}

AppView handleSharedFriend(AppView oldAppView, String data) {
  try {
    final friendFile = deserializeMsg<FriendFile>(data);
    return AppView.settings(SettingsView.selectCardAddFriend(friendFile));
  } on SerializeError {
    return oldAppView;
  }
}

AppView handleSharedRelay(AppView oldAppView, String data) {
  try {
    final relayAddress = deserializeMsg<RelayAddress>(data);
    return AppView.settings(SettingsView.selectCardAddRelay(relayAddress));
  } on SerializeError {
    return oldAppView;
  }
}

AppView handleSharedIndex(AppView oldAppView, String data) {
  try {
    final indexServerFile = deserializeMsg<IndexServerFile>(data);
    return AppView.settings(SettingsView.selectCardAddIndex(indexServerFile));
  } on SerializeError {
    return oldAppView;
  }
}

AppView handleSharedRemoteCard(AppView oldAppView, String data) {
  try {
    final remoteCardFile = deserializeMsg<RemoteCardFile>(data);
    return AppView.settings(SettingsView.newCard(NewCardView.newRemoteName(remoteCardFile)));
  } on DeserializationError {
    return oldAppView;
  }
}
