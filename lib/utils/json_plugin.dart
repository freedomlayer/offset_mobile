import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_union/custom_json_plugin.dart';
import 'package:built_value/serializer.dart';

/// A json serializer plugin with a fix for the case of non-string key types.
class CommJsonPlugin extends CustomJsonPlugin {
  List _toList(Map map) {
    var result = List(map.length * 2);
    var i = 0;
    map.forEach((key, value) {
      // Drop null values, they are represented by missing keys.
      if (value == null) {
        return;
      }

      result[i] = key;
      result[i + 1] = value;
      i += 2;
    });
    return result;
  }

  @override
  Object beforeDeserialize(Object object, FullType specifiedType) {
    if (object is Map && specifiedType.root != JsonObject) {
      if (specifiedType.isUnspecified) {
        return super.beforeDeserialize(object, specifiedType);
      } else {
        return _toList(object);
      }
    } else {
      return super.beforeDeserialize(object, specifiedType);
    }
  }

  /// Converts serialization output, a `List`, to a `Map`, when the serialized
  /// type is known statically.
  Map _toMap(List list) {
    var result = <String, Object>{};
    for (var i = 0; i != list.length ~/ 2; ++i) {
      final key = list[i * 2];
      final value = list[i * 2 + 1];
      result[key as String] = value;
    }
    return result;
  }

  // Fix special case of BuiltMap keys. Avoids double encoding of key ("myKey"
  // instead of ""myKey"").
  @override
  Object afterSerialize(Object object, FullType specifiedType) {
    if (object is List && specifiedType.root == BuiltMap) {
      if (specifiedType.isUnspecified) {
        return super.afterSerialize(object, specifiedType);
      } else {
        return _toMap(object);
      }
    } else {
      return super.afterSerialize(object, specifiedType);
    }
  }
}
