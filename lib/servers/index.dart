import '../protocol/protocol.dart';

final knownIndexServers = <NamedIndexServerAddress>[
  NamedIndexServerAddress((b) => b
    ..name = "offset_index0"
    ..address = NetAddress("index0.offsetcredit.org:11199")
    ..publicKey = PublicKey("x_tFd7JAY1h5mx1072pZFFGauifu9ZiUCpsYRX1tv9s")),
  NamedIndexServerAddress((b) => b
    ..name = "offset_index1"
    ..address = NetAddress("index1.offsetcredit.org:11331")
    ..publicKey = PublicKey("rGGIKuwv7ewnOQ_s3gL36IqQK_vu-qweRj24074yPEI")),
  NamedIndexServerAddress((b) => b
    ..name = "offset_index2"
    ..address = NetAddress("index2.offsetcredit.org:11385")
    ..publicKey = PublicKey("EXuvtumXU8gmLM40LQAYcAxnH5aFHeU_CSN_SH8Q4mI")),
];

