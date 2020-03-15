import 'package:flutter/material.dart';

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
    NodeState nodeState,
    Function(FriendSettingsAction) queueAction) {
  final friendPublicKey = friendSettingsView.friendPublicKey;
  return friendSettingsView.inner.match(
      home: () => _renderFriendHome(
          nodeName, friendPublicKey, nodeState, queueAction),
      resolve: () =>
          _renderResolve(nodeName, friendPublicKey, nodeState, queueAction),
      currencySettings: (currency) => _renderCurrencySettings(
          nodeName, friendPublicKey, currency, nodeState, queueAction),
      newCurrency: () => _renderNewCurrency(
          nodeName, friendPublicKey, nodeState, queueAction));
}

Widget _renderFriendHome(
    NodeName nodeName,
    PublicKey friendPublicKey,
    NodeState nodeState,
    Function(FriendSettingsAction) queueAction) {

  throw UnimplementedError();

  /*
  final body = Center(child: Column(children: [
    Expanded(flex: 1, child: ListTile(title: )),
    Expanded(flex: 10, listView),
  ]));

  return frame(
      title: Text('${nodeName.inner}: Friend Settings'),
      body: body,
      backAction: () => queueAction(RelaysSettingsAction.back()));
  */
}

Widget _renderResolve(
    NodeName nodeName,
    PublicKey friendPublicKey,
    NodeState nodeState,
    Function(FriendSettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderCurrencySettings(
    NodeName nodeName,
    PublicKey friendPublicKey,
    Currency currency,
    NodeState nodeState,
    Function(FriendSettingsAction) queueAction) {
  throw UnimplementedError();
}

Widget _renderNewCurrency(
    NodeName nodeName,
    PublicKey friendPublicKey,
    NodeState nodeState,
    Function(FriendSettingsAction) queueAction) {
  throw UnimplementedError();
}
