import 'package:meta/meta.dart';
import 'package:built_value/serializer.dart';
import 'package:offst_mobile/utils/wrapped_string_builder.dart';

part 'common.g.dart';

@WrappedString()
class PublicKey extends _$PublicKey {
  PublicKey(String inner) : super(inner);
}

@WrappedString()
class PrivateKey extends _$PrivateKey {
  PrivateKey(String inner) : super(inner);
}

@WrappedString()
class Uid extends _$Uid {
  Uid(String inner) : super(inner);
}

@WrappedString()
class NetAddress extends _$NetAddress {
  NetAddress(String inner) : super(inner);
}

@WrappedString()
class NodeName extends _$NodeName {
  NodeName(String inner) : super(inner);
}

@WrappedString()
class NodeId extends _$NodeId {
  NodeId(String inner) : super(inner);
}

@WrappedString()
class Currency extends _$Currency {
  Currency(String inner) : super(inner);
}

@WrappedString()
class HashResult extends _$HashResult {
  HashResult(String inner) : super(inner);
}

@WrappedString()
class HashedLock extends _$HashedLock {
  HashedLock(String inner) : super(inner);
}

@WrappedString()
class InvoiceId extends _$InvoiceId {
  InvoiceId(String inner) : super(inner);
}

@WrappedString()
class PaymentId extends _$PaymentId {
  PaymentId(String inner) : super(inner);
}

@WrappedString()
class PlainLock extends _$PlainLock {
  PlainLock(String inner) : super(inner);
}

@WrappedString()
class RandValue extends _$RandValue {
  RandValue(String inner) : super(inner);
}

@WrappedString()
class Signature extends _$Signature {
  Signature(String inner) : super(inner);
}

@WrappedString()
class U128 extends _$U128 {
  U128(String inner) : super(inner);
}

@WrappedString()
class I128 extends _$I128 {
  I128(String inner) : super(inner);
}

@WrappedString()
class U64 extends _$U64 {
  U64(String inner) : super(inner);
}

final commonSerializers = <Serializer>[
  PublicKeySerializer(),
  PrivateKeySerializer(),
  UidSerializer(),
  NetAddressSerializer(),
  NodeNameSerializer(),
  NodeIdSerializer(),
  CurrencySerializer(),
  HashResultSerializer(),
  HashedLockSerializer(),
  InvoiceIdSerializer(),
  PaymentIdSerializer(),
  PlainLockSerializer(),
  RandValueSerializer(),
  SignatureSerializer(),
  U128Serializer(),
  I128Serializer(),
  U64Serializer(),
];
