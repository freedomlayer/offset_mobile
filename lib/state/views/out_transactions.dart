import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../../protocol/common.dart';

part 'out_transactions.g.dart';

@BuiltUnion()
class OutTransactionsView extends _$OutTransactionsView {
  static Serializer<OutTransactionsView> get serializer =>
      _$outTransactionsViewSerializer;

  OutTransactionsView.home() : super.home();
  OutTransactionsView.transaction(NodeName nodeName, PaymentId paymentId)
      : super.transaction(nodeName, paymentId);
  OutTransactionsView.sendCommit(NodeName nodeName, PaymentId paymentId)
      : super.sendCommit(nodeName, paymentId);
}
