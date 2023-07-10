import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSystemNetworkExtension on JSChrome {
  /// Use the `chrome.system.network` API.
  external JSSystemNetwork get systemNetwork;
}

@JS()
@staticInterop
class JSSystemNetwork {}

extension JSSystemNetworkExtension on JSSystemNetwork {
  /// Retrieves information about local adapters on this system.
  /// |callback| : Called when local adapter information is available.
  external void getNetworkInterfaces(JSFunction callback);
}

@JS()
@staticInterop
class NetworkInterface {}

extension NetworkInterfaceExtension on NetworkInterface {
  /// The underlying name of the adapter. On *nix, this will typically be
  /// "eth0", "wlan0", etc.
  external String get name;

  /// The available IPv4/6 address.
  external String get address;

  /// The prefix length
  external int get prefixLength;
}
