

import 'dart:js_interop';

import 'package:test/test.dart';

void main() {
  test('Non existing function', () {
    try {
      window.notExistingFunction(() {}.toJS);
    } catch (e) {
      print('Catched error $e');
    }
  });
}

@JS()
@staticInterop
external Window get window;

@JS()
@staticInterop
class Window {}

extension on Window {
  external JSAny? notExistingFunction(JSFunction);
}