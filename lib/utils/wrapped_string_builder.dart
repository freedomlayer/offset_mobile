import 'package:meta/meta.dart';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../error.dart';

@immutable
class WrappedString {
  const WrappedString();
}

class WrappedStringError extends AppError {
  WrappedStringError(cause): super(cause);
}

Builder wrappedStringBuilder(BuilderOptions options) =>
    SharedPartBuilder([WrappedStringGenerator()], 'wrapped_string');

class WrappedStringGenerator
    extends GeneratorForAnnotation<WrappedString> {
  @override
  Object generateForAnnotatedElement(
          Element element, ConstantReader annotation, BuildStep buildStep) =>
      generateWrappedString(element, annotation);
}



/*
/// class name should be of the form: "__ClassName".
/// This function returns "ClassName"
String calcClassName(Element element) {
  var className;
  if (element is ClassElement && !element.isMixin && !element.isEnum) {
    className = element.name;
  } else {
    throw WrappedStringError('Invalid element: $element');
  }

  if (!(className[0] == '_' &&  className[1] == '_')) {
    throw WrappedStringError('Invalid class name: $className');
  }

  return className.substring(2);
}
*/

/// Generate code for a new-type class that wraps a string.
/// When serialized, a simple json string will be created.
String generateWrappedString(Element element, ConstantReader annotation) {
  final className = element.name;

  return '''
@immutable
class _\$$className {
  final String inner;

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
  int get hashCode {
    // Based on _combine function (quiver)
    final value = 0x1337;
    var hash = 0x1fffffff & (inner.hashCode + value);
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    hash ^= (hash >> 6);

    // Based on _finish function (quiver)
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
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
    return <Object>[object.inner];
  }

  @override
  $className deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final iterator = serialized.iterator;
    iterator.moveNext();
    return $className(iterator.current);
  }
}
  ''';
}
