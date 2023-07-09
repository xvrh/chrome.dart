import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSExtensionTypesExtension on JSChrome {
  /// The `chrome.extensionTypes` API contains type declarations for Chrome
  /// extensions.
  external JSExtensionTypes get ExtensionTypes;
}

@JS()
@staticInterop
class JSExtensionTypes {}

extension JSExtensionTypesExtension on JSExtensionTypes {}
