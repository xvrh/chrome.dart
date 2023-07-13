import 'dart:js_interop';

import 'chrome.dart';

extension JSChromeEnterpriseExtension on JSChrome {
  external JSChromeEnterprise get enterprise;
}

@JS()
@staticInterop
class JSChromeEnterprise {}
