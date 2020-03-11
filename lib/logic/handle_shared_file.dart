import 'dart:io';
import 'dart:developer' as developer;

import 'package:path/path.dart' as path;

import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../protocol/serialize.dart';

import '../state/state.dart';


/// May we interrupt a certain AppView?
bool _isInterruptible(AppView appView) {
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
      balances: (_) => true,
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
        return _isInterruptible(appView);
      },
      transition: (_a, _b, _c, _d) => false
  );

  if (!interruptible) {
    return appState;
  }

  // Read file contents:
  String data;
  try {
    data = File(filePath).readAsStringSync();
  } on FileSystemException catch (e) {
    developer.log('handleSharedFile: Could not read file as string: $e');
    return appState;
  }

  // Get file extension:
  String extension = path.extension(filePath);

  // Remove trailing dot:
  if (extension.length > 0) {
    if (extension[0] == '.') {
      extension = extension.substring(1);
    }
  }

  AppView newAppView;
  switch (extension) {
    case INVOICE_EXT: {
      newAppView = _handleSharedInvoice(oldAppView, data);
    }
    break;

    case COMMIT_EXT: {
      newAppView = _handleSharedCommit(oldAppView, data);
    }
    break;

    case FRIEND_EXT: {
      newAppView = _handleSharedFriend(oldAppView, data);
    }
    break;

    case RELAY_EXT: {
      newAppView = _handleSharedRelay(oldAppView, data);
    }
    break;

    case INDEX_EXT: {
      newAppView = _handleSharedIndex(oldAppView, data);
    }
    break;

    case REMOTE_CARD_EXT: {
      newAppView = _handleSharedRemoteCard(oldAppView, data);
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

AppView _handleSharedInvoice(AppView oldAppView, String data) {
  try {
    final invoiceFile = deserializeMsg<InvoiceFile>(data);
    return AppView.buy(BuyView.invoiceInfo(invoiceFile));
  } on SerializeError {
    return oldAppView;
  }
}

AppView _handleSharedCommit(AppView oldAppView, String data) {
  try {
    final commit = deserializeMsg<Commit>(data);
    return AppView.inTransactions(InTransactionsView.selectCardApplyCommit(commit));
  } on SerializeError {
    return oldAppView;
  }
}

AppView _handleSharedFriend(AppView oldAppView, String data) {
  try {
    final friendFile = deserializeMsg<FriendFile>(data);
    return AppView.settings(SettingsView.selectCardAddFriend(friendFile));
  } on SerializeError {
    return oldAppView;
  }
}

AppView _handleSharedRelay(AppView oldAppView, String data) {
  try {
    final relayAddress = deserializeMsg<RelayAddress>(data);
    return AppView.settings(SettingsView.selectCardAddRelay(relayAddress));
  } on SerializeError {
    return oldAppView;
  }
}

AppView _handleSharedIndex(AppView oldAppView, String data) {
  try {
    final indexServerFile = deserializeMsg<IndexServerFile>(data);
    return AppView.settings(SettingsView.selectCardAddIndex(indexServerFile));
  } on SerializeError {
    return oldAppView;
  }
}

AppView _handleSharedRemoteCard(AppView oldAppView, String data) {
  try {
    final remoteCardFile = deserializeMsg<RemoteCardFile>(data);
    return AppView.settings(SettingsView.newCard(NewCardView.newRemoteName(remoteCardFile)));
  } on SerializeError {
    return oldAppView;
  }
}
