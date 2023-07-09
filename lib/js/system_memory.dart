import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSystemMemoryExtension on JSChrome {
  ///  The `chrome.system.memory` API.
  external JSSystemMemory get SystemMemory;
}

@JS()
@staticInterop
class JSSystemMemory {}

extension JSSystemMemoryExtension on JSSystemMemory {
  ///  Get physical memory information.
  external void getInfo();
}
