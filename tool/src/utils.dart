library utility;

import 'dart:io';

/// foo.bar ==> fooBar
String toCamelCase(String str) {
  return str.replaceAllMapped(
      new RegExp(r"\.([a-z])"), (Match m) => "${m.group(1)!.toUpperCase()}");
}

/// fooBar ==> foo_bar
String fromCamelCase(String str) {
  if (str == str.toUpperCase()) {
    return str;
  } else {
    return str.replaceAllMapped(
        new RegExp(r"[A-Z]"), (Match m) => "_${m.group(0)!.toLowerCase()}");
  }
}

/// foo ==> Foo
String titleCase(String str) {
  return str.substring(0, 1).toUpperCase() + str.substring(1);
}

String convertHtmlToDartdoc(String str) {
  str = str.replaceAll('<code>', '`');
  str = str.replaceAll('</code>', '`');

  str = str.replaceAll('<em>', '_');
  str = str.replaceAll('</em>', '_');

  str = str.replaceAll('<strong>', '*');
  str = str.replaceAll('</strong>', '*');

  str = str.replaceAll('<var>', '[');
  str = str.replaceAll('</var>', ']');

  str = str.replaceAll('&mdash;', '-');

  str = str.replaceAll('</p><p>', '\n\n');
  str = str.replaceAll('<p>', '');
  str = str.replaceAll('</p>', '');

  // $(ref:sessions) ==> [sessions]
  str = str.replaceAllMapped(
      new RegExp(r"\$\(ref:([\.\w]*)\)"), (Match m) => "[${m.group(1)}]");

  // $ref:runtime.onConnect ==> [runtime.onConnect]
  str = str.replaceAllMapped(
      new RegExp(r"\$ref:([\.\w]*)"), (Match m) => "[${m.group(1)}]");

  // <a href='content_scripts.html#pi'>programmatic injection</a> ==> [foo](url)
  str = str.replaceAllMapped(
      new RegExp(r"""<a href=['"](\S*)['"]>([\w ]*)</a>"""),
      (Match m) => "[${m.group(2)}](${m.group(1)})");

  return str;
}

String getFileName(FileSystemEntity entity) {
  String name = entity.path;
  int index = name.lastIndexOf(Platform.pathSeparator);
  if (index != -1) {
    name = name.substring(index + 1);
  }
  return name;
}

final _importMap = const {
  'DirectoryEntry': '../src/files.dart',
  'Entry': '../src/files.dart',
  'FileEntry': '../src/files.dart',
  'DOMFileSystem': '../src/files.dart',
  'FileSystem': '../src/files.dart',
  'Blob': '../src/files.dart',
  'Window': 'windows'
};

String? getImportForClass(String? name) {
  if (name != null) {
    return _importMap[name];
  } else {
    return null;
  }
}
