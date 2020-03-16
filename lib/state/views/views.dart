// import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import 'buy.dart';
import 'out_transactions.dart';
import 'in_transactions.dart';
import 'balances.dart';
import 'sell.dart';
import 'settings.dart';

export 'buy.dart';
export 'out_transactions.dart';
export 'in_transactions.dart';
export 'balances.dart';
export 'sell.dart';
export 'settings.dart';

part 'views.g.dart';

@BuiltUnion()
class AppView extends _$AppView {
  static Serializer<AppView> get serializer => _$appViewSerializer;

  AppView.home() : super.home();
  AppView.buy(BuyView buy) : super.buy(buy);
  AppView.sell(SellView sell) : super.sell(sell);
  AppView.inTransactions(InTransactionsView inTransactions)
      : super.inTransactions(inTransactions);
  AppView.outTransactions(OutTransactionsView outTransactions)
      : super.outTransactions(outTransactions);
  AppView.balances(BalancesView balances) : super.balances(balances);
  AppView.settings(SettingsView settings) : super.settings(settings);
}
