import 'package:test/test.dart';

import 'package:path/path.dart' as path;


void main() {
  group('path tests', () {
    test('path extension test', () {
      expect(path.extension('/a/b/c/d.txt'), '.txt');
      expect(path.extension('/a/b/c/d'), '');
    });
  });
}
