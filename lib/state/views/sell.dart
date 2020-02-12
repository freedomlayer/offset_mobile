import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

part 'sell.g.dart';

@BuiltUnion()
class SellView extends _$SellView {
  static Serializer<SellView> get serializer => _$sellViewSerializer;

  // TODO: Fill in here
  SellView.variant(int myInt) : super.variant(myInt);
}

