import 'dart:io';
import 'dart:async';
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

const String STCOMPACT_FILENAME = 'stcompact';

Future<String> _getBinaryPath() async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  return path.join(dir, STCOMPACT_FILENAME);
}

Future<void> loadBinaries() async {
  // Obtain the binary file from assets:
  var bytes =
      await rootBundle.load("stcompact/$STCOMPACT_FILENAME");

  // Get the path we want the binary file to live in:
  final String binaryPath = await _getBinaryPath();

  // Write the binary file:
  await File(binaryPath).writeAsBytes(bytes.buffer.asUint8List());

  // Change the binary file to be executable:
  return Process.run('chmod', ['a+x', binaryPath]);
}

Future<Process> openProcess() async {
  return Process.start(await _getBinaryPath(), []);
}

