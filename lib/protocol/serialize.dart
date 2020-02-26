import 'dart:developer' as developer;
import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:offst_mobile/utils/json_plugin.dart';

import '../protocol/protocol.dart';
import '../error.dart';

final _serializersWithPlugin =
      (serializers.toBuilder()..addPlugin(CommJsonPlugin())).build();

JsonEncoder _encoder = JsonEncoder();
final _decoder = JsonDecoder();

class SerializeError extends AppError {
  SerializeError(cause): super(cause);
}

/// Deserialize a protocol message
/// Throws `SerializeError` on error
T deserializeMsg<T>(String data) {
  try {
    final serialized = _decoder.convert(data);
    final serializersWithPlugin =
          (serializers.toBuilder()..addPlugin(CommJsonPlugin())).build();

    return serializersWithPlugin.deserialize(serialized, specifiedType: FullType(T));
  } catch (e) {
    developer.log('deserializeData() error: $e');
    throw SerializeError('$e');
  }
}

/// Serialize a protocol message
/// Throws `SerializeError` on error
String serializeMsg<T>(T msg) {
    final serialized2 = _serializersWithPlugin.serialize(msg,
        specifiedType: FullType(T));
    return _encoder.convert(serialized2);

}
