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
          type: _toTypeRef(m.type),
          optional: m.isOptional,
          documentation: _toDocumentation(m.documentation));
      properties.add(p);
    }

    if (t.methods.isNotEmpty) {
      throw UnimplementedError('${namespace.name} / ${t.name} has methods');
    }

    var dict = Dictionary(t.name,
        properties: properties,
        methods: [],
        documentation: _toDocumentation(t.documentation));
    dictionaries.add(dict);
  }

  var methods = <Method>[];
  for (var f in namespace.functionDeclaration?.methods ?? <IDLMethod>[]) {
    var parameters = <Property>[];
    MethodReturn? returns;
    for (var p in f.parameters) {
      if (!p.isCallback) {
        var property = Property(
          p.name,
          type: _toTypeRef(p.type),
          optional: p.isOptional,
          documentation: '',
        );
        parameters.add(property);
      } else {
        returns = MethodReturn(
          type: _toTypeRef(p.type),
          isAsync: p.isCallback,
          supportPromise: p.supportsPromises,
          name: p.name,
        );
      }
    }

    var method = Method(
      f.name,
      parameters: parameters,
      documentation: _toDocumentation(f.documentation),
      returns: returns ??
          MethodReturn(
            type: TypeRef.void$,
            isAsync: false,
            supportPromise: false,
          ),
    );
    methods.add(method);
  }

  return ChromeApi(
    name: namespace.name,
    events: namespace.eventDeclaration?.methods
            .map((e) => Event(e.name, _toDocumentation(e.documentation)))
            .toList() ??
        [],
    documentation: _toDocumentation(namespace.documentation),
    properties: {},
    functions: methods,
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

TypeRef _toTypeRef(IDLType type) {
  var typeName = type.name;
  return TypeRef(typeName, isArray: type.isArray);
}

//TODO(xha): keep the raw documentation and now re-wrap it in code-generation
String _toDocumentation(List<String> documentation) => documentation.join('\n');
