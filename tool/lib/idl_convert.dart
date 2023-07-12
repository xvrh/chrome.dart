import 'package:collection/collection.dart';

import 'chrome_model.dart';
import 'idl_model.dart';
import 'idl_parser.dart';
import 'utils/string_helpers.dart';

class IdlModelConverter {
  final IDLNamespaceDeclaration model;
  final _syntheticDictionaries = <Dictionary>[];
  final _syntheticTypedefs = <Typedef>[];

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
      dictionaries: [..._convertDictionaries(), ..._syntheticDictionaries],
      enumerations: _convertEnums().toList(),
      typedefs: _syntheticTypedefs,
    );
  }

  Iterable<Event> _convertEvents() sync* {
    if (model.eventDeclaration == null) return;

    for (var e in model.eventDeclaration!.methods) {
      var parameters = e.parameters;
      ChromeType? type;
      if (parameters.length == 1) {
        var createdProperty = _convertSyntheticParam(parameters.first);
        type = createdProperty.type;
      } else if (parameters.length > 1) {
        var newTypeName = '${stringToUpperCamel(e.name)}Event';
        var syntheticType = Dictionary(newTypeName,
            properties: [
              for (var param in parameters) _convertSyntheticParam(param)
            ],
            methods: [],
            events: [],
            documentation: '',
            isAnonymous: false,
            isSyntheticEvent: true);
        type = LocalType(newTypeName, isNullable: false);
        _syntheticDictionaries.add(syntheticType);
      }
      yield Event(e.name,
          type: type, documentation: _toDocumentation(e.documentation));
    }
  }

  Property _convertSyntheticParam(IDLParameter param) {
    ChromeType type;
    var callback = model.callbackDeclarations
        .singleWhereOrNull((e) => e.name == param.type.name);

    if (callback != null) {
      var positionalParameters = callback.parameters.map((p) {
        var innerParam = _convertSyntheticParam(p);

        return FunctionParameter(innerParam.name, innerParam.type);
      }).toList();
      type = FunctionType(null, positionalParameters,
          isNullable: param.isOptional);
      if (_syntheticTypedefs.none((e) => e.alias == callback.name)) {
        _syntheticTypedefs.add(Typedef(callback.name,
            target: type,
            documentation: _toDocumentation(callback.documentation)));
      }
      type = AliasedType(callback.name, type, isNullable: param.isOptional);
    } else {
      type = _typeFromName(param.type, isNullable: param.isOptional);
    }

    return Property(
      param.name,
      type: type,
      documentation: '',
    );
  }

  Iterable<Property> _convertProperties() sync* {
    if (model.propertiesDeclaration == null) return;

    for (var prop in model.propertiesDeclaration!.methods) {
      yield Property(
        prop.name,
        type: _typeFromName(prop.returnType, isNullable: false),
        documentation: _toDocumentation(prop.documentation),
      );
    }
  }

  Iterable<Dictionary> _convertDictionaries() sync* {
    for (var t in model.typeDeclarations) {
      var properties = <Property>[];
      for (var m in t.members) {
        var p = Property(m.name,
            type: _typeFromName(m.type, isNullable: m.isOptional),
            documentation: _toDocumentation(m.documentation));
        properties.add(p);
      }

      if (t.methods.isNotEmpty) {
        throw UnimplementedError('${model.name} / ${t.name} has methods');
      }
      if (t.methods.isNotEmpty) {
        throw UnimplementedError('${model.name} / ${t.name} has methods');
      }

      yield Dictionary(
        t.name,
        properties: properties,
        methods: [],
        events: [],
        documentation: _toDocumentation(t.documentation),
        //TODO: make it anonymous if this is a "input" only type?
        isAnonymous: false,
      );
    }
  }

  Iterable<Method> _convertMethods() sync* {
    for (var f in model.functionDeclaration?.methods ?? <IDLMethod>[]) {
      var parameters = <Property>[];
      AsyncReturnType? callback;
      for (var p in f.parameters) {
        if (p.isCallback && f.returnType.name == 'void') {
          if (callback != null) {
            throw UnimplementedError(
                'Multiple callback for ${model.name} ${f.name}');
          }
          var callbackDeclaration = model.callbackDeclarations.singleWhere(
              (c) => c.name == p.type.name,
              orElse: () => throw StateError(
                  'Look for callback ${p.type.name} ${model.name} ${f.name}'));

          FunctionParameter? singleParameter;
          if (callbackDeclaration.parameters.length > 1) {
            var syntheticTypeName = '${stringToUpperCamel(f.name)}Result';

            singleParameter = FunctionParameter(
                null, LocalType(syntheticTypeName, isNullable: false));
            var syntheticType = Dictionary(syntheticTypeName,
                properties: [
                  for (var param in callbackDeclaration.parameters)
                    _convertSyntheticParam(param)
                ],
                methods: [],
                events: [],
                documentation: '',
                isAnonymous: false,
                isSyntheticEvent: true);
            _syntheticDictionaries.add(syntheticType);
          } else if (callbackDeclaration.parameters case [var param]) {
            singleParameter = FunctionParameter(param.name,
                _typeFromName(param.type, isNullable: param.isOptional));
          }

          var jsCallback = FunctionType(
              null, [if (singleParameter != null) singleParameter],
              isNullable: p.isOptional);
          callback = AsyncReturnType(singleParameter?.type, jsCallback);
          if (f.returnType.name != 'void') {
            throw UnimplementedError(
                'Async with non void function ${model.name} / ${f.name}');
          }
        } else {
          var property = Property(
            p.name,
            type: _typeFromName(p.type, isNullable: p.isOptional),
            documentation: '',
          );
          parameters.add(property);
        }
      }
      var returns = MethodReturn(
        type: callback ??
            (f.returnType.name != 'void'
                ? _typeFromName(f.returnType, isNullable: false)
                : null),
      );

      yield Method(
        f.name,
        parameters: parameters,
        documentation: _toDocumentation(f.documentation),
        returns: returns,
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

  ChromeType _typeFromName(IDLType type, {required bool isNullable}) {
    var name = type.name;
    var arrayIsNullable = isNullable;
    if (type.isArray) {
      isNullable = false;
    }
    var chromeType = ChromeType.tryParse(name, isNullable: isNullable) ??
        LocalType.parse(name, isNullable: isNullable);
    if (type.isArray) {
      return ListType(chromeType, isNullable: arrayIsNullable);
    }
    return chromeType;
  }
}

//TODO(xha): keep the raw documentation and now re-wrap it in code-generation
String _toDocumentation(List<String> documentation) => documentation.join('\n');
