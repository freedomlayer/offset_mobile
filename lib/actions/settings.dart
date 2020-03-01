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
  SettingsAction.newCard(NewCardAction newCard) : super.newCard(newCard);
  SettingsAction.cardSettings(CardSettingsAction cardSettings) : super.cardSettings(cardSettings);
  // Select a card (Used for received a shared Relay file or Index file):
  SettingsAction.selectCard(NodeName nodeName) : super.selectCard(nodeName);
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
  FriendSettingsAction.enable() : super.enable();
  FriendSettingsAction.disable() : super.disable();
  FriendSettingsAction.unfriend() : super.unfriend();

  FriendSettingsAction.removeCurrency(Currency currency) : super.removeCurrency(currency);
  FriendSettingsAction.currencySettings(CurrencySettingsAction currencySettings) : super.currencySettings(currencySettings);
  FriendSettingsAction.resolve(ResolveAction resolve) : super.resolve(resolve);
  FriendSettingsAction.newCurrency(NewCurrencyAction newCurrency) : super.newCurrency(newCurrency);
}


@BuiltUnion()
class CurrencySettingsAction extends _$CurrencySettingsAction {
  static Serializer<CurrencySettingsAction> get serializer => _$currencySettingsActionSerializer;

  CurrencySettingsAction.back() : super.back();
  CurrencySettingsAction.open() : super.open();
  CurrencySettingsAction.close() : super.close();
  CurrencySettingsAction.update(U128 remoteMaxDebt, Rate rate) : super.update(remoteMaxDebt, rate);
}


@BuiltUnion()
class ResolveAction extends _$ResolveAction {
  static Serializer<ResolveAction> get serializer => _$resolveActionSerializer;

  ResolveAction.back() : super.back();
  ResolveAction.accept() : super.accept();
}


@BuiltUnion()
class NewCurrencyAction extends _$NewCurrencyAction {
  static Serializer<NewCurrencyAction> get serializer => _$newCurrencyActionSerializer;

  NewCurrencyAction.back() : super.back();
  NewCurrencyAction.newCurrency(Currency currency, U128 remoteMaxDebt, Rate rate) : super.newCurrency(currency, remoteMaxDebt, rate);
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

