import 'chrome_model.dart';
import 'json_model.dart';
import 'utils/split_words.dart';
import 'utils/string_helpers.dart';

class JsonModelConverter {
  final JsonNamespace model;
  late final _enumsToConvert =
      model.types.where((e) => e.enums != null).toList();
  late final _dictionariesToGenerate =
      model.types.where((e) => e.enums == null).toList();

  JsonModelConverter(this.model);

  ChromeApi convert() {
    return ChromeApi(
      name: model.namespace,
      documentation: model.description,
      events: _convertEvents().toList(),
      functions: _convertFunctions().toList(),
      properties: _convertProperties().toList(),
      dictionaries: _convertDictionaries().toList(),
      enumerations: _convertEnums().toList(),
    );
  }

  Iterable<Event> _convertEvents() sync* {
    for (var e in model.events) {
      yield _toEvent(e);
    }
  }

  Event _toEvent(JsonFunction event) {
    for (var param in event.parameters) {
      var name = param.name!;
      var parameterType = _addSyntheticTypeIfNeeded(param, name, event.name,
              anonymous: false) ??
          _propertyType(param);

      //TODO: create synthetic class to hold event with > 1 parameter
    }

    return Event(event.name, event.description);
  }

  Iterable<Method> _convertFunctions() sync* {
    for (var f in model.functions) {
      yield _convertFunction(f);
    }
  }

  Method _convertFunction(JsonFunction f) {
    var jsonReturns = f.returnsAsync ?? f.returns;
    var returns = MethodReturn(
        type: TypeRef.void$, isAsync: false, supportPromise: false);
    if (jsonReturns != null) {
      var supportsPromises = f.returnsAsync != null;
      var isAsync = jsonReturns.parameters != null;

      returns = MethodReturn(
        type: _propertyType(jsonReturns),
        isAsync: isAsync,
        supportPromise: supportsPromises,
        name: jsonReturns.name,
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
              anonymous: true) ??
          _propertyType(param);

      yield Property(
        name,
        type: parameterType,
        optional: param.optional ?? false,
        documentation: param.description,
      );
    }
  }

  TypeRef? _addSyntheticTypeIfNeeded(
      JsonProperty property, String name, String parent,
      {required bool anonymous}) {
    TypeRef? type;
    if (property.properties != null) {
      var typeName = upperCamel(
          splitWords('${name.startsWith(parent) ? '' : parent} $name'));
      type = TypeRef(typeName);
      _dictionariesToGenerate.add(JsonDeclaredType(
          typeName, property.description,
          properties: property.properties)
        ..isAnonymous = anonymous);
    } else if (property.enums != null) {
      var typeName = upperCamel(
          splitWords('${name.startsWith(parent) ? '' : parent} $name'));
      type = TypeRef(typeName);
      _dictionariesToGenerate.add(JsonDeclaredType(
          typeName, property.description,
          enums: property.enums));
    } else if (property.items case var items?) {
      if (items.$ref == null) {
        if (items.properties != null) {
          _addSyntheticTypeIfNeeded(items, name, parent, anonymous: anonymous);
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
                  anonymous: t.isAnonymous) ??
              _propertyType(e.value);

          if (e.value.parameters != null) {
            //TODO(xha): support function parameter
          }

          var property = Property(
            e.key,
            type: propertyType,
            optional: e.value.optional ?? false,
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
          events.add(_toEvent(event));
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
      yield Property(
        prop.key,
        type: _propertyType(prop.value),
        optional: prop.value.optional ?? false,
        documentation: prop.value.description,
      );
    }
  }

  TypeRef _propertyType(JsonProperty prop) {
    var typeName = prop.isInstanceOf ??
        prop.items?.name ??
        prop.items?.$ref ??
        prop.type ??
        prop.$ref;
    if (typeName == null) {
      if (prop.value is int) {
        typeName = 'integer';
      }
    }
    typeName ??= 'object';

    var isArray = prop.items != null;
    return TypeRef(typeName, isArray: isArray);
  }
}
