import 'package:dart_style/dart_style.dart';
import 'package:code_builder/code_builder.dart';
import '../src/utils.dart';
import 'chrome_model.dart' as model;
import 'comment.dart';
import 'utils/split_words.dart';
import 'utils/string_helpers.dart';

const _dartInteropUrl = 'dart:js_interop';
const _sharedCodeUrl = 'chrome.dart';

final _formatter = DartFormatter();

class _GeneratorBase {
  final model.ChromeApi api;

  _GeneratorBase(this.api);

  String get _apiName => api.name.split('.').map(titleCase).join('');

  String get _apiNameCamelCase => lowerCamel(splitWords(_apiName));
}

class JsBindingGenerator extends _GeneratorBase {
  JsBindingGenerator(super.api);

  String get bindingClassName => 'JS$_apiName';

  String _bindingName(model.TypeRef ref) =>
      ref.isArray ? 'JSArray' : _toJsName(ref.name);
  String? _bindingUrl(model.TypeRef ref) => ref.isArray ? null : ref.url;

  static String _toJsName(String type) {
    return const {
          'integer': 'int',
          'long': 'int',
          'number': 'num',
          'boolean': 'bool',
          'DOMString': 'String',
          'string': 'String',
          'object': 'JSObject',
          'ArrayBuffer': 'JSArrayBuffer',
          'any': 'JSAny',
          'function': 'JSFunction',
          'InjectedFunction': 'JSFunction',
          'Date': 'JSObject', //TODO(xha): convert to a dart DateTime?
          'binary': 'JSAny', //TODO: JSArrayBuffer ??
          //TODO(xha): link to "package:web"?
          'HTMLElement': 'JSObject',
          'Window': 'JSObject',
          'SubtleCrypto': 'JSObject',
          'Blob': 'JSObject',
        }[type] ??
        type;
  }

  String toCode() {
    final library = Library((b) => b
      ..directives.add(Directive.export('chrome.dart'))
      ..body.addAll([
        Extension((b) => b
          ..name = 'JSChrome${bindingClassName}Extension'
          ..on = refer('JSChrome', 'chrome.dart')
          ..methods.add(Method((b) => b
            ..docs.add(documentationComment(api.documentation, indent: 2))
            ..external = true
            ..returns = refer(bindingClassName)
            ..name = _apiNameCamelCase
            ..type = MethodType.getter))),
        Class((b) => b
          ..annotations.addAll([_jsAnnotation(), _staticInteropAnnotation()])
          ..name = bindingClassName),
        Extension((b) => b
          ..name = '${bindingClassName}Extension'
          ..on = refer(bindingClassName)
          ..methods.addAll(api.functions.map(_function))
          ..methods.addAll(api.events.map(_event))
          ..methods.addAll(api.properties.map(_property))),
        for (var type in api.enumerations)
          TypeDef((b) => b
            ..name = type.name
            ..docs.add(documentationComment(type.documentation, indent: 0))
            ..definition = refer('String')),
        for (var type in api.dictionaries) ..._dictionary(type),
      ]));

    final emitter = DartEmitter(allocator: Allocator());
    return _formatter.format('${library.accept(emitter)}');
  }

  Method _function(model.Method method) {
    var parameters = method.parameters
        .map((p) => Parameter((b) => b
          ..name = p.name
          ..type = refer('${_bindingName(p.type)}${p.optional ? '?' : ''}',
              _bindingUrl(p.type))))
        .toList();

    Reference returns;
    if (method.returns.isAsync && method.returns.supportPromise) {
      returns = refer('JSPromise', _dartInteropUrl);
    } else if (!method.returns.isAsync) {
      returns = refer(
          _bindingName(method.returns.type), _bindingUrl(method.returns.type));
    } else {
      returns = refer('void');
      parameters.add(Parameter((b) => b
        ..name = method.returns.name ?? 'callback'
        ..type = refer('JSFunction')));
    }

    return Method((b) => b
      ..docs.add(documentationComment(method.documentation, indent: 2))
      ..name = method.name
      ..external = true
      ..returns = returns
      ..requiredParameters.addAll(parameters));
  }

  Method _event(model.Event event) {
    return Method((b) => b
      ..name = event.name
      ..docs.add(documentationComment(event.documentation, indent: 2))
      ..external = true
      ..returns = refer('ChromeEvent', _sharedCodeUrl)
      ..type = MethodType.getter);
  }

  Method _property(model.Property prop) {
    return Method((b) => b
      ..name = prop.name
      ..returns = refer(_bindingName(prop.type), _bindingUrl(prop.type))
      ..docs.add(documentationComment(prop.documentation, indent: 2))
      ..external = true
      ..type = MethodType.getter);
  }

  Iterable<Spec> _dictionary(model.Dictionary type) sync* {
    if (type.isAnonymous) {
      yield Class((b) => b
        ..annotations.addAll([
          _jsAnnotation(),
          _staticInteropAnnotation(),
          _anonymousAnnotation()
        ])
        ..name = type.name
        ..constructors.add(Constructor((b) => b
          ..external = true
          ..factory = true
          ..optionalParameters
              .addAll(type.properties.map(_typePropertyAsParameter)))));
    } else {
      yield Class((b) => b
        ..annotations.addAll([_jsAnnotation(), _staticInteropAnnotation()])
        ..name = type.name);
      yield Extension((b) => b
        ..name = '${type.name}Extension'
        ..on = refer(type.name)
        ..fields.addAll(type.properties.map(_typeProperty))
        ..methods.addAll(type.methods.map(_function))
        ..methods.addAll(type.events.map(_event)));
    }
  }

  Field _typeProperty(model.Property property) {
    return Field((b) => b
      ..docs.add(documentationComment(property.documentation, indent: 2))
      ..name = property.name
      ..external = true
      ..type = refer(
          '${_bindingName(property.type)}${property.optional ? '?' : ''}',
          _bindingUrl(property.type)));
  }

  Parameter _typePropertyAsParameter(model.Property property) {
    return Parameter((b) => b
      ..docs.add(documentationComment(property.documentation, indent: 2))
      ..name = property.name
      ..named = true
      ..type = refer(
          '${_bindingName(property.type)}${property.optional ? '?' : ''}',
          _bindingUrl(property.type)));
  }
}

class DartApiGenerator extends _GeneratorBase {
  DartApiGenerator(super.api);

  String get mainClassName => 'Chrome$_apiName';

  String toCode() {
    final library = Library((b) => b
      ..directives.add(Directive.export('chrome.dart'))
      ..body.addAll([
        Field((b) => b
          ..name = '_$_apiNameCamelCase'
          ..modifier = FieldModifier.final$
          ..assignment = refer(mainClassName).property('_').call([]).code),
        Extension((b) => b
          ..name = '${mainClassName}Extension'
          ..on = refer('Chrome', _sharedCodeUrl)
          ..methods.add(Method((b) => b
            ..returns = refer(mainClassName)
            ..name = _apiNameCamelCase
            ..lambda = true
            ..body = Code('_$_apiNameCamelCase')
            ..type = MethodType.getter))),
        Class((b) => b
          ..name = mainClassName
          ..constructors.add(Constructor((c) => c.name = '_'))
          ..methods.addAll(api.functions.map(_function))
          //..methods.addAll(api.properties.map(_property))
          ..methods.addAll(api.events.map(_event))),
        for (var enumeration in api.enumerations) _enum(enumeration),
      ]));

    final emitter = DartEmitter(allocator: Allocator());
    return _formatter.format('${library.accept(emitter)}');
  }

  Method _function(model.Method method) {
    return Method((b) => b
      ..docs.add(documentationComment(method.documentation, indent: 2))
      ..name = method.name
      ..returns = refer('void')
      ..body = const Code('throw UnimplementedError()')
      ..lambda = true
      ..requiredParameters.addAll(
          method.parameters.map((p) => Parameter((b) => b..name = p.name))));
  }

  Method _event(model.Event event) {
    return Method((b) => b
      ..name = event.name
      ..docs.add(documentationComment(event.documentation, indent: 2))
      ..returns = refer('Stream', _sharedCodeUrl)
      ..body = const Code('throw UnimplementedError()')
      ..lambda = true
      ..type = MethodType.getter);
  }

  Method _property(model.Property prop) {
    return Method((b) => b
      ..name = prop.name
      ..returns = refer(prop.type.name, prop.type.url)
      ..docs.add(documentationComment(prop.documentation, indent: 2))
      ..external = true
      ..type = MethodType.getter);
  }

  Enum _enum(model.Enumeration enumeration) {
    return Enum((b) => b
      ..name = enumeration.name
      ..docs.add(documentationComment(enumeration.documentation, indent: 0))
      ..fields.add(Field((b) => b
        ..name = 'value'
        ..type = refer('String')
        ..modifier = FieldModifier.final$))
      ..constructors.add(Constructor((b) => b
        ..constant = true
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'value'
          ..toThis = true))))
      ..values.addAll(enumeration.values.map((v) => EnumValue((b) => b
        ..name = _toEnumValue(v.name)
        ..arguments.add(literal(v.name))
        ..docs.addAll([
          if (v.documentation.isNotEmpty)
            documentationComment(v.documentation, indent: 2)
        ])))));
  }
}

Expression _staticInteropAnnotation() =>
    refer('staticInterop', _dartInteropUrl);

Expression _anonymousAnnotation() => refer('anonymous', _dartInteropUrl);
Expression _jsAnnotation([String? name]) =>
    refer('JS', _dartInteropUrl).call([if (name != null) literalString(name)]);

String _toEnumValue(String input) {
  input = lowerCamel(splitWords(input).map((e) => e.toLowerCase()));

  return preventKeywords(input);
}

const Set<String> _dartKeywords = {
  'abstract', 'deferred', 'if', 'super',
  'as', 'do', 'implements', 'switch',
  'assert', 'dynamic', 'import', 'sync',
  'async', 'else', 'in', 'this',
  'enum', 'is', 'throw',
  'await', 'export', 'library', 'true',
  'break', 'external', 'new', 'try',
  'case', 'extends', 'null', 'typedef',
  'catch', 'factory', 'operator', 'var',
  'class', 'false', 'part', 'void',
  'const', 'final', 'rethrow', 'while',
  'continue', 'finally', 'return', 'with',
  'covariant', 'for', 'yield',
  'default', 'static' //
};

String preventKeywords(String input) {
  if (_dartKeywords.contains(input)) {
    return '$input\$';
  } else {
    return input;
  }
}
