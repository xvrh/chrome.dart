import 'dart:js_interop';

@JS()
external JSChrome get chrome;

@JS()
@staticInterop
class JSChrome {}

// TODO: use generated Event class
@JS()
@staticInterop
class ChromeEvent {}

extension ChromeEventExtension on ChromeEvent {
  external void addListener(JSFunction callback);
  external void removeListener(JSFunction callback);
}
