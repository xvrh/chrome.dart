/**
 * A library to query the declaritive overrides for Chrome API generation. See
 * the `meta/overrides.json` file.
 */
library overrides;

import 'dart:convert';
import 'dart:io';

class Overrides {
  late Map<String, String> renameNamespaceMap;

  late List<String> suppressClassList;
  late Map<String, String> renameClassMap;

  late List<String> overrideClasses;

  Overrides() {
    _init({});
  }

  Overrides.fromFile(File file) {
    _init(json.decode(file.readAsStringSync()) as Map<String, dynamic>);
  }

  void _init(Map<String, dynamic> m) {
    renameNamespaceMap =
        (m['renameNamespace'] as Map?)?.cast<String, String>() ?? {};

    suppressClassList = (m['suppressClass'] as List?)?.cast<String>() ?? [];

    renameClassMap = (m['renameClass'] as Map?)?.cast<String, String>() ?? {};

    overrideClasses = (m['overrideClass'] as List?)?.cast<String>() ?? [];
  }

  String? namespaceRename(String name) {
    return renameNamespaceMap[name];
  }

  bool suppressClass(String libraryName, String name) {
    String qualifiedName = '${libraryName}.${name}';
    return suppressClassList.contains(qualifiedName);
  }

  String className(String libraryName, String name) {
    String qualifiedName = '${libraryName}.${name}';
    return renameClassMap[qualifiedName] ?? name;
  }

  /**
   * Given a library name, return a list of strig pairs. The first element
   * represents the original name, and the second element represents the new
   * name.
   */
  List<List<String>> classRenamesFor(String libraryName) {
    Iterable<String> keys = renameClassMap.keys
        .where((String str) => str.startsWith('${libraryName}.'));

    return keys.map((key) {
      String? newName = renameClassMap[key]!;
      String oldName = key.substring(key.lastIndexOf('.') + 1);
      return [oldName, newName];
    }).toList();
  }

  String overrideClass(String className) {
    return overrideClasses.contains(className) ? '_${className}' : className;
  }
}
