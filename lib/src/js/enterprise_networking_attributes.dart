import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSEnterpriseNetworkingAttributesExtension on JSChrome {
  /// Use the `chrome.enterprise.networkingAttributes` API to read
  /// information about your current network.
  /// Note: This API is only available to extensions force-installed by
  /// enterprise
  /// policy.
  external JSEnterpriseNetworkingAttributes get enterpriseNetworkingAttributes;
}

@JS()
@staticInterop
class JSEnterpriseNetworkingAttributes {}

extension JSEnterpriseNetworkingAttributesExtension
    on JSEnterpriseNetworkingAttributes {
  /// Retrieves the network details of the device's default network.
  /// If the user is not affiliated or the device is not connected to a
  /// network, $(ref:runtime.lastError) will be set with a failure reason.
  /// |callback| : Called with the device's default network's
  /// $(ref:NetworkDetails).
  external void getNetworkDetails(JSFunction callback);
}

@JS()
@staticInterop
class NetworkDetails {}

extension NetworkDetailsExtension on NetworkDetails {
  /// The device's MAC address.
  external JSString get macAddress;

  /// The device's local IPv4 address (undefined if not configured).
  external JSString? get ipv4;

  /// The device's local IPv6 address (undefined if not configured).
  external JSString? get ipv6;
}
