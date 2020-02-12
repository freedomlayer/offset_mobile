import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

part 'out_transactions.g.dart';

@BuiltUnion()
class OutTransactionsView extends _$OutTransactionsView {
  static Serializer<OutTransactionsView> get serializer => _$outTransactionsViewSerializer;

  // TODO: Fill in here:
  OutTransactionsView.variant(int myInt) : super.variant(myInt);
}

