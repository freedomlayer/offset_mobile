import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import 'common.dart';
import 'compact.dart';

export 'common.dart';
export 'compact.dart';

part 'protocol.g.dart';

abstract class NodeInfoLocal
    implements Built<NodeInfoLocal, NodeInfoLocalBuilder> {
  static Serializer<NodeInfoLocal> get serializer => _$nodeInfoLocalSerializer;

  PublicKey get nodePublicKey;

  NodeInfoLocal._();
  factory NodeInfoLocal([void Function(NodeInfoLocalBuilder) updates]) =
      _$NodeInfoLocal;
}

abstract class NodeInfoRemote
    implements Built<NodeInfoRemote, NodeInfoRemoteBuilder> {
  static Serializer<NodeInfoRemote> get serializer =>
      _$nodeInfoRemoteSerializer;

  PublicKey get appPublicKey;
  PublicKey get nodePublicKey;
  NetAddress get nodeAddress;

  NodeInfoRemote._();
  factory NodeInfoRemote([void Function(NodeInfoRemoteBuilder) updates]) =
      _$NodeInfoRemote;
}

@BuiltUnion()
class NodeInfo extends _$NodeInfo {
  static Serializer<NodeInfo> get serializer => _$nodeInfoSerializer;

  NodeInfo.local(NodeInfoLocal nodeInfoLocal) : super.local(nodeInfoLocal);
  NodeInfo.remote(NodeInfoRemote nodeInfoRemote) : super.remote(nodeInfoRemote);
}

@BuiltUnion()
class NodeMode extends _$NodeMode {
  static Serializer<NodeMode> get serializer => _$nodeModeSerializer;

  NodeMode.open(NodeId nodeId) : super.open(nodeId);
  NodeMode.closed() : super.closed();
}

abstract class NodeStatus implements Built<NodeStatus, NodeStatusBuilder> {
  static Serializer<NodeStatus> get serializer => _$nodeStatusSerializer;

  NodeMode get mode;
  bool get isEnabled;
  NodeInfo get info;

  NodeStatus._();
  factory NodeStatus([void Function(NodeStatusBuilder) updates]) = _$NodeStatus;
}

abstract class CreateNodeLocal
    implements Built<CreateNodeLocal, CreateNodeLocalBuilder> {
  static Serializer<CreateNodeLocal> get serializer =>
      _$createNodeLocalSerializer;

  NodeName get nodeName;

  CreateNodeLocal._();
  factory CreateNodeLocal([void Function(CreateNodeLocalBuilder) updates]) =
      _$CreateNodeLocal;
}

abstract class CreateNodeRemote
    implements Built<CreateNodeRemote, CreateNodeRemoteBuilder> {
  static Serializer<CreateNodeRemote> get serializer =>
      _$createNodeRemoteSerializer;

  NodeName get nodeName;
  PrivateKey get appPrivateKey;
  PublicKey get nodePublicKey;
  NetAddress get nodeAddress;

  CreateNodeRemote._();
  factory CreateNodeRemote([void Function(CreateNodeRemoteBuilder) updates]) =
      _$CreateNodeRemote;
}

@BuiltUnion()
class ResponseOpenNode extends _$ResponseOpenNode {
  static Serializer<ResponseOpenNode> get serializer =>
      _$responseOpenNodeSerializer;

  ResponseOpenNode.success(NodeName nodeName, NodeId nodeId,
      AppPermissions appPermissions, CompactReport compactReport)
      : super.success(nodeName, nodeId, appPermissions, compactReport);
  ResponseOpenNode.failure(NodeName nodeName) : super.failure(nodeName);
}

@BuiltUnion()
class CreateNode extends _$CreateNode {
  static Serializer<CreateNode> get serializer => _$createNodeSerializer;

  CreateNode.createNodeLocal(CreateNodeLocal createNodeLocal)
      : super.createNodeLocal(createNodeLocal);
  CreateNode.createNodeRemote(CreateNodeRemote createNodeRemote)
      : super.createNodeRemote(createNodeRemote);
}

abstract class NodeOpened implements Built<NodeOpened, NodeOpenedBuilder> {
  static Serializer<NodeOpened> get serializer => _$nodeOpenedSerializer;

  NodeName get nodeName;
  NodeId get nodeId;
  AppPermissions get appPermissions;
  CompactReport get compactReport;

  NodeOpened._();
  factory NodeOpened([void Function(NodeOpenedBuilder) updates]) = _$NodeOpened;
}

@BuiltUnion()
class ServerToUser extends _$ServerToUser {
  static Serializer<ServerToUser> get serializer => _$serverToUserSerializer;

  ServerToUser.nodeOpened(NodeOpened nodeOpened) : super.nodeOpened(nodeOpened);
  ServerToUser.nodesStatus(BuiltMap<NodeName, NodeStatus> nodesStatus)
      : super.nodesStatus(nodesStatus);
  ServerToUser.node(NodeId nodeId, CompactToUser compactToUser)
      : super.node(nodeId, compactToUser);
}

@BuiltUnion()
class ServerToUserAck extends _$ServerToUserAck {
  static Serializer<ServerToUserAck> get serializer =>
      _$serverToUserAckSerializer;

  ServerToUserAck.serverToUser(ServerToUser serverToUser)
      : super.serverToUser(serverToUser);
  ServerToUserAck.ack(Uid uid) : super.ack(uid);
}

@BuiltUnion()
class UserToServer extends _$UserToServer {
  static Serializer<UserToServer> get serializer => _$userToServerSerializer;

  UserToServer.createNode(CreateNode createNode) : super.createNode(createNode);
  UserToServer.removeNode(NodeName nodeName) : super.removeNode(nodeName);

  UserToServer.enableNode(NodeName nodeName) : super.enableNode(nodeName);
  UserToServer.disableNode(NodeName nodeName) : super.disableNode(nodeName);
  UserToServer.node(NodeId nodeId, UserToCompact userToCompact)
      : super.node(nodeId, userToCompact);
}

abstract class UserToServerAck
    implements Built<UserToServerAck, UserToServerAckBuilder> {
  static Serializer<UserToServerAck> get serializer =>
      _$userToServerAckSerializer;

  Uid get requestId;
  UserToServer get inner;

  UserToServerAck._();
  factory UserToServerAck([void Function(UserToServerAckBuilder) updates]) =
      _$UserToServerAck;
}
