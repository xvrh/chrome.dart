import 'package:collection/collection.dart';

import 'chrome_model.dart';
import 'idl_model.dart';
import 'idl_parser.dart';
import 'utils/string.dart';

class IdlModelConverter {
  final IDLNamespaceDeclaration model;
  final _syntheticDictionaries = <Dictionary>[];
  final _syntheticTypedefs = <Typedef>[];

  IdlModelConverter(this.model);

  String get _targetFileName => '${apiNameToFileName(model.name)}.dart';

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
        var newTypeName = '${e.name.upperCamel}Event';
        var syntheticType = Dictionary(newTypeName,
            properties: [
              for (var param in parameters) _convertSyntheticParam(param)
            ],
            methods: [],
            events: [],
            documentation: '',
            isAnonymous: false,
            isSyntheticEvent: true);
        type = LocalType(newTypeName,
            declarationFile: _targetFileName, isNullable: false);
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
      type = AliasedType(callback.name, type,declarationFile: _targetFileName, isNullable: param.isOptional);
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
    for (var declaration in model.typeDeclarations) {
      var properties = <Property>[];
      for (var member in declaration.members) {
        if (member.name.startsWith('_')) continue;

        var p = Property(member.name,
            type: _typeFromName(member.type, isNullable: member.isOptional),
            documentation: _toDocumentation(member.documentation));
        properties.add(p);
      }

      if (declaration.methods.isNotEmpty) {
        throw UnimplementedError(
            '${model.name} / ${declaration.name} has methods');
      }
      if (declaration.methods.isNotEmpty) {
        throw UnimplementedError(
            '${model.name} / ${declaration.name} has methods');
      }

      yield Dictionary(
        declaration.name,
        properties: properties,
        methods: [],
        events: [],
        documentation: _toDocumentation(declaration.documentation),
        //TODO: make it anonymous if this is a "input" only type?
        isAnonymous: false,
      );
    }
  }

  Iterable<Method> _convertMethods() sync* {
    for (var function in model.functionDeclaration?.methods ?? <IDLMethod>[]) {
      var parameters = <Property>[];
      AsyncReturnType? callback;
      for (var paramDecl in function.parameters) {
        if (paramDecl.isCallback && function.returnType.name == 'void') {
          if (callback != null) {
            throw UnimplementedError(
                'Multiple callback for ${model.name} ${function.name}');
          }
          var callbackDeclaration = model.callbackDeclarations.singleWhere(
              (c) => c.name == paramDecl.type.name,
              orElse: () => throw StateError(
                  'Look for callback ${paramDecl.type.name} ${model.name} ${function.name}'));

          FunctionParameter? singleParameter;
          var allParameters = <FunctionParameter>[];
          if (callbackDeclaration.parameters.length > 1) {
            var syntheticTypeName = '${function.name.upperCamel}Result';

            var syntheticProperties = <Property>[];
            for (var param in callbackDeclaration.parameters) {
              var syntheticProperty = _convertSyntheticParam(param);
              syntheticProperties.add(syntheticProperty);
              allParameters.add(FunctionParameter(
                  syntheticProperty.name, syntheticProperty.type));
            }

            singleParameter = FunctionParameter(
                null,
                LocalType(syntheticTypeName,
                    declarationFile: _targetFileName, isNullable: false));
            var syntheticType = Dictionary(syntheticTypeName,
                properties: syntheticProperties,
                methods: [],
                events: [],
                documentation: '',
                isAnonymous: false,
                isSyntheticEvent: true);
            _syntheticDictionaries.add(syntheticType);
          } else if (callbackDeclaration.parameters case [var param]) {
            singleParameter = FunctionParameter(param.name,
                _typeFromName(param.type, isNullable: param.isOptional));
            allParameters.add(singleParameter);
          }

          var jsCallback = FunctionType(null, allParameters,
              isNullable: paramDecl.isOptional);
          callback = AsyncReturnType(singleParameter?.type, jsCallback);
          if (function.returnType.name != 'void') {
            throw UnimplementedError(
                'Async with non void function ${model.name} / ${function.name}');
          }
        } else {
          var property = Property(
            paramDecl.name,
            type:
                _typeFromName(paramDecl.type, isNullable: paramDecl.isOptional),
            documentation: '',
          );
          parameters.add(property);
        }
      }
      var returns = MethodReturn(
        type: callback ??
            (function.returnType.name != 'void'
                ? _typeFromName(function.returnType, isNullable: false)
                : null),
      );

      yield Method(
        function.name,
        parameters: parameters,
        documentation: _toDocumentation(function.documentation),
        returns: returns,
      );
    }
  }

  Iterable<Enumeration> _convertEnums() sync* {
    for (var declaration in model.enumDeclarations) {
      yield Enumeration(
        declaration.name,
        documentation: _toDocumentation(declaration.documentation),
        values: declaration.enums
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
        LocalType.parse(name,
            selfFileName: _targetFileName, isNullable: isNullable);
    if (type.isArray) {
      return ListType(chromeType, isNullable: arrayIsNullable);
    }
    return chromeType;
  }
}

//TODO(xha): keep the raw documentation and now re-wrap it in code-generation
String _toDocumentation(List<String> documentation) => documentation.join('\n');
