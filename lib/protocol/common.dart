import 'package:meta/meta.dart';

import 'package:built_value/serializer.dart';
import 'wrapped_string_builder.dart';

part 'common.g.dart';

@WrappedString()
// ignore: unused_element
class __PublicKey {}

@WrappedString()
// ignore: unused_element
class __PrivateKey {}

@WrappedString()
// ignore: unused_element
class __Uid {}

@WrappedString()
// ignore: unused_element
class __NetAddress {}

@WrappedString()
// ignore: unused_element
class __NodeName {}

@WrappedString()
// ignore: unused_element
class __NodeId {}

@WrappedString()
// ignore: unused_element
class __Currency {}

@WrappedString()
// ignore: unused_element
class __HashResult {}

@WrappedString()
// ignore: unused_element
class __HashedLock {}

@WrappedString()
// ignore: unused_element
class __InvoiceId {}

@WrappedString()
// ignore: unused_element
class __PaymentId {}

@WrappedString()
// ignore: unused_element
class __PlainLock {}

@WrappedString()
// ignore: unused_element
class __RandValue {}

@WrappedString()
// ignore: unused_element
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
