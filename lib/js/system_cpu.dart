import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSystemCpuExtension on JSChrome {
  ///  Use the `system.cpu` API to query CPU metadata.
  external JSSystemCpu get SystemCpu;
}

@JS()
@staticInterop
class JSSystemCpu {}

extension JSSystemCpuExtension on JSSystemCpu {
  ///  Queries basic CPU information of the system.
  external void getInfo();
}
