import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_union/built_union.dart';
import 'package:meta/meta.dart';

import 'common.dart';

part 'protocol.g.dart';

abstract class NodeInfoLocal implements Built<NodeInfoLocal, NodeInfoLocalBuilder> {
  static Serializer<NodeInfoLocal> get serializer => _$nodeInfoLocalSerializer;

  PublicKey get publicKey;

  NodeInfoLocal._();
  factory NodeInfoLocal([void Function(NodeInfoLocalBuilder) updates]) = _$NodeInfoLocal;
}

abstract class NodeInfoRemote implements Built<NodeInfoRemote, NodeInfoRemoteBuilder> {
  static Serializer<NodeInfoRemote> get serializer => _$nodeInfoRemoteSerializer;

  PublicKey get appPublicKey;
  PublicKey get nodePublicKey;
  NetAddress get nodeAddress;

  NodeInfoRemote._();
  factory NodeInfoRemote([void Function(NodeInfoRemoteBuilder) updates]) = _$NodeInfoRemote;
}

@BuiltUnion()
class NodeInfo extends _$NodeInfo {
  static Serializer<NodeInfo> get serializer => _$nodeInfoSerializer;

  NodeInfo.local(NodeInfoLocal nodeInfoLocal) : super.local(nodeInfoLocal);
  NodeInfo.remote(NodeInfoRemote nodeInfoRemote) : super.remote(nodeInfoRemote);
}

abstract class NodeStatus implements Built<NodeStatus, NodeStatusBuilder> {
  static Serializer<NodeStatus> get serializer => _$nodeStatusSerializer;

  bool get isOpen;
  NodeInfo get info;

  NodeStatus._();
  factory NodeStatus([void Function(NodeStatusBuilder) updates]) = _$NodeStatus;
}

abstract class CreateNodeLocal implements Built<CreateNodeLocal, CreateNodeLocalBuilder> {
  static Serializer<CreateNodeLocal> get serializer => _$createNodeLocalSerializer;

  NodeName get nodeName;

  CreateNodeLocal._();
  factory CreateNodeLocal([void Function(CreateNodeLocalBuilder) updates]) = _$CreateNodeLocal;
}
/*

#[derive(Arbitrary, Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
pub struct CreateNodeRemote {
    pub node_name: NodeName,
    #[serde(with = "ser_b64")]
    pub app_private_key: PrivateKey,
    #[serde(with = "ser_b64")]
    pub node_public_key: PublicKey,
    pub node_address: NetAddress,
}

#[allow(clippy::large_enum_variant)]
#[derive(Arbitrary, Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
pub enum ResponseOpenNode {
    Success(NodeName, NodeId, AppPermissions, CompactReport), // (node_name, node_id, compact_report)
    Failure(NodeName),
}

pub type NodesStatus = HashMap<NodeName, NodeStatus>;

#[derive(Arbitrary, Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
pub enum CreateNode {
    CreateNodeLocal(CreateNodeLocal),
    CreateNodeRemote(CreateNodeRemote),
}

#[allow(clippy::large_enum_variant)]
#[derive(Arbitrary, Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
pub enum ServerToUser {
    ResponseOpenNode(ResponseOpenNode),
    // TODO: Should add a serde hint here?
    /// A map of all nodes and their current status
    NodesStatus(NodesStatus),
    /// A message received from a specific node
    Node(NodeId, CompactToUser), // (node_id, compact_to_user)
}

#[allow(clippy::large_enum_variant)]
#[derive(Arbitrary, Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
pub enum ServerToUserAck {
    ServerToUser(ServerToUser),
    #[serde(with = "ser_b64")]
    Ack(Uid),
}

#[allow(clippy::large_enum_variant)]
#[derive(Arbitrary, Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
pub enum UserToServer {
    CreateNode(CreateNode),
    RemoveNode(NodeName),
    RequestOpenNode(NodeName),
    CloseNode(NodeId), // node_id
    /// A message sent to a specific node
    Node(NodeId, UserToCompact), // (node_id, user_to_compact)
}

#[derive(Arbitrary, Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
pub struct UserToServerAck {
    #[serde(with = "ser_b64")]
    pub request_id: Uid,
    pub inner: UserToServer,
}
*/


// -----------------------------------------------------------------------
// -----------------------------------------------------------------------

/// Collect all the serializers required for the protocol
/// with stcompact
Serializers collectSerializers() {
  final serBuilder = Serializers().toBuilder();

  // Serializers for common types:
  for (final commonSer in commonSerializers) {
    serBuilder.add(commonSer);
  }

  // Serializers for compound protocol messages:
  serBuilder.add(NodeInfoLocal.serializer);

  return serBuilder.build();
}

final serializers = collectSerializers();
