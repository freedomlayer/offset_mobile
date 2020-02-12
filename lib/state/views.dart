// import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

part 'views.g.dart';


@BuiltUnion()
class AppView extends _$AppView {
  static Serializer<AppView> get serializer => _$appViewSerializer;

  AppView.main(MainView main) : super.main(main);
  AppView.buy(BuyView buy) : super.buy(buy);
  AppView.sell(SellView sell) : super.sell(sell);
  AppView.outTransactions(OutTransactionsView outTransactions) : super.outTransactions(outTransactions);
  AppView.balances(BalancesView balances) : super.balances(balances);
  AppView.settings(SettingsView settings) : super.settings(settings);
}



@BuiltUnion()
class MainView extends _$MainView {
  static Serializer<MainView> get serializer => _$mainViewSerializer;

  // TODO: Fill in here:
  MainView.variant(int myInt) : super.variant(myInt);
}


@BuiltUnion()
class BuyView extends _$BuyView {
  static Serializer<BuyView> get serializer => _$buyViewSerializer;

  // TODO: Fill in here:
  BuyView.variant(int myInt) : super.variant(myInt);
}


@BuiltUnion()
class SellView extends _$SellView {
  static Serializer<SellView> get serializer => _$sellViewSerializer;

  // TODO: Fill in here
  SellView.variant(int myInt) : super.variant(myInt);
}


@BuiltUnion()
class OutTransactionsView extends _$OutTransactionsView {
  static Serializer<OutTransactionsView> get serializer => _$outTransactionsViewSerializer;

  // TODO: Fill in here:
  OutTransactionsView.variant(int myInt) : super.variant(myInt);
}


@BuiltUnion()
class BalancesView extends _$BalancesView {
  static Serializer<BalancesView> get serializer => _$balancesViewSerializer;

  // TODO: Fill in here:
  BalancesView.variant(int myInt) : super.variant(myInt);
}


@BuiltUnion()
class SettingsView extends _$SettingsView {
  static Serializer<SettingsView> get serializer => _$settingsViewSerializer;

  // TODO: Fill in here:
  SettingsView.variant(int myInt) : super.variant(myInt);
}

