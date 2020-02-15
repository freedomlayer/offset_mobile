import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

import 'types.dart';
import 'handle_shared_file.dart';
import 'handle_action.dart';

HandleOutput handleServerToUserAck(
    AppState appState, ServerToUserAck serverToUserAck) {
  return serverToUserAck.match(
      serverToUser: (serverToUser) =>
          handleServerToUser(appState, serverToUser),
      ack: (requestId) => handleAck(appState, requestId),
      node: (nodeId, compactToUser) =>
          handleNode(appState, nodeId, compactToUser));
}

HandleOutput handleServerToUser(AppState appState, ServerToUser serverToUser) {
  throw UnimplementedError();
}

HandleOutput handleAck(AppState appState, Uid requestId) {
  return appState.viewState.match(
      view: (_appView) =>
          HandleOutput(((b) => b..appState = appState.toBuilder())),
      transition: (oldView, newView, nextRequests, pendingRequest) {
        if (pendingRequest == requestId) {
          // The received ack exactly belongs to the request we are waiting for

          final nextRequestsList = nextRequests.asList();
          if (nextRequestsList.isEmpty) {
            // This is the last ack we were waiting for:
            final newAppState =
                appState.rebuild((b) => b..viewState = ViewState.view(newView));
            return HandleOutput(((b) => b..appState = newAppState.toBuilder()));
          } else {
            // We need to wait for more acks:

            // Pop one pending request from the list, and put its requestId
            // as the pending request
            final request = nextRequestsList.removeAt(0);
            final newNextRequestsList = BuiltList(nextRequestsList);
            final newAppState = appState.rebuild((b) => b
              ..viewState = ViewState.transition(
                  oldView, newView, newNextRequestsList, request.requestId));
            return HandleOutput(((b) => b
              ..appState = newAppState.toBuilder()
              ..userToServerAck = request.toBuilder()));
          }
        } else {
          // The received ack does not match the request we are waiting for
          return HandleOutput(((b) => b..appState = appState.toBuilder()));
        }
      });
}

HandleOutput handleNode(
    AppState appState, NodeId nodeId, CompactToUser compactToUser) {
  throw UnimplementedError();
}
