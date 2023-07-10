import 'dart:io';
import 'package:path/path.dart' as p;

import '../apis.dart';
import 'chrome_model.dart';
import 'code_generator.dart';
import 'json_convert.dart';
import 'json_model.dart' as json;
import 'idl_convert.dart' as idl;

final idlPath = 'idl';

void main() {
  for (var api in extensionApis) {
    generateApi(api);
  }
}

void generateApi(String apiName) {
  var fileName = _apiNameToFileName(apiName);
  var idlFile = _locateDefinitionFile(fileName);
  var content = idlFile.readAsStringSync();

  ChromeApi model;
  if (idlFile.path.endsWith('.json')) {
    model = JsonModelConverter(json.JsonNamespace.parse(content)).convert();
  } else {
    model = idl.loadIdlModel(content);
  }

  var output = CodeGenerator(model);
  File(p.join('lib', 'js', '$fileName.dart'))
      .writeAsStringSync(output.jsBinding());
  File(p.join('lib', '$fileName.dart'))
      .writeAsStringSync(output.highLevelApi());
}

String _apiNameToFileName(String name) {
  name = name.replaceAll('.', '_');
  name = name.replaceAllMapped(
      RegExp(r"[A-Z]"), (Match m) => "_${m.group(0)!.toLowerCase()}");
  return name;
}

File _locateDefinitionFile(String fileName) {
  fileName = fileName.replaceFirst("devtools_", "devtools/");

  var possiblePaths = [
    'chrome/$fileName.json',
    'chrome/$fileName.idl',
    'extensions/$fileName.json',
    'extensions/$fileName.idl',
  ];

  for (var path in possiblePaths) {
    var file = File(p.join(idlPath, path));
    if (file.existsSync()) return file;
  }

  throw Exception('No IDL file found for library $fileName');
}
