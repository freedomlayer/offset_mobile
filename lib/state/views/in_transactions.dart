import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../../protocol/common.dart';
import '../../protocol/protocol.dart';

part 'in_transactions.g.dart';

@BuiltUnion()
class InTransactionsView extends _$InTransactionsView {
  static Serializer<InTransactionsView> get serializer =>
      _$inTransactionsViewSerializer;

  InTransactionsView.home() : super.home();
  InTransactionsView.transaction(NodeName nodeName, InvoiceId invoiceId)
      : super.transaction(nodeName, invoiceId);
  InTransactionsView.sendInvoice(NodeName nodeName, InvoiceId invoiceId)
      : super.sendInvoice(nodeName, invoiceId);
  InTransactionsView.collected(NodeName nodeName, InvoiceId invoiceId)
      : super.collected(nodeName, invoiceId);
  InTransactionsView.selectCardApplyCommit(Commit commit)
      : super.selectCardApplyCommit(commit);
}
