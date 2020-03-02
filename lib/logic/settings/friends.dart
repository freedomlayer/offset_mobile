import 'dart:math';
import 'dart:developer' as developer;
import 'package:built_collection/built_collection.dart';

import '../../actions/actions.dart';
import '../../protocol/protocol.dart';
import '../../protocol/file.dart';
import '../../state/state.dart';

import '../../rand.dart';

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
      selectNewFriend: () => createStateInner(CardSettingsInnerView.friends(
          FriendsSettingsView.newFriend(NewFriendView.select()))),
      newFriend: (newFriendAction) =>
          _handleNewFriend(nodeName, nodesStates, newFriendAction, rand),
      selectFriend: (friendPublicKey) => createStateInner(
          CardSettingsInnerView.friends(
              FriendsSettingsView.friendSettings(FriendSettingsView((b) => b
                ..friendPublicKey = friendPublicKey
                ..inner = FriendSettingsInnerView.home())))),
      friendSettings: (friendSettingsAction) {
        final friendSettingsView = friendsSettingsView.match(
            home: () => null,
            friendSettings: (friendSettingsView) => friendSettingsView,
            newFriend: (_) => null,
            shareInfo: () => null);

        if (friendSettingsView == null) {
          developer
              .log('_handleFriendsSettings(): friendSettings: Incorrect view!');
          return createStateInner(
              CardSettingsInnerView.friends(friendsSettingsView));
        }

        return _handleFriendSettings(nodeName, friendSettingsView, nodesStates,
            friendSettingsAction, rand);
      },
      shareInfo: () =>
          createStateInner(CardSettingsInnerView.friends(FriendsSettingsView.shareInfo())));
}

AppState _handleNewFriend(
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    NewFriendAction newFriendAction,
    Random rand) {
  final createStateInner = (CardSettingsInnerView cardSettingsInnerView) =>
      AppState((b) => b
        ..nodesStates = nodesStates.toBuilder()
        ..viewState = ViewState.view(
            AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b
              ..nodeName = nodeName
              ..inner = cardSettingsInnerView)))));

  return newFriendAction.match(
      back: () => createStateInner(
          CardSettingsInnerView.friends(FriendsSettingsView.home())),
      loadFriend: (friendFile) => createStateInner(
          CardSettingsInnerView.friends(FriendsSettingsView.newFriend(
              NewFriendView.name(friendFile.publicKey, friendFile.relays)))),
      addFriend: (friendName, friendFile) => _handleAddFriend(
          nodeName, nodesStates, friendName, friendFile, rand));
}

AppState _handleAddFriend(
    NodeName nodeName,
    BuiltMap<NodeName, NodeState> nodesStates,
    String friendName,
    FriendFile friendFile,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];
  if (nodeState == null) {
    developer.log('_handleAddFriend(): node $nodeName does not exist!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final nodeId = nodeOpen.nodeId;
  if (nodeId == null) {
    developer.log('_handleAddFriend(): node $nodeName is not open!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final addFriend = AddFriend((b) => b
    ..friendPublicKey = friendFile.publicKey
    ..relays = friendFile.relays.toBuilder()
    ..name = friendName);

  final userToCompact = UserToCompact.addFriend(addFriend);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final newFriendView =
      NewFriendView.name(friendFile.publicKey, friendFile.relays);
  final oldView = AppView.settings(SettingsView.cardSettings(CardSettingsView(
      (b) => b
        ..nodeName = nodeName
        ..inner = CardSettingsInnerView.friends(
            FriendsSettingsView.newFriend(newFriendView)))));
  final newView =
      AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b
        ..nodeName = nodeName
        ..inner = CardSettingsInnerView.friends(FriendsSettingsView.home()))));

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

AppState _handleFriendSettings(
    NodeName nodeName,
    FriendSettingsView friendSettingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    FriendSettingsAction friendSettingsAction,
    Random rand) {
  final createStateFriends = (FriendsSettingsView friendsSettingsView) =>
      AppState((b) => b
        ..nodesStates = nodesStates.toBuilder()
        ..viewState = ViewState.view(
            AppView.settings(SettingsView.cardSettings(CardSettingsView((b) => b
              ..nodeName = nodeName
              ..inner = CardSettingsInnerView.friends(friendsSettingsView))))));

  return friendSettingsAction.match(
      back: () => friendSettingsView.inner.match(
          home: () => createStateFriends(FriendsSettingsView.home()),
          resolve: () => createStateFriends(FriendsSettingsView.friendSettings(
              friendSettingsView
                  .rebuild((b) => b..inner = FriendSettingsInnerView.home()))),
          currencySettings: (_currency) => createStateFriends(
              FriendsSettingsView.friendSettings(friendSettingsView
                  .rebuild((b) => b..inner = FriendSettingsInnerView.home()))),
          newCurrency: () =>
              createStateFriends(FriendsSettingsView.friendSettings(friendSettingsView.rebuild((b) => b..inner = FriendSettingsInnerView.home())))),
      enableFriend: () => _handleEnableFriend(nodeName, friendSettingsView.friendPublicKey, nodesStates, rand),
      disableFriend: () => _handleDisableFriend(nodeName, friendSettingsView.friendPublicKey, nodesStates, rand),
      removeFriend: () => _handleRemoveFriend(nodeName, friendSettingsView.friendPublicKey, nodesStates, rand),
      removeCurrency: (currency) => _handleRemoveCurrency(nodeName, friendSettingsView.friendPublicKey, currency, nodesStates, rand),
      selectNewCurrency: () => throw UnimplementedError(),
      newCurrency: (currency, remoteMaxDebt, rate) => throw UnimplementedError(),
      selectCurrency: (currency) => throw UnimplementedError(),
      openCurrency: (currency) => throw UnimplementedError(),
      closeCurrency: (currency) => throw UnimplementedError(),
      updateCurrency: (currency, remoteMaxDebt, rate) => throw UnimplementedError(),
      selectResolve: () => throw UnimplementedError(),
      resolve: () => throw UnimplementedError());
}

AppState _handleEnableFriend(NodeName nodeName, PublicKey friendPublicKey,
    BuiltMap<NodeName, NodeState> nodesStates, Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];

  if (nodeState == null) {
    developer.log('_handleEnable(): node $nodeName does not exist!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final nodeId = nodeOpen.nodeId;
  if (nodeId == null) {
    developer.log('_handleEnable(): node $nodeName is not open!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final userToCompact = UserToCompact.enableFriend(friendPublicKey);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final friendsSettingsView =
      FriendsSettingsView.friendSettings(FriendSettingsView((b) => b
        ..friendPublicKey = friendPublicKey
        ..inner = FriendSettingsInnerView.home()));
  final cardSettingsView = CardSettingsView((b) => b
    ..nodeName = nodeName
    ..inner = CardSettingsInnerView.friends(friendsSettingsView));
  final oldView = AppView.settings(SettingsView.cardSettings(cardSettingsView));
  final newView = oldView;

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

AppState _handleDisableFriend(NodeName nodeName, PublicKey friendPublicKey,
    BuiltMap<NodeName, NodeState> nodesStates, Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];

  if (nodeState == null) {
    developer.log('_handleDisable(): node $nodeName does not exist!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final nodeId = nodeOpen.nodeId;
  if (nodeId == null) {
    developer.log('_handleDisable(): node $nodeName is not open!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final userToCompact = UserToCompact.disableFriend(friendPublicKey);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final friendsSettingsView =
      FriendsSettingsView.friendSettings(FriendSettingsView((b) => b
        ..friendPublicKey = friendPublicKey
        ..inner = FriendSettingsInnerView.home()));
  final cardSettingsView = CardSettingsView((b) => b
    ..nodeName = nodeName
    ..inner = CardSettingsInnerView.friends(friendsSettingsView));
  final oldView = AppView.settings(SettingsView.cardSettings(cardSettingsView));
  final newView = oldView;

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

AppState _handleRemoveFriend(NodeName nodeName, PublicKey friendPublicKey,
    BuiltMap<NodeName, NodeState> nodesStates, Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];

  if (nodeState == null) {
    developer.log('_handleUnfriend(): node $nodeName does not exist!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final nodeId = nodeOpen.nodeId;
  if (nodeId == null) {
    developer.log('_handleUnfriend(): node $nodeName is not open!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final userToCompact = UserToCompact.removeFriend(friendPublicKey);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final friendsSettingsView =
      FriendsSettingsView.friendSettings(FriendSettingsView((b) => b
        ..friendPublicKey = friendPublicKey
        ..inner = FriendSettingsInnerView.home()));
  final cardSettingsView = CardSettingsView((b) => b
    ..nodeName = nodeName
    ..inner = CardSettingsInnerView.friends(friendsSettingsView));
  final oldView = AppView.settings(SettingsView.cardSettings(cardSettingsView));

  final newCardSettingsView = CardSettingsView((b) => b
    ..nodeName = nodeName
    ..inner = CardSettingsInnerView.friends(FriendsSettingsView.home()));
  final newView =
      AppView.settings(SettingsView.cardSettings(newCardSettingsView));

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

AppState _handleRemoveCurrency(NodeName nodeName, PublicKey friendPublicKey,
    Currency currency, BuiltMap<NodeName, NodeState> nodesStates, Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  final nodeState = nodesStates[nodeName];

  if (nodeState == null) {
    developer.log('_handleRemoveCurrency(): node $nodeName does not exist!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final nodeOpen =
      nodeState.inner.match(open: (nodeOpen) => nodeOpen, closed: () => null);

  final nodeId = nodeOpen.nodeId;
  if (nodeId == null) {
    developer.log('_handleRemoveCurrency(): node $nodeName is not open!');
    return createState(AppView.settings(SettingsView.home()));
  }

  final removeFriendCurrency = RemoveFriendCurrency((b) => b
    ..friendPublicKey = friendPublicKey
    ..currency = currency);
  final userToCompact =
      UserToCompact.removeFriendCurrency(removeFriendCurrency);
  final userToServer = UserToServer.node(nodeId, userToCompact);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final friendsSettingsView =
      FriendsSettingsView.friendSettings(FriendSettingsView((b) => b
        ..friendPublicKey = friendPublicKey
        ..inner = FriendSettingsInnerView.home()));
  final cardSettingsView = CardSettingsView((b) => b
    ..nodeName = nodeName
    ..inner = CardSettingsInnerView.friends(friendsSettingsView));
  final oldView = AppView.settings(SettingsView.cardSettings(cardSettingsView));
  final newView = oldView;

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}
