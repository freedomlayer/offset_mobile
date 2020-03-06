import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:developer' as developer;
import 'package:built_collection/built_collection.dart';

import 'dart:convert';
import 'dart:async';
import 'process.dart';

import 'state/state.dart';
import 'logic/types.dart';
import 'logic/logic.dart';
import 'protocol/protocol.dart';
import 'protocol/serialize.dart';
import 'actions/actions.dart';
import 'error.dart';

class MainAppError extends AppError {
  MainAppError(cause) : super(cause);
}

// import 'package:receive_sharing_intent/receive_sharing_intent.dart';

void main() => runApp(MainApp());


/// Attempt to send pending outgoing messages, if any.
AppState attemptSend(
    AppState appState, Function(UserToServerAck) sendUserToServerAck) {
  return appState.viewState.match(
      view: (_) => appState,
      transition: (oldView, newView, nextRequests, optPendingRequest) {
        if (optPendingRequest != OptPendingRequest.none()) {
          // There is already an outgoing request in progress. We will not send another one
          // until the previous one is complete.
          return appState;
        }
        if (nextRequests.isEmpty) {
          developer.log('attemptSend(): Invalid state');
          return appState;
        }

        final nextRequestsList = nextRequests.asList();
        final userToServerAck = nextRequestsList.removeAt(0);
        // Send obtained message:
        sendUserToServerAck(userToServerAck);

        // Update AppState:
        final newNextRequests = BuiltList<UserToServerAck>(nextRequestsList);
        return appState.rebuild((b) => b
          ..viewState = ViewState.transition(oldView, newView, newNextRequests,
              OptPendingRequest.some(userToServerAck.requestId)));
      });
}

class MainApp extends StatefulWidget {
  MainApp();

  @override
  MainAppState createState() {
    return MainAppState();
  }
}

class MainAppState extends State<MainApp> {
  /// Have we already connected to the process?
  bool _isReady = false;
  Process _process;
  AppState _appState;
  /// Sender side of events channel
  StreamController<AppEvent> _eventController;

  MainAppState();

  Future<void> initProcess() async {
    await loadBinaries();

    _process = await openProcess();

    _eventController = StreamController<AppEvent>();


    // TODO: We use asBroadcastStream() to be able to read the first element.
    // There is possibly a cleaner way to do this.
    final fromProcess =
        _process.stdout.transform(utf8.decoder).map((String data) {
            // TODO: deserializeMsg might raise an exception. How to handle?
            return deserializeMsg<ServerToUserAck>(data);
        }).asBroadcastStream();

    // The first message must contain the current state of all nodes:
    final ServerToUserAck serverToUserAck = await fromProcess.first;
    final serverToUser = serverToUserAck.match(
        serverToUser: (serverToUser) => serverToUser,
        ack: (_) => throw MainAppError('Invalid first incoming message'));

    final nodesStatus = serverToUser.match(
        nodeOpened: (_) => throw MainAppError('Invalid first incoming message'),
        nodesStatus: (nodesStatus) => nodesStatus,
        node: (_a, _b) => throw MainAppError('Invalid first incoming message'));

    // Create initial appState (according to first incoming message from stcompact)
    final preAppState = AppState((b) => b
      ..viewState = ViewState.view(AppView.home())
      ..nodesStates = BuiltMap<NodeName, NodeState>().toBuilder());
    _appState = handleNodesStatus(preAppState, nodesStatus);

    // Handle messages from stcompact:
    fromProcess.listen((serverToUserAck) {
      // TODO; `deserializeMsg` could raise an exception. How to handle it?
      _eventController.add(AppEvent.serverToUserAck(serverToUserAck));
    });

    _process.exitCode.then((exitCode) {
      developer.log('Process exited with code: $exitCode');
      // TODO: Is this a reasonable place to close the eventController?
      _eventController.close();
      throw MainAppError('Remote process closed!');
      // TODO: What to do in this case?
      // Ideas:
      // - Close the app?
      // - Show an error screen and then close the program?
    });

    _process.stderr.transform(utf8.decoder).listen((data) {
      developer.log("stderr: $data");
    });

    // TODO: We need to listen to incoming shared files and send them as `AppEvent.sharedFile(...)`

    final sendUserToServerAck = (UserToServerAck userToServerAck) {
      final data = serializeMsg<UserToServerAck>(userToServerAck);
      _process.stdin.writeln(data);
    };

    // Secure random generator:
    final rand = Random.secure();

    // Begin handling events:
    this._eventController.stream.listen((appEvent) {
      final newAppState = handleAppEvent(this._appState, appEvent, rand);
      this._appState = attemptSend(this._appState, sendUserToServerAck);
      setState(() => this._appState = newAppState);
    });

    // App is ready to start handling user's actions.
    setState(() => this._isReady = true);
  }

  /// Queue a user action
  void _queueAction(AppAction appAction) {
    _eventController.add(AppEvent.action(appAction));
  }

  @override
  void initState() {
    super.initState();

    // Calling an async function. Should set `_isReady = true` when ready.
    initProcess();
  }

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Rust background demo';

    // throw UnimplementedError();

    if (!_isReady) {
      return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Not ready...'),
          ),
        ),
      );
    } else {
      return MaterialApp(
        title: appTitle,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Ready!'),
          ),
        ),
      );
    }
  }
}

