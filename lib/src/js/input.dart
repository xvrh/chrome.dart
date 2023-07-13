import 'dart:js_interop';

import 'chrome.dart';

extension JSChromeInputExtension on JSChrome {
  external JSChromeInput get input;
}

@JS()
@staticInterop
class JSChromeInput {}
