import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../protocol/common.dart';
import '../protocol/compact.dart';
import '../protocol/file.dart';

part 'actions.g.dart';


@BuiltUnion()
class AppAction extends _$AppAction {
  static Serializer<AppAction> get serializer => _$appActionSerializer;

  AppAction.main(MainAction mainAction) : super.main(mainAction);
  AppAction.buy(BuyAction buyAction) : super.buy(buyAction);
  AppAction.sell(SellAction sellAction) : super.sell(sellAction);
  AppAction.outTransactions(OutTransactionsAction outTransactions) : super.outTransactions(outTransactions);
  AppAction.balances(BalancesAction balances) : super.balances(balances);
  AppAction.settings(SettingsAction settings) : super.settings(settings);
}


@BuiltUnion()
class MainAction extends _$MainAction {
  static Serializer<MainAction> get serializer => _$mainActionSerializer;

  MainAction.selectBuy() : super.selectBuy();
  MainAction.selectSell() : super.selectSell();
  MainAction.selectOutTransactions() : super.selectOutTransactions();
  MainAction.selectBalances() : super.selectBalances();
  MainAction.selectSettings() : super.selectSettings();
}


@BuiltUnion()
class BuyAction extends _$BuyAction {
  static Serializer<BuyAction> get serializer => _$buyActionSerializer;

  BuyAction.back() : super.back();
  BuyAction.selectCard(NodeName nodeName) : super.selectCard(nodeName);
  BuyAction.loadInvoiceScan() : super.loadInvoiceScan();
  BuyAction.loadInvoiceFile() : super.loadInvoiceFile();
  BuyAction.loadInvoice(InvoiceFile invoiceFile) : super.loadInvoice(invoiceFile);
  BuyAction.cancelPayment(PaymentId paymentId) : super.cancelPayment(paymentId);
}

@BuiltUnion()
class SellAction extends _$SellAction {
  static Serializer<SellAction> get serializer => _$sellActionSerializer;

  SellAction.back() : super.back();
  SellAction.selectCard(NodeName nodeName) : super.selectCard(nodeName);
  SellAction.invoiceDetails(Currency currency, U128 amount, String description) : super.invoiceDetails(currency, amount, description);
  SellAction.loadProofScan() : super.loadProofScan();
  SellAction.loadProofFile() : super.loadProofFile();
  SellAction.loadProof(Commit commit) : super.loadProof(commit);
  SellAction.cancelInvoice(InvoiceId invoiceId) : super.cancelInvoice(invoiceId);
  SellAction.collectInvoice(InvoiceId invoiceId) : super.collectInvoice(invoiceId);
}


@BuiltUnion()
class OutTransactionsAction extends _$OutTransactionsAction {
  static Serializer<OutTransactionsAction> get serializer => _$outTransactionsActionSerializer;

  OutTransactionsAction.back() : super.back();
  OutTransactionsAction.selectPayment(PaymentId paymentId) : super.selectPayment(paymentId);
  OutTransactionsAction.discardPayment(PaymentId paymentId) : super.discardPayment(paymentId);
  OutTransactionsAction.viewPayments() : super.viewPayments();
}



@BuiltUnion()
class BalancesAction extends _$BalancesAction {
  static Serializer<BalancesAction> get serializer => _$balancesActionSerializer;

  BalancesAction.back() : super.back();
}


@BuiltUnion()
class SettingsAction extends _$SettingsAction {
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

