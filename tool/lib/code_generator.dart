import 'package:dart_style/dart_style.dart';
import 'package:code_builder/code_builder.dart';
import '../src/utils.dart';
import 'chrome_model.dart' as model;
import 'comment.dart';

const _dartInteropUrl = 'dart:js_interop';
const _sharedCodeUrl = 'chrome.dart';

class CodeGenerator {
  final model.ChromeApi api;
  final _formatter = DartFormatter();

  CodeGenerator(this.api);

  String get apiClassName => 'Chrome${titleCase(api.name)}';

  String get bindingClassName => 'JS${titleCase(api.name)}';

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
          ..methods.addAll(api.events.map(_bindingEvent)))
      ]));

    final emitter = DartEmitter(allocator: Allocator());
    return _formatter.format('${library.accept(emitter)}');
  }

  Method _bindingFunction(model.Method method) {
    return Method((b) => b
      ..docs.add(documentationComment(method.documentation, indent: 2))
      ..name = method.name
      ..external = true
      ..returns = refer('void'));
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
    ..name = api.name
    ..type = MethodType.getter);

  String highLevelApi() {
    final library = Library((b) => b.body.addAll([
          Field((b) => b
            ..name = '_${api.name}'
            ..modifier = FieldModifier.final$
            ..assignment = refer(apiClassName).property('_').call([]).code),
          Extension((b) => b
            ..name = 'Chrome${apiClassName}Extension'
            ..on = refer('Chrome', _sharedCodeUrl)
            ..methods.add(Method((b) => b
              ..returns = refer(apiClassName)
              ..name = api.name
              ..lambda = true
              ..body = Code('_${api.name}')
              ..type = MethodType.getter))),
          Class((b) => b
            ..name = apiClassName
            ..constructors.add(Constructor((c) => c.name = '_'))),
        ]));

    final emitter = DartEmitter(allocator: Allocator());
    return _formatter.format('${library.accept(emitter)}');
  }

  Expression _staticInteropAnnotation() =>
      refer('staticInterop', _dartInteropUrl);

  Expression _anonymousAnnotation() => refer('anonymous', _dartInteropUrl);
  Expression _jsAnnotation([String? name]) => refer('JS', _dartInteropUrl)
      .call([if (name != null) literalString(name)]);
}
