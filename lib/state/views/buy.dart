import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../../protocol/common.dart';

part 'buy.g.dart';

@BuiltUnion()
class BuyView extends _$BuyView {
  static Serializer<BuyView> get serializer => _$buyViewSerializer;

  BuyView.selectCard() : super.selectCard();
  BuyView.cardBuy(CardBuyView cardBuy) : super.cardBuy(cardBuy);
}

abstract class CardBuyView implements Built<CardBuyView, CardBuyViewBuilder> {
  static Serializer<CardBuyView> get serializer => _$cardBuyViewSerializer;

  NodeName get nodeName;
  CardBuyViewInner get inner;

  CardBuyView._();
  factory CardBuyView([void Function(CardBuyViewBuilder) updates]) = _$CardBuyView;
}


@BuiltUnion()
class CardBuyViewInner extends _$CardBuyViewInner {
  static Serializer<CardBuyViewInner> get serializer => _$cardBuyViewInnerSerializer;

  CardBuyViewInner.invoiceSelect() : super.invoiceSelect();
  CardBuyViewInner.invoiceScan() : super.invoiceScan();
  CardBuyViewInner.invoiceFile() : super.invoiceFile();
  CardBuyViewInner.paymentProgress(PaymentId paymentId) : super.paymentProgress(paymentId);
  /*
  CardBuyViewInner.confirmFees(PaymentId paymentId) : super.confirmFees(paymentId);
  CardBuyViewInner.paymentFailed(PaymentId paymentId) : super.paymentFailed(paymentId);
  CardBuyViewInner.sendingPayment(PaymentId paymentId) : super.sendingPayment(paymentId);
  CardBuyViewInner.paymentProof(PaymentId paymentId) : super.paymentProof(paymentId);
  */
}


