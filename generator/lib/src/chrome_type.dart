import 'package:code_builder/code_builder.dart' as code;
import 'utils/string.dart';

sealed class ChromeType {
  final bool isNullable;

  ChromeType({required this.isNullable});

  code.Reference get dartType;

  code.Reference get jsType;

  code.Reference get jsTypeReferencedFromDart => jsType;

  code.Expression toJS(code.Expression accessor);

  code.Expression toDart(code.Expression accessor);

  String get questionMark => isNullable ? '?' : '';

  ChromeType copyWith({required bool isNullable});

  static ChromeType? tryParse(String input, {required bool isNullable}) {
    return PrimitiveType.tryParse(input, isNullable: isNullable) ??
        WebType.tryParse(input, isNullable: isNullable) ??
        JSFunctionType.tryParse(input, isNullable: isNullable) ??
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
  code.Expression toDart(code.Expression accessor) {
    return accessor;
  }

  @override
  code.Expression toJS(code.Expression accessor) {
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

  @override
  ChromeType copyWith({required bool isNullable}) =>
      StringType(isNullable: isNullable);
}

class IntegerType extends PrimitiveType {
  IntegerType({required super.isNullable});

  @override
  String get toDartMethod => 'toDartInt';

  @override
  String get dartTypeWithoutNullable => 'int';

  @override
  ChromeType copyWith({required bool isNullable}) =>
      IntegerType(isNullable: isNullable);
}

class DoubleType extends PrimitiveType {
  DoubleType({required super.isNullable});

  @override
  String get toDartMethod => 'toDartDouble';

  @override
  String get dartTypeWithoutNullable => 'double';

  @override
  ChromeType copyWith({required bool isNullable}) =>
      DoubleType(isNullable: isNullable);
}

class BooleanType extends PrimitiveType {
  BooleanType({required super.isNullable});

  @override
  String get dartTypeWithoutNullable => 'bool';

  @override
  ChromeType copyWith({required bool isNullable}) =>
      BooleanType(isNullable: isNullable);
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
  code.Expression toDart(code.Expression accessor) =>
      accessor.nullSafePropertyIf('toDart', isNullable);

  @override
  code.Expression toJS(code.Expression accessor) =>
      accessor.nullSafePropertyIf('toJS', isNullable);

  @override
  ChromeType copyWith({required bool isNullable}) =>
      ArrayBufferType(isNullable: isNullable);
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
  code.Expression toDart(code.Expression accessor) => accessor;

  @override
  code.Expression toJS(code.Expression accessor) => accessor;

  @override
  ChromeType copyWith({required bool isNullable}) =>
      WebType(isNullable: isNullable);
}

class VariousType extends ChromeType {
  VariousType({required super.isNullable});

  static ChromeType? tryParse(String input, {required bool isNullable}) {
    if (const {
      'object',
      'any',
      'Date',
      'binary',
      'InjectedFunction',
      'global',
    }.contains(input)) {
      return VariousType(isNullable: isNullable);
    }
    return null;
  }

  @override
  code.Reference get dartType => code.TypeReference((b) => b
    ..symbol = 'Object'
    ..isNullable = isNullable);

  @override
  code.Reference get jsType => code.TypeReference((b) => b
    ..symbol = 'JSAny'
    ..isNullable = isNullable);

  @override
  code.Expression toDart(code.Expression accessor) => accessor;

  @override
  code.Expression toJS(code.Expression accessor) {
    return accessor.nullSafePropertyIf('toJS', isNullable);
  }

  @override
  ChromeType copyWith({required bool isNullable}) =>
      VariousType(isNullable: isNullable);
}

class JSFunctionType extends ChromeType {
  JSFunctionType({required super.isNullable});

  static ChromeType? tryParse(String input, {required bool isNullable}) {
    if (const {
      'function',
    }.contains(input)) {
      return JSFunctionType(isNullable: isNullable);
    }
    return null;
  }

  @override
  code.Reference get dartType => code.TypeReference((b) => b
    ..symbol = 'JSFunction'
    ..isNullable = isNullable);

  @override
  code.Reference get jsType => dartType;

  @override
  code.Expression toDart(code.Expression accessor) => accessor;

  @override
  code.Expression toJS(code.Expression accessor) => accessor;

  @override
  ChromeType copyWith({required bool isNullable}) =>
      JSFunctionType(isNullable: isNullable);
}

// TODO: replace with LazyType which will do it's resolutation based on a Context
// class only when code-generating
class LocalType extends ChromeType {
  final String name;
  final String? url;
  final String declarationFile;

  LocalType(this.name,
      {this.url, required this.declarationFile, required super.isNullable});

  @override
  ChromeType copyWith({required bool isNullable}) => LocalType(name,
      url: url, declarationFile: declarationFile, isNullable: isNullable);

  static LocalType parse(String input,
      {required String selfFileName, required bool isNullable}) {
    var split = input.split('.');
    String? url;
    if (split.length > 1) {
      url = '${split.first.snakeCase}.dart';
    }
    var name = split.last;

    return LocalType(name,
        declarationFile: selfFileName, isNullable: isNullable, url: url);
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
  code.Reference get jsTypeReferencedFromDart {
    String fullUrl;
    const jsBasePath = 'src/js/';
    if (url case var url?) {
      fullUrl = '$jsBasePath$url';
    } else {
      fullUrl = '$jsBasePath$declarationFile';
    }

    return code.TypeReference((b) => b
      ..symbol = name
      ..isNullable = isNullable
      ..url = fullUrl);
  }

  @override
  code.Expression toDart(code.Expression accessor) {
    if (isNullable) {
      return accessor
          .nullSafeProperty('let')
          .call([code.refer(name).property('fromJS')]);
    } else {
      return code.refer(name).property('fromJS').call([accessor]);
    }
  }

  @override
  code.Expression toJS(code.Expression accessor) {
    return accessor.nullSafePropertyIf('toJS', isNullable);
  }
}

class FunctionType extends ChromeType {
  final ChromeType? returns;
  final List<FunctionParameter> positionalParameters;

  FunctionType(this.returns, this.positionalParameters,
      {required super.isNullable});

  @override
  ChromeType copyWith({required bool isNullable}) =>
      FunctionType(returns, positionalParameters, isNullable: isNullable);

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
  code.Expression toDart(code.Expression accessor) {
    return code.refer('UnimplementedError').call([]).thrown;
  }

  @override
  code.Expression toJS(code.Expression accessor) {
    // Need to wrap with a function taking JS parameters and convert them to Dart
    return code.refer('UnimplementedError').call([]).thrown;
  }
}

class FunctionParameter {
  final String name;
  final ChromeType type;

  FunctionParameter(this.name, this.type);
}

class ListType extends ChromeType {
  final ChromeType item;

  ListType(this.item, {required super.isNullable});

  @override
  ChromeType copyWith({required bool isNullable}) =>
      ListType(item, isNullable: isNullable);

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
  code.Expression toDart(code.Expression accessor) {
    return accessor
        .nullSafePropertyIf('toDart', isNullable)
        .property('cast')
        .call([], {}, [item.jsTypeReferencedFromDart])
        .property('map')
        .call([
          code.Method((b) => b
            ..requiredParameters.add(code.Parameter((b) => b..name = 'e'))
            ..lambda = true
            ..body = item.toDart(code.refer('e')).code).closure
        ])
        .property('toList')
        .call([]);

    // TODO:
    // remove map((e) => e)
    // try to tear-off result (when end with (e))
    // check if cast<int>() is correct or need cast<JSNumber>()
  }

  @override
  code.Expression toJS(code.Expression accessor) {
    return accessor
        .nullSafePropertyIf('toJSArray', isNullable)
        .call([
      code.Method((b) => b
        ..requiredParameters.add(code.Parameter((b) => b..name = 'e'))
        ..lambda = true
        ..body = item.toJS(code.refer('e')).code).closure
    ]);
  }
}

class AliasedType extends ChromeType {
  final String alias;
  final ChromeType original;
  final String declarationFile;

  AliasedType(this.alias, ChromeType original,
      {required this.declarationFile, required bool isNullable})
      : original = original.copyWith(isNullable: isNullable),
        super(isNullable: isNullable);

  @override
  ChromeType copyWith({required bool isNullable}) =>
      AliasedType(alias, original,
          declarationFile: declarationFile, isNullable: isNullable);

  @override
  code.Reference get jsType {
    var originalType = original.jsType;
    if (originalType is code.TypeReference) {
      return originalType.rebuild((b) => b.symbol = alias);
    }
    return originalType;
  }

  @override
  code.Reference get jsTypeReferencedFromDart {
    var originalType = original.jsTypeReferencedFromDart;
    if (originalType is code.TypeReference) {
      return originalType.rebuild((b) => b
        ..symbol = alias
        ..url = 'src/js/$declarationFile');
    }
    return originalType;
  }

  @override
  code.Reference get dartType => jsType;

  @override
  code.Expression toDart(code.Expression accessor) => original.toDart(accessor);

  @override
  code.Expression toJS(code.Expression accessor) => original.toJS(accessor);
}

class AsyncReturnType extends ChromeType {
  final ChromeType? _dart;
  final FunctionType jsCallback;

  AsyncReturnType(this._dart, this.jsCallback)
      : super(isNullable: _dart?.isNullable ?? false);

  @override
  ChromeType copyWith({required bool isNullable}) =>
      AsyncReturnType(_dart, jsCallback);

  @override
  code.Reference get jsType => jsCallback.jsType;

  @override
  code.Reference get dartType => _dart?.dartType ?? code.refer('void');

  @override
  code.Expression toDart(code.Expression accessor) =>
      jsCallback.toDart(accessor);

  @override
  code.Expression toJS(code.Expression accessor) =>
      _dart?.toJS(accessor) ?? accessor;
}

extension on code.Expression {
  code.Expression nullSafePropertyIf(String name, bool isNullable) {
    if (isNullable) {
      return nullSafeProperty(name);
    } else {
      return property(name);
    }
  }
}
