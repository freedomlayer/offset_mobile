import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:offset/utils/json_plugin.dart';

import 'protocol.dart';
import 'file.dart';
import '../error.dart';

import '../logger.dart';

final logger = createLogger('protocol::serialize');

/// Collect all the serializers required for the protocol
/// with stcompact
Serializers collectSerializers() {
  final serBuilder = Serializers().toBuilder();

  // Serializers for common types:
  for (final commonSer in commonSerializers) {
    serBuilder.add(commonSer);
  }

  // Serializers for common types:
  for (final compactSer in compactSerializers) {
    serBuilder.add(compactSer);
  }

  // Serializers for file types:
  for (final fileSer in fileSerializers) {
    serBuilder.add(fileSer);
  }

  // Serializers for compound protocol messages:
  serBuilder.add(NodeInfoLocal.serializer);
  serBuilder.add(NodeInfoRemote.serializer);
  serBuilder.add(NodeInfo.serializer);
  serBuilder.add(NodeOpened.serializer);
  serBuilder.add(NodeMode.serializer);
  serBuilder.add(NodeStatus.serializer);
  serBuilder.add(CreateNodeLocal.serializer);
  serBuilder.add(CreateNodeRemote.serializer);
  serBuilder.add(ResponseOpenNode.serializer);
  serBuilder.add(CreateNode.serializer);
  serBuilder.add(ServerToUser.serializer);
  serBuilder.add(ServerToUserAck.serializer);
  serBuilder.add(UserToServer.serializer);
  serBuilder.add(UserToServerAck.serializer);

  serBuilder.addBuilderFactory(
      const FullType(BuiltList, const [const FullType(RelayAddress)]),
      () => new ListBuilder<RelayAddress>());
  serBuilder.addBuilderFactory(
      const FullType(
          BuiltList, const [const FullType(NamedIndexServerAddress)]),
      () => new ListBuilder<NamedIndexServerAddress>());
  serBuilder.addBuilderFactory(
      const FullType(BuiltList, const [const FullType(NamedRelayAddress)]),
      () => new ListBuilder<NamedRelayAddress>());
  serBuilder.addBuilderFactory(
      const FullType(
          BuiltMap, const [const FullType(Currency), const FullType(I128)]),
      () => new MapBuilder<Currency, I128>());
  serBuilder.addBuilderFactory(
      const FullType(BuiltMap,
          const [const FullType(Currency), const FullType(CurrencyReport)]),
      () => new MapBuilder<Currency, CurrencyReport>());
  serBuilder.addBuilderFactory(
      const FullType(BuiltMap,
          const [const FullType(Currency), const FullType(BalanceInfo)]),
      () => new MapBuilder<Currency, BalanceInfo>());
  serBuilder.addBuilderFactory(
      const FullType(BuiltMap,
          const [const FullType(Currency), const FullType(ConfigReport)]),
      () => new MapBuilder<Currency, ConfigReport>());
  serBuilder.addBuilderFactory(
      const FullType(BuiltMap,
          const [const FullType(PublicKey), const FullType(FriendReport)]),
      () => new MapBuilder<PublicKey, FriendReport>());
  serBuilder.addBuilderFactory(
      const FullType(BuiltMap,
          const [const FullType(InvoiceId), const FullType(OpenInvoice)]),
      () => new MapBuilder<InvoiceId, OpenInvoice>());
  serBuilder.addBuilderFactory(
      const FullType(BuiltMap,
          const [const FullType(PaymentId), const FullType(OpenPayment)]),
      () => new MapBuilder<PaymentId, OpenPayment>());
  serBuilder.addBuilderFactory(
      const FullType(BuiltMap,
          const [const FullType(NodeName), const FullType(NodeStatus)]),
      () => new MapBuilder<NodeName, NodeStatus>());

  return serBuilder.build();
}

final serializers = collectSerializers();

final _serializersWithPlugin =
    (serializers.toBuilder()..addPlugin(CommJsonPlugin())).build();

JsonEncoder _encoder = JsonEncoder();
final _decoder = JsonDecoder();

class SerializeError extends AppError {
  SerializeError(cause) : super(cause);
}

/// Deserialize a protocol message
/// Throws `SerializeError` on error
T deserializeMsg<T>(String data) {
  try {
    final serialized = _decoder.convert(data);
    final serializersWithPlugin =
        (serializers.toBuilder()..addPlugin(CommJsonPlugin())).build();

    return serializersWithPlugin.deserialize(serialized,
        specifiedType: FullType(T));
  } catch (e) {
    logger.w('deserializeData() error: $e');
    throw SerializeError('$e');
  }
}

/// Serialize a protocol message
/// Throws `SerializeError` on error
String serializeMsg<T>(T msg) {
  final serialized2 =
      _serializersWithPlugin.serialize(msg, specifiedType: FullType(T));
  return _encoder.convert(serialized2);
}
