import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../protocol/common.dart';
import '../protocol/compact.dart';

part 'sell.g.dart';


@BuiltUnion()
class SellAction extends _$SellAction {
  static Serializer<SellAction> get serializer => _$sellActionSerializer;

  SellAction.back() : super.back();
  SellAction.selectCard(NodeName nodeName) : super.selectCard(nodeName);
  SellAction.invoiceDetails(Currency currency, U128 amount, String description) : super.invoiceDetails(currency, amount, description);
  SellAction.loadProofScan() : super.loadProofScan();
  SellAction.loadProofFile() : super.loadProofFile();
  SellAction.loadProof(Commit commit) : super.loadProof(commit);
  SellAction.cancelInvoice(InvoiceId invoiceId) : super.cancelInvoice(invoiceId);
  SellAction.collectInvoice(InvoiceId invoiceId) : super.collectInvoice(invoiceId);
}

