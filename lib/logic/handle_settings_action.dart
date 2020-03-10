import 'dart:math';
import 'dart:developer' as developer;
import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../protocol/file.dart';
import '../state/state.dart';

import '../rand.dart';

import 'settings/card.dart';

AppState handleSettingsAction(
    SettingsView settingsView,
    BuiltMap<NodeName, NodeState> nodesStates,
    SettingsAction settingsAction,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return settingsAction.match(
      back: () => createState(AppView.home()),
      selectNewCard: () => createState(AppView.settings(SettingsView.newCard(NewCardView.select()))),
      newCard: (newCardAction) {
        final newCardView = settingsView.match(
            home: () => null,
            cardSettings: (_) => null,
            newCard: (newCardView) => newCardView,
            selectCardAddRelay: (_) => null,
            selectCardAddIndex: (_) => null,
            selectCardAddFriend: (_) => null);

        if (newCardView == null) {
          developer.log('handleSettingsAction: newCard: Incorrect view');
          return createState(AppView.settings(settingsView));
        }

        return _handleNewCard(newCardView, nodesStates, newCardAction, rand);
      },
      cardSettings: (cardSettingsAction) {
        final cardSettingsView = settingsView.match(
            home: () => null,
            cardSettings: (cardSettingsView) => cardSettingsView,
            newCard: (_) => null,
            selectCardAddRelay: (_) => null,
            selectCardAddIndex: (_) => null,
            selectCardAddFriend: (_) => null);

        if (cardSettingsView == null) {
          developer.log('handleSettingsAction: cardSettings: Incorrect view');
          return createState(AppView.settings(settingsView));
        }

        return handleCardSettingsAction(
            cardSettingsView, nodesStates, cardSettingsAction, rand);
      },
      selectCard: (nodeName) {
        final cardSettingsView = CardSettingsView((b) => b
          ..nodeName = nodeName
          ..inner = CardSettingsInnerView.home());
        return createState(
            AppView.settings(SettingsView.cardSettings(cardSettingsView)));
      });
}

AppState _handleNewCard(
    NewCardView newCardView,
    BuiltMap<NodeName, NodeState> nodesStates,
    NewCardAction newCardAction,
    Random rand) {
  final createState = (AppView appView) => AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.view(appView));

  return newCardAction.match(
      back: () => newCardView.match(
          select: () => createState(AppView.settings(SettingsView.home())),
          newLocal: () => createState(
              AppView.settings(SettingsView.newCard(NewCardView.select()))),
          newRemote: () => createState(
              AppView.settings(SettingsView.newCard(NewCardView.select()))),
          newRemoteName: (nodeName) => createState(
              AppView.settings(SettingsView.newCard(NewCardView.select())))),
      selectLocal: () => createState(
          AppView.settings(SettingsView.newCard(NewCardView.newLocal()))),
      selectRemote: () => createState(
          AppView.settings(SettingsView.newCard(NewCardView.newRemote()))),
      newCardLocal: (nodeName) =>
          _handleNewCardLocal(nodeName, nodesStates, rand),
      loadCardRemote: (remoteCardFile) => createState(
          AppView.settings(SettingsView.newCard(NewCardView.newRemoteName(remoteCardFile)))),
      newCardRemote: (nodeName, remoteCardFile) => _handleNewCardRemote(nodeName, remoteCardFile, nodesStates, rand));
}

AppState _handleNewCardLocal(
    NodeName nodeName, BuiltMap<NodeName, NodeState> nodesStates, Random rand) {

  final createNodeLocal = CreateNodeLocal((b) => b..nodeName = nodeName);
  final createNode = CreateNode.createNodeLocal(createNodeLocal);
  final userToServer = UserToServer.createNode(createNode);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.settings(SettingsView.newCard(NewCardView.newLocal()));
  final newView = AppView.settings(SettingsView.home());

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}

AppState _handleNewCardRemote(NodeName nodeName, RemoteCardFile remoteCardFile,
    BuiltMap<NodeName, NodeState> nodesStates, Random rand) {

  final createNodeRemote = CreateNodeRemote((b) => b..nodeName = nodeName
                                                    ..appPrivateKey = remoteCardFile.appPrivateKey
                                                    ..nodePublicKey = remoteCardFile.nodePublicKey
                                                    ..nodeAddress = remoteCardFile.nodeAddress);
  final createNode = CreateNode.createNodeRemote(createNodeRemote);
  final userToServer = UserToServer.createNode(createNode);
  final requestId = genUid(rand);
  final userToServerAck = UserToServerAck((b) => b
    ..requestId = requestId
    ..inner = userToServer);

  final oldView = AppView.settings(SettingsView.newCard(NewCardView.newLocal()));
  final newView = AppView.settings(SettingsView.home());

  final nextRequests = BuiltList<UserToServerAck>([userToServerAck]);
  final optPendingRequest = OptPendingRequest.none();

  return AppState((b) => b
    ..nodesStates = nodesStates.toBuilder()
    ..viewState = ViewState.transition(
        oldView, newView, nextRequests, optPendingRequest));
}
