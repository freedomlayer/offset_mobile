import 'package:flutter/services.dart';

import 'package:barcode_scan/barcode_scan.dart';

import '../../protocol/serialize.dart';
import '../../error.dart';

class QrScanError extends AppError {
  QrScanError(cause) : super(cause);
}

Future<T> qrScan<T>() async {
  String data;
  try {
    data = await BarcodeScanner.scan();
  } on PlatformException catch (e) {
    if (e.code == BarcodeScanner.CameraAccessDenied) {
      throw QrScanError('Camera access denied: $e');
    } else {
      throw QrScanError('Unknown PlatformException error: $e');
    }
  } on FormatException {
    throw QrScanError('User canceled scan');
  } catch (e) {
    throw QrScanError('Unknown error: $e');
  }

  T message;

  try {
    message = deserializeMsg<T>(data);
  } on SerializeError {
    throw QrScanError('Failed to deserialize data: $data');
  }
  return message;
}
