import 'package:built_value/built_value.dart';
import 'package:built_union/built_union.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'about.g.dart';

@BuiltUnion()
class AboutAction extends _$AboutAction {
  static Serializer<AboutAction> get serializer => _$aboutActionSerializer;

  AboutAction.back() : super.back();
}
