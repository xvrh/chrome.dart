import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSTypesExtension on JSChrome {
  /// The `chrome.types` API contains type declarations for Chrome.
  external JSTypes get Types;
}

@JS()
@staticInterop
class JSTypes {}

extension JSTypesExtension on JSTypes {}
