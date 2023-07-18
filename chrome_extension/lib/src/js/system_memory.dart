import 'dart:js_interop';

import 'system.dart';

export 'chrome.dart';
export 'system.dart';

extension JSChromeJSSystemMemoryExtension on JSChromeSystem {
  /// The `chrome.system.memory` API.
  external JSSystemMemory get memory;
}

@JS()
@staticInterop
class JSSystemMemory {}

extension JSSystemMemoryExtension on JSSystemMemory {
  /// Get physical memory information.
  external JSPromise getInfo();
}

@JS()
@staticInterop
class MemoryInfo {}

extension MemoryInfoExtension on MemoryInfo {
  /// The total amount of physical memory capacity, in bytes.
  external double capacity;

  /// The amount of available capacity, in bytes.
  external double availableCapacity;
}
