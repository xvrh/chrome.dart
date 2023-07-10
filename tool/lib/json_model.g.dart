// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonNamespace _$JsonNamespaceFromJson(Map<String, dynamic> json) =>
    JsonNamespace(
      namespace: json['namespace'] as String,
      description: json['description'] as String? ?? '',
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, JsonProperty.fromJson(e as Map<String, dynamic>)),
          ) ??
          {},
      functions: (json['functions'] as List<dynamic>?)
              ?.map((e) => JsonFunction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      events: (json['events'] as List<dynamic>?)
              ?.map((e) => JsonFunction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      types: (json['types'] as List<dynamic>?)
              ?.map((e) => JsonDeclaredType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

JsonFunction _$JsonFunctionFromJson(Map<String, dynamic> json) => JsonFunction(
      json['name'] as String,
      json['type'] as String?,
      json['description'] as String? ?? '',
      (json['parameters'] as List<dynamic>?)
              ?.map((e) => JsonProperty.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      json['returns'] == null
          ? null
          : JsonProperty.fromJson(json['returns'] as Map<String, dynamic>),
      json['returns_async'] == null
          ? null
          : JsonProperty.fromJson(
              json['returns_async'] as Map<String, dynamic>),
    );

JsonDeclaredType _$JsonDeclaredTypeFromJson(Map<String, dynamic> json) =>
    JsonDeclaredType(
      json['id'] as String,
      json['description'] as String? ?? '',
      type: json['type'] as String?,
      enums: (json['enum'] as List<dynamic>?)
          ?.map((e) => const _JsonEnumConverter().fromJson(e as Object))
          .toList(),
      properties: (json['properties'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, JsonProperty.fromJson(e as Map<String, dynamic>)),
      ),
    );

JsonProperty _$JsonPropertyFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'name',
      'type',
      'minimum',
      'maximum',
      'minLength',
      'maxLength',
      'optional',
      'value',
      'description',
      'deprecated',
      r'$ref',
      'properties',
      'parameters',
      'choices',
      'items',
      'enum',
      'isInstanceOf',
      'additionalProperties',
      'extension_types',
      'nodoc',
      'maxItems',
      'minItems',
      'platforms',
      'preserveNull',
      'serialized_type',
      'min_version'
    ],
  );
  return JsonProperty(
    json['name'] as String?,
    json['type'] as String?,
    json['minimum'] as num?,
    json['maximum'] as num?,
    json['minLength'] as int?,
    json['maxLength'] as int?,
    json['optional'] as bool?,
    json['description'] as String? ?? '',
    json['deprecated'] as String?,
    json[r'$ref'] as String?,
    (json['properties'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, JsonProperty.fromJson(e as Map<String, dynamic>)),
    ),
    json['value'],
    json['isInstanceOf'] as String?,
    json['additionalProperties'] == null
        ? null
        : JsonProperty.fromJson(
            json['additionalProperties'] as Map<String, dynamic>),
    (json['parameters'] as List<dynamic>?)
        ?.map((e) => JsonProperty.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['items'] == null
        ? null
        : JsonProperty.fromJson(json['items'] as Map<String, dynamic>),
    (json['extension_types'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    json['nodoc'],
    (json['choices'] as List<dynamic>?)
        ?.map((e) => JsonProperty.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['maxItems'] as int?,
    json['minItems'] as int?,
    (json['enum'] as List<dynamic>?)
        ?.map((e) => const _JsonEnumConverter().fromJson(e as Object))
        .toList(),
    (json['platforms'] as List<dynamic>?)?.map((e) => e as String).toList(),
    json['preserveNull'] as bool?,
    json['serialized_type'] as String?,
    json['min_version'] as String?,
  );
}
