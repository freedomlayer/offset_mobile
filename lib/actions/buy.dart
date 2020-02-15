import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../protocol/common.dart';
import '../protocol/file.dart';

part 'buy.g.dart';

@BuiltUnion()
class BuyAction extends _$BuyAction {
  static Serializer<BuyAction> get serializer => _$buyActionSerializer;

  BuyAction.back() : super.back();
  BuyAction.loadInvoiceScan() : super.loadInvoiceScan();
  BuyAction.loadInvoiceFile() : super.loadInvoiceFile();
  BuyAction.loadInvoice(InvoiceFile invoiceFile) : super.loadInvoice(invoiceFile);
  BuyAction.confirmInvoice() : super.confirmInvoice();
  BuyAction.selectCard(NodeName nodeName) : super.selectCard(nodeName);
  BuyAction.cancelPayment() : super.cancelPayment();
}
