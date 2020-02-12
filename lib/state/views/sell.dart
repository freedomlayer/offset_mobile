import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';


// import '../../protocol/protocol.dart';
import '../../protocol/compact.dart';
import '../../protocol/common.dart';

part 'sell.g.dart';

@BuiltUnion()
class SellView extends _$SellView {
  static Serializer<SellView> get serializer => _$sellViewSerializer;

  SellView.selectCard() : super.selectCard();
  SellView.cardSell(CardSellView cardSell) : super.cardSell(cardSell);
}


abstract class CardSellView implements Built<CardSellView, CardSellViewBuilder> {
  static Serializer<CardSellView> get serializer => _$cardSellViewSerializer;

  NodeName get nodeName;
  CardSellInnerView get inner;


  CardSellView._();
  factory CardSellView([void Function(CardSellViewBuilder) updates]) = _$CardSellView;
}

@BuiltUnion()
class CardSellInnerView extends _$CardSellInnerView {
  static Serializer<CardSellInnerView> get serializer => _$cardSellInnerViewSerializer;

  CardSellInnerView.invoiceDetails() : super.invoiceDetails();
  CardSellInnerView.sendInvoice(InvoiceId invoiceId) : super.sendInvoice(invoiceId);
  CardSellInnerView.receiveProofSelect(InvoiceId invoiceId) : super.receiveProofSelect(invoiceId);
  CardSellInnerView.receiveProofScan(InvoiceId invoiceId) : super.receiveProofScan(invoiceId);
  CardSellInnerView.receiveProofFile(InvoiceId invoiceId) : super.receiveProofFile(invoiceId);
  CardSellInnerView.paymentReceived(InvoiceId invoiceId, Commit commit) : super.paymentReceived(invoiceId, commit);
  CardSellInnerView.paymentCollected(InvoiceId invoiceId, Commit commit) : super.paymentCollected(invoiceId, commit);
}


