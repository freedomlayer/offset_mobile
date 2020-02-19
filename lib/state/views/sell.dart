import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../../protocol/common.dart';

part 'sell.g.dart';

@BuiltUnion()
class SellView extends _$SellView {
  static Serializer<SellView> get serializer => _$sellViewSerializer;

  SellView.selectCard() : super.selectCard();
  SellView.invoiceDetails(NodeName nodeName) : super.invoiceDetails(nodeName);
  SellView.sendInvoice(NodeName nodeName, InvoiceId invoiceId) : super.sendInvoice(nodeName, invoiceId);
}

