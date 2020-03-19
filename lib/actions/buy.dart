import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../protocol/protocol.dart';
import '../protocol/file.dart';

part 'buy.g.dart';

@BuiltUnion()
class BuyAction extends _$BuyAction {
  static Serializer<BuyAction> get serializer => _$buyActionSerializer;

  BuyAction.back() : super.back();
  BuyAction.loadInvoice(InvoiceFile invoiceFile)
      : super.loadInvoice(invoiceFile);
  // TODO: Maybe add invoiceFile to confirmInfo()?
  BuyAction.confirmInfo() : super.confirmInfo();
  // TODO: Maybe add invoiceFile to selectCard()?
  BuyAction.selectCard(NodeName nodeName) : super.selectCard(nodeName);
  // TODO: Maybe add paymentId to variants below?
  BuyAction.confirmFees() : super.confirmFees();
  BuyAction.cancelPayment() : super.cancelPayment();
}
