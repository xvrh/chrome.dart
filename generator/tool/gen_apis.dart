import 'dart:io';
import 'package:chrome_extension_generator/apis.dart';
import 'package:chrome_extension_generator/src/chrome_model.dart';
import 'package:chrome_extension_generator/src/code_generator.dart';
import 'package:chrome_extension_generator/src/idl_convert.dart' as idl;
import 'package:chrome_extension_generator/src/json_convert.dart';
import 'package:chrome_extension_generator/src/json_model.dart' as json;
import 'package:chrome_extension_generator/src/utils/string.dart';
import 'package:path/path.dart' as p;
import 'code_style/fix_import_order.dart';

final idlPath = 'idl';
final targetPath = '../chrome_apis/lib';

void main() {
  var groups = <String, List<ChromeApi>>{};
  var context = Context();
  for (var apiName in extensionApis) {
    var api = _createApi(context, apiName);
    if (api.group case var group?) {
      (groups[group] ??= []).add(api);
    }
    context.apis.add(api);
  }
  context.resolveLazyTypes();

  for (var api in context.apis) {
    _generateCode(api);
  }

  for (var group in groups.entries) {
    _writeFile(p.join(targetPath, '${group.key.snakeCase}.dart'),
        generateDartGroupCode(group.key, group.value));
  }
  _writeFile(p.join(targetPath, 'chrome.dart'),
      generateChromeCode(context.apis, groups.keys.toList()));
}

ChromeApi _createApi(Context context, String apiName) {
  var idlFile = _locateDefinitionFile(apiName);
  var content = idlFile.readAsStringSync();

  ChromeApi model;
  if (idlFile.path.endsWith('.json')) {
    model = JsonModelConverter(context, json.JsonNamespace.parse(content))
        .convert();
  } else {
    model = idl.IdlModelConverter.fromString(context, content).convert();
  }

  return model;
}

void _generateCode(ChromeApi model) {
  _writeFile(p.join(targetPath, 'src', 'js', model.fileName),
      JsBindingGenerator(model).toCode());
  _writeFile(
      p.join(targetPath, model.fileName), DartApiGenerator(model).toCode());

  if (model.group case var group?) {
    _writeFile(p.join(targetPath, 'src', 'js', '${group.snakeCase}.dart'),
        generateJSGroupCode(group));
  }
}

void _writeFile(String path, String code) {
  code = reorderImports(code);
  File(path).writeAsStringSync(code);
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
