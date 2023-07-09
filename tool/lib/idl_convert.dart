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
            .map((f) => Method(f.name,
                parameters: f.parameters
                    .map((p) => Property(p.name,
                        typeName: p.type.name,
                        optional: p.isOptional,
                        documentation: '',
                        isArray: p.type.isArray))
                    .toList(),
                documentation: _toDocumentation(f.documentation)))
            .toList() ??
        [],
    dictionaries: namespace.typeDeclarations
        .map((t) => Dictionary(t.name,
            properties: t.members
                .map((m) => Property(m.name,
                    typeName: m.type.name,
                    isArray: m.type.isArray,
                    optional: m.isOptional,
                    documentation: _toDocumentation(m.documentation)))
                .toList(),
            documentation: _toDocumentation(t.documentation)))
        .toList(),
    enumerations: namespace.enumDeclarations
        .map((e) => Enumeration(
              e.name,
              documentation: _toDocumentation(e.documentation),
              values: e.enums
                  .map((v) => EnumerationValue(
                      name: v.name,
                      documentation: _toDocumentation(v.documentation)))
                  .toList(),
            ))
        .toList(),
  );
}

//TODO(xha): keep the raw documentation and now re-wrap it in code-generation
String _toDocumentation(List<String> documentation) => documentation.join('\n');
