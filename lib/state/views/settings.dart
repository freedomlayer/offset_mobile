import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../../protocol/common.dart';
import '../../protocol/compact.dart';

part 'settings.g.dart';

@BuiltUnion()
class SettingsView extends _$SettingsView {
  static Serializer<SettingsView> get serializer => _$settingsViewSerializer;

  SettingsView.home() : super.home();
  SettingsView.cardSettings(CardSettingsView cardSettings) : super.cardSettings(cardSettings);
  SettingsView.newCard(NewCardView newCard) : super.newCard(newCard);
  SettingsView.selectCardAddRelay() : super.selectCardAddRelay();
  SettingsView.selectCardAddIndex() : super.selectCardAddIndex();

}



@BuiltUnion()
class NewCardView extends _$NewCardView {
  static Serializer<NewCardView> get serializer => _$newCardViewSerializer;

  NewCardView.select() : super.select();
  NewCardView.local() : super.local();
  NewCardView.remote() : super.remote();
}



abstract class CardSettingsView implements Built<CardSettingsView, CardSettingsViewBuilder> {
  static Serializer<CardSettingsView> get serializer => _$cardSettingsViewSerializer;

  NodeName get nodeName;
  CardSettingsInnerView get inner;

  CardSettingsView._();
  factory CardSettingsView([void Function(CardSettingsViewBuilder) updates]) = _$CardSettingsView;
}


@BuiltUnion()
class CardSettingsInnerView extends _$CardSettingsInnerView {
  static Serializer<CardSettingsInnerView> get serializer => _$cardSettingsInnerViewSerializer;

  CardSettingsInnerView.home() : super.home();
  CardSettingsInnerView.friends(FriendsSettingsView friends) : super.friends(friends);
  CardSettingsInnerView.relays(RelaysSettingsView relays) : super.relays(relays);
  CardSettingsInnerView.indexServers(IndexServersSettingsView indexServers) : super.indexServers(indexServers);
}

// ------------------[Friends settings]-----------------------------


@BuiltUnion()
class FriendsSettingsView extends _$FriendsSettingsView {
  static Serializer<FriendsSettingsView> get serializer => _$friendsSettingsViewSerializer;

  FriendsSettingsView.home() : super.home();
  FriendsSettingsView.friendSettings(FriendSettingsView friendSettings) : super.friendSettings(friendSettings);
  FriendsSettingsView.newFriend(NewFriendView newFriend) : super.newFriend(newFriend);
  // Share our node's info
  FriendsSettingsView.shareInfo() : super.shareInfo();
}


@BuiltUnion()
class NewFriendView extends _$NewFriendView {
  static Serializer<NewFriendView> get serializer => _$newFriendViewSerializer;

  // Select how to add a friend
  NewFriendView.select() : super.select();
  // Add a name to the newly loaded friend
  NewFriendView.name(PublicKey friendPublicKey, BuiltList<RelayAddress> relays) : super.name(friendPublicKey, relays);
}



abstract class FriendSettingsView implements Built<FriendSettingsView, FriendSettingsViewBuilder> {
  static Serializer<FriendSettingsView> get serializer => _$friendSettingsViewSerializer;

  PublicKey get friendPublicKey;
  FriendSettingsInnerView get inner;


  FriendSettingsView._();
  factory FriendSettingsView([void Function(FriendSettingsViewBuilder) updates]) = _$FriendSettingsView;
}


@BuiltUnion()
class FriendSettingsInnerView extends _$FriendSettingsInnerView {
  static Serializer<FriendSettingsInnerView> get serializer => _$friendSettingsInnerViewSerializer;

  FriendSettingsInnerView.home() : super.home();
  FriendSettingsInnerView.resolve() : super.resolve();
  FriendSettingsInnerView.currencySettings(Currency currency) : super.currencySettings(currency);
  FriendSettingsInnerView.newCurrency() : super.newCurrency();
}

// ------------------[Relays settings]-----------------------------



@BuiltUnion()
class RelaysSettingsView extends _$RelaysSettingsView {
  static Serializer<RelaysSettingsView> get serializer => _$relaysSettingsViewSerializer;

  RelaysSettingsView.home() : super.home();
  RelaysSettingsView.newRelaySelect() : super.newRelaySelect();
  RelaysSettingsView.newRelayName(PublicKey relayPublicKey, NetAddress relayAddress) : super.newRelayName(relayPublicKey, relayAddress);
}

// ------------------[Index servers settings]-----------------------------


@BuiltUnion()
class IndexServersSettingsView extends _$IndexServersSettingsView {
  static Serializer<IndexServersSettingsView> get serializer => _$indexServersSettingsViewSerializer;

  IndexServersSettingsView.home() : super.home();
  IndexServersSettingsView.newIndexSelect() : super.newIndexSelect();
  IndexServersSettingsView.newIndexName(PublicKey indexPublicKey, NetAddress indexAddress) : super.newIndexName(indexPublicKey, indexAddress);
}


