import 'src/internal_helpers.dart';
import 'src/js/enterprise_networking_attributes.dart' as $js;
export 'chrome.dart';

final _enterpriseNetworkingAttributes =
    ChromeEnterpriseNetworkingAttributes._();

extension ChromeEnterpriseNetworkingAttributesExtension on Chrome {
  ChromeEnterpriseNetworkingAttributes get enterpriseNetworkingAttributes =>
      _enterpriseNetworkingAttributes;
}

class ChromeEnterpriseNetworkingAttributes {
  ChromeEnterpriseNetworkingAttributes._();

  /// Retrieves the network details of the device's default network.
  /// If the user is not affiliated or the device is not connected to a
  /// network, [runtime.lastError] will be set with a failure reason.
  /// |callback| : Called with the device's default network's
  /// [NetworkDetails].
  Future<NetworkDetails> getNetworkDetails() => throw UnimplementedError();
}

class NetworkDetails {
  NetworkDetails.fromJS(this._wrapped);

  final $js.NetworkDetails _wrapped;

  $js.NetworkDetails get toJS => _wrapped;

  /// The device's MAC address.
  String get macAddress => _wrapped.macAddress;
  set macAddress(String v) {
    throw UnimplementedError();
  }

  /// The device's local IPv4 address (undefined if not configured).
  String? get ipv4 => _wrapped.ipv4;
  set ipv4(String? v) {
    throw UnimplementedError();
  }

  /// The device's local IPv6 address (undefined if not configured).
  String? get ipv6 => _wrapped.ipv6;
  set ipv6(String? v) {
    throw UnimplementedError();
  }
}
