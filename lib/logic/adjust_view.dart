import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

import 'types.dart';
import 'handle_shared_file.dart';
import 'handle_action.dart';

/// Does the view rely on a card that is both existent and active?
bool isViewValid(AppView appView, Set<NodeName> openNodes) {
  return appView.match(
      home: () => true,
      buy: (buyView) => throw UnimplementedError(),
      sell: (sellView) => throw UnimplementedError(),
      outTransactions: (outTransactionsView) => throw UnimplementedError(),
      inTransactions: (outTransactionsView) => throw UnimplementedError(),
      balances: () => true,
      settings: (settingsView) => throw UnimplementedError(),
      );
}





/*
AppState adjustView(AppState appState) {
  for (final closedNodeName in closedNodes) {
    appState.viewState.match(
  }
}
*/
