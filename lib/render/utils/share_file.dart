import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

import '../../protocol/serialize.dart';

import 'package:path/path.dart' as path;

const String SHARE_DIR = 'share';

// TODO: Is there any issue if this function is called twice
// with the same shareFilename? Possibly randomize filename or directory name
// to avoid issues?

/// Share a file with another application
Future<void> shareFile<T>(T msg, String shareFilename) async {
  // Get app's directory:
  // Directory appDir = await getApplicationDocumentsDirectory();
  Directory tempDir = await getTemporaryDirectory();

  // Make sure SHARE_DIR directory exists:
  final shareDirPath = path.join(tempDir.path, SHARE_DIR);
  await Directory(shareDirPath).create();

  // Serialize message into a string:
  final data = serializeMsg<T>(msg);

  // Write to file:
  final shareFilePath = path.join(shareDirPath, shareFilename);
  File shareFile = File(shareFilePath);
  shareFile.writeAsStringSync(data);

  // Share (local) file:
  ShareExtend.share(shareFile.path, "file");
}
