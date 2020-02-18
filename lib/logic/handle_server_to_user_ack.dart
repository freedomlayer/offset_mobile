import 'dart:developer' as developer;

import 'package:built_collection/built_collection.dart';

import '../actions/actions.dart';
import '../protocol/protocol.dart';
import '../state/state.dart';

import 'types.dart';
import 'handle_shared_file.dart';
import 'handle_action.dart';

AppState handleServerToUserAck(
    AppState appState, ServerToUserAck serverToUserAck) {
  return serverToUserAck.match(
      serverToUser: (serverToUser) =>
          handleServerToUser(appState, serverToUser),
      ack: (requestId) => handleAck(appState, requestId));
}

AppState handleServerToUser(AppState appState, ServerToUser serverToUser) {
  return serverToUser.match(
      responseOpenNode: (responseOpenNode) =>
          handleResponseOpenNode(appState, responseOpenNode),
      nodesStatus: (nodesStatus) => handleNodesStatus(appState, nodesStatus),
      node: (nodeId, compactToUser) =>
          handleNode(appState, nodeId, compactToUser));
}

AppState handleAck(AppState appState, Uid requestId) {
  return appState.viewState.match(
      view: (_appView) => appState,
      transition: (oldView, newView, nextRequests, optPendingRequest) {
        if (optPendingRequest == OptPendingRequest.some(requestId)) {
          // The received ack exactly belongs to the request we are waiting for

          final nextRequestsList = nextRequests.asList();
          if (nextRequestsList.isEmpty) {
            // This is the last ack we were waiting for:
            final newAppState =
                appState.rebuild((b) => b..viewState = ViewState.view(newView));
            return newAppState;
          } else {
            // We need to wait for more acks:
            return appState.rebuild((b) => b
              ..viewState = ViewState.transition(
                  oldView, newView, nextRequests, OptPendingRequest.none()));
          }
        } else {
          // The received ack does not match the request we are waiting for
          return appState;
        }
      });
}

AppState handleResponseOpenNode(
    AppState appState, ResponseOpenNode responseOpenNode) {
  return responseOpenNode.match(
      success: (nodeName, nodeId, appPermissions, compactReport) {
    final nodeState = appState.nodesStates[nodeName];
    if (nodeState == null) {
      developer.log('Node $nodeName does not exist!');
      return appState;
    }
    return nodeState.inner.match(
      closed: () {
        developer.log('Node $nodeName is closed!');
        return appState;
      },
      preOpen: () {
        final newNodeState = nodeState.rebuild((b) => b
          ..inner = NodeStateInner.open(
              nodeName, nodeId, appPermissions, compactReport));
        return appState.rebuild((b) => b..nodesStates[nodeName] = newNodeState);
      },
      open: (_, _a, _b, _c) {
        developer.log('Node $nodeName is already open!');
        return appState;
      },
    );
  }, failure: (nodeName) {
    return appState;
  });
}

AppState handleNodesStatus(
    AppState appState, BuiltMap<NodeName, NodeStatus> nodesStatus) {
  final Map<NodeName, NodeState> newMap = {};
  nodesStatus.forEach((nodeName, nodeStatus) {
    final oldNodeState = appState.nodesStates[nodeName];
    NodeState newNodeState;
    if (oldNodeState == null) {
      // Node did not exist before.
      // We are going to create a new node:
      newNodeState = NodeState((b) => b
        ..info = nodeStatus.info
        ..inner = nodeStatus.isOpen
            ? NodeStateInner.preOpen()
            : NodeStateInner.closed());
    } else {
      // Node existed before.
      // We copy the given info, and adjust the activeness status:
      NodeStateInner newInner;
      if (!nodeStatus.isOpen) {
        newInner = NodeStateInner.closed();
      } else {
        // isOpen == true:
        if (oldNodeState.inner.isClosed) {
          newInner = NodeStateInner.preOpen();
        } else {
          newInner = oldNodeState.inner;
        }
      }
      newNodeState = oldNodeState.rebuild((b) => b
        ..info = nodeStatus.info
        ..inner = newInner);
    }
    newMap[nodeName] = newNodeState;
  });

  // TODO: Somehow adjust views when a node is removed or becomes closed?
  // We will sometimes need to go back etc.
  throw UnimplementedError();

  final newNodesStates = BuiltMap<NodeName, NodeState>(newMap);
  return appState.rebuild((b) => b..nodesStates = newNodesStates.toBuilder());
}

K keyForValue<K, V>(Map<K, V> map, V value) {
  for (final entry in map.entries) {
    if (entry.value == value) {
      return entry.key;
    }
  }
  return null;
}

AppState handleNode(
    AppState appState, NodeId nodeId, CompactToUser compactToUser) {
  return compactToUser.match(
    paymentFees: (paymentFees) {
      throw UnimplementedError();
    },
    paymentCommit: (paymentCommit) {
      throw UnimplementedError();
    },
    paymentDone: (paymentDone) {
      throw UnimplementedError();
    },
    report: (report) {
      throw UnimplementedError();
    },
    responseVerifyCommit: (responseVerifyCommit) {
      throw UnimplementedError();
    },
  );
}
