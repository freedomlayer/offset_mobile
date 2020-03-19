import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../protocol/common.dart';

part 'sell.g.dart';

@BuiltUnion()
class SellAction extends _$SellAction {
  static Serializer<SellAction> get serializer => _$sellActionSerializer;

  SellAction.back() : super.back();
  SellAction.selectCard(NodeName nodeName) : super.selectCard(nodeName);
  SellAction.createInvoice(
      NodeName nodeName, Currency currency, U128 amount, String description)
      : super.createInvoice(nodeName, currency, amount, description);
  SellAction.viewTransaction(NodeName nodeName, InvoiceId invoiceId)
      : super.viewTransaction(nodeName, invoiceId);
  SellAction.cancelInvoice(NodeName nodeName, InvoiceId invoiceId)
      : super.cancelInvoice(nodeName, invoiceId);
}
