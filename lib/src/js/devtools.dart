import 'dart:js_interop';

import 'chrome.dart';

extension JSChromeDevtoolsExtension on JSChrome {
  external JSChromeDevtools get devtools;
}

@JS()
@staticInterop
class JSChromeDevtools {}
