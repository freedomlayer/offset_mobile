import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import '../protocol/protocol.dart';
import '../protocol/common.dart';
import '../protocol/compact.dart';
import 'views/views.dart';

export 'views/views.dart';

part 'state.g.dart';


@BuiltUnion()
class NodeStateInner extends _$NodeStateInner {
  static Serializer<NodeStateInner> get serializer =>
      _$nodeStateInnerSerializer;

  NodeStateInner.closed() : super.closed();

  /// Already open, but we still don't have all the information.
  NodeStateInner.preOpen() : super.preOpen();
  NodeStateInner.open(NodeName nodeName, NodeId nodeId,
      AppPermissions appPermissions, CompactReport compactReport)
      : super.open(nodeName, nodeId, appPermissions, compactReport);
}

abstract class NodeState implements Built<NodeState, NodeStateBuilder> {
  static Serializer<NodeState> get serializer => _$nodeStateSerializer;

  NodeInfo get info;
  NodeStateInner get inner;

  NodeState._();
  factory NodeState([void Function(NodeStateBuilder) updates]) = _$NodeState;
}

@BuiltUnion()
class ViewState extends _$ViewState {
  static Serializer<ViewState> get serializer => _$viewStateSerializer;

  ViewState.view(AppView view) : super.view(view);
  ViewState.transition(
      AppView oldView, AppView newView, BuiltList<UserToServerAck> nextRequests, Uid pendingRequest)
      : super.transition(oldView, newView, nextRequests, pendingRequest);
}

/// Complete app's state. This structure should be enough to draw the application
/// at any moment.
abstract class AppState implements Built<AppState, AppStateBuilder> {
  static Serializer<AppState> get serializer => _$appStateSerializer;

  ViewState get viewState;
  BuiltMap<NodeName, NodeState> get nodesStates;

  AppState._();
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;
}
