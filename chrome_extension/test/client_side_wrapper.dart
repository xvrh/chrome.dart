import 'dart:js_interop';

void setup(void Function() callback) {
  isReady = true;
  startFunction = callback.toJS;
}

@JS()
@staticInterop
external bool isReady;

@JS()
@staticInterop
external JSFunction? startFunction;
