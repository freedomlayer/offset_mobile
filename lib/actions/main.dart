import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

part 'main.g.dart';

@BuiltUnion()
class MainAction extends _$MainAction {
  static Serializer<MainAction> get serializer => _$mainActionSerializer;

  MainAction.selectBuy() : super.selectBuy();
  MainAction.selectSell() : super.selectSell();
  MainAction.selectOutTransactions() : super.selectOutTransactions();
  MainAction.selectBalances() : super.selectBalances();
  MainAction.selectSettings() : super.selectSettings();
}

