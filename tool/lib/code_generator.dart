import 'package:dart_style/dart_style.dart';
import 'package:code_builder/code_builder.dart';
import 'chrome_model.dart' as model;

class CodeGenerator {
  final model.ChromeApi api;

  CodeGenerator(this.api);

  String toCode() {
    final library = Library((b) => b.body.addAll([
          Method((b) => b
            ..body = const Code('')
            ..name = 'doThing'
            ..returns = refer('Thing', 'package:a/a.dart')),
          Method((b) => b
            ..body = const Code('')
            ..name = 'doOther'
            ..returns = refer('Other', 'package:b/b.dart')),
        ]));
    final emitter = DartEmitter(allocator: Allocator());

    var formatter = DartFormatter();

    return formatter.format('${library.accept(emitter)}');
  }
}
