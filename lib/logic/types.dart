import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
// import '../state/state.dart';


part 'types.g.dart';

@BuiltUnion()
class AppEvent extends _$AppEvent {
  static Serializer<AppEvent> get serializer => _$appEventSerializer;

  // Shared file intent
  AppEvent.sharedFile(String filePath) : super.sharedFile(filePath);
  // Application UI action (Caused by the user, from the UI)
  AppEvent.action(AppAction appAction) : super.action(appAction);
  // Communication from stcompact server
  AppEvent.serverToUserAck(ServerToUserAck serverToUserAck)
      : super.serverToUserAck(serverToUserAck);
}

