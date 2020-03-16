import 'package:qr_flutter/qr_flutter.dart';
import '../../protocol/serialize.dart';

qrShow<T>(T msg) {
  final data = serializeMsg<T>(msg);
  return QrImage(
    data: data,
    version: QrVersions.auto,
  );
}
