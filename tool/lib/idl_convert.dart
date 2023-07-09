import 'chrome_model.dart';
import 'idl_model.dart';
import 'idl_parser.dart';

ChromeApi loadIdlModel(String content) {
  var parser = ChromeIDLParser();
  var namespace = parser.namespaceDeclaration.parse(content).value;

  var dictionaries = <Dictionary>[];
  for (var t in namespace.typeDeclarations) {
    var properties = <Property>[];
    for (var m in t.members) {
      var p = Property(m.name,
          type: _propertyType(m.type),
          optional: m.isOptional,
          documentation: _toDocumentation(m.documentation));
      properties.add(p);
    }

    var methods = <Method>[];
    for (var m in t.methods) {
      var method = Method(m.name,
          parameters: m.parameters
              .map((p) => Property(p.name,
                  type: _propertyType(p.type),
                  optional: p.isOptional,
                  documentation: ''))
              .toList(),
          documentation: _toDocumentation(m.documentation));
      methods.add(method);
    }

    var dict = Dictionary(t.name,
        properties: properties,
        methods: methods,
        documentation: _toDocumentation(t.documentation));
    dictionaries.add(dict);
  }

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
                    .map((p) => Property(
                          p.name,
                          type: _propertyType(p.type),
                          optional: p.isOptional,
                          documentation: '',
                        ))
                    .toList(),
                documentation: _toDocumentation(f.documentation)))
            .toList() ??
        [],
    dictionaries: dictionaries,
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

TypeRef _propertyType(IDLType type) {
  var typeName = type.name;
  return TypeRef(typeName, isArray: type.isArray);
}

//TODO(xha): keep the raw documentation and now re-wrap it in code-generation
String _toDocumentation(List<String> documentation) => documentation.join('\n');
