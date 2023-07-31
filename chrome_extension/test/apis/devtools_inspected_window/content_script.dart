import 'dart:js_interop';
import 'dart:js_util';

void main() {
  print('Content script');

  var exported = createDartExport(Counter()) as JSObject;
  window.counter = exported;
}

@JS()
external Window get window;

@JS()
@staticInterop
class Window {}

extension on Window {
  external JSObject counter;
}

// The Dart class must have `@JSExport` on it or one of its instance members.
@JSExport()
class Counter {
  int value = 0;

  void increment() {
    value++;
    print('Increment');
  }
}
