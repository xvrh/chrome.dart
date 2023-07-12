import 'package:dart_style/dart_style.dart';
import 'package:code_builder/code_builder.dart';
import '../src/utils.dart';
import 'chrome_model.dart' as model;
import 'comment.dart';
import 'utils/split_words.dart';
import 'utils/string_helpers.dart';

const _dartInteropUrl = 'dart:js_interop';
const _sharedBinding = 'chrome.dart';
const _internalHelpers = 'src/internal_helpers.dart';
const _jsPrefix = r'$js';

final _formatter = DartFormatter();

String apiNameToFileName(String name) {
  name = name.replaceAll('.', '_');
  name = name.replaceAllMapped(
      RegExp(r"[A-Z]"), (Match m) => "_${m.group(0)!.toLowerCase()}");
  return name;
}

class _GeneratorBase {
  final String initialName;
  final model.ChromeApi api;

  _GeneratorBase(this.api, this.initialName);

  String get _apiName => api.name.split('.').map(firstLetterUpper).join('');

  String get _apiNameCamelCase => lowerCamel(splitWords(_apiName));
}

class JsBindingGenerator extends _GeneratorBase {
  JsBindingGenerator(super.api, super.initialName);

  String get bindingClassName => 'JS$_apiName';

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
        for (var type in api.typedefs)
          TypeDef((b) => b
            ..name = type.alias
            ..docs.add(documentationComment(type.documentation, indent: 0))
            ..definition = type.target.jsType),
        for (var type in api.dictionaries.where((d) => !d.isSyntheticEvent))
          ..._dictionary(type),
      ]));

    final emitter =
        DartEmitter(allocator: Allocator(), useNullSafetySyntax: true);
    return _formatter.format('${library.accept(emitter)}');
  }

  Method _function(model.Method method) {
    var parameters = method.parameters
        .map((p) => Parameter((b) => b
          ..name = p.name
          ..type = p.type.jsType))
        .toList();

    Reference returns;
    if (!method.returns.isAsync) {
      returns = method.returns.type?.jsType ?? refer('void');
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
      ..returns = refer('ChromeEvent', _sharedBinding)
      ..type = MethodType.getter);
  }

  Method _property(model.Property prop) {
    return Method((b) => b
      ..name = prop.name
      ..returns = prop.type.jsType
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
      ..type = property.type.jsType);
  }

  Parameter _typePropertyAsParameter(model.Property property) {
    return Parameter((b) => b
      ..docs.add(documentationComment(property.documentation, indent: 2))
      ..name = property.name
      ..named = true
      ..type = property.type.jsType);
  }

  Expression _staticInteropAnnotation() =>
      refer('staticInterop', _dartInteropUrl);

  Expression _anonymousAnnotation() => refer('anonymous', _dartInteropUrl);
  Expression _jsAnnotation([String? name]) => refer('JS', _dartInteropUrl)
      .call([if (name != null) literalString(name)]);
}

class DartApiGenerator extends _GeneratorBase {
  DartApiGenerator(super.api, super.initialName);

  String get mainClassName => 'Chrome$_apiName';

  String toCode() {
    final library = Library((b) => b
      ..directives.add(Directive.import(
          'src/js/${apiNameToFileName(initialName)}.dart',
          as: _jsPrefix))
      ..directives.add(Directive.export('chrome.dart'))
      ..body.addAll([
        Field((b) => b
          ..name = '_$_apiNameCamelCase'
          ..modifier = FieldModifier.final$
          ..assignment = refer(mainClassName).property('_').call([]).code),
        Extension((b) => b
          ..name = '${mainClassName}Extension'
          ..on = refer('Chrome', _internalHelpers)
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
          ..methods.addAll(api.properties.map(_property))
          ..methods.addAll(api.events.map(_event))),
        for (var enumeration in api.enumerations) _enum(enumeration),
        for (var type in api.typedefs)
          TypeDef((b) => b
            ..name = type.alias
            ..docs.add(documentationComment(type.documentation, indent: 0))
            ..definition = type.target.dartType),
        for (var type in api.dictionaries) ..._dictionary(type),
      ]));

    final emitter =
        DartEmitter(allocator: Allocator(), useNullSafetySyntax: true);
    return _formatter.format('${library.accept(emitter)}');
  }

  Method _function(model.Method method) {
    var returns = method.returns.type?.dartType ?? refer('void');

    return Method((b) => b
      ..docs.add(documentationComment(method.documentation, indent: 2))
      ..name = method.name
      ..returns = returns
      ..body = const Code('throw UnimplementedError()')
      ..lambda = true
      ..requiredParameters
          .addAll(method.parameters.map((p) => Parameter((b) => b
            ..name = p.name
            ..type = p.type.dartType))));
  }

  Method _event(model.Event event) {
    return Method((b) => b
      ..name = event.name
      ..docs.add(documentationComment(event.documentation, indent: 2))
      ..returns = TypeReference((b) => b
        ..symbol = 'Stream'
        ..types.add(event.type?.dartType ?? refer('void')))
      ..body = const Code('throw UnimplementedError()')
      ..lambda = true
      ..type = MethodType.getter);
  }

  Method _property(model.Property prop) {
    return Method((b) => b
      ..name = lowerCamel(splitWords(prop.name))
      ..returns = prop.type.dartType
      ..docs.add(documentationComment(prop.documentation, indent: 2))
      ..type = MethodType.getter
      //TODO: make the conversion
      ..body = Code(
          "${'$_jsPrefix.chrome.$_apiNameCamelCase.${prop.name} as dynamic'}")
      ..lambda = true);
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
        ]))))
      ..methods.add(Method((b) => b
        ..name = 'toJS'
        ..type = MethodType.getter
        ..lambda = true
        ..returns = refer('String')
        ..body = Code('value')))
      ..methods.add(Method((b) => b
        ..name = 'fromJS'
        ..static = true
        ..returns = refer(enumeration.name)
        ..lambda = true
        ..requiredParameters.add(Parameter((b) => b
          ..name = 'value'
          ..type = refer('String')))
        ..body = Code('values.firstWhere((e) => e.value == value)'))));
  }

  Iterable<Spec> _dictionary(model.Dictionary type) sync* {
    yield Class((b) {
      b.name = type.name;

      if (!type.isSyntheticEvent) {
        b
          ..fields.add(Field((b) => b
            ..name = '_wrapped'
            ..modifier = FieldModifier.final$
            ..type = refer('$_jsPrefix.${type.name}')))
          ..constructors.add(Constructor((b) => b
            ..name = 'fromJS'
            ..requiredParameters.add(Parameter((b) => b
              ..name = '_wrapped'
              ..toThis = true))))
          ..methods.add(Method((b) => b
            ..name = 'toJS'
            ..type = MethodType.getter
            ..returns = refer('$_jsPrefix.${type.name}')
            ..lambda = true
            ..body = Code('_wrapped')));
      }

      if (type.isSyntheticEvent) {
        b
          ..constructors.add(Constructor((b) => b
            ..optionalParameters
                .addAll(type.properties.map((p) => Parameter((b) => b
                  ..name = p.name
                  ..named = true
                  ..required = true
                  ..toThis = true)))))
          ..fields.addAll(type.properties.map(_syntheticProperty));
      } else if (!type.isAnonymous) {
        b
          ..methods
              .addAll(type.properties.map(_wrappingProperty).expand((e) => e))
          ..methods.addAll(type.methods.map(_function))
          ..methods.addAll(type.events.map(_event));
      }
    });
  }

  Iterable<Method> _wrappingProperty(model.Property property) sync* {
    yield Method((b) => b
      ..docs.add(documentationComment(property.documentation, indent: 2))
      ..name = property.name
      ..returns = property.type.dartType
      ..type = MethodType.getter
      ..lambda = true
      ..body = Code(property.type.toDart('_wrapped.${property.name}')));

    yield Method((b) => b
      ..name = property.name
      ..type = MethodType.setter
      ..requiredParameters.add(Parameter((b) => b
        ..name = 'v'
        ..type = property.type.dartType))
     ..body = Code('_wrapped.${property.name} = ${property.type.toJS('v')};'));
  }

  Field _syntheticProperty(model.Property property) {
    return Field((b) => b
      ..docs.add(documentationComment(property.documentation, indent: 2))
      ..name = property.name
      ..type = property.type.dartType
      ..modifier = FieldModifier.final$);
  }
}

class _PrefixedAllocator implements Allocator {
  static const _prefixes = {model.jsBindingRecognizableUrl: _jsPrefix};

  final _imports = <String, String>{};

  @override
  String allocate(Reference reference) {
    final symbol = reference.symbol;
    final url = reference.url;

    var prefix = _prefixes[url];
    if (url == null || prefix == null) {
      return symbol!;
    }
    return '${_imports.putIfAbsent(url, () => prefix)}.$symbol';
  }

  @override
  Iterable<Directive> get imports => _imports.keys.map(
        (u) => Directive.import(u, as: _imports[u]),
      );
}

String _toEnumValue(String input) {
  input = lowerCamel(splitWords(input).map((e) => e.toLowerCase()));

  return enumValueIdentifier(input);
}

const _dartKeywordsInEnum = {
  'null', 'default', 'in', 'class' //
};

String enumValueIdentifier(String input) {
  if (_dartKeywordsInEnum.contains(input)) {
    return '$input\$';
  } else {
    return input;
  }
}
