import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../protocol/common.dart';

part 'out_transactions.g.dart';


@BuiltUnion()
class OutTransactionsAction extends _$OutTransactionsAction {
  static Serializer<OutTransactionsAction> get serializer => _$outTransactionsActionSerializer;

  OutTransactionsAction.back() : super.back();
  OutTransactionsAction.selectPayment(PaymentId paymentId) : super.selectPayment(paymentId);
  OutTransactionsAction.discardPayment(PaymentId paymentId) : super.discardPayment(paymentId);
  OutTransactionsAction.viewPayments() : super.viewPayments();
}
