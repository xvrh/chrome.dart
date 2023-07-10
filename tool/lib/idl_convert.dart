import 'chrome_model.dart';
import 'idl_model.dart';
import 'idl_parser.dart';

class IdlModelConverter {
  final IDLNamespaceDeclaration model;

  IdlModelConverter(this.model);

  factory IdlModelConverter.fromString(String content) {
    var parser = ChromeIDLParser();
    var namespace = parser.namespaceDeclaration.parse(content).value;
    return IdlModelConverter(namespace);
  }

  ChromeApi convert() {
    return ChromeApi(
      name: model.name,
      documentation: _toDocumentation(model.documentation),
      events: _convertEvents().toList(),
      properties: _convertProperties().toList(),
      functions: _convertMethods().toList(),
      dictionaries: _convertDictionaries().toList(),
      enumerations: _convertEnums().toList(),
    );
  }

  Iterable<Event> _convertEvents() sync* {
    if (model.eventDeclaration == null) return;

    for (var e in model.eventDeclaration!.methods) {
      yield Event(e.name, _toDocumentation(e.documentation));
    }
  }

  Iterable<Property> _convertProperties() sync* {
    if (model.propertiesDeclaration == null) return;

    for (var prop in model.propertiesDeclaration!.methods) {
      yield Property(
        prop.name,
        type: _toTypeRef(prop.returnType),
        optional: false,
        documentation: _toDocumentation(prop.documentation),
      );
    }
  }

  Iterable<Dictionary> _convertDictionaries() sync* {
    for (var t in model.typeDeclarations) {
      var properties = <Property>[];
      for (var m in t.members) {
        var p = Property(m.name,
            type: _toTypeRef(m.type),
            optional: m.isOptional,
            documentation: _toDocumentation(m.documentation));
        properties.add(p);
      }

      if (t.methods.isNotEmpty) {
        throw UnimplementedError('${model.name} / ${t.name} has methods');
      }

      yield Dictionary(
        t.name,
        properties: properties,
        methods: [],
        documentation: _toDocumentation(t.documentation),
        //TODO: make it anonymous if this is a "input" only type?
        isAnonymous: false,
      );
    }
  }

  Iterable<Method> _convertMethods() sync* {
    for (var f in model.functionDeclaration?.methods ?? <IDLMethod>[]) {
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

      yield Method(
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
    }
  }

  Iterable<Enumeration> _convertEnums() sync* {
    for (var e in model.enumDeclarations) {
      yield Enumeration(
        e.name,
        documentation: _toDocumentation(e.documentation),
        values: e.enums
            .map((v) => EnumerationValue(
                name: v.name, documentation: _toDocumentation(v.documentation)))
            .toList(),
      );
    }
  }
}

TypeRef _toTypeRef(IDLType type) {
  var typeName = type.name;
  return TypeRef(typeName, isArray: type.isArray);
}

//TODO(xha): keep the raw documentation and now re-wrap it in code-generation
String _toDocumentation(List<String> documentation) => documentation.join('\n');
