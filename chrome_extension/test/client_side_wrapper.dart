import 'dart:convert';
import 'dart:js_interop';

import 'test_context.dart';
export 'test_context.dart';

void setup(void Function(TestContext) callback) {
  isReady = true;
  startFunction = (String parameters) {
    var context =
        TestContext.fromJson(jsonDecode(parameters) as Map<String, dynamic>);
    callback(context);
  }.toJS;
}

@JS()
@staticInterop
external bool isReady;

@JS()
@staticInterop
external JSFunction? startFunction;
