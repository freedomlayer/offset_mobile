import '../protocol/protocol.dart';

final knownRelays = <NamedRelayAddress>[
  NamedRelayAddress((b) => b
    ..name = "offset_relay0"
    ..address = NetAddress("relay0.offsetcredit.org:11051")
    ..publicKey = PublicKey("pgl9Jm109Q5d69EN4WjjVBbRmCLHJfgyR0pSoJflvzE")),
  NamedRelayAddress((b) => b
    ..name = "offset_relay1"
    ..address = NetAddress("relay1.offsetcredit.org:11156")
    ..publicKey = PublicKey("9F_0d1ZVeyYYS9tpVnkUtjtCePcH-_hRWdbduNL_X04")),
  NamedRelayAddress((b) => b
    ..name = "offset_relay2"
    ..address = NetAddress("relay2.offsetcredit.org:11056")
    ..publicKey = PublicKey("_5BaZ-NnRpyCimUc_erW_Tzv9xyUiz-Y2zWglJmFNxA")),
];
