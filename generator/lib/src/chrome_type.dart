import 'package:code_builder/code_builder.dart' as code;
import 'chrome_model.dart';
import 'utils/string.dart';

class Context {
  final apis = <ChromeApi>[];
  final _lazyTypes = <LazyType>[];

  void resolveLazyTypes() {
    for (var type in _lazyTypes) {
      type.resolve(apis);
    }
  }

  ChromeType createType(String input,
      {required String locationFile, required bool isNullable}) {
    var split = input.split('.');
    String? prefix;
    if (split.length > 1) {
      prefix = split.first;
    }
    var name = split.last;

    if (prefix == null) {
      var primitive = _PrimitiveType.tryParse(input, isNullable: isNullable);
      if (primitive != null) {
        return primitive;
      }
    }
    return LazyType(
        context: this,
        name: name,
        prefix: prefix,
        locationFile: locationFile,
        isNullable: isNullable);
  }
}

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

  var _ = "";
  //static ChromeType? tryParse(String input, {required bool isNullable}) {
  //  return PrimitiveType.tryParse(input, isNullable: isNullable) ??
  //      WebType.tryParse(input, isNullable: isNullable) ??
  //      JSFunctionType.tryParse(input, isNullable: isNullable) ??
  //      VariousType.tryParse(input, isNullable: isNullable);
  //}
}

class LazyType extends ChromeType {
  final Context context;
  final String name;
  final String? prefix;
  final String locationFile;
  ChromeType? _resolved;

  LazyType({
    required this.context,
    required this.name,
    required this.prefix,
    required this.locationFile,
    required bool isNullable,
  }) : super(isNullable: isNullable) {
    context._lazyTypes.add(this);
  }

  @override
  ChromeType copyWith({required bool isNullable}) {
    if (_resolved case var resolved?) {
      return resolved.copyWith(isNullable: isNullable);
    } else {
      return LazyType(
          context: context,
          name: name,
          prefix: prefix,
          locationFile: locationFile,
          isNullable: isNullable);
    }
  }

  String? get _prefixUrl => prefix != null ? '${prefix!.snakeCase}.dart' : null;

  void resolve(List<ChromeApi> apis) {
    _resolved = _resolve(apis);
  }

  ChromeType _resolve(List<ChromeApi> apis) {
    ChromeType? searchTypeInApi(String name, ChromeApi api) {
      for (var dict in api.dictionaries) {
        if (dict.name == name) {
          return DictionaryType(name,
              url: _prefixUrl,
              locationFile: locationFile,
              isNullable: isNullable);
        }
      }
      if (api.enumerations.any((e) => e.name == name)) {
        return EnumType(name,
            url: _prefixUrl,
            locationFile: locationFile,
            isNullable: isNullable);
      }
      for (var typedef in api.typedefs) {
        if (typedef.alias == name) {
          return AliasedType(name, typedef.target,
              url: _prefixUrl,
              locationFile: locationFile, isNullable: isNullable);
        }
      }
      return null;
    }

    ChromeType? tryParse(String input) {
      return _WebType.tryParse(input, isNullable: isNullable) ??
          JSFunctionType.tryParse(input, isNullable: isNullable) ??
          _VariousType.tryParse(input, isNullable: isNullable);
    }

    if (prefix != null) {
      for (var api in apis) {
        if (api.group == prefix && api.fileName != locationFile ||
            api.name == prefix) {
          var found = searchTypeInApi(name, api);
          if (found != null) return found;
        }
      }
      throw Exception('Type $name not found');
    } else {
      var thisApi = apis.singleWhere((e) => e.fileName == locationFile);
      var found = searchTypeInApi(name, thisApi) ?? tryParse(name);
      if (found != null) return found;

      throw Exception('Type $name not found');
    }
  }

  @override
  code.Reference get dartType => _resolved!.dartType;

  @override
  code.Reference get jsType => _resolved!.jsType;

  @override
  code.Reference get jsTypeReferencedFromDart =>
      _resolved!.jsTypeReferencedFromDart;

  @override
  code.Expression toDart(code.Expression accessor) =>
      _resolved!.toDart(accessor);

  @override
  code.Expression toJS(code.Expression accessor) => _resolved!.toJS(accessor);
}

sealed class _PrimitiveType extends ChromeType {
  _PrimitiveType({required super.isNullable});

  static ChromeType? tryParse(String input, {required bool isNullable}) {
    return switch (input) {
      'DOMString' || 'string' => _StringType(isNullable: isNullable),
      'integer' || 'long' => _IntegerType(isNullable: isNullable),
      'number' || 'double' => _DoubleType(isNullable: isNullable),
      'boolean' => _BooleanType(isNullable: isNullable),
      'ArrayBuffer' => _ArrayBufferType(isNullable: isNullable),
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
}

class _StringType extends _PrimitiveType {
  _StringType({required super.isNullable});

  @override
  String get dartTypeWithoutNullable => 'String';

  @override
  ChromeType copyWith({required bool isNullable}) =>
      _StringType(isNullable: isNullable);
}

class _IntegerType extends _PrimitiveType {
  _IntegerType({required super.isNullable});

  @override
  String get toDartMethod => 'toDartInt';

  @override
  String get dartTypeWithoutNullable => 'int';

  @override
  ChromeType copyWith({required bool isNullable}) =>
      _IntegerType(isNullable: isNullable);
}

class _DoubleType extends _PrimitiveType {
  _DoubleType({required super.isNullable});

  @override
  String get toDartMethod => 'toDartDouble';

  @override
  String get dartTypeWithoutNullable => 'double';

  @override
  ChromeType copyWith({required bool isNullable}) =>
      _DoubleType(isNullable: isNullable);
}

class _BooleanType extends _PrimitiveType {
  _BooleanType({required super.isNullable});

  @override
  String get dartTypeWithoutNullable => 'bool';

  @override
  ChromeType copyWith({required bool isNullable}) =>
      _BooleanType(isNullable: isNullable);
}

class _ArrayBufferType extends ChromeType {
  _ArrayBufferType({required super.isNullable});

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
      _ArrayBufferType(isNullable: isNullable);
}

class _WebType extends ChromeType {
  _WebType({required super.isNullable});

  static ChromeType? tryParse(String input, {required bool isNullable}) {
    if (const {
      'HTMLElement',
      "Window",
      'SubtleCrypto',
      'Blob',
      'ImageData',
      'LocalMediaStream',
      'DirectoryEntry',
    }.contains(input)) {
      return _WebType(isNullable: isNullable);
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
      _WebType(isNullable: isNullable);
}

class _VariousType extends ChromeType {
  _VariousType({required super.isNullable});

  static ChromeType? tryParse(String input, {required bool isNullable}) {
    if (const {
      'object',
      'any',
      'Date',
      'binary',
      "InjectedFunction",
      'global',
    }.contains(input)) {
      return _VariousType(isNullable: isNullable);
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
      _VariousType(isNullable: isNullable);
}

//TODO: delete this class and replace with FunctionType and correct parameters?
var b = "";

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

abstract class _LocalType extends ChromeType {
  final String name;
  final String? url;
  final String locationFile;

  _LocalType(this.name,
      {this.url, required this.locationFile, required super.isNullable});

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
    return code.TypeReference((b) => b
      ..symbol = name
      ..isNullable = isNullable
      ..url = 'src/js/${url ?? locationFile}');
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

class DictionaryType extends _LocalType {
  DictionaryType(super.name,
      {super.url, required super.locationFile, required super.isNullable});

  @override
  ChromeType copyWith({required bool isNullable}) => DictionaryType(name,
      url: url, locationFile: locationFile, isNullable: isNullable);
}

class EnumType extends _LocalType {
  EnumType(super.name,
      {super.url, required super.locationFile, required super.isNullable});

  @override
  ChromeType copyWith({required bool isNullable}) => EnumType(name,
      url: url, locationFile: locationFile, isNullable: isNullable);
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
    return accessor.nullSafePropertyIf('toJSArray', isNullable).call([
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
  final String locationFile;
  final String? url;

  AliasedType(this.alias, ChromeType original,
      { this.url, required this.locationFile, required bool isNullable})
      : original = original.copyWith(isNullable: isNullable),
        super(isNullable: isNullable);

  @override
  ChromeType copyWith({required bool isNullable}) =>
      AliasedType(alias, original, url: url,
          locationFile: locationFile, isNullable: isNullable);

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
      return originalType.rebuild((b) =>
      b
        ..symbol = alias
        ..url = 'src/js/${url ?? locationFile}');
    }
    return originalType;
  }

  @override
  code.Reference get dartType {
    var originalType = original.jsType;
    if (originalType is code.TypeReference) {
      return originalType.rebuild((b) => b..symbol = alias..url = url);
    }
    return originalType;
  }

  @override
  code.Expression toDart(code.Expression accessor) => original.toDart(accessor);

  @override
  code.Expression toJS(code.Expression accessor) => original.toJS(accessor);
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

class AsyncReturnType extends ChromeType {
  final ChromeType? _dart;
  final FunctionType jsCallback;
  bool supportsPromises = false;

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

class ChoiceType extends ChromeType {
  ChoiceType({required super.isNullable});

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
      ChoiceType(isNullable: isNullable);
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
