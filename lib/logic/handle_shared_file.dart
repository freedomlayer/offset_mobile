import 'dart:io';
import 'dart:developer' as developer;
import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:path/path.dart' as path;

import 'package:offst_mobile/utils/json_plugin.dart';

// import 'package:offst_mobile/protocol/common.dart';
// import 'package:offst_mobile/protocol/protocol.dart';
// import 'package:offst_mobile/utils/json_plugin.dart';

// import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../protocol/file.dart';


import '../state/state.dart';


// Types of shared file extensions we know how to handle
const String INVOICE_EXT = '.invoice';
const String COMMIT_EXT = '.commit';
const String FRIEND_EXT = '.friend';
const String RELAY_EXT = '.relay';
const String INDEX_EXT = '.index';
const String REMOTE_CARD_EXT = '.rcard';


class DeserializeError implements Exception {
  String cause;
  DeserializeError(this.cause);
}

// TODO: Handle exceptions from deserializeData.
// Deserialize:
T deserializeData<T>(String data) {
  try {
    final decoder = JsonDecoder();
    final serialized = decoder.convert(data);
    final serializersWithPlugin =
          (serializers.toBuilder()..addPlugin(CommJsonPlugin())).build();

    return serializersWithPlugin.deserialize(serialized, specifiedType: FullType(T));
  } catch (e) {
    developer.log('deserializeData() error: $e');
    throw DeserializeError;
  }
}


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
    final invoiceFile = deserializeData<InvoiceFile>(data);
    return AppView.buy(BuyView.invoiceInfo(invoiceFile));
  } on DeserializeError {
    return oldAppView;
  }
}

AppView handleSharedCommit(AppView oldAppView, String data) {
  try {
    final commit = deserializeData<Commit>(data);
    return AppView.inTransactions(InTransactionsView.selectCardApplyCommit(commit));
  } on DeserializeError {
    return oldAppView;
  }
}

AppView handleSharedFriend(AppView oldAppView, String data) {
  try {
    final friendFile = deserializeData<FriendFile>(data);
    return AppView.settings(SettingsView.selectCardAddFriend(friendFile));
  } on DeserializeError {
    return oldAppView;
  }
}

AppView handleSharedRelay(AppView oldAppView, String data) {
  try {
    final relayAddress = deserializeData<RelayAddress>(data);
    return AppView.settings(SettingsView.selectCardAddRelay(relayAddress));
  } on DeserializeError {
    return oldAppView;
  }
}

AppView handleSharedIndex(AppView oldAppView, String data) {
  try {
    final indexServerFile = deserializeData<IndexServerFile>(data);
    return AppView.settings(SettingsView.selectCardAddIndex(indexServerFile));
  } on DeserializeError {
    return oldAppView;
  }
}

AppView handleSharedRemoteCard(AppView oldAppView, String data) {
  try {
    final remoteCardFile = deserializeData<RemoteCardFile>(data);
    return AppView.settings(SettingsView.newCard(NewCardView.newRemoteName(remoteCardFile)));
  } on DeserializationError {
    return oldAppView;
  }
}
