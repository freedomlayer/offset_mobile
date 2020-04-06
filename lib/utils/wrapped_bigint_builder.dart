import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'wrapped_bigint.dart';

Builder wrappedBigIntBuilder(BuilderOptions options) =>
    SharedPartBuilder([WrappedBigIntGenerator()], 'wrapped_bigint');

class WrappedBigIntGenerator extends GeneratorForAnnotation<WrappedBigInt> {
  @override
  Object generateForAnnotatedElement(
          Element element, ConstantReader annotation, BuildStep buildStep) =>
      generateWrappedBigInt(element, annotation);
}

/// Generate code for a new-type class that wraps a BigInt.
/// When serialized, a simple json string will be created.
String generateWrappedBigInt(Element element, ConstantReader annotation) {
  final className = element.name;

  return '''
@immutable
class _\$$className implements Comparable<_\$$className>{
  final BigInt inner;

  _\$$className(this.inner);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) {
      return true;
    }
    if (other is _\$$className) {
      return inner == other.inner;
    } else {
      return false;
    }
  }

  @override
  String toString() {
      return '$className(\$inner)';
  }

  @override
  int get hashCode {
    // Based on _combine function (quiver)
    final value = 0x1338;
    var hash = 0x1fffffff & (inner.hashCode + value);
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    hash ^= (hash >> 6);

    // Based on _finish function (quiver)
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }

  @override
  int compareTo(_\$$className other) {
    return inner.compareTo(other.inner);
  }
}

class ${className}Serializer implements StructuredSerializer<$className> {
  @override
  final Iterable<Type> types = const [$className, _\$$className];
  @override
  final String wireName = '$className';

  @override
  Iterable<Object> serialize(Serializers serializers, $className object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[object.inner.toString()];
  }

  @override
  $className deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final iterator = serialized.iterator;
    iterator.moveNext();
    return $className(BigInt.parse(iterator.current));
  }
}
  ''';
}
