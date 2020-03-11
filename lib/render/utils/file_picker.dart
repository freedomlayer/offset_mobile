import 'dart:io';
import 'package:flutter/services.dart';

import 'package:file_picker/file_picker.dart';



import '../../protocol/serialize.dart';
import '../../error.dart';


class FilePickerError extends AppError {
  FilePickerError(cause): super(cause);
}

Future<T> pickFromFile<T>(String fileExtension) async {
    // Choosing FileType.CUSTOM doesn't seem to work with our custom extension,
    // so we use FileType.ANY instead.
    String filePath;
    try {
      filePath = await FilePicker.getFilePath(
          type: FileType.ANY, fileExtension: fileExtension);
    } on PlatformException catch (e) {
      throw FilePickerError('Platform exception: $e');
    }

    if (filePath == null) {
      throw FilePickerError('User did not pick a file');
    }

    // Read file contents:
    String data;
    try {
      data = File(filePath).readAsStringSync();
    } on FileSystemException catch (e) {
      throw FilePickerError('Could not read file as string: $e');
    }

    T message;

    try {
      message = deserializeMsg<T>(data);
    } on SerializeError {
      throw FilePickerError('Failed to deserialize data: $data');
    }

    // Load the remote card file:
    return message;
}

