import 'dart:convert';
import 'dart:math';
import 'protocol/protocol.dart';

const int UID_LEN = 16;
const int PAYMENT_ID_LEN = 16;

// final Random _random = Random.secure();

/// Return `length` random bytes, encoded in base64
String _randBytesB64(Random rand, int length) {
  final values = List<int>.generate(length, (i) => rand.nextInt(0x100));
  return base64Url.encode(values);
}


/// Generate a random Uid
Uid genUid(Random rand) {
  return Uid(_randBytesB64(rand, UID_LEN));
}

/// Generate a random PaymentId
PaymentId genPaymentId(Random rand) {
  return PaymentId(_randBytesB64(rand, PAYMENT_ID_LEN));
}


