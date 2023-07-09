import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSystemNetworkExtension on JSChrome {
  ///  Use the `chrome.system.network` API.
  external JSSystemNetwork get SystemNetwork;
}

@JS()
@staticInterop
class JSSystemNetwork {}

extension JSSystemNetworkExtension on JSSystemNetwork {
  ///  Retrieves information about local adapters on this system.
  ///  |callback| : Called when local adapter information is available.
  external void getNetworkInterfaces();
}
