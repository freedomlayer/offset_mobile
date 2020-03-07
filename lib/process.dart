import 'dart:io';
import 'dart:async';
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
// import 'package:flutter/material.dart';

import 'error.dart';

const String STCOMPACT = 'stcompact';
const String TEMP_STCOMPACT = 'temp_stcompact';

const List<String> STCOMPACT_FILENAMES = ['stcompact_armv7', 'stcompact_aarch64', 'stcompact_i686'];
const String STORE_DIR = 'store';

class ProcessError extends AppError {
  ProcessError(cause) : super(cause);
}

/// Path to stcompact's executable
Future<String> _getBinaryPath(String filename) async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  return path.join(dir, filename);
}

/// Path to stcompact's store
Future<String> _getStorePath() async {
  String dir = (await getApplicationDocumentsDirectory()).path;
  return path.join(dir, STORE_DIR);
}

Future<void> _loadBinary(String assetFile, String destFile) async {
  // Obtain the binary file from assets:
  var bytes =
      await rootBundle.load(path.join('external', assetFile));

  // Get the path we want the binary file to live in:
  final String binaryPath = await _getBinaryPath(destFile);

  // Write the binary file:
  await File(binaryPath).writeAsBytes(bytes.buffer.asUint8List());

  // Change the binary file to be executable:
  await Process.run('chmod', ['a+x', binaryPath]);
}

Future<void> _removeBinary(String filename) async {
  // Obtain the binary file from assets:
  String dir = (await getApplicationDocumentsDirectory()).path;
  final file = File(path.join(dir, filename));
  await file.delete();
}

/// Check if the given binary can run on this platform
/// This is a hack, because currently we have no way of checking
/// what is the underlying host platform.
Future<bool> _canBinaryRun(String filename) async {
  // We try to run the stcompact binary with no arguments.
  // We identify success by seeing a 'USAGE' message, as it means the binary can run on this platform:
  ProcessResult processResult;
  try {
    processResult = await Process.run(await _getBinaryPath(filename), []);
  } catch (e) {
    // debugPrint('_canBinaryRun: error caught: $e');
    return false;
  }

  if (processResult == null) {
    return false;
  }

  // debugPrint('_canBinaryRun: ${processResult.exitCode}');
  final stderr = processResult.stderr;
  if (stderr is String) {
    return stderr.contains('USAGE');
  } else {
    return false;
  }
}

Future<String> _selectBinary(List<String> filenames) async {
  // Check if we have already chosen a binary path:
  final binaryPath = await _getBinaryPath(STCOMPACT);
  if (File(binaryPath).existsSync()) {
    // debugPrint('_selectBinary: stcompact already exists');
    return binaryPath;
  }

  // debugPrint('_selectBinary: Selecting a suitable binary...');

  // Check if each of the binaries is runnable.
  // We pick the first runnable binary file:
  for (final assetFile in filenames) {
    await _loadBinary(assetFile, TEMP_STCOMPACT);
    // debugPrint('_selectBinary(): Trying $assetFile');
    if (await _canBinaryRun(TEMP_STCOMPACT)) {
      // Move to stcompact:
      final srcPath = await _getBinaryPath(TEMP_STCOMPACT);
      final destPath = await _getBinaryPath(STCOMPACT);
      await File(srcPath).rename(destPath);
      // debugPrint('_selectBinary: Chosen $assetFile');
      return destPath;
    } else {
      _removeBinary(TEMP_STCOMPACT);
    }
  }
  throw ProcessError('No binary suitable for this platform');
}


Future<Process> openProcess() async {
  final binaryFilename = await _selectBinary(STCOMPACT_FILENAMES);
  return Process.start(binaryFilename, ['--store', await _getStorePath()]);
}

