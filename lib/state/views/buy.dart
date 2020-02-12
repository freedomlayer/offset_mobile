import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

part 'buy.g.dart';

@BuiltUnion()
class BuyView extends _$BuyView {
  static Serializer<BuyView> get serializer => _$buyViewSerializer;

  // TODO: Fill in here:
  BuyView.variant(int myInt) : super.variant(myInt);
}

