import 'chrome.dart';
export 'chrome.dart';

final _enterpriseNetworkingAttributes =
    ChromeEnterpriseNetworkingAttributes._();

extension ChromeChromeEnterpriseNetworkingAttributesExtension on Chrome {
  ChromeEnterpriseNetworkingAttributes get enterpriseNetworkingAttributes =>
      _enterpriseNetworkingAttributes;
}

class ChromeEnterpriseNetworkingAttributes {
  ChromeEnterpriseNetworkingAttributes._();

  ///  Retrieves the network details of the device's default network.
  ///  If the user is not affiliated or the device is not connected to a
  ///  network, $(ref:runtime.lastError) will be set with a failure reason.
  ///  |callback| : Called with the device's default network's
  ///  $(ref:NetworkDetails).
  void getNetworkDetails() => throw UnimplementedError();
}
