import 'dart:math';

import '../state/state.dart';

import 'types.dart';
import 'handle_shared_file.dart';
import 'handle_action.dart';
import 'handle_server_to_user_ack.dart';

AppState handleAppEvent(AppState appState, AppEvent appEvent, Random rand) {
  return appEvent.match(
    sharedFile: (filePath) => handleSharedFile(appState, filePath),
    action: (appAction) => handleAction(appState, appAction, rand),
    serverToUserAck: (serverToUserAck) =>
        handleServerToUserAck(appState, serverToUserAck),
  );
}
