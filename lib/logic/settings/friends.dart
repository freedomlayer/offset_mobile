import 'dart:math';
// import 'dart:developer' as developer;
import 'package:built_collection/built_collection.dart';

import '../../actions/actions.dart';
import '../../protocol/protocol.dart';
// import '../../protocol/file.dart';
import '../../state/state.dart';

// import '../../rand.dart';

AppState handleFriendsSettings(
    NodeName nodeName,
    FriendsSettingsView friendsSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    FriendsSettingsAction friendsSettingsAction,
    Random rand) {
  final createStateInner = (CardSettingsInnerView cardSettingsInnerView) =>
      AppState((b) => b
        ..nodesStates = nodesStates.toBuilder()
        ..viewState = ViewState.view(
            AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b
              ..nodeName = nodeName
              ..inner = cardSettingsInnerView)))));

  return friendsSettingsAction.match(
      back: () => friendsSettingsView.match(
          home: () => createStateInner(CardSettingsInnerView.home()),
          friendSettings: (_) => createStateInner(
              CardSettingsInnerView.friends(FriendsSettingsView.home())),
          newFriend: (_) => createStateInner(
              CardSettingsInnerView.friends(FriendsSettingsView.home())),
          shareInfo: () => createStateInner(
              CardSettingsInnerView.friends(FriendsSettingsView.home()))),
      selectNewFriend: () => createStateInner(
          CardSettingsInnerView.friends(
              FriendsSettingsView.newFriend(NewFriendView.select()))),
      newFriend: (newFriendAction) => throw UnimplementedError(),
      selectFriend: (friendPublicKey) => createStateInner(
          CardSettingsInnerView.friends(
              FriendsSettingsView.friendSettings(FriendSettingsView((b) => b
                ..friendPublicKey = friendPublicKey
                ..inner = FriendSettingsInnerView.home())))),
      friendSettings: (friendSettingsAction) => throw UnimplementedError(),
      shareInfo: () => createStateInner(
          CardSettingsInnerView.friends(FriendsSettingsView.shareInfo())));
}
