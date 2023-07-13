import 'dart:js_interop';

import 'chrome.dart';

extension JSChromeSystemExtension on JSChrome {
  external JSChromeSystem get system;
}

@JS()
@staticInterop
class JSChromeSystem {}
