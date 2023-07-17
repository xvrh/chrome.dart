import 'dart:js_interop';
export 'js/events.dart' show Event;

@JS()
external JSChrome get chrome;

@JS()
@staticInterop
class JSChrome {}

