import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../../protocol/common.dart';

part 'in_transactions.g.dart';


@BuiltUnion()
class InTransactionsView extends _$InTransactionsView {
  static Serializer<InTransactionsView> get serializer => _$inTransactionsViewSerializer;

  InTransactionsView.home() : super.home();
  InTransactionsView.transaction(InvoiceId invoiceId) : super.transaction(invoiceId);
  InTransactionsView.sendInvoice(InvoiceId invoiceId) : super.sendInvoice(invoiceId);
  InTransactionsView.collected(InvoiceId invoiceId) : super.collected(invoiceId);
}
