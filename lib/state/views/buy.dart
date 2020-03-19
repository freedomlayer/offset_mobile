import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../../protocol/file.dart';

part 'buy.g.dart';

@BuiltUnion()
class BuyView extends _$BuyView {
  static Serializer<BuyView> get serializer => _$buyViewSerializer;

  BuyView.invoiceSelect() : super.invoiceSelect();
  BuyView.invoiceInfo(InvoiceFile invoiceFile) : super.invoiceInfo(invoiceFile);
  BuyView.selectCard(InvoiceFile invoiceFile) : super.selectCard(invoiceFile);
  /*
  BuyView.paymentProgress(NodeName nodeName, PaymentId paymentId)
      : super.paymentProgress(nodeName, paymentId);
  */
}
