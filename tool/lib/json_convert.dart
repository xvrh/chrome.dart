import 'package:collection/collection.dart';

import 'chrome_model.dart';
import 'json_model.dart';
import 'utils/string.dart';

class JsonModelConverter {
  final JsonNamespace model;
  late final _enumsToConvert =
      model.types.where((e) => e.enums != null).toList();
  late final _dictionariesToGenerate =
      model.types.where((e) => e.enums == null && e.type == 'object').toList();
  final _syntheticDictionaries = <Dictionary>[];
  final _typedefs = <Typedef>[];

  JsonModelConverter(this.model) {
    _fillTypedefs();
  }

  String get _targetFileName => '${apiNameToFileName(model.namespace)}.dart';

  ChromeApi convert() {
    return ChromeApi(
      name: model.namespace,
      documentation: model.description,
      events: _convertEvents().toList(),
      functions: _convertFunctions().toList(),
      properties: _convertProperties().toList(),
      typedefs: _typedefs,
      dictionaries: [..._convertDictionaries(), ..._syntheticDictionaries],
      enumerations: _convertEnums().toList(),
    );
  }

  Iterable<Event> _convertEvents() sync* {
    for (var e in model.events) {
      yield _toEvent(e);
    }
  }

  Event _toEvent(JsonFunction event, {String? parent}) {
    var parameters = <JsonProperty, ChromeType>{};
    for (var param in event.parameters) {
      var name = param.name!;
      var parameterType = _addSyntheticTypeIfNeeded(param, name, event.name,
              anonymous: false, isNullable: param.optional ?? false) ??
          _propertyType(param);
      parameters[param] = parameterType;
    }
    ChromeType? parameterType;
    if (parameters.length == 1) {
      parameterType = parameters.values.first;
    } else if (parameters.length > 1) {
      var syntheticTypeName = '${parent ?? ''} ${event.name} Event'.upperCamel;
      var syntheticType = Dictionary(syntheticTypeName,
          properties: [
            for (var param in parameters.entries)
              Property(param.key.name!,
                  type: param.value, documentation: param.key.description)
          ],
          methods: [],
          events: [],
          documentation: '',
          isAnonymous: false,
          isSyntheticEvent: true);
      assert(syntheticType.properties.length > 1);
      _syntheticDictionaries.add(syntheticType);
      parameterType = _newLocalType(syntheticTypeName, isNullable: false);
    }

    return Event(event.name,
        type: parameterType, documentation: event.description);
  }

  Iterable<Method> _convertFunctions() sync* {
    for (var f in model.functions) {
      yield _convertFunction(f);
    }
  }

  Method _convertFunction(JsonFunction f) {
    var jsonReturns = f.returnsAsync ?? f.returns;
    var returns = MethodReturn(type: null);
    ChromeType returnType;
    if (jsonReturns != null) {
      if (f.returnsAsync != null && jsonReturns.parameters == null) {
        throw StateError('Not a function in ${model.namespace} ${f.name}');
      }

      if (jsonReturns.parameters != null) {
        FunctionParameter? singleParameter;
        if (jsonReturns.parameters!.length > 1) {
          throw UnimplementedError();
        } else if (jsonReturns.parameters case [var p]) {
          var type = _addSyntheticTypeIfNeeded(
                  p, '${jsonReturns.name!}_${p.name!}', f.name,
                  anonymous: false, isNullable: p.optional ?? false) ??
              _propertyType(p);
          singleParameter = FunctionParameter(p.name, type);
        }
        var jsReturnType = FunctionType(
            null, [if (singleParameter != null) singleParameter],
            isNullable: jsonReturns.optional ?? false);
        returnType = AsyncReturnType(singleParameter?.type, jsReturnType);
      } else {
        returnType = _addSyntheticTypeIfNeeded(jsonReturns, 'Return', f.name,
                anonymous: false, isNullable: jsonReturns.optional ?? false) ??
            _propertyType(jsonReturns);
      }

      returns = MethodReturn(
        name: jsonReturns.name,
        type: returnType,
      );
    }

    return Method(
      f.name,
      returns: returns,
      parameters: _functionParameters(f).toList(),
      documentation: f.description,
    );
  }

  Iterable<Property> _functionParameters(JsonFunction function) sync* {
    for (var param in function.parameters) {
      var name = param.name!;
      var parameterType = _addSyntheticTypeIfNeeded(param, name, function.name,
              anonymous: true, isNullable: param.optional ?? false) ??
          _propertyType(param);

      yield Property(
        name,
        type: parameterType,
        documentation: param.description,
      );
    }
  }

  ChromeType? _addSyntheticTypeIfNeeded(
      JsonProperty property, String name, String parent,
      {required bool anonymous, required bool isNullable}) {
    ChromeType? type;
    if (property.properties != null) {
      var typeName =
          '${name.startsWith(parent) ? '' : parent} $name'.upperCamel;
      _dictionariesToGenerate.add(JsonDeclaredType(
          typeName, property.description,
          properties: property.properties)
        ..isAnonymous = anonymous);
      type = _newLocalType(typeName, isNullable: isNullable);
    } else if (property.enums != null) {
      var typeName =
          '${name.startsWith(parent) ? '' : parent} $name'.upperCamel;
      _dictionariesToGenerate.add(JsonDeclaredType(
          typeName, property.description,
          enums: property.enums));
      type = _newLocalType(typeName, isNullable: isNullable);
    } else if (property.items case var items?) {
      if (items.$ref == null) {
        if (items.properties != null) {
          type = _addSyntheticTypeIfNeeded(items, name, parent,
              anonymous: anonymous, isNullable: isNullable);
        } else if (items.enums != null) {
          throw UnimplementedError('$parent $name');
        }
      }
    }
    return type;
  }

  Iterable<Dictionary> _convertDictionaries() sync* {
    while (_dictionariesToGenerate.isNotEmpty) {
      var t = _dictionariesToGenerate.removeAt(0);
      var properties = <Property>[];
      if (t.properties != null) {
        for (var e in t.properties!.entries) {
          var propertyType = _addSyntheticTypeIfNeeded(e.value, e.key, t.id,
                  anonymous: t.isAnonymous,
                  isNullable: e.value.optional ?? false) ??
              _propertyType(e.value);

          if (e.value.parameters != null) {
            //TODO(xha): support function parameter
          }

          var property = Property(
            e.key,
            type: propertyType,
            documentation: e.value.description,
          );
          properties.add(property);
        }
      }

      var methods = <Method>[];
      if (t.functions != null) {
        for (var f in t.functions!) {
          methods.add(_convertFunction(f));
        }
      }

      var events = <Event>[];
      if (t.events != null) {
        for (var event in t.events!) {
          events.add(_toEvent(event, parent: t.id));
        }
      }

      yield Dictionary(
        t.id,
        properties: properties,
        methods: methods,
        events: events,
        documentation: t.description,
        isAnonymous: t.isAnonymous,
      );
    }
  }

  Iterable<Enumeration> _convertEnums() sync* {
    for (var e in _enumsToConvert) {
      var values = <EnumerationValue>[];
      for (var v in e.enums!) {
        values.add(EnumerationValue(
          name: v.name,
          documentation: v.description,
        ));
      }
      yield Enumeration(
        e.id,
        documentation: e.description,
        values: values,
      );
    }
  }

  Iterable<Property> _convertProperties() sync* {
    for (var prop in model.properties.entries) {
      var type = _addSyntheticTypeIfNeeded(
              prop.value, prop.key, model.namespace,
              anonymous: false, isNullable: prop.value.optional ?? false) ??
          _propertyType(prop.value);

      yield Property(
        prop.key,
        type: type,
        documentation: prop.value.description,
      );
    }
  }

  void _fillTypedefs() {
    for (var type
        in model.types.where((t) => t.type != 'object' && t.enums == null)) {
      ChromeType? target;

      if (type.type == 'array') {
        var items = type.items!;
        var typeRef = _addSyntheticTypeIfNeeded(items, 'Items', type.id,
                anonymous: false, isNullable: false) ??
            _propertyType(items);
        target = ListType(typeRef, isNullable: false);
      } else if (type.isInstanceOf case var isInstanceOf?) {
        target = ChromeType.tryParse(isInstanceOf, isNullable: false)!;
      } else if (type.type case var type?) {
        target = ChromeType.tryParse(type, isNullable: false)!;
      } else {
        target = VariousType(isNullable: false);
      }

      _typedefs.add(
          Typedef(type.id, target: target, documentation: type.description));
    }
  }

  ChromeType _propertyType(JsonProperty prop) {
    String typeName;
    var nullable = prop.optional ?? false;
    var arrayNullable = nullable;
    var isArray = false;
    if (prop.items case var items?) {
      typeName = _extractType(items);
      isArray = true;
      nullable = false;
    } else {
      typeName = _extractType(prop);
    }

    ChromeType? type;
    if (_typedefs.firstWhereOrNull((e) => e.alias == typeName)
        case var typedef?) {
      type = AliasedType(typeName, typedef.target, isNullable: nullable);
    }

    type ??= ChromeType.tryParse(typeName, isNullable: nullable) ??
        LocalType.parse(typeName,
            selfFileName: _targetFileName, isNullable: nullable);
    if (isArray) {
      return ListType(type, isNullable: arrayNullable);
    }
    return type;
  }

  String _extractType(JsonProperty prop) {
    assert(prop.items == null && prop.type != 'array');
    assert(prop.properties == null);

    var typeName = prop.isInstanceOf ?? prop.type ?? prop.$ref;
    if (typeName == null) {
      if (prop.value is int) {
        typeName = 'integer';
      }
    }
    return typeName ?? 'object';
  }

  LocalType _newLocalType(String name, {required bool isNullable}) {
    return LocalType(name,
        selfFileName: _targetFileName, isNullable: isNullable);
  }
}
