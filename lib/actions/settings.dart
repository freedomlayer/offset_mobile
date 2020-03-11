import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../protocol/common.dart';
import '../protocol/compact.dart';
import '../protocol/file.dart';

part 'settings.g.dart';

@BuiltUnion() class SettingsAction extends _$SettingsAction {
  static Serializer<SettingsAction> get serializer => _$settingsActionSerializer;

  SettingsAction.back() : super.back();
  SettingsAction.selectNewCard() : super.selectNewCard();
  SettingsAction.newCard(NewCardAction newCard) : super.newCard(newCard);
  SettingsAction.cardSettings(CardSettingsAction cardSettings) : super.cardSettings(cardSettings);
  // Pick a card to view card settings
  SettingsAction.selectCard(NodeName nodeName) : super.selectCard(nodeName);
  // Select a card (Used for handling an imported file)
  SettingsAction.selectCardSharedIndex(NodeName nodeName, IndexServerFile indexServerFile) : super.selectCardSharedIndex(nodeName, indexServerFile);
  SettingsAction.selectCardSharedRelay(NodeName nodeName, RelayAddress relayAddress) : super.selectCardSharedRelay(nodeName, relayAddress);
  SettingsAction.selectCardSharedFriend(NodeName nodeName, FriendFile friendFile) : super.selectCardSharedFriend(nodeName, friendFile);
}


@BuiltUnion()
class NewCardAction extends _$NewCardAction {
  static Serializer<NewCardAction> get serializer => _$newCardActionSerializer;

  NewCardAction.back() : super.back();
  // NewCardAction.selectNewCard() : super.selectNewCard();
  NewCardAction.selectLocal() : super.selectLocal();
  NewCardAction.selectRemote() : super.selectRemote();
  NewCardAction.newCardLocal(NodeName nodeName) : super.newCardLocal(nodeName);
  NewCardAction.loadCardRemote(RemoteCardFile remoteCardFile)
      : super.loadCardRemote(remoteCardFile);
  NewCardAction.newCardRemote(NodeName nodeName, RemoteCardFile remoteCardFile)
      : super.newCardRemote(nodeName, remoteCardFile);
}



@BuiltUnion()
class CardSettingsAction extends _$CardSettingsAction {
  static Serializer<CardSettingsAction> get serializer => _$cardSettingsActionSerializer;

  CardSettingsAction.back() : super.back();
  CardSettingsAction.enable() : super.enable();
  CardSettingsAction.disable() : super.disable();
  CardSettingsAction.friendsSettings(FriendsSettingsAction friendsSettings) : super.friendsSettings(friendsSettings);
  CardSettingsAction.relaysSettings(RelaysSettingsAction relaysSettings) : super.relaysSettings(relaysSettings);
  CardSettingsAction.indexServersSettings(IndexServersSettingsAction indexServersSettings) : super.indexServersSettings(indexServersSettings);
}


@BuiltUnion()
class FriendsSettingsAction extends _$FriendsSettingsAction {
  static Serializer<FriendsSettingsAction> get serializer => _$friendsSettingsActionSerializer;

  FriendsSettingsAction.back() : super.back();
  FriendsSettingsAction.selectNewFriend() : super.selectNewFriend();
  FriendsSettingsAction.newFriend(NewFriendAction newFriend) : super.newFriend(newFriend);
  FriendsSettingsAction.selectFriend(PublicKey friendPublicKey) : super.selectFriend(friendPublicKey);
  FriendsSettingsAction.friendSettings(FriendSettingsAction friendSettings) : super.friendSettings(friendSettings);
  FriendsSettingsAction.shareInfo() : super.shareInfo();
}


@BuiltUnion()
class NewFriendAction extends _$NewFriendAction {
  static Serializer<NewFriendAction> get serializer => _$newFriendActionSerializer;

  NewFriendAction.back() : super.back();
  NewFriendAction.loadFriend(FriendFile friendFile) : super.loadFriend(friendFile);
  NewFriendAction.addFriend(String friendName, FriendFile friendFile) : super.addFriend(friendName, friendFile);
}


@BuiltUnion()
class FriendSettingsAction extends _$FriendSettingsAction {
  static Serializer<FriendSettingsAction> get serializer => _$friendSettingsActionSerializer;

  FriendSettingsAction.back() : super.back();
  FriendSettingsAction.enableFriend() : super.enableFriend();
  FriendSettingsAction.disableFriend() : super.disableFriend();
  FriendSettingsAction.removeFriend() : super.removeFriend();

  FriendSettingsAction.removeCurrency(Currency currency) : super.removeCurrency(currency);

  FriendSettingsAction.selectNewCurrency() : super.selectNewCurrency();
  FriendSettingsAction.newCurrency(Currency currency, U128 remoteMaxDebt, Rate rate) : super.newCurrency(currency, remoteMaxDebt, rate);

  FriendSettingsAction.selectCurrency(Currency currency) : super.selectCurrency(currency);
  FriendSettingsAction.openCurrency(Currency currency) : super.openCurrency(currency);
  FriendSettingsAction.closeCurrency(Currency currency) : super.closeCurrency(currency);
  FriendSettingsAction.updateCurrency(Currency currency, U128 remoteMaxDebt, Rate rate) : super.updateCurrency(currency, remoteMaxDebt, rate);

  FriendSettingsAction.selectResolve() : super.selectResolve();
  FriendSettingsAction.resolve() : super.resolve();
}


@BuiltUnion()
class RelaysSettingsAction extends _$RelaysSettingsAction {
  static Serializer<RelaysSettingsAction> get serializer => _$relaysSettingsActionSerializer;

  RelaysSettingsAction.back() : super.back();
  RelaysSettingsAction.removeRelay(PublicKey relayPublicKey) : super.removeRelay(relayPublicKey);
  RelaysSettingsAction.selectNewRelay() : super.selectNewRelay();
  RelaysSettingsAction.newRelay(NamedRelayAddress relay) : super.newRelay(relay);
}


@BuiltUnion()
class IndexServersSettingsAction extends _$IndexServersSettingsAction {
  static Serializer<IndexServersSettingsAction> get serializer => _$indexServersSettingsActionSerializer;

  IndexServersSettingsAction.back() : super.back();
  IndexServersSettingsAction.removeIndex(PublicKey indexPublicKey) : super.removeIndex(indexPublicKey);
  IndexServersSettingsAction.selectNewIndex() : super.selectNewIndex();
  IndexServersSettingsAction.newIndex(NamedIndexServerAddress indexServer) : super.newIndex(indexServer);
}

