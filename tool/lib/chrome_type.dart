import 'package:code_builder/code_builder.dart' as code;

import 'utils/string_helpers.dart';

const jsBindingRecognizableUrl = '_js_binding.dart';

sealed class ChromeType {
  final bool isNullable;

  ChromeType({required this.isNullable});

  code.Reference get dartType;

  code.Reference get jsType;

  String toJS(String accessor);

  String toDart(String accessor);

  String get questionMark => isNullable ? '?' : '';

  static ChromeType? tryParse(String input, {required bool isNullable}) {
    return PrimitiveType.tryParse(input, isNullable: isNullable) ??
        WebType.tryParse(input, isNullable: isNullable) ??
        VariousType.tryParse(input, isNullable: isNullable);
  }
}

sealed class PrimitiveType extends ChromeType {
  PrimitiveType({required super.isNullable});

  static ChromeType? tryParse(String input, {required bool isNullable}) {
    return switch (input) {
      'DOMString' || 'string' => StringType(isNullable: isNullable),
      'integer' || 'long' => IntegerType(isNullable: isNullable),
      'number' || 'double' => DoubleType(isNullable: isNullable),
      'boolean' => BooleanType(isNullable: isNullable),
      'ArrayBuffer' => ArrayBufferType(isNullable: isNullable),
      _ => null,
    };
  }

  String get toDartMethod => 'toDart';

  String get dartTypeWithoutNullable;

  @override
  code.Reference get dartType => code.TypeReference((b) => b
    ..symbol = dartTypeWithoutNullable
    ..isNullable = isNullable);

  // Primitive types are converted automatically
  @override
  code.Reference get jsType => dartType;

  @override
  String toDart(String accessor) {
    return accessor;
  }

  @override
  String toJS(String accessor) {
    return accessor;
  }

  @override
  String toDartFromExternal(String accessor) {
    return '$accessor$questionMark.$toDartMethod';
  }

  @override
  String toJSFromExternal(String accessor) {
    return '$accessor$questionMark.toJS';
  }
}

class StringType extends PrimitiveType {
  StringType({required super.isNullable});

  @override
  String get dartTypeWithoutNullable => 'String';
}

class IntegerType extends PrimitiveType {
  IntegerType({required super.isNullable});

  @override
  String get toDartMethod => 'toDartInt';

  @override
  String get dartTypeWithoutNullable => 'int';
}

class DoubleType extends PrimitiveType {
  DoubleType({required super.isNullable});

  @override
  String get toDartMethod => 'toDartDouble';

  @override
  String get dartTypeWithoutNullable => 'double';
}

class BooleanType extends PrimitiveType {
  BooleanType({required super.isNullable});

  @override
  String get dartTypeWithoutNullable => 'bool';
}

class ArrayBufferType extends ChromeType {
  ArrayBufferType({required super.isNullable});

  @override
  code.Reference get dartType => code.TypeReference((b) => b
    ..symbol = 'ByteBuffer'
    ..url = 'dart:typed_data'
    ..isNullable = isNullable);

  @override
  code.Reference get jsType => code.TypeReference((b) => b
    ..symbol = 'JSArrayBuffer'
    ..isNullable = isNullable);

  @override
  String toDart(String accessor) => '$accessor$questionMark.toDart';

  @override
  String toJS(String accessor) => '$accessor$questionMark.toJS';
}

class WebType extends ChromeType {
  WebType({required super.isNullable});

  static ChromeType? tryParse(String input, {required bool isNullable}) {
    if (const {
      'HTMLElement',
      'Window',
      'SubtleCrypto',
      'Blob',
      'ImageData',
      'LocalMediaStream'
    }.contains(input)) {
      return WebType(isNullable: isNullable);
    }
    return null;
  }

  //TODO: point to package:web at some point
  @override
  code.Reference get dartType => code.TypeReference((b) => b
    ..symbol = 'JSObject'
    ..isNullable = isNullable);

  @override
  code.Reference get jsType => dartType;

  @override
  String toDart(String accessor) => accessor;

  @override
  String toJS(String accessor) => accessor;
}

class VariousType extends ChromeType {
  VariousType({required super.isNullable});

  static ChromeType? tryParse(String input, {required bool isNullable}) {
    if (const {
      'object',
      'any',
      'Date',
      'binary',
      'function',
      'InjectedFunction',
      'global',
    }.contains(input)) {
      return VariousType(isNullable: isNullable);
    }
    return null;
  }

  @override
  code.Reference get dartType => code.TypeReference((b) => b
    ..symbol = 'JSAny'
    ..isNullable = isNullable);

  @override
  code.Reference get jsType => dartType;

  @override
  String toDart(String accessor) => accessor;

  @override
  String toJS(String accessor) => accessor;
}

class LocalType extends ChromeType {
  final String name;
  final String? url;

  LocalType(this.name, {this.url, required super.isNullable});

  static LocalType parse(String input, {required bool isNullable}) {
    var split = input.split('.');
    String? url;
    if (split.length > 1) {
      url = '${stringToSnakeCase(split.first)}.dart';
    }
    var name = split.last;

    return LocalType(name, isNullable: isNullable, url: url);
  }

  @override
  code.Reference get dartType => code.TypeReference((b) => b
    ..symbol = name
    ..isNullable = isNullable
    ..url = url);

  @override
  code.Reference get jsType => code.TypeReference((b) => b
    ..symbol = name
    ..isNullable = isNullable
    ..url = url);

  @override
  String toDart(String accessor) {
    if (isNullable) {
      return '$accessor?.let($name.fromJS)';
    } else {
      return '$name.fromJS($accessor)';
    }
  }

  @override
  String toJS(String accessor) {
    return '$accessor$questionMark.toJS';
  }
}

class FunctionType extends ChromeType {
  final ChromeType? returns;
  final List<FunctionParameter> positionalParameters;

  FunctionType(this.returns, this.positionalParameters,
      {required super.isNullable});

  @override
  code.Reference get jsType => code.TypeReference((b) => b
    ..symbol = 'JSFunction'
    ..isNullable = isNullable);

  @override
  code.Reference get dartType {
    return code.FunctionType((b) => b
      ..returnType = returns?.dartType ?? code.refer('void')
      ..requiredParameters
          .addAll(positionalParameters.map((p) => p.type.dartType))
      ..isNullable = isNullable);
  }

  @override
  String toDart(String accessor) {
    return 'throw UnimplementedError()';
  }

  @override
  String toJS(String accessor) {
    // Need to wrap with a function taking JS parameters and convert them to Dart
    return 'throw UnimplementedError()';
  }
}

class FunctionParameter {
  final String? name;
  final ChromeType type;

  FunctionParameter(this.name, this.type);
}

class ListType extends ChromeType {
  final ChromeType item;

  ListType(this.item, {required super.isNullable});

  @override
  code.Reference get jsType => code.TypeReference((b) => b
    ..symbol = 'JSArray'
    ..isNullable = isNullable);

  @override
  code.Reference get dartType {
    return code.TypeReference((b) => b
      ..symbol = 'List'
      ..isNullable = isNullable
      ..types.add(item.dartType));
  }

  @override
  String toDart(String accessor) {
    // '$accessor${isNullable ? '?' : ''}.toDart.map((JSAny? e) => e! as $elementType).toList()';
    return 'throw UnimplementedError()';
  }

  @override
  String toJS(String accessor) {
    // Need to wrap with a function taking JS parameters and convert them to Dart
    return 'throw UnimplementedError()';
  }
}

class AliasedType extends ChromeType {
  final String alias;
  final ChromeType original;

  AliasedType(this.alias, this.original, {required bool isNullable})
      : super(isNullable: isNullable);

  @override
  code.Reference get jsType => code.TypeReference((b) => b
    ..symbol = alias
    ..isNullable = isNullable);

  @override
  code.Reference get dartType => jsType;

  @override
  String toDart(String accessor) => original.toDart(accessor);

  @override
  String toJS(String accessor) => original.toJS(accessor);
}

class AsyncReturnType extends ChromeType {
  final ChromeType? _dart;
  final FunctionType _js;

  AsyncReturnType(this._dart, this._js)
      : super(isNullable: _dart?.isNullable ?? false);

  @override
  code.Reference get jsType => _js.jsType;

  @override
  code.Reference get dartType {
    return code.TypeReference((b) => b
      ..symbol = 'Future'
      ..types.add(_dart?.dartType ?? code.refer('void')));
  }

  @override
  String toDart(String accessor) => _js.toDart(accessor);

  @override
  String toJS(String accessor) => _dart?.toJS(accessor) ?? accessor;
}
