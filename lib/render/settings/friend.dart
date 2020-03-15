import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';

import '../../protocol/protocol.dart';
// import '../../protocol/file.dart';
import '../../state/state.dart';
import '../../actions/actions.dart';
// import '../utils/qr_show.dart';
// import '../utils/share_file.dart';

// import '../utils/file_picker.dart';
// import '../utils/qr_scan.dart';

// import '../../logger.dart';

// import '../frame.dart';

Widget renderFriendSettings(
    NodeName nodeName,
    FriendSettingsView friendSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(FriendSettingsAction) queueAction) {

  final friendPublicKey = friendSettingsView.friendPublicKey;
  return friendSettingsView.inner.match(
      home: () => _renderFriendHome(nodeName, friendPublicKey, nodesStates, queueAction),
      resolve: () => _renderResolve(nodeName, friendPublicKey, nodesStates, queueAction),
      currencySettings: (currency) => _renderCurrencySettings(nodeName, friendPublicKey, currency, nodesStates, queueAction),
      newCurrency: () => _renderNewCurrency(nodeName, friendPublicKey, nodesStates, queueAction));
}


Widget _renderFriendHome(
    NodeName nodeName,
    PublicKey friendPublicKey,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(FriendSettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderResolve(
    NodeName nodeName,
    PublicKey friendPublicKey,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(FriendSettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderCurrencySettings(
    NodeName nodeName,
    PublicKey friendPublicKey,
    Currency currency,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(FriendSettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderNewCurrency(
    NodeName nodeName,
    PublicKey friendPublicKey,
    BuiltMap<NodeName, NodeState> nodesStates,
    Function(FriendSettingsAction) queueAction) {
  throw UnimplementedError();
}
