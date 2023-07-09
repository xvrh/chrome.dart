import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSystemNetworkExtension on JSChrome {
  ///  Use the `chrome.system.network` API.
  external JSSystemNetwork get systemNetwork;
}

@JS()
@staticInterop
class JSSystemNetwork {}

extension JSSystemNetworkExtension on JSSystemNetwork {
  ///  Retrieves information about local adapters on this system.
  ///  |callback| : Called when local adapter information is available.
  external void getNetworkInterfaces(callback);
}

@JS()
@staticInterop
class NetworkInterface {
  ///  The underlying name of the adapter. On *nix, this will typically be
  ///  "eth0", "wlan0", etc.
  external JSAny get name;

  ///  The available IPv4/6 address.
  external JSAny get address;

  ///  The prefix length
  external JSAny get prefixLength;
}
