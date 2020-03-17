import 'dart:io';
import 'dart:async';
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart' show rootBundle;

import 'package:path_provider/path_provider.dart';

import 'error.dart';

const ASSETS_DIR = 'external';
const List<String> STCOMPACT_FILENAMES = [
  'stcompact_armv7',
  'stcompact_aarch64',
  'stcompact_i686'
];
const String STORE_DIR = 'store';

const String BIN_DIR = 'bin';
const String STCOMPACT = 'stcompact';
const String TEMP_STCOMPACT = 'temp_stcompact';

class ProcessError extends AppError {
  ProcessError(cause) : super(cause);
}

Future<void> _loadBinary(
    String appDir, String assetFile, String destFile) async {
  // Obtain the binary file from assets:
  var bytes = await rootBundle.load(path.join(ASSETS_DIR, assetFile));

  // Get the path we want the binary file to live in:
  final String binaryPath = path.join(appDir, BIN_DIR, destFile);

  // Write the binary file:
  await File(binaryPath).writeAsBytes(bytes.buffer.asUint8List());

  // Change the binary file to be executable:
  await Process.run('chmod', ['a+x', binaryPath]);
}

/// Check if the given binary can run on this platform
/// This is a hack, because currently we have no way of checking
/// what is the underlying host platform.
Future<bool> _canBinaryRun(String filePath) async {
  // We try to run the stcompact binary with no arguments.
  // We identify success by seeing a 'USAGE' message, as it means the binary can run on this platform:
  ProcessResult processResult;
  try {
    processResult = await Process.run(filePath, []);
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

// TODO: Change logic to be both fast enough, but also allowing updates.
Future<String> _selectBinary(String appDir, List<String> filenames) async {
  // Create the bin directory (In case it does not already exist):
  await Directory(path.join(appDir, BIN_DIR)).create();

  // Check if we have already chosen a binary path:
  final binaryPath = path.join(appDir, BIN_DIR, STCOMPACT);
  if (File(binaryPath).existsSync()) {
    await File(binaryPath).delete();
    // return binaryPath;
  }

  // Check if each of the binaries is runnable.
  // We pick the first runnable binary file:
  for (final assetFile in filenames) {
    await _loadBinary(appDir, assetFile, TEMP_STCOMPACT);
    final srcPath = path.join(appDir, BIN_DIR, TEMP_STCOMPACT);
    if (await _canBinaryRun(path.join(appDir, BIN_DIR, TEMP_STCOMPACT))) {
      // Move to stcompact:
      final destPath = path.join(appDir, BIN_DIR, STCOMPACT);
      await File(srcPath).rename(destPath);
      return destPath;
    } else {
      await File(srcPath).delete();
    }
  }
  throw ProcessError('No binary suitable for this platform');
}

Future<Process> openProcess() async {
  final String appDir = (await getApplicationDocumentsDirectory()).path;
  final binaryFilename = await _selectBinary(appDir, STCOMPACT_FILENAMES);
  return Process.start(
      binaryFilename, ['--store', path.join(appDir, STORE_DIR)],
      environment: {'RUST_LOG': 'error', 'RUST_BACKTRACE': '1'});
}
