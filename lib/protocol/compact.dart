import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import 'common.dart';

part 'compact.g.dart';

abstract class AppPermissions
    implements Built<AppPermissions, AppPermissionsBuilder> {
  static Serializer<AppPermissions> get serializer =>
      _$appPermissionsSerializer;

  bool get routes;
  bool get buyer;
  bool get seller;
  bool get config;

  AppPermissions._();
  factory AppPermissions([void Function(AppPermissionsBuilder) updates]) =
      _$AppPermissions;
}

abstract class Rate implements Built<Rate, RateBuilder> {
  static Serializer<Rate> get serializer => _$rateSerializer;

  int get mul;
  int get add;

  Rate._();
  factory Rate([void Function(RateBuilder) updates]) = _$Rate;
}

abstract class Receipt implements Built<Receipt, ReceiptBuilder> {
  static Serializer<Receipt> get serializer => _$receiptSerializer;

  HashResult get responseHash;
  InvoiceId get invoiceId;
  Currency get currency;
  PlainLock get srcPlainLock;
  PlainLock get destPlainLock;
  bool get isComplete;
  U128 get destPayment;
  U128 get totalDestPayment;
  Signature get signature;

  Receipt._();
  factory Receipt([void Function(ReceiptBuilder) updates]) = _$Receipt;
}

abstract class NamedIndexServerAddress
    implements Built<NamedIndexServerAddress, NamedIndexServerAddressBuilder> {
  static Serializer<NamedIndexServerAddress> get serializer =>
      _$namedIndexServerAddressSerializer;

  PublicKey get publicKey;
  NetAddress get address;
  String get name;

  NamedIndexServerAddress._();
  factory NamedIndexServerAddress(
          [void Function(NamedIndexServerAddressBuilder) updates]) =
      _$NamedIndexServerAddress;
}

abstract class NamedRelayAddress
    implements Built<NamedRelayAddress, NamedRelayAddressBuilder> {
  static Serializer<NamedRelayAddress> get serializer =>
      _$namedRelayAddressSerializer;

  PublicKey get publicKey;
  NetAddress get address;
  String get name;

  NamedRelayAddress._();
  factory NamedRelayAddress([void Function(NamedRelayAddressBuilder) updates]) =
      _$NamedRelayAddress;
}

abstract class RelayAddress
    implements Built<RelayAddress, RelayAddressBuilder> {
  static Serializer<RelayAddress> get serializer => _$relayAddressSerializer;

  PublicKey get publicKey;
  NetAddress get address;

  RelayAddress._();
  factory RelayAddress([void Function(RelayAddressBuilder) updates]) =
      _$RelayAddress;
}

abstract class Commit implements Built<Commit, CommitBuilder> {
  static Serializer<Commit> get serializer => _$commitSerializer;

  HashResult get responseHash;
  PlainLock get srcPlainLock;
  HashedLock get destHashedLock;
  U128 get destPayment;
  U128 get totalDestPayment;
  InvoiceId get invoiceId;
  Currency get currency;
  Signature get signature;

  Commit._();
  factory Commit([void Function(CommitBuilder) updates]) = _$Commit;
}

abstract class OpenFriendCurrency
    implements Built<OpenFriendCurrency, OpenFriendCurrencyBuilder> {
  static Serializer<OpenFriendCurrency> get serializer =>
      _$openFriendCurrencySerializer;

  PublicKey get friendPublicKey;
  Currency get currency;

  OpenFriendCurrency._();
  factory OpenFriendCurrency(
          [void Function(OpenFriendCurrencyBuilder) updates]) =
      _$OpenFriendCurrency;
}

abstract class CloseFriendCurrency
    implements Built<CloseFriendCurrency, CloseFriendCurrencyBuilder> {
  static Serializer<CloseFriendCurrency> get serializer =>
      _$closeFriendCurrencySerializer;

  PublicKey get friendPublicKey;
  Currency get currency;

  CloseFriendCurrency._();
  factory CloseFriendCurrency(
          [void Function(CloseFriendCurrencyBuilder) updates]) =
      _$CloseFriendCurrency;
}

abstract class AddFriend implements Built<AddFriend, AddFriendBuilder> {
  static Serializer<AddFriend> get serializer => _$addFriendSerializer;

  PublicKey get friendPublicKey;
  BuiltList<RelayAddress> get relays;
  String get name;

  AddFriend._();
  factory AddFriend([void Function(AddFriendBuilder) updates]) = _$AddFriend;
}

abstract class SetFriendRelays
    implements Built<SetFriendRelays, SetFriendRelaysBuilder> {
  static Serializer<SetFriendRelays> get serializer =>
      _$setFriendRelaysSerializer;

  PublicKey get friendPublicKey;
  BuiltList<RelayAddress> get relays;

  SetFriendRelays._();
  factory SetFriendRelays([void Function(SetFriendRelaysBuilder) updates]) =
      _$SetFriendRelays;
}

abstract class SetFriendName
    implements Built<SetFriendName, SetFriendNameBuilder> {
  static Serializer<SetFriendName> get serializer => _$setFriendNameSerializer;

  PublicKey get friendPublicKey;
  String get name;

  SetFriendName._();
  factory SetFriendName([void Function(SetFriendNameBuilder) updates]) =
      _$SetFriendName;
}

abstract class InitPayment implements Built<InitPayment, InitPaymentBuilder> {
  static Serializer<InitPayment> get serializer => _$initPaymentSerializer;

  PaymentId get paymentId;
  InvoiceId get invoiceId;
  Currency get currency;
  PublicKey get destPublicKey;
  U128 get destPayment;
  String get description;

  InitPayment._();
  factory InitPayment([void Function(InitPaymentBuilder) updates]) =
      _$InitPayment;
}

@BuiltUnion()
class PaymentFeesResponse extends _$PaymentFeesResponse {
  static Serializer<PaymentFeesResponse> get serializer =>
      _$paymentFeesResponseSerializer;

  PaymentFeesResponse.unreachable() : super.unreachable();
  PaymentFeesResponse.fees(U128 fees, Uid confirmId)
      : super.fees(fees, confirmId);
}

abstract class PaymentFees implements Built<PaymentFees, PaymentFeesBuilder> {
  static Serializer<PaymentFees> get serializer => _$paymentFeesSerializer;

  PaymentId get paymentId;
  PaymentFeesResponse get response;

  PaymentFees._();
  factory PaymentFees([void Function(PaymentFeesBuilder) updates]) =
      _$PaymentFees;
}

@BuiltUnion()
class PaymentDoneStatus extends _$PaymentDoneStatus {
  static Serializer<PaymentDoneStatus> get serializer =>
      _$paymentDoneStatusSerializer;

  PaymentDoneStatus.failure(Uid ackUid) : super.failure(ackUid);
  PaymentDoneStatus.success(Receipt receipt, U128 fees, Uid uid)
      : super.success(receipt, fees, uid);
}

abstract class PaymentDone implements Built<PaymentDone, PaymentDoneBuilder> {
  static Serializer<PaymentDone> get serializer => _$paymentDoneSerializer;

  PaymentId get paymentId;
  PaymentDoneStatus get status;

  PaymentDone._();
  factory PaymentDone([void Function(PaymentDoneBuilder) updates]) =
      _$PaymentDone;
}

abstract class RequestVerifyCommit
    implements Built<RequestVerifyCommit, RequestVerifyCommitBuilder> {
  static Serializer<RequestVerifyCommit> get serializer =>
      _$requestVerifyCommitSerializer;

  Uid get requestId;
  Commit get commit;

  RequestVerifyCommit._();
  factory RequestVerifyCommit(
          [void Function(RequestVerifyCommitBuilder) updates]) =
      _$RequestVerifyCommit;
}

abstract class ResponseVerifyCommit
    implements Built<ResponseVerifyCommit, ResponseVerifyCommitBuilder> {
  static Serializer<ResponseVerifyCommit> get serializer =>
      _$responseVerifyCommitSerializer;

  Uid get requestId;
  VerifyCommitStatus get status;

  ResponseVerifyCommit._();
  factory ResponseVerifyCommit(
          [void Function(ResponseVerifyCommitBuilder) updates]) =
      _$ResponseVerifyCommit;
}

@BuiltUnion()
class VerifyCommitStatus extends _$VerifyCommitStatus {
  static Serializer<VerifyCommitStatus> get serializer =>
      _$verifyCommitStatusSerializer;

  VerifyCommitStatus.failure() : super.failure();
  VerifyCommitStatus.success() : super.success();
}

abstract class PaymentCommit
    implements Built<PaymentCommit, PaymentCommitBuilder> {
  static Serializer<PaymentCommit> get serializer => _$paymentCommitSerializer;

  PaymentId get paymentId;
  Commit get commit;

  PaymentCommit._();
  factory PaymentCommit([void Function(PaymentCommitBuilder) updates]) =
      _$PaymentCommit;
}

abstract class ConfirmPaymentFees
    implements Built<ConfirmPaymentFees, ConfirmPaymentFeesBuilder> {
  static Serializer<ConfirmPaymentFees> get serializer =>
      _$confirmPaymentFeesSerializer;

  PaymentId get paymentId;
  Uid get confirmId;

  ConfirmPaymentFees._();
  factory ConfirmPaymentFees(
          [void Function(ConfirmPaymentFeesBuilder) updates]) =
      _$ConfirmPaymentFees;
}

abstract class SetFriendCurrencyMaxDebt
    implements
        Built<SetFriendCurrencyMaxDebt, SetFriendCurrencyMaxDebtBuilder> {
  static Serializer<SetFriendCurrencyMaxDebt> get serializer =>
      _$setFriendCurrencyMaxDebtSerializer;

  PublicKey get friendPublicKey;
  Currency get currency;
  U128 get remoteMaxDebt;

  SetFriendCurrencyMaxDebt._();
  factory SetFriendCurrencyMaxDebt(
          [void Function(SetFriendCurrencyMaxDebtBuilder) updates]) =
      _$SetFriendCurrencyMaxDebt;
}

abstract class RemoveFriendCurrency
    implements Built<RemoveFriendCurrency, RemoveFriendCurrencyBuilder> {
  static Serializer<RemoveFriendCurrency> get serializer =>
      _$removeFriendCurrencySerializer;

  PublicKey get friendPublicKey;
  Currency get currency;

  RemoveFriendCurrency._();
  factory RemoveFriendCurrency(
          [void Function(RemoveFriendCurrencyBuilder) updates]) =
      _$RemoveFriendCurrency;
}

abstract class ResetFriendChannel
    implements Built<ResetFriendChannel, ResetFriendChannelBuilder> {
  static Serializer<ResetFriendChannel> get serializer =>
      _$resetFriendChannelSerializer;

  PublicKey get friendPublicKey;
  Signature get resetToken;

  ResetFriendChannel._();
  factory ResetFriendChannel(
          [void Function(ResetFriendChannelBuilder) updates]) =
      _$ResetFriendChannel;
}

abstract class SetFriendCurrencyRate
    implements Built<SetFriendCurrencyRate, SetFriendCurrencyRateBuilder> {
  static Serializer<SetFriendCurrencyRate> get serializer =>
      _$setFriendCurrencyRateSerializer;

  PublicKey get friendPublicKey;
  Currency get currency;
  Rate get rate;

  SetFriendCurrencyRate._();
  factory SetFriendCurrencyRate(
          [void Function(SetFriendCurrencyRateBuilder) updates]) =
      _$SetFriendCurrencyRate;
}

abstract class AddInvoice implements Built<AddInvoice, AddInvoiceBuilder> {
  static Serializer<AddInvoice> get serializer => _$addInvoiceSerializer;

  InvoiceId get invoiceId;
  Currency get currency;
  U128 get totalDestPayment;
  String get description;

  AddInvoice._();
  factory AddInvoice([void Function(AddInvoiceBuilder) updates]) = _$AddInvoice;
}

@BuiltUnion()
class RequestStatusReport extends _$RequestStatusReport {
  static Serializer<RequestStatusReport> get serializer =>
      _$requestStatusReportSerializer;

  RequestStatusReport.open() : super.open();
  RequestStatusReport.closed() : super.closed();
}

abstract class ConfigReport
    implements Built<ConfigReport, ConfigReportBuilder> {
  static Serializer<ConfigReport> get serializer => _$configReportSerializer;

  Rate get rate;
  U128 get remoteMaxDebt;
  bool get isOpen;

  ConfigReport._();
  factory ConfigReport([void Function(ConfigReportBuilder) updates]) =
      _$ConfigReport;
}

@BuiltUnion()
class FriendLivenessReport extends _$FriendLivenessReport {
  static Serializer<FriendLivenessReport> get serializer =>
      _$friendLivenessReportSerializer;

  FriendLivenessReport.online() : super.online();
  FriendLivenessReport.offline() : super.offline();
}

abstract class ResetTermsReport
    implements Built<ResetTermsReport, ResetTermsReportBuilder> {
  static Serializer<ResetTermsReport> get serializer =>
      _$resetTermsReportSerializer;

  Signature get resetToken;
  BuiltMap<Currency, I128> get balanceForReset;

  ResetTermsReport._();
  factory ResetTermsReport([void Function(ResetTermsReportBuilder) updates]) =
      _$ResetTermsReport;
}

abstract class ChannelInconsistentReport
    implements
        Built<ChannelInconsistentReport, ChannelInconsistentReportBuilder> {
  static Serializer<ChannelInconsistentReport> get serializer =>
      _$channelInconsistentReportSerializer;

  BuiltMap<Currency, I128> get localResetTerms;

  // Optional. TODO: Check if this works as intended.
  @nullable
  ResetTermsReport get optRemoteResetTerms;

  ChannelInconsistentReport._();
  factory ChannelInconsistentReport(
          [void Function(ChannelInconsistentReportBuilder) updates]) =
      _$ChannelInconsistentReport;
}

abstract class CurrencyReport
    implements Built<CurrencyReport, CurrencyReportBuilder> {
  static Serializer<CurrencyReport> get serializer =>
      _$currencyReportSerializer;

  I128 get balance;
  U128 get localPendingDebt;
  U128 get remotePendingDebt;

  CurrencyReport._();
  factory CurrencyReport([void Function(CurrencyReportBuilder) updates]) =
      _$CurrencyReport;
}

abstract class ChannelConsistentReport
    implements Built<ChannelConsistentReport, ChannelConsistentReportBuilder> {
  static Serializer<ChannelConsistentReport> get serializer =>
      _$channelConsistentReportSerializer;

  BuiltMap<Currency, CurrencyReport> get currencyReports;

  ChannelConsistentReport._();
  factory ChannelConsistentReport(
          [void Function(ChannelConsistentReportBuilder) updates]) =
      _$ChannelConsistentReport;
}

@BuiltUnion()
class ChannelStatusReport extends _$ChannelStatusReport {
  static Serializer<ChannelStatusReport> get serializer =>
      _$channelStatusReportSerializer;

  ChannelStatusReport.inconsistent(
      ChannelInconsistentReport channelInconsistentReport)
      : super.inconsistent(channelInconsistentReport);
  ChannelStatusReport.consistent(
      ChannelConsistentReport channelConsistentReport)
      : super.consistent(channelConsistentReport);
}

@BuiltUnion()
class FriendStatusReport extends _$FriendStatusReport {
  static Serializer<FriendStatusReport> get serializer =>
      _$friendStatusReportSerializer;

  FriendStatusReport.enabled() : super.enabled();
  FriendStatusReport.disabled() : super.disabled();
}

abstract class BalanceInfo implements Built<BalanceInfo, BalanceInfoBuilder> {
  static Serializer<BalanceInfo> get serializer => _$balanceInfoSerializer;

  I128 get balance;
  U128 get localPendingDebt;
  U128 get remotePendingDebt;

  BalanceInfo._();
  factory BalanceInfo([void Function(BalanceInfoBuilder) updates]) =
      _$BalanceInfo;
}

abstract class McInfo implements Built<McInfo, McInfoBuilder> {
  static Serializer<McInfo> get serializer => _$mcInfoSerializer;

  PublicKey get localPublicKey;
  PublicKey get remotePublicKey;
  BuiltMap<Currency, BalanceInfo> get balances;

  McInfo._();
  factory McInfo([void Function(McInfoBuilder) updates]) = _$McInfo;
}

abstract class CountersInfo
    implements Built<CountersInfo, CountersInfoBuilder> {
  static Serializer<CountersInfo> get serializer => _$countersInfoSerializer;

  U64 get inconsistencyCounter;
  U128 get moveTokenCounter;

  CountersInfo._();
  factory CountersInfo([void Function(CountersInfoBuilder) updates]) =
      _$CountersInfo;
}

abstract class TokenInfo implements Built<TokenInfo, TokenInfoBuilder> {
  static Serializer<TokenInfo> get serializer => _$tokenInfoSerializer;

  McInfo get mc;
  CountersInfo get counters;

  TokenInfo._();
  factory TokenInfo([void Function(TokenInfoBuilder) updates]) = _$TokenInfo;
}

abstract class MoveTokenHashedReport
    implements Built<MoveTokenHashedReport, MoveTokenHashedReportBuilder> {
  static Serializer<MoveTokenHashedReport> get serializer =>
      _$moveTokenHashedReportSerializer;

  HashResult get prefixHash;
  TokenInfo get tokenInfo;
  RandValue get randNonce;
  Signature get newToken;

  MoveTokenHashedReport._();
  factory MoveTokenHashedReport(
          [void Function(MoveTokenHashedReportBuilder) updates]) =
      _$MoveTokenHashedReport;
}

abstract class FriendReport
    implements Built<FriendReport, FriendReportBuilder> {
  static Serializer<FriendReport> get serializer => _$friendReportSerializer;

  String get name;
  BuiltMap<Currency, ConfigReport> get currencyConfigs;

  @nullable
  MoveTokenHashedReport get optLastIncomingMoveToken;

  FriendLivenessReport get liveness;
  ChannelStatusReport get channelStatus;
  FriendStatusReport get status;

  FriendReport._();
  factory FriendReport([void Function(FriendReportBuilder) updates]) =
      _$FriendReport;
}

abstract class OpenInvoice implements Built<OpenInvoice, OpenInvoiceBuilder> {
  static Serializer<OpenInvoice> get serializer => _$openInvoiceSerializer;

  Currency get currency;
  U128 get totalDestPayment;
  String get description;
  bool get isCommited;
  Generation get generation;

  OpenInvoice._();
  factory OpenInvoice([void Function(OpenInvoiceBuilder) updates]) =
      _$OpenInvoice;
}

@BuiltUnion()
class OpenPaymentStatus extends _$OpenPaymentStatus {
  static Serializer<OpenPaymentStatus> get serializer =>
      _$openPaymentStatusSerializer;

  OpenPaymentStatus.searchingRoute(Uid requestRoutesId)
      : super.searchingRoute(requestRoutesId);
  OpenPaymentStatus.foundRoute(Uid confirmId, U128 fees)
      : super.foundRoute(confirmId, fees);
  OpenPaymentStatus.sending(U128 fees) : super.sending(fees);
  OpenPaymentStatus.commit(Commit commit, U128 fees)
      : super.commit(commit, fees);
  OpenPaymentStatus.success(Receipt receipt, U128 fees, Uid ackUid)
      : super.success(receipt, fees, ackUid);
  OpenPaymentStatus.failure(Uid ackUid) : super.failure(ackUid);
}

abstract class OpenPayment implements Built<OpenPayment, OpenPaymentBuilder> {
  static Serializer<OpenPayment> get serializer => _$openPaymentSerializer;

  InvoiceId get invoiceId;
  Currency get currency;
  PublicKey get destPublicKey;
  U128 get destPayment;
  String get description;
  Generation get generation;
  OpenPaymentStatus get status;

  OpenPayment._();
  factory OpenPayment([void Function(OpenPaymentBuilder) updates]) =
      _$OpenPayment;
}

abstract class CompactReport
    implements Built<CompactReport, CompactReportBuilder> {
  static Serializer<CompactReport> get serializer => _$compactReportSerializer;

  PublicKey get localPublicKey;
  BuiltList<NamedIndexServerAddress> get indexServers;
  @nullable
  PublicKey get optConnectedIndexServer;
  BuiltList<NamedRelayAddress> get relays;
  BuiltMap<PublicKey, FriendReport> get friends;
  BuiltMap<InvoiceId, OpenInvoice> get openInvoices;
  BuiltMap<PaymentId, OpenPayment> get openPayments;

  CompactReport._();
  factory CompactReport([void Function(CompactReportBuilder) updates]) =
      _$CompactReport;
}

@BuiltUnion()
class CompactToUserAck extends _$CompactToUserAck {
  static Serializer<CompactToUserAck> get serializer =>
      _$compactToUserAckSerializer;

  CompactToUserAck.ack(Uid ackUid) : super.ack(ackUid);
  CompactToUserAck.compactToUser(CompactToUser compactToUser)
      : super.compactToUser(compactToUser);
}

@BuiltUnion()
class CompactToUser extends _$CompactToUser {
  static Serializer<CompactToUser> get serializer => _$compactToUserSerializer;

  CompactToUser.paymentFees(PaymentFees paymentFees)
      : super.paymentFees(paymentFees);
  CompactToUser.paymentCommit(PaymentCommit paymentCommit)
      : super.paymentCommit(paymentCommit);
  CompactToUser.paymentDone(PaymentDone paymentDone)
      : super.paymentDone(paymentDone);
  CompactToUser.report(CompactReport compactReport)
      : super.report(compactReport);
  CompactToUser.responseVerifyCommit(ResponseVerifyCommit responseVerifyCommit)
      : super.responseVerifyCommit(responseVerifyCommit);
}

@BuiltUnion()
class UserToCompact extends _$UserToCompact {
  static Serializer<UserToCompact> get serializer => _$userToCompactSerializer;

  // -----[Configuration]-----
  UserToCompact.addRelay(NamedRelayAddress namedRelayAddress)
      : super.addRelay(namedRelayAddress);
  UserToCompact.removeRelay(PublicKey publicKey) : super.removeRelay(publicKey);
  UserToCompact.addIndexServer(NamedIndexServerAddress namedIndexServerAddress)
      : super.addIndexServer(namedIndexServerAddress);
  UserToCompact.removeIndexServer(PublicKey publicKey)
      : super.removeIndexServer(publicKey);
  UserToCompact.addFriend(AddFriend addFriend) : super.addFriend(addFriend);
  UserToCompact.setFriendRelays(SetFriendRelays setFriendRelays)
      : super.setFriendRelays(setFriendRelays);
  UserToCompact.setFriendName(SetFriendName setFriendName)
      : super.setFriendName(setFriendName);
  UserToCompact.removeFriend(PublicKey publicKey)
      : super.removeFriend(publicKey);
  UserToCompact.enableFriend(PublicKey publicKey)
      : super.enableFriend(publicKey);
  UserToCompact.disableFriend(PublicKey publicKey)
      : super.disableFriend(publicKey);
  UserToCompact.openFriendCurrency(OpenFriendCurrency openFriendCurrency)
      : super.openFriendCurrency(openFriendCurrency);
  UserToCompact.closeFriendCurrency(CloseFriendCurrency closeFriendCurrency)
      : super.closeFriendCurrency(closeFriendCurrency);
  UserToCompact.setFriendCurrencyMaxDebt(
      SetFriendCurrencyMaxDebt setFriendCurrencyMaxDebt)
      : super.setFriendCurrencyMaxDebt(setFriendCurrencyMaxDebt);
  UserToCompact.setFriendCurrencyRate(
      SetFriendCurrencyRate setFriendCurrencyRate)
      : super.setFriendCurrencyRate(setFriendCurrencyRate);
  UserToCompact.removeFriendCurrency(RemoveFriendCurrency removeFriendCurrency)
      : super.removeFriendCurrency(removeFriendCurrency);
  UserToCompact.resetFriendChannel(ResetFriendChannel resetFriendChannel)
      : super.resetFriendChannel(resetFriendChannel);

  // -----[Buyer]-----
  UserToCompact.initPayment(InitPayment initPayment)
      : super.initPayment(initPayment);
  UserToCompact.confirmPaymentFees(ConfirmPaymentFees confirmPaymentFees)
      : super.confirmPaymentFees(confirmPaymentFees);
  UserToCompact.cancelPayment(PaymentId paymentId)
      : super.cancelPayment(paymentId);
  UserToCompact.ackPaymentDone(PaymentId paymentId, Uid ackUid)
      : super.ackPaymentDone(paymentId, ackUid);

  // -----[Seller]-----
  UserToCompact.addInvoice(AddInvoice addInvoice)
      : super.addInvoice(addInvoice);
  UserToCompact.cancelInvoice(InvoiceId invoiceId)
      : super.cancelInvoice(invoiceId);
  UserToCompact.requestVerifyCommit(RequestVerifyCommit requestVerifyCommit)
      : super.requestVerifyCommit(requestVerifyCommit);
  UserToCompact.commitInvoice(InvoiceId invoiceId)
      : super.commitInvoice(invoiceId);
}

abstract class UserToCompactAck
    implements Built<UserToCompactAck, UserToCompactAckBuilder> {
  static Serializer<UserToCompactAck> get serializer =>
      _$userToCompactAckSerializer;

  Uid get userRequestId;
  UserToCompact get inner;

  UserToCompactAck._();
  factory UserToCompactAck([void Function(UserToCompactAckBuilder) updates]) =
      _$UserToCompactAck;
}

final compactSerializers = <Serializer>[
  _$appPermissionsSerializer,
  _$rateSerializer,
  _$receiptSerializer,
  _$namedIndexServerAddressSerializer,
  _$namedRelayAddressSerializer,
  _$relayAddressSerializer,
  _$commitSerializer,
  _$openFriendCurrencySerializer,
  _$closeFriendCurrencySerializer,
  _$addFriendSerializer,
  _$setFriendRelaysSerializer,
  _$setFriendNameSerializer,
  _$initPaymentSerializer,
  _$paymentFeesResponseSerializer,
  _$paymentFeesSerializer,
  _$paymentDoneStatusSerializer,
  _$paymentDoneSerializer,
  _$requestVerifyCommitSerializer,
  _$responseVerifyCommitSerializer,
  _$verifyCommitStatusSerializer,
  _$paymentCommitSerializer,
  _$confirmPaymentFeesSerializer,
  _$setFriendCurrencyMaxDebtSerializer,
  _$removeFriendCurrencySerializer,
  _$resetFriendChannelSerializer,
  _$setFriendCurrencyRateSerializer,
  _$addInvoiceSerializer,
  _$requestStatusReportSerializer,
  _$configReportSerializer,
  _$friendLivenessReportSerializer,
  _$resetTermsReportSerializer,
  _$channelInconsistentReportSerializer,
  _$currencyReportSerializer,
  _$channelConsistentReportSerializer,
  _$channelStatusReportSerializer,
  _$friendStatusReportSerializer,
  _$balanceInfoSerializer,
  _$mcInfoSerializer,
  _$countersInfoSerializer,
  _$tokenInfoSerializer,
  _$moveTokenHashedReportSerializer,
  _$friendReportSerializer,
  _$openInvoiceSerializer,
  _$openPaymentStatusSerializer,
  _$openPaymentSerializer,
  _$compactReportSerializer,
  _$compactToUserAckSerializer,
  _$compactToUserSerializer,
  _$userToCompactSerializer,
  _$userToCompactAckSerializer,
];
