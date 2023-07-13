import 'package:dart_style/dart_style.dart';
import 'package:code_builder/code_builder.dart';
import '../src/utils.dart';
import 'chrome_model.dart' as model;
import 'comment.dart';
import 'utils/string.dart';
import 'package:path/path.dart' as p;

const _dartInteropUrl = 'dart:js_interop';
const _sharedBinding = 'chrome.dart';
const _internalHelpers = 'src/internal_helpers.dart';
const _jsPrefix = r'$js';

final _formatter = DartFormatter();

class _GeneratorBase {
  final model.ChromeApi api;

  _GeneratorBase(this.api);
}

class JsBindingGenerator extends _GeneratorBase {
  JsBindingGenerator(super.api);

  String get bindingClassName => 'JS${api.classNameWithGroup}';

  String toCode() {
    final library = Library((b) => b
      ..directives.addAll([
        Directive.export('chrome.dart'),
        if (api.group case var group?)
          Directive.export('${group.snakeCase}.dart')
      ])
      ..body.addAll([
        Extension((b) => b
          ..name = 'JSChrome${bindingClassName}Extension'
          ..on = _extensionOn
          ..methods.add(Method((b) => b
            ..docs.add(documentationComment(api.documentation, indent: 2))
            ..external = true
            ..returns = refer(bindingClassName)
            ..name = api.nameWithoutGroup.lowerCamel
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

    return _emitCode(library);
  }

  Reference get _extensionOn {
    var extensionOn = 'JSChrome';
    var extensionOnImport = 'chrome';
    var group = api.group;
    if (group != null) {
      extensionOn = '$extensionOn${group.upperCamel}';
      extensionOnImport = group.snakeCase;
    }
    return refer(extensionOn, '$extensionOnImport.dart');
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
}

class DartApiGenerator extends _GeneratorBase {
  DartApiGenerator(super.api);

  String get mainClassName => 'Chrome${api.classNameWithGroup}';

  String get _jsFile => 'src/js/${api.fileName}';

  String toCode() {
    final library = Library((b) => b
      ..directives.addAll([
        Directive.export('src/chrome.dart', show: ['chrome']),
        Directive.import(_internalHelpers),
        if (api.group case var group?)
          Directive.export('${group.snakeCase}.dart', show: [
            'Chrome${group.upperCamel}',
            'Chrome${group.upperCamel}Extension',
          ])
      ])
      ..body.addAll([
        Field((b) => b
          ..name = '_${api.name.lowerCamel}'
          ..modifier = FieldModifier.final$
          ..assignment = refer(mainClassName).property('_').call([]).code),
        Extension((b) => b
          ..name = '${mainClassName}Extension'
          ..on = _extensionOn
          ..methods.add(Method((b) => b
            ..returns = refer(mainClassName)
            ..name = api.nameWithoutGroup.lowerCamel
            ..lambda = true
            ..body = Code('_${api.name.lowerCamel}')
            ..type = MethodType.getter))),
        Class((b) => b
          ..name = mainClassName
          ..constructors.add(Constructor((c) => c.name = '_'))
          ..methods.addAll(
              api.functions.map((f) => _function(f, source: _referJsBinding())))
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

    return _emitCode(library, allocator: _PrefixedAllocator(api.fileName));
  }

  Reference get _extensionOn {
    var extensionOn = 'Chrome';
    String? extensionOnImport;
    var group = api.group;
    if (group != null) {
      extensionOn = '$extensionOn${group.upperCamel}';
      extensionOnImport = '${group.snakeCase}.dart';
    }
    return refer(extensionOn, extensionOnImport);
  }

  Expression _referJsBinding() {
    Expression referTo = refer('chrome', _jsFile);
    if (api.group case var group?) {
      referTo = referTo.property(group);
    }
    return referTo.property(api.nameWithoutGroup.lowerCamel);
  }

  Method _function(model.Method method, {required Expression source}) {
    Reference returns;
    Block body;

    var referTo = source.property(method.name);
    var callParameters = <Expression>[
      for (var p in method.parameters) p.type.toJS(refer(p.name))
    ];

    if (method.returns.type case model.AsyncReturnType asyncReturn) {
      var futureType = method.returns.type?.dartType ?? refer('void');
      returns = TypeReference((b) => b
        ..symbol = 'Future'
        ..types.add(futureType));

      var completerVar = r'$completer';

      body = Block.of([
        declareVar(completerVar)
            .assign(refer('Completer').call([], {}, [futureType]))
            .statement,
        referTo.call([
          ...callParameters,
          Method((b) => b
            ..lambda = false
            ..requiredParameters.addAll([
              for (var jsParam in asyncReturn.jsCallback.positionalParameters)
                Parameter((b) => b
                  ..name = jsParam.name!
                  ..type = jsParam.type.jsType)
            ])
            ..body = refer(completerVar)
                .property('complete')
                .call([refer('null')]).statement).closure.property('toJS')
        ]).statement,
        refer(completerVar).property('future').returned.statement,
      ]);
    } else {
      var callExpression = referTo.call(callParameters);
      if (method.returns.type case var returnType?) {
        callExpression = returnType.toDart(callExpression).returned;
      }

      body = Block.of([
        callExpression.statement,
      ]);
      returns = method.returns.type?.dartType ?? refer('void');
    }

    return Method((b) => b
      ..docs.add(documentationComment(method.documentation, indent: 2))
      ..name = method.name
      ..returns = returns
      ..body = body
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
    var referTo = _referJsBinding().property(prop.name);

    return Method((b) => b
      ..name = prop.name.lowerCamel
      ..returns = prop.type.dartType
      ..docs.add(documentationComment(prop.documentation, indent: 2))
      ..type = MethodType.getter
      ..body = referTo.asA(refer('dynamic')).code
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

  Iterable<Spec> _dictionary(model.Dictionary dictionary) sync* {
    var type = model.LocalType(dictionary.name,
        selfFileName: api.fileName, isNullable: false);

    const wrappedVariable = '_wrapped';

    yield Class((b) {
      b.name = dictionary.name;

      if (!dictionary.isSyntheticEvent) {
        //TODO: don't generate some classes that are anonymous and used only
        // at the root of the input function

        Expression constructorSetter;
        if (dictionary.isAnonymous) {
          constructorSetter = type.jsTypeReferencedFromDart.call([], {
            for (var property in dictionary.properties)
              property.name: property.type.toJS(refer(property.name)),
          });
        } else {
          constructorSetter = type.jsTypeReferencedFromDart.call([]);
          for (var property in dictionary.properties) {
            constructorSetter = constructorSetter
                .cascade(property.name)
                .assign(property.type.toJS(refer(property.name)));
          }
        }

        b
          ..fields.add(Field((b) => b
            ..name = wrappedVariable
            ..modifier = FieldModifier.final$
            ..type = refer(dictionary.name, _jsFile)))
          ..constructors.add(Constructor((b) => b
            ..name = 'fromJS'
            ..requiredParameters.add(Parameter((b) => b
              ..name = wrappedVariable
              ..toThis = true))))
          ..constructors.add(Constructor((b) => b
            ..optionalParameters
                .addAll(dictionary.properties.map((p) => Parameter((b) => b
                  ..name = p.name
                  ..type = p.type.dartType
                  ..named = true
                  ..required = !p.type.isNullable)))
            ..initializers
                .add(refer(wrappedVariable).assign(constructorSetter).code)))
          ..methods.add(Method((b) => b
            ..name = 'toJS'
            ..type = MethodType.getter
            ..returns = refer(dictionary.name, _jsFile)
            ..lambda = true
            ..body = Code(wrappedVariable)));
      } else {
        b
          ..constructors.add(Constructor((b) => b
            ..optionalParameters
                .addAll(dictionary.properties.map((p) => Parameter((b) => b
                  ..name = p.name
                  ..named = true
                  ..required = true
                  ..toThis = true)))))
          ..fields.addAll(dictionary.properties.map(_syntheticProperty));
      }

      if (!dictionary.isSyntheticEvent && !dictionary.isAnonymous) {
        b
          ..methods.addAll(
              dictionary.properties.map(_wrappingProperty).expand((e) => e))
          ..methods.addAll(dictionary.methods
              .map((f) => _function(f, source: refer(wrappedVariable))))
          ..methods.addAll(dictionary.events.map(_event));
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
      ..body =
          property.type.toDart(refer('_wrapped').property(property.name)).code);

    yield Method((b) => b
      ..name = property.name
      ..type = MethodType.setter
      ..requiredParameters.add(Parameter((b) => b
        ..name = 'v'
        ..type = property.type.dartType))
      ..body = refer('_wrapped')
          .property(property.name)
          .assign(property.type.toJS(refer('v')))
          .statement);
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
  final _imports = <String, String?>{};
  final String thisFile;

  _PrefixedAllocator(this.thisFile);

  @override
  String allocate(Reference reference) {
    final symbol = reference.symbol;
    final url = reference.url;

    if (url != null && url.startsWith('src/js')) {
      var baseName = p.basename(url);
      String prefix;
      if (baseName == thisFile) {
        prefix = _jsPrefix;
      } else {
        prefix = '${_jsPrefix}_${p.basenameWithoutExtension(url)}';
      }

      _imports[url] = prefix;
      return '$prefix.$symbol';
    } else if (url != null) {
      _imports[url] = null;
    }
    return symbol!;
  }

  @override
  Iterable<Directive> get imports => _imports.keys.map(
        (u) => Directive.import(u, as: _imports[u]),
      );
}

String generateJSGroupCode(String group) {
  var groupClass = 'JSChrome${model.apiNameToClassName(group)}';
  final library = Library((b) => b
    ..body.addAll([
      Extension((b) => b
        ..name = '${groupClass}Extension'
        ..on = refer('JSChrome', 'chrome.dart')
        ..methods.add(Method((b) => b
          ..external = true
          ..returns = refer('JSChrome${model.apiNameToClassName(group)}')
          ..name = group
          ..type = MethodType.getter))),
      Class((b) => b
        ..annotations.addAll([_jsAnnotation(), _staticInteropAnnotation()])
        ..name = groupClass),
    ]));

  return _emitCode(library);
}

String generateDartGroupCode(String groupName, List<model.ChromeApi> apis) {
  var groupClass = 'Chrome${model.apiNameToClassName(groupName)}';
  final library = Library((b) => b
    ..directives.addAll([
      for (var api in apis)
        Directive.export('${model.apiNameToFileName(api.name)}.dart'),
    ])
    ..body.addAll([
      Field((b) => b
        ..name = '_${groupClass.lowerCamel}'
        ..modifier = FieldModifier.final$
        ..assignment = refer(groupClass).property('_').call([]).code),
      Extension((b) => b
        ..name = '${groupClass}Extension'
        ..on = refer('Chrome', _internalHelpers)
        ..methods.add(Method((b) => b
          ..returns = refer(groupClass)
          ..name = groupName
          ..lambda = true
          ..body = Code('_${groupClass.lowerCamel}')
          ..type = MethodType.getter))),
      Class((b) => b
        ..name = groupClass
        ..constructors.add(Constructor((c) => c.name = '_'))),
    ]));

  return _emitCode(library);
}

String generateChromeCode(List<model.ChromeApi> apis, List<String> groups) {
  final library = Library((b) => b
    ..directives.addAll([
      Directive.export('src/chrome.dart', show: ['chrome', 'Chrome']),
      for (var api in apis)
        Directive.export(api.fileName, show: [
          'Chrome${model.apiNameToClassName(api.name)}',
          'Chrome${model.apiNameToClassName(api.name)}Extension',
        ]),
      for (var group in groups)
        Directive.export('${model.apiNameToFileName(group)}.dart', show: [
          'Chrome${model.apiNameToClassName(group)}',
          'Chrome${model.apiNameToClassName(group)}Extension',
        ]),
    ]));

  return _emitCode(library);
}

String _emitCode(Spec spec, {Allocator? allocator}) {
  final emitter = DartEmitter(
      allocator: allocator ?? Allocator(),
      useNullSafetySyntax: true,
      orderDirectives: true);
  return _formatter.format('${spec.accept(emitter)}');
}

Expression _staticInteropAnnotation() =>
    refer('staticInterop', _dartInteropUrl);

Expression _anonymousAnnotation() => refer('anonymous', _dartInteropUrl);
Expression _jsAnnotation([String? name]) =>
    refer('JS', _dartInteropUrl).call([if (name != null) literalString(name)]);

String _toEnumValue(String input) {
  return enumValueIdentifier(input.lowerCamel);
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
