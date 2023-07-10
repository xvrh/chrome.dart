import 'package:dart_style/dart_style.dart';
import 'package:code_builder/code_builder.dart';
import '../src/utils.dart';
import 'chrome_model.dart' as model;
import 'comment.dart';
import 'utils/split_words.dart';
import 'utils/string_helpers.dart';

const _dartInteropUrl = 'dart:js_interop';
const _sharedCodeUrl = 'chrome.dart';

class CodeGenerator {
  final model.ChromeApi api;
  final _formatter = DartFormatter();

  CodeGenerator(this.api);

  String get apiClassName => 'Chrome${_apiName}';

  String get bindingClassName => 'JS${_apiName}';

  String get _apiName => api.name.split('.').map(titleCase).join('');

  String get _apiNameCamelCase => lowerCamel(splitWords(_apiName));

  String jsBinding() {
    final library = Library((b) => b
      ..directives.add(Directive.export('chrome.dart'))
      ..body.addAll([
        Extension((b) => b
          ..name = 'JSChrome${bindingClassName}Extension'
          ..on = refer('JSChrome', 'chrome.dart')
          ..methods.add(_bindingAccessor())),
        Class((b) => b
          ..annotations.addAll([_jsAnnotation(), _staticInteropAnnotation()])
          ..name = bindingClassName),
        Extension((b) => b
          ..name = '${bindingClassName}Extension'
          ..on = refer(bindingClassName)
          ..methods.addAll(api.functions.map(_bindingFunction))
          ..methods.addAll(api.events.map(_bindingEvent))),
        for (var type in api.enumerations)
          TypeDef((b) => b
            ..name = type.name
            ..docs.add(documentationComment(type.documentation, indent: 0))
            ..definition = refer('JSString')),
        for (var type in api.dictionaries) ..._bindingDictionary(type),
      ]));

    final emitter = DartEmitter(allocator: Allocator());
    return _formatter.format('${library.accept(emitter)}');
  }

  Method _bindingFunction(model.Method method) {
    var parameters = method.parameters
        .map((p) => Parameter((b) => b
          ..name = p.name
          ..type = refer(p.type.bindingName, p.type.url)))
        .toList();

    Reference returns;
    if (method.returns.isAsync && method.returns.supportPromise) {
      returns = refer('JSPromise', _dartInteropUrl);
    } else if (!method.returns.isAsync) {
      returns = refer(method.returns.type.bindingName, method.returns.type.url);
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

  Method _bindingEvent(model.Event event) {
    return Method((b) => b
      ..name = event.name
      ..docs.add(documentationComment(event.documentation, indent: 2))
      ..external = true
      ..returns = refer('ChromeEvent', _sharedCodeUrl)
      ..type = MethodType.getter);
  }

  Method _bindingAccessor() => Method((b) => b
    ..docs.add(documentationComment(api.documentation, indent: 2))
    ..external = true
    ..returns = refer(bindingClassName)
    ..name = _apiNameCamelCase
    ..type = MethodType.getter);

  Iterable<Spec> _bindingDictionary(model.Dictionary type) sync* {
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
          ..requiredParameters
              .addAll(type.properties.map(_bindingTypePropertyAsParameter)))));
    } else {
      yield Class((b) => b
        ..annotations.addAll([_jsAnnotation(), _staticInteropAnnotation()])
        ..name = type.name);
      yield Extension((b) => b
        ..name = '${type.name}Extension'
        ..on = refer(type.name)
        ..methods.addAll(type.properties.map(_bindingTypeProperty)));
    }
  }

  Method _bindingTypeProperty(model.Property property) {
    return Method((b) => b
      ..docs.add(documentationComment(property.documentation, indent: 2))
      ..name = property.name
      ..external = true
      ..returns = refer(
          '${property.type.bindingName}${property.optional ? '?' : ''}',
          property.type.url)
      ..type = MethodType.getter);
  }

  Parameter _bindingTypePropertyAsParameter(model.Property property) {
    return Parameter((b) => b
      ..docs.add(documentationComment(property.documentation, indent: 2))
      ..name = property.name
      ..type = refer(
          '${property.type.bindingName}${property.optional ? '?' : ''}',
          property.type.url));
  }

  String highLevelApi() {
    final library = Library((b) => b
      ..directives.add(Directive.export('chrome.dart'))
      ..body.addAll([
        Field((b) => b
          ..name = '_${_apiNameCamelCase}'
          ..modifier = FieldModifier.final$
          ..assignment = refer(apiClassName).property('_').call([]).code),
        Extension((b) => b
          ..name = 'Chrome${apiClassName}Extension'
          ..on = refer('Chrome', _sharedCodeUrl)
          ..methods.add(Method((b) => b
            ..returns = refer(apiClassName)
            ..name = _apiNameCamelCase
            ..lambda = true
            ..body = Code('_${_apiNameCamelCase}')
            ..type = MethodType.getter))),
        Class((b) => b
          ..name = apiClassName
          ..constructors.add(Constructor((c) => c.name = '_'))
          ..methods.addAll(api.functions.map(_highLevelFunction))
          ..methods.addAll(api.events.map(_highLevelEvent))),
        for (var enumeration in api.enumerations)
          Enum((b) => b
            ..name = enumeration.name
            ..docs
                .add(documentationComment(enumeration.documentation, indent: 0))
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
              ]))))),
      ]));

    final emitter = DartEmitter(allocator: Allocator());
    return _formatter.format('${library.accept(emitter)}');
  }

  Method _highLevelFunction(model.Method method) {
    return Method((b) => b
      ..docs.add(documentationComment(method.documentation, indent: 2))
      ..name = method.name
      ..returns = refer('void')
      ..body = const Code('throw UnimplementedError()')
      ..lambda = true
      ..requiredParameters.addAll(
          method.parameters.map((p) => Parameter((b) => b..name = p.name))));
  }

  Method _highLevelEvent(model.Event event) {
    return Method((b) => b
      ..name = event.name
      ..docs.add(documentationComment(event.documentation, indent: 2))
      ..returns = refer('Stream', _sharedCodeUrl)
      ..body = const Code('throw UnimplementedError()')
      ..lambda = true
      ..type = MethodType.getter);
  }

  Expression _staticInteropAnnotation() =>
      refer('staticInterop', _dartInteropUrl);

  Expression _anonymousAnnotation() => refer('anonymous', _dartInteropUrl);
  Expression _jsAnnotation([String? name]) => refer('JS', _dartInteropUrl)
      .call([if (name != null) literalString(name)]);
}

String _toEnumValue(String input) {
  input = lowerCamel(splitWords(input));

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
