import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../../protocol/common.dart';

part 'balances.g.dart';

@BuiltUnion()
class BalancesView extends _$BalancesView {
  static Serializer<BalancesView> get serializer => _$balancesViewSerializer;

  BalancesView.selectCard() : super.selectCard();
  BalancesView.cardBalances(NodeName nodeName) : super.cardBalances(nodeName);
}
