import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSystemMemoryExtension on JSChrome {
  ///  The `chrome.system.memory` API.
  external JSSystemMemory get systemMemory;
}

@JS()
@staticInterop
class JSSystemMemory {}

extension JSSystemMemoryExtension on JSSystemMemory {
  ///  Get physical memory information.
  external void getInfo(JSFunction callback);
}

@JS()
@staticInterop
class MemoryInfo {}

extension MemoryInfoExtension on MemoryInfo {
  ///  The total amount of physical memory capacity, in bytes.
  external double get capacity;

  ///  The amount of available capacity, in bytes.
  external double get availableCapacity;
}