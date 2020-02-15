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
}


@BuiltUnion()
class NewCardAction extends _$NewCardAction {
  static Serializer<NewCardAction> get serializer => _$newCardActionSerializer;

  NewCardAction.back() : super.back();
  NewCardAction.selectNewCard() : super.selectNewCard();
  NewCardAction.selectNewCardLocal() : super.selectNewCardLocal();
  NewCardAction.selectNewCardRemote() : super.selectNewCardRemote();
  NewCardAction.newCardLocal(NodeName nodeName) : super.newCardLocal(nodeName);
  NewCardAction.newCardRemote(NodeName nodeName, PrivateKey appPrivateKey, PublicKey nodePublicKey, NetAddress nodeAddress)
      : super.newCardRemote(nodeName, appPrivateKey, nodePublicKey, nodeAddress);
}



@BuiltUnion()
class CardSettingsAction extends _$CardSettingsAction {
  static Serializer<CardSettingsAction> get serializer => _$cardSettingsActionSerializer;

  CardSettingsAction.friendsSettings(FriendsSettingsAction friendsSettings) : super.friendsSettings(friendsSettings);
  CardSettingsAction.relaysSettings(RelaysSettingsAction relaysSettings) : super.relaysSettings(relaysSettings);
  CardSettingsAction.indexServersSettings(IndexServersSettingsAction indexServersSettings) : super.indexServersSettings(indexServersSettings);
}


@BuiltUnion()
class FriendsSettingsAction extends _$FriendsSettingsAction {
  static Serializer<FriendsSettingsAction> get serializer => _$friendsSettingsActionSerializer;

  FriendsSettingsAction.back() : super.back();
  FriendsSettingsAction.newFriend(NewFriendAction newFriend) : super.newFriend(newFriend);
  FriendsSettingsAction.friendSettings(FriendSettingsAction friendSettings) : super.friendSettings(friendSettings);
  FriendsSettingsAction.shareInfo() : super.shareInfo();
}


@BuiltUnion()
class NewFriendAction extends _$NewFriendAction {
  static Serializer<NewFriendAction> get serializer => _$newFriendActionSerializer;

  NewFriendAction.back() : super.back();
  NewFriendAction.loadFriendScan() : super.loadFriendScan();
  NewFriendAction.loadFriendFile() : super.loadFriendFile();
  NewFriendAction.loadFriend(FriendFile friendFile) : super.loadFriend(friendFile);
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
  RelaysSettingsAction.selectNewRelayScan() : super.selectNewRelayScan();
  RelaysSettingsAction.selectNewRelayFile() : super.selectNewRelayFile();
  RelaysSettingsAction.newRelay(NamedRelayAddress relay) : super.newRelay(relay);
}


@BuiltUnion()
class IndexServersSettingsAction extends _$IndexServersSettingsAction {
  static Serializer<IndexServersSettingsAction> get serializer => _$indexServersSettingsActionSerializer;

  IndexServersSettingsAction.back() : super.back();
  IndexServersSettingsAction.removeIndex(PublicKey indexPublicKey) : super.removeIndex(indexPublicKey);
  IndexServersSettingsAction.selectNewIndex() : super.selectNewIndex();
  IndexServersSettingsAction.selectNewIndexScan() : super.selectNewIndexScan();
  IndexServersSettingsAction.selectNewIndexFile() : super.selectNewIndexFile();
  IndexServersSettingsAction.newIndex(NamedIndexServerAddress indexServer) : super.newIndex(indexServer);
}
