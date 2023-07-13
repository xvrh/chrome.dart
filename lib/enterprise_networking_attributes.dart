import 'enterprise.dart';
import 'src/internal_helpers.dart';
import 'src/js/enterprise_networking_attributes.dart' as $js;

export 'enterprise.dart' show ChromeEnterprise, ChromeEnterpriseExtension;
export 'src/chrome.dart' show chrome;

final _enterpriseNetworkingAttributes =
    ChromeEnterpriseNetworkingAttributes._();

extension ChromeEnterpriseNetworkingAttributesExtension on ChromeEnterprise {
  ChromeEnterpriseNetworkingAttributes get networkingAttributes =>
      _enterpriseNetworkingAttributes;
}

class ChromeEnterpriseNetworkingAttributes {
  ChromeEnterpriseNetworkingAttributes._();

  /// Retrieves the network details of the device's default network.
  /// If the user is not affiliated or the device is not connected to a
  /// network, [runtime.lastError] will be set with a failure reason.
  /// |callback| : Called with the device's default network's
  /// [NetworkDetails].
  Future<NetworkDetails> getNetworkDetails() {
    var $completer = Completer<NetworkDetails>();
    $js.chrome.enterprise.networkingAttributes
        .getNetworkDetails(($js.NetworkDetails networkAddresses) {
      $completer.complete(NetworkDetails.fromJS(networkAddresses));
    }.toJS);
    return $completer.future;
  }
}

class NetworkDetails {
  NetworkDetails.fromJS(this._wrapped);

  NetworkDetails({
    required String macAddress,
    String? ipv4,
    String? ipv6,
  }) : _wrapped = $js.NetworkDetails()
          ..macAddress = macAddress
          ..ipv4 = ipv4
          ..ipv6 = ipv6;

  final $js.NetworkDetails _wrapped;

  $js.NetworkDetails get toJS => _wrapped;

  /// The device's MAC address.
  String get macAddress => _wrapped.macAddress;
  set macAddress(String v) {
    _wrapped.macAddress = v;
  }

  /// The device's local IPv4 address (undefined if not configured).
  String? get ipv4 => _wrapped.ipv4;
  set ipv4(String? v) {
    _wrapped.ipv4 = v;
  }

  /// The device's local IPv6 address (undefined if not configured).
  String? get ipv6 => _wrapped.ipv6;
  set ipv6(String? v) {
    _wrapped.ipv6 = v;
  }
}
