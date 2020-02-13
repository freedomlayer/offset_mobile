import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import 'buy.dart';
import 'main.dart';
import 'out_transactions.dart';
import 'sell.dart';
import 'balances.dart';
import 'settings.dart';

part 'actions.g.dart';


@BuiltUnion()
class AppAction extends _$AppAction {
  static Serializer<AppAction> get serializer => _$appActionSerializer;

  AppAction.main(MainAction mainAction) : super.main(mainAction);
  AppAction.buy(BuyAction buyAction) : super.buy(buyAction);
  AppAction.sell(SellAction sellAction) : super.sell(sellAction);
  AppAction.outTransactions(OutTransactionsAction outTransactions) : super.outTransactions(outTransactions);
  AppAction.balances(BalancesAction balances) : super.balances(balances);
  AppAction.settings(SettingsAction settings) : super.settings(settings);
}



