import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:developer' as developer;

import 'package:logger/logger.dart';

import 'package:built_collection/built_collection.dart';
import 'package:receive_file_intent/receive_file_intent.dart';

import 'dart:convert';
import 'dart:async';
import 'process.dart';

import 'state/state.dart';
import 'logic/types.dart';
import 'logic/logic.dart';
import 'protocol/protocol.dart';
import 'protocol/serialize.dart';
import 'actions/actions.dart';
import 'render/render.dart';
import 'logger.dart';
import 'error.dart';

final logger = createLogger('main');

class MainAppError extends AppError {
  MainAppError(cause) : super(cause);
}

void main() {
  // Set log level for the whole application:
  Logger.level = Level.warning;
  return runApp(MainApp());
}

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
          logger.e('attemptSend(): Invalid state');
          return appState;
        }

        final nextRequestsList =
            List<UserToServerAck>.from(nextRequests.asList());
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
  List<StreamSubscription> _streamSubs = [];

  MainAppState();

  Future<void> initProcess() async {
    _process = await openProcess();

    _eventController = StreamController<AppEvent>();

    // TODO: We use asBroadcastStream() to be able to read the first element.
    // There is possibly a cleaner way to do this.
    final fromProcess = _process.stdout
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .map((String data) {
      logger.d('Message from process:\n$data');
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
    _streamSubs.add(fromProcess.listen((serverToUserAck) {
      // TODO; `deserializeMsg` could raise an exception. How to handle it?
      _eventController.add(AppEvent.serverToUserAck(serverToUserAck));
    }, onError: (err) {
      throw MainAppError('fromProcess listen error: $err');
    }));

    _process.exitCode.then((exitCode) {
      logger.e('Process exited with code: $exitCode');
      // TODO: Is this a reasonable place to close the eventController?
      _eventController.close();
      throw MainAppError('Remote process closed!');
      // TODO: What to do in this case?
      // Ideas:
      // - Close the app?
      // - Show an error screen and then close the program?
    });

    _streamSubs.add(_process.stderr.transform(utf8.decoder).listen((data) {
      logger.e('stderr:\n$data');
    }, onError: (err) {
      throw MainAppError('stderr listen error: $err');
    }));

    // Handle shared files:
    final handleSharedFiles = (List<String> filePaths) {
      if (filePaths == null) {
        logger.w('handleSharedFiles(): Received null filePaths. Aborting');
        return;
      }
      if (filePaths.isEmpty) {
        logger.w('handleSharedFiles(): Received empty shared filePaths!');
        return;
      }
      if (filePaths.length > 1) {
        logger.w(
            'handleSharedFiles(): Received more than one file path! Aborting.');
        return;
      }
      // We received exactly one filePath:
      final filePath = filePaths[0];
      // Queue shared file event:
      _eventController.add(AppEvent.sharedFile(filePath));
    };

    // Listen to incoming shared files:
    // For sharing files coming from outside the app while the app is in the memory
    _streamSubs
        .add(ReceiveFileIntent.getFileStream().listen((List<String> filePaths) {
      handleSharedFiles(filePaths);
    }, onError: (err) {
      throw MainAppError('getIntentDataStreamError: $err');
    }));

    // For sharing files coming from outside the app while the app is closed
    ReceiveFileIntent.getInitialFile().then((List<String> filePaths) {
      handleSharedFiles(filePaths);
    });

    final sendUserToServerAck = (UserToServerAck userToServerAck) {
      final data = serializeMsg<UserToServerAck>(userToServerAck);
      logger.d('Sending to process:\n$data');
      _process.stdin.writeln(data);
    };

    // Secure random generator:
    final rand = Random.secure();

    // Begin handling events:
    _streamSubs.add(this._eventController.stream.listen((appEvent) {
      final newAppState1 = handleAppEvent(this._appState, appEvent, rand);
      final newAppState2 = attemptSend(newAppState1, sendUserToServerAck);
      setState(() => this._appState = newAppState2);
    }, onError: (err) {
      throw MainAppError('_eventController error: $err');
    }));

    // App is ready to start handling user's actions.
    setState(() => this._isReady = true);
  }

  /// Queue a user action
  void _queueAction(AppAction appAction) {
    _eventController.add(AppEvent.action(appAction));
  }

  @override
  void initState() {
    logger.d('initState() was called');
    super.initState();

    // Calling an async function. Should set `_isReady = true` when ready.
    initProcess();
  }

  @override
  void dispose() {
    // Cancel all stream subscriptions:
    for (final streamSub in _streamSubs) {
      streamSub.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return renderNotReady();
    } else {
      return render(_appState, _queueAction);
    }
  }
}
