import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// import 'package:built_union/built_union.dart';
// import 'package:meta/meta.dart';

import 'common.dart';
import 'compact.dart';

part 'file.g.dart';

abstract class InvoiceFile implements Built<InvoiceFile, InvoiceFileBuilder> {
  static Serializer<InvoiceFile> get serializer => _$invoiceFileSerializer;

  InvoiceId get invoiceId;
  Currency get currency;
  PublicKey get destPublicKey;
  U128 get destPayment;
  String get description;

  InvoiceFile._();
  factory InvoiceFile([void Function(InvoiceFileBuilder) updates]) = _$InvoiceFile;
}


abstract class FriendFile implements Built<FriendFile, FriendFileBuilder> {
  static Serializer<FriendFile> get serializer => _$friendFileSerializer;

  PublicKey get friendPublicKey;
  BuiltList<RelayAddress> get relays;
  String get name;

  FriendFile._();
  factory FriendFile([void Function(FriendFileBuilder) updates]) = _$FriendFile;
}


abstract class RemoteCardFile implements Built<RemoteCardFile, RemoteCardFileBuilder> {
  static Serializer<RemoteCardFile> get serializer => _$remoteCardFileSerializer;

  PublicKey get nodePublicKey;
  NetAddress get nodeAddress;
  PrivateKey get appPrivateKey;

  RemoteCardFile._();
  factory RemoteCardFile([void Function(RemoteCardFileBuilder) updates]) = _$RemoteCardFile;
}

