import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:chrome_extension_generator/apis.dart';
import 'package:chrome_extension_generator/src/chrome_model.dart';
import 'package:chrome_extension_generator/src/code_generator.dart';
import 'package:chrome_extension_generator/src/json_convert.dart';
import 'package:chrome_extension_generator/src/json_model.dart' as json;
import 'package:chrome_extension_generator/src/idl_convert.dart' as idl;
import 'package:chrome_extension_generator/src/utils/string.dart';

final idlPath = 'idl';
final targetPath = '../chrome_extension/lib';

void main() {
  var groups = <String, List<ChromeApi>>{};
  var apis = <ChromeApi>[];
  for (var apiName in extensionApis) {
    var api = generateApi(apiName);
    if (api.group case var group?) {
      (groups[group] ??= []).add(api);
    }
    apis.add(api);
  }
  for (var group in groups.entries) {
    File(p.join(targetPath, '${group.key.snakeCase}.dart'))
        .writeAsStringSync(generateDartGroupCode(group.key, group.value));
  }
  File(p.join(targetPath, 'chrome.dart'))
      .writeAsStringSync(generateChromeCode(apis, groups.keys.toList()));
}

ChromeApi generateApi(String apiName) {
  var idlFile = _locateDefinitionFile(apiName);
  var content = idlFile.readAsStringSync();

  ChromeApi model;
  if (idlFile.path.endsWith('.json')) {
    model = JsonModelConverter(json.JsonNamespace.parse(content)).convert();
  } else {
    model = idl.IdlModelConverter.fromString(content).convert();
  }

  File(p.join(targetPath, 'src', 'js', model.fileName))
      .writeAsStringSync(JsBindingGenerator(model).toCode());
  File(p.join(targetPath, model.fileName))
      .writeAsStringSync(DartApiGenerator(model).toCode());

  if (model.group case var group?) {
    File(p.join(targetPath, 'src', 'js', '${group.snakeCase}.dart'))
        .writeAsStringSync(generateJSGroupCode(group));
  }
  return model;
}

File _locateDefinitionFile(String apiName) {
  var fileName = apiName.snakeCase;
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
