import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

part 'home.g.dart';

@BuiltUnion()
class HomeAction extends _$HomeAction {
  static Serializer<HomeAction> get serializer => _$homeActionSerializer;

  HomeAction.selectBuy() : super.selectBuy();
  HomeAction.selectSell() : super.selectSell();
  HomeAction.selectInTransactions() : super.selectInTransactions();
  HomeAction.selectOutTransactions() : super.selectOutTransactions();
  HomeAction.selectBalances() : super.selectBalances();
  HomeAction.selectSettings() : super.selectSettings();
  HomeAction.selectAbout() : super.selectAbout();
}
