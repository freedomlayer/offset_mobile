import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'common.g.dart';

// ------------- PublicKey -----------------------------------------

abstract class PublicKey implements Built<PublicKey, PublicKeyBuilder> {
  String get inner;

  factory PublicKey([Function(PublicKeyBuilder) updates]) = _$PublicKey;
  PublicKey._();
}

Serializer<PublicKey> publicKeySerializer = PublicKeySerializer();

class PublicKeySerializer implements StructuredSerializer<PublicKey> {
  @override
  final Iterable<Type> types = const [PublicKey, _$PublicKey];
  @override
  final String wireName = 'PublicKey';

  @override
  Iterable<Object> serialize(Serializers serializers, PublicKey object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[object.inner];
  }

  @override
  PublicKey deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    
    final result = PublicKeyBuilder();
    final iterator = serialized.iterator;
    iterator.moveNext();
    result.inner = iterator.current;

    return result.build();
  }
}

// ---------------- PrivateKey ---------------------------------

abstract class PrivateKey implements Built<PrivateKey, PrivateKeyBuilder> {
  String get inner;

  factory PrivateKey([Function(PrivateKeyBuilder) updates]) = _$PrivateKey;
  PrivateKey._();
}

Serializer<PrivateKey> privateKeySerializer = PrivateKeySerializer();

class PrivateKeySerializer implements StructuredSerializer<PrivateKey> {
  @override
  final Iterable<Type> types = const [PrivateKey, _$PrivateKey];
  @override
  final String wireName = 'PrivateKey';

  @override
  Iterable<Object> serialize(Serializers serializers, PrivateKey object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[object.inner];
  }

  @override
  PrivateKey deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    
    final result = PrivateKeyBuilder();
    final iterator = serialized.iterator;
    iterator.moveNext();
    result.inner = iterator.current;

    return result.build();
  }
}


// ---------------- Uid ---------------------------------

abstract class Uid implements Built<Uid, UidBuilder> {
  String get inner;

  factory Uid([Function(UidBuilder) updates]) = _$Uid;
  Uid._();
}

Serializer<Uid> uidSerializer = UidSerializer();

class UidSerializer implements StructuredSerializer<Uid> {
  @override
  final Iterable<Type> types = const [Uid, _$Uid];
  @override
  final String wireName = 'Uid';

  @override
  Iterable<Object> serialize(Serializers serializers, Uid object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[object.inner];
  }

  @override
  Uid deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    
    final result = UidBuilder();
    final iterator = serialized.iterator;
    iterator.moveNext();
    result.inner = iterator.current;

    return result.build();
  }
}


// ---------------- NetAddress ---------------------------------

abstract class NetAddress implements Built<NetAddress, NetAddressBuilder> {
  String get inner;

  factory NetAddress([Function(NetAddressBuilder) updates]) = _$NetAddress;
  NetAddress._();
}

Serializer<NetAddress> netAddressSerializer = NetAddressSerializer();

class NetAddressSerializer implements StructuredSerializer<NetAddress> {
  @override
  final Iterable<Type> types = const [NetAddress, _$NetAddress];
  @override
  final String wireName = 'NetAddress';

  @override
  Iterable<Object> serialize(Serializers serializers, NetAddress object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[object.inner];
  }

  @override
  NetAddress deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    
    final result = NetAddressBuilder();
    final iterator = serialized.iterator;
    iterator.moveNext();
    result.inner = iterator.current;

    return result.build();
  }
}

// ---------------- NodeName ---------------------------------

abstract class NodeName implements Built<NodeName, NodeNameBuilder> {
  String get inner;

  factory NodeName([Function(NodeNameBuilder) updates]) = _$NodeName;
  NodeName._();
}

Serializer<NodeName> nodeNameSerializer = NodeNameSerializer();

class NodeNameSerializer implements StructuredSerializer<NodeName> {
  @override
  final Iterable<Type> types = const [NodeName, _$NodeName];
  @override
  final String wireName = 'NodeName';

  @override
  Iterable<Object> serialize(Serializers serializers, NodeName object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[object.inner];
  }

  @override
  NodeName deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    
    final result = NodeNameBuilder();
    final iterator = serialized.iterator;
    iterator.moveNext();
    result.inner = iterator.current;

    return result.build();
  }
}


// ---------------- NodeId ------------------------------

abstract class NodeId implements Built<NodeId, NodeIdBuilder> {
  String get inner;

  factory NodeId([Function(NodeIdBuilder) updates]) = _$NodeId;
  NodeId._();
}

Serializer<NodeId> nodeIdSerializer = NodeIdSerializer();

class NodeIdSerializer implements StructuredSerializer<NodeId> {
  @override
  final Iterable<Type> types = const [NodeId, _$NodeId];
  @override
  final String wireName = 'NodeId';

  @override
  Iterable<Object> serialize(Serializers serializers, NodeId object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[object.inner];
  }

  @override
  NodeId deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    
    final result = NodeIdBuilder();
    final iterator = serialized.iterator;
    iterator.moveNext();
    result.inner = iterator.current;

    return result.build();
  }
}


// Exported serializers:
final commonSerializers = <Serializer>[
  publicKeySerializer,
  privateKeySerializer,
  uidSerializer,
  netAddressSerializer,
  nodeNameSerializer,
  nodeIdSerializer,
];
