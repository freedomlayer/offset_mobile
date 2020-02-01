import 'package:meta/meta.dart';

import 'package:built_value/serializer.dart';
import 'wrapped_string_builder.dart';

part 'common.g.dart';

@WrappedString()
class __PublicKey {}

@WrappedString()
class __PrivateKey {}

@WrappedString()
class __Uid {}

@WrappedString()
class __NetAddress {}

@WrappedString()
class __NodeName {}

@WrappedString()
class __NodeId {}

@WrappedString()
class __Currency {}

@WrappedString()
class __HashResult {}

@WrappedString()
class __HashedLock {}

@WrappedString()
class __InvoiceId {}

@WrappedString()
class __PaymentId {}

@WrappedString()
class __PlainLock {}

@WrappedString()
class __RandValue {}

@WrappedString()
class __Signature {}


final commonSerializers = <Serializer>[
  PublicKey.serializer,
  PrivateKey.serializer,
  Uid.serializer,
  NetAddress.serializer,
  NodeName.serializer,
  NodeId.serializer,
  Currency.serializer,
  HashResult.serializer,
  HashedLock.serializer,
  InvoiceId.serializer,
  PaymentId.serializer,
  PlainLock.serializer,
  RandValue.serializer,
  Signature.serializer,
];
