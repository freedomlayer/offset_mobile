import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import 'buy.dart';
import 'home.dart';
import 'out_transactions.dart';
import 'sell.dart';
import 'balances.dart';
import 'settings.dart';

export 'buy.dart';
export 'home.dart';
export 'out_transactions.dart';
export 'sell.dart';
export 'balances.dart';
export 'settings.dart';

part 'actions.g.dart';


@BuiltUnion()
class AppAction extends _$AppAction {
  static Serializer<AppAction> get serializer => _$appActionSerializer;

  AppAction.home(HomeAction home) : super.home(home);
  AppAction.buy(BuyAction buy) : super.buy(buy);
  AppAction.sell(SellAction sell) : super.sell(sell);
  AppAction.outTransactions(OutTransactionsAction outTransactions) : super.outTransactions(outTransactions);
  AppAction.balances(BalancesAction balances) : super.balances(balances);
  AppAction.settings(SettingsAction settings) : super.settings(settings);
}



