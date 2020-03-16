import 'dart:convert';
import 'dart:math';
import 'protocol/protocol.dart';

const int UID_LEN = 16;
const int PAYMENT_ID_LEN = 16;
const int INVOICE_ID_LEN = 32;

// final Random _random = Random.secure();

/// Return `length` random bytes, encoded in base64
String _randBytesB64(Random rand, int length) {
  final values = List<int>.generate(length, (i) => rand.nextInt(0x100));
  final encoded = base64Url.encode(values);
  // We remove trailing '=' because stcompact does the same.
  return encoded.replaceAll('=', '');
}

/// Generate a random Uid
Uid genUid(Random rand) {
  return Uid(_randBytesB64(rand, UID_LEN));
}

/// Generate a random PaymentId
PaymentId genPaymentId(Random rand) {
  return PaymentId(_randBytesB64(rand, PAYMENT_ID_LEN));
}

/// Generate a random InvoiceId
InvoiceId genInvoiceId(Random rand) {
  return InvoiceId(_randBytesB64(rand, INVOICE_ID_LEN));
}
