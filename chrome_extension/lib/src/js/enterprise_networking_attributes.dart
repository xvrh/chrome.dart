import 'dart:js_interop';

import 'enterprise.dart';

export 'chrome.dart';
export 'enterprise.dart';

extension JSChromeJSEnterpriseNetworkingAttributesExtension
    on JSChromeEnterprise {
  /// Use the `chrome.enterprise.networkingAttributes` API to read
  /// information about your current network.
  /// Note: This API is only available to extensions force-installed by
  /// enterprise
  /// policy.
  external JSEnterpriseNetworkingAttributes get networkingAttributes;
}

@JS()
@staticInterop
class JSEnterpriseNetworkingAttributes {}

extension JSEnterpriseNetworkingAttributesExtension
    on JSEnterpriseNetworkingAttributes {
  /// Retrieves the network details of the device's default network.
  /// If the user is not affiliated or the device is not connected to a
  /// network, [runtime.lastError] will be set with a failure reason.
  /// |callback| : Called with the device's default network's
  /// [NetworkDetails].
  external JSPromise getNetworkDetails();
}

@JS()
@staticInterop
class NetworkDetails {}

extension NetworkDetailsExtension on NetworkDetails {
  /// The device's MAC address.
  external String macAddress;

  /// The device's local IPv4 address (undefined if not configured).
  external String? ipv4;

  /// The device's local IPv6 address (undefined if not configured).
  external String? ipv6;
}