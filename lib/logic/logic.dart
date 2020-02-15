import '../state/state.dart';

import 'types.dart';
import 'handle_shared_file.dart';
import 'handle_action.dart';
import 'handle_server_to_user_ack.dart';


HandleOutput handleAppEvent(AppState appState, AppEvent appEvent) {
  return appEvent.match(
    sharedFile: (filePath) => handleSharedFile(appState, filePath),
    action: (appAction) => handleAction(appState, appAction),
    serverToUserAck: (serverToUserAck) => handleServerToUserAck(appState, serverToUserAck),
  ); }

