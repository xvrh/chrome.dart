import 'chrome_model.dart';
import 'idl_parser.dart';

ChromeApi loadIdlModel(String content) {
  var parser = ChromeIDLParser();
  var namespace = parser.namespaceDeclaration.parse(content).value;
  return ChromeApi(
    name: namespace.name,
    events: namespace.eventDeclaration?.methods
            .map((e) => Event(e.name, _toDocumentation(e.documentation)))
            .toList() ??
        [],
    documentation: _toDocumentation(namespace.documentation),
    properties: {},
    functions: namespace.functionDeclaration?.methods
            .map((f) => Method(
                name: f.name, documentation: _toDocumentation(f.documentation)))
            .toList() ??
        [],
  );
}

//TODO(xha): keep the raw documentation and now re-wrap it in code-generation
String _toDocumentation(List<String> documentation) => documentation.join('\n');
