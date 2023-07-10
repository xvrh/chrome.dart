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
      properties: {},
      dictionaries: _convertDictionaries().toList(),
      enumerations: _convertEnums().toList(),
    );
  }

  Iterable<Event> _convertEvents() sync* {
    for (var e in model.events) {
      yield Event(e.name, e.description);
    }
  }

  Iterable<Method> _convertFunctions() sync* {
    for (var f in model.functions) {
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

      yield Method(
        f.name,
        returns: returns,
        parameters: _functionParameters(f).toList(),
        documentation: f.description,
      );
    }
  }

  Iterable<Property> _functionParameters(JsonFunction function) sync* {
    for (var param in function.parameters) {
      var name = param.name!;
      var parameterType = _propertyType(param);
      if (param.properties != null) {
        var typeName = upperCamel(splitWords(
            '${name.startsWith(function.name) ? '' : function.name} $name'));
        parameterType = TypeRef(typeName);
        _dictionariesToGenerate.add(JsonDeclaredType(
            typeName, param.description,
            properties: param.properties)
          ..isAnonymous = true);
      } else if (param.enums != null) {
        var typeName = upperCamel(splitWords(
            '${name.startsWith(function.name) ? '' : function.name} $name'));
        parameterType = TypeRef(typeName);
        _dictionariesToGenerate.add(
            JsonDeclaredType(typeName, param.description, enums: param.enums));
      }

      yield Property(
        name,
        type: parameterType,
        optional: param.optional ?? false,
        documentation: param.description,
      );
    }
  }

  Iterable<Dictionary> _convertDictionaries() sync* {
    while (_dictionariesToGenerate.isNotEmpty) {
      var t = _dictionariesToGenerate.removeAt(0);
      var properties = <Property>[];
      if (t.properties != null) {
        for (var e in t.properties!.entries) {
          var propertyType = _propertyType(e.value);

          if (e.value.parameters != null) {
            //TODO(xha): support function parameter
          }
          if (e.value.enums != null) {
            throw UnimplementedError();
          }
          if (e.value.properties != null) {
            var typeName = '${t.id}${firstLetterUpper(e.key)}';
            propertyType = TypeRef(typeName);
            _dictionariesToGenerate.add(JsonDeclaredType(
                typeName, e.value.description,
                properties: e.value.properties));
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

      yield Dictionary(
        t.id,
        properties: properties,
        documentation: t.description,
        methods: [],
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

  TypeRef _propertyType(JsonProperty prop) {
    var typeName = prop.isInstanceOf ?? prop.type ?? prop.$ref ?? 'object';
    var isArray = prop.items != null;
    return TypeRef(typeName, isArray: isArray);
  }
}
