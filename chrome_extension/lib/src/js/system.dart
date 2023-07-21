import 'dart:js_interop';

import 'chrome.dart';

extension JSChromeSystemExtension on JSChrome {
  JSChromeSystem get system {
    var system = systemNullable;
    if (system == null) {
      throw Exception('Not available');
    }
    return system;
  }

  @JS('system')
  external JSChromeSystem? get systemNullable;
}

@JS()
@staticInterop
class JSChromeSystem {}
