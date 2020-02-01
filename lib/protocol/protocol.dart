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


@BuiltUnion()
class SimpleUnion extends _$SimpleUnion {
  static Serializer<SimpleUnion> get serializer => _$simpleUnionSerializer;

  SimpleUnion.empty() : super.empty();
  SimpleUnion.integer(int integer) : super.integer(integer);
  SimpleUnion.tuple(int tupleInt, String tupleString)
      : super.tuple(tupleInt, tupleString);
  SimpleUnion.string(String string) : super.string(string);
  SimpleUnion.builtList(BuiltList<int> builtList) : super.builtList(builtList);
}

/*
#[derive(Arbitrary, Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
pub struct NodeInfoLocal {
    #[serde(with = "ser_b64")]
    pub node_public_key: PublicKey,
}

#[derive(Arbitrary, Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
pub struct NodeInfoRemote {
    #[serde(with = "ser_b64")]
    pub app_public_key: PublicKey,
    #[serde(with = "ser_b64")]
    pub node_public_key: PublicKey,
    pub node_address: NetAddress,
}

#[derive(Arbitrary, Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
pub enum NodeInfo {
    Local(NodeInfoLocal),
    Remote(NodeInfoRemote),
}

#[derive(Arbitrary, Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
pub struct NodeStatus {
    pub is_open: bool,
    pub info: NodeInfo,
}

#[derive(Arbitrary, Clone, Debug, Serialize, Deserialize, PartialEq, Eq)]
pub struct CreateNodeLocal {
    pub node_name: NodeName,
}

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
