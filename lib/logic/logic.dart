import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

import 'types.dart';


HandleOutput handleAppEvent(AppState appState, AppEvent appEvent) {
  return appEvent.match(
    sharedFile: (filePath) => handleSharedFile(appState, filePath),
    action: (appAction) => handleAction(appState, appAction),
    serverToUserAck: (serverToUserAck) => handleServerToUserAck(appState, serverToUserAck),
  );
}

HandleOutput handleSharedFile(AppState appState, String filePath) {
  throw UnimplementedError();
}

HandleOutput handleAction(AppState appState, AppAction appAction) {
  throw UnimplementedError();
}

HandleOutput handleServerToUserAck(AppState appState, ServerToUserAck serverToUserAck) {
  throw UnimplementedError();
}
