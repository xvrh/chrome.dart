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
}
