import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../protocol/common.dart';

part 'in_transactions.g.dart';


@BuiltUnion()
class InTransactionsAction extends _$InTransactionsAction {
  static Serializer<InTransactionsAction> get serializer => _$inTransactionsActionSerializer;

  InTransactionsAction.back() : super.back();
  InTransactionsAction.resendInvoice() : super.resendInvoice();
  InTransactionsAction.collectInvoice() : super.collectInvoice();
  InTransactionsAction.cancelInvoice() : super.cancelInvoice();
}
