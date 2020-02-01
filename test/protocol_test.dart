import 'dart:convert';
import 'package:built_value/serializer.dart';
import 'package:built_union/custom_json_plugin.dart';
import 'package:test/test.dart';

import 'package:offst_mobile/protocol/common.dart';
import 'package:offst_mobile/protocol/protocol.dart';

void main() {
  group('common serialize', () {
    /*
    final serBuilder = Serializers().toBuilder();
    for (final commonSer in commonSerializers) {
      serBuilder.add(commonSer);
    }

    Serializers serializers = serBuilder.build();
    */

    final serializersWithPlugin =
        (serializers.toBuilder()..addPlugin(CustomJsonPlugin())).build();

    test('PublicKey serialization', () {
      final publicKey = PublicKey('MyPublicKey');
      final serialized = serializersWithPlugin.serialize(publicKey,
          specifiedType: FullType(PublicKey));

      JsonEncoder encoder = JsonEncoder.withIndent('  ');
      String jsonString = encoder.convert(serialized);
      // We expect a single string, without a wrap:
      expect(jsonString, '"MyPublicKey"');

      final decoder = JsonDecoder();
      final serialized2 = decoder.convert(jsonString);
      final publicKey2 = serializersWithPlugin.deserialize(serialized2,
          specifiedType: FullType(PublicKey));

      expect(publicKey, publicKey2);

    });
    test('NodeInfoLocal serialization', () {
      final nodeInfoLocal = NodeInfoLocal((b) => b..publicKey = PublicKey('MyPublicKey'));
      final serialized = serializersWithPlugin.serialize(nodeInfoLocal,
          specifiedType: FullType(NodeInfoLocal));

      JsonEncoder encoder = JsonEncoder.withIndent('  ');
      String jsonString = encoder.convert(serialized);

      final decoder = JsonDecoder();
      final serialized2 = decoder.convert(jsonString);
      final nodeInfoLocal2 = serializersWithPlugin.deserialize(serialized2,
          specifiedType: FullType(NodeInfoLocal));

      expect(nodeInfoLocal, nodeInfoLocal2);

    });
  });
}
