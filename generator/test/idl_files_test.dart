library test_chrome_idl_files;

import 'dart:io';
import 'dart:mirrors';

import 'package:chrome_extension_generator/src/chrome_type.dart';
import 'package:chrome_extension_generator/src/idl_model.dart';
import 'package:chrome_extension_generator/src/idl_parser.dart';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';

void main() {
  group('ChromeIDLParser', () {
    bool idlFileExtTest(File file) => file.path.endsWith('.idl');
    var chromeIdlFileEntities = Directory('idl')
        .listSync(recursive: true, followLinks: false)
        .whereType<File>()
        .where(idlFileExtTest);

    // TODO: make async
    for (var file in chromeIdlFileEntities) {
      test(file.path, () {
        var webIdl = file.readAsStringSync();
        var chromeIDLParser = ChromeIDLParser();
        var namespace =
            chromeIDLParser.namespaceDeclaration.parse(webIdl).value;
        var context = Context();
        // /*ChromeLibrary chromeLibrary =*/ convert(context, namespace);
      });
    }
  });
}
