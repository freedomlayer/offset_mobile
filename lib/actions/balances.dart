import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../protocol/protocol.dart';


part 'balances.g.dart';

@BuiltUnion()
class BalancesAction extends _$BalancesAction {
  static Serializer<BalancesAction> get serializer => _$balancesActionSerializer;

  BalancesAction.back() : super.back();
  BalancesAction.selectCard(NodeName nodeName) : super.selectCard(nodeName);
}


