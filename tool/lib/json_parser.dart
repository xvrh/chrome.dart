library json_parser;

import 'dart:convert';
import 'dart:io';

import 'json_model.dart';

void main(List<String> args) {
  var namespace = parse(File(args.first).readAsStringSync());

  print(namespace);
}

JsonNamespace parse(String jsonText) {
  // pre-filter to remove line comments -
  var lines = LineSplitter().convert(jsonText);
  var newLines = lines.map((String line) {
    var index = line.indexOf('//');

    // If we find // foo, we remove it from the line, unless it looks like
    // :// foo (as in, http://cheese.com).

    if (index == -1) {
      return line;
    } else if (index == 0 || line.codeUnitAt(index - 1) != 58) {
      // 58 == ':'
      return line.substring(0, index);
    } else {
      return line;
    }
  });

  return _parseJson(json.decode(newLines.join('\n')) as List);
}

JsonNamespace _parseJson(List<dynamic> json) {
  return JsonNamespace(json[0]);
}
