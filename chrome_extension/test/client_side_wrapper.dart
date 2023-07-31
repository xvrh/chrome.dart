import 'dart:convert';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import 'dart:js_util';

import 'package:chrome_apis/extension.dart';
import 'package:chrome_apis/runtime.dart';

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
