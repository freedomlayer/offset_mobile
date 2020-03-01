import 'dart:developer' as developer;

import 'package:built_collection/built_collection.dart';

import '../protocol/protocol.dart';
import '../state/state.dart';

import 'adjust_view.dart';

AppState handleServerToUserAck(
    AppState appState, ServerToUserAck serverToUserAck) {
  final appState1 = serverToUserAck.match(
      serverToUser: (serverToUser) =>
          handleServerToUser(appState, serverToUser),
      ack: (requestId) => handleAck(appState, requestId));

  // We only adjust view if the view is not currently during transition:
  final viewState = appState1.viewState.match(
      view: (appView) =>
          ViewState.view(adjustAppView(appView, appState.nodesStates)),
      transition: (_oldView, _newView, _nextRequests, _optPendingRequest) =>
          appState1.viewState);

  return appState1.rebuild((b) => b..viewState = viewState);
}

AppState handleServerToUser(AppState appState, ServerToUser serverToUser) {
  return serverToUser.match(
      nodeOpened: (nodeOpened) => handleNodeOpened(appState, nodeOpened),
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

AppState handleNodeOpened(AppState appState, NodeOpened nodeOpened) {
  final nodeState = appState.nodesStates[nodeOpened.nodeName];
  if (nodeState == null) {
    developer.log('Node ${nodeOpened.nodeName} does not exist!');
    return appState;
  }

  final nodeOpen = NodeOpen((b) => b
    ..nodeId = nodeOpened.nodeId
    ..appPermissions = nodeOpened.appPermissions.toBuilder()
    ..compactReport = nodeOpened.compactReport.toBuilder());

  final newNodeState =
      nodeState.rebuild((b) => b..inner = NodeStateInner.open(nodeOpen));
  return appState
      .rebuild((b) => b..nodesStates[nodeOpened.nodeName] = newNodeState);
}

AppState handleNodesStatus(
    AppState appState, BuiltMap<NodeName, NodeStatus> nodesStatus) {
  final Map<NodeName, NodeState> newMap = {};
  nodesStatus.forEach((nodeName, nodeStatus) {
    final oldNodeState = appState.nodesStates[nodeName];
    NodeState newNodeState;

    if (oldNodeState == null) {
      // Node did not exist before:
      final newInner = nodeStatus.mode.match(
        open: (nodeId) {
          developer.log(
              "Node $nodeName is online but we never received a NodeOpened message!");
          return NodeStateInner.closed();
        },
        closed: () => NodeStateInner.closed(),
      );

      // Node did not exist before.
      // We are going to create a new node:
      newNodeState = NodeState((b) => b
        ..info = nodeStatus.info
        ..inner = newInner);
    } else {
      // Node existed before.
      // We copy the given info, and adjust the activeness status:
      final newInner = nodeStatus.mode.match(
        open: (nodeId) {
          oldNodeState.inner.match(
              open: (nodeOpen) => oldNodeState.inner,
              closed: () {
                developer.log(
                    "Node $nodeName is online but we never received a NodeOpened message!");
                return NodeStateInner.closed();
              });
        },
        closed: () => NodeStateInner.closed(),
      );

      newNodeState = oldNodeState.rebuild((b) => b
        ..info = nodeStatus.info
        ..inner = newInner);
    }
    newMap[nodeName] = newNodeState;
  });

  final newNodesStates = BuiltMap<NodeName, NodeState>(newMap);
  return appState.rebuild((b) => b..nodesStates = newNodesStates.toBuilder());
}

/*
/// Find a value `k` such that `predicate(k,map[k])`
K searchMap<K, V>(Map<K, V> map, bool Function(K, V) predicate) {
  for (final entry in map.entries) {
    if (predicate(entry.key, entry.value)) {
      return entry.key;
    }
  }
  return null;
}
*/

AppState handleNode(
    AppState appState, NodeId nodeId, CompactToUser compactToUser) {
  return compactToUser.match(
    paymentFees: (paymentFees) =>
        _handleNodePaymentFees(appState, nodeId, paymentFees),
    paymentCommit: (paymentCommit) =>
        _handleNodePaymentCommit(appState, nodeId, paymentCommit),
    paymentDone: (paymentDone) =>
        _handleNodePaymentDone(appState, nodeId, paymentDone),
    report: (report) => handleReport(appState, nodeId, report),
    responseVerifyCommit: (responseVerifyCommit) =>
        _handleNodeResponseVerifyCommit(appState, nodeId, responseVerifyCommit),
  );
}

/// Handle incoming CompactReport
AppState handleReport(
    AppState appState, NodeId nodeId, CompactReport compactReport) {
  AppState newAppState = appState;
  int numFound = 0;

  appState.nodesStates.forEach((nodeName, nodeState) {
    numFound += nodeState.inner.match(
      closed: () => 0,
      open: (nodeOpen) {
      // open: (nodeName, curNodeId, appPermissions, compactReport) {
        if (nodeId != nodeOpen.nodeId) {
          return 0;
        }

        final newNodeOpen = NodeOpen((b) => b..nodeId = nodeOpen.nodeId
                                             ..appPermissions = nodeOpen.appPermissions.toBuilder()
                                             ..compactReport = compactReport.toBuilder());

        final newNodesStates = appState.nodesStates.rebuild((b) => b[nodeName] =
            b[nodeName].rebuild((b) => b
              ..inner = NodeStateInner.open(newNodeOpen)));

        newAppState = newAppState
            .rebuild((b) => b..nodesStates = newNodesStates.toBuilder());

        return 1;
      },
    );
  });

  if (numFound == 0) {
    developer.log('Node with nodeId = $nodeId was not found!');
  } else if (numFound > 1) {
    developer.log('Node with nodeId = $nodeId was found $numFound times!');
  }

  return newAppState;
}

AppState _handleNodePaymentFees(
    AppState appState, NodeId nodeId, PaymentFees paymentFees) {
  // We currently do nothing here
  return appState;
}

AppState _handleNodePaymentCommit(
    AppState appState, NodeId nodeId, PaymentCommit paymentCommit) {
  // We currently do nothing here
  return appState;
}

AppState _handleNodePaymentDone(
    AppState appState, NodeId nodeId, PaymentDone paymentDone) {
  // We currently do nothing here
  return appState;
}

AppState _handleNodeResponseVerifyCommit(AppState appState, NodeId nodeId,
    ResponseVerifyCommit responseVerifyCommit) {
  // We currently do nothing here
  return appState;
}
