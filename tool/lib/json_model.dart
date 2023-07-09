library model_json;

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'chrome_model.dart';

part 'json_model.g.dart';

@JsonSerializable(createToJson: false)
class JsonNamespace {
  final String namespace;

  @JsonKey(defaultValue: '')
  final String description;

  @JsonKey(defaultValue: {})
  final Map<String, JsonProperty> properties;

  @JsonKey(defaultValue: [])
  final List<JsonFunction> functions;

  @JsonKey(defaultValue: [])
  final List<JsonFunction> events;

  @JsonKey(defaultValue: [])
  final List<JsonDeclaredType> types;

  JsonNamespace({
    required this.namespace,
    required this.description,
    required this.properties,
    required this.functions,
    required this.events,
    required this.types,
  });

  factory JsonNamespace.fromJson(Map<String, dynamic> json) =>
      _$JsonNamespaceFromJson(json);

  static JsonNamespace parse(String jsonText) {
    // pre-filter to remove line comments -
    //TODO: use a real JSON5 parser
    var lines = LineSplitter().convert(jsonText);
    var newLines = lines.map((String line) {
      var index = line.indexOf('//');

      // If we find // foo, we remove it from the line, unless it looks like
      // :// foo (as in, http://cheese.com).

      if (index == -1) {
        return line;
      } else if (index == 0 || line.codeUnitAt(index - 1) != 58) {
        // 58 == ':'
        return line.substring(0, index);
      } else {
        return line;
      }
    });

    return JsonNamespace.fromJson((json.decode(newLines.join('\n')) as List)
        .single as Map<String, dynamic>);
  }
}

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class JsonFunction {
  final String name;
  final String? type;

  @JsonKey(defaultValue: '')
  final String description;

  @JsonKey(defaultValue: [])
  final List<JsonProperty> parameters;

  final JsonProperty? returns;

  final JsonProperty? returnsAsync;

  JsonFunction(this.name, this.type, this.description, this.parameters,
      this.returns, this.returnsAsync);

  factory JsonFunction.fromJson(Map<String, dynamic> json) =>
      _$JsonFunctionFromJson(json);
}

@JsonSerializable(createToJson: false)
class JsonDeclaredType {
  final String id;
  final String? type;

  @JsonKey(defaultValue: '')
  final String description;

  @JsonKey(name: 'enum')
  @_JsonEnumConverter()
  final List<JsonEnumValue>? enums;

  final Map<String, JsonProperty>? properties;

  JsonDeclaredType(
      this.id, this.type, this.description, this.enums, this.properties);

  factory JsonDeclaredType.fromJson(Map<String, dynamic> json) =>
      _$JsonDeclaredTypeFromJson(json);
}

@JsonSerializable(createToJson: false, disallowUnrecognizedKeys: true)
class JsonProperty {
  final String? name;
  final String? type;
  final num? minimum, maximum;
  final int? minLength, maxLength;
  final bool? optional;
  final Object? value;

  @JsonKey(defaultValue: '')
  final String description;
  final String? deprecated;

  final String? $ref;

  final Map<String, JsonProperty>? properties;
  final List<JsonProperty>? parameters;
  final List<JsonProperty>? choices;
  final JsonProperty? items;

  @JsonKey(name: 'enum')
  @_JsonEnumConverter()
  final List<JsonEnumValue>? enums;

  final String? isInstanceOf;

  final JsonProperty? additionalProperties;

  @JsonKey(name: 'extension_types')
  final List<String>? extensionTypes;

  final Object? nodoc;

  final int? maxItems, minItems;

  final List<String>? platforms;

  final bool? preserveNull;

  @JsonKey(name: 'serialized_type')
  final String? serializedType;

  @JsonKey(name: 'min_version')
  final String? minVersion;

  JsonProperty(
      this.name,
      this.type,
      this.minimum,
      this.maximum,
      this.minLength,
      this.maxLength,
      this.optional,
      this.description,
      this.deprecated,
      this.$ref,
      this.properties,
      this.value,
      this.isInstanceOf,
      this.additionalProperties,
      this.parameters,
      this.items,
      this.extensionTypes,
      this.nodoc,
      this.choices,
      this.maxItems,
      this.minItems,
      this.enums,
      this.platforms,
      this.preserveNull,
      this.serializedType,
      this.minVersion);

  factory JsonProperty.fromJson(Map<String, dynamic> json) =>
      _$JsonPropertyFromJson(json);
}

class JsonEnumValue {
  final String name;
  final String description;

  JsonEnumValue(this.name, this.description);
}

class _JsonEnumConverter extends JsonConverter<JsonEnumValue, Object> {
  const _JsonEnumConverter();

  @override
  JsonEnumValue fromJson(Object json) {
    if (json is String) {
      return JsonEnumValue(json, '');
    } else if (json is Map<String, dynamic>) {
      return JsonEnumValue(
          json['name']! as String, json['description'] as String? ?? '');
    } else {
      throw UnsupportedError('value is ${json.runtimeType}');
    }
  }

  @override
  Object toJson(JsonEnumValue object) {
    throw UnimplementedError();
  }
}

ChromeApi loadJsonModel(String content) {
  var jsonModel = JsonNamespace.parse(content);
  var enums = jsonModel.types.where((e) => e.enums != null);

  return ChromeApi(
    name: jsonModel.namespace,
    events: jsonModel.events.map((e) => Event(e.name, e.description)).toList(),
    documentation: jsonModel.description,
    properties: {},
    functions: jsonModel.functions
        .map((f) => Method(
              f.name,
              parameters: f.parameters.map(_methodParameter).toList(),
              documentation: f.description,
            ))
        .toList(),
    dictionaries: jsonModel.types
        .map((t) => Dictionary(
              t.id,
              properties: t.properties?.entries
                      .map((e) => _dictionaryProperty(e.key, e.value))
                      .toList() ??
                  [],
              documentation: t.description,
            ))
        .toList(),
    enumerations: enums
        .map((e) => Enumeration(e.id,
            documentation: e.description,
            values: e.enums!
                .map((v) => EnumerationValue(
                    name: v.name, documentation: v.description))
                .toList()))
        .toList(),
  );
}

Property _dictionaryProperty(String name, JsonProperty prop) {
  return Property(
    name,
    typeName: prop.isInstanceOf ?? prop.type ?? prop.$ref ?? 'object',
    isArray: prop.items != null,
    optional: prop.optional ?? false,
    documentation: prop.description,
  );
}

Property _methodParameter(JsonProperty prop) {
  return Property(
    prop.name!,
    typeName: prop.isInstanceOf ?? prop.type ?? prop.$ref ?? 'object',
    isArray: prop.items != null,
    optional: prop.optional ?? false,
    documentation: prop.description,
  );
}
