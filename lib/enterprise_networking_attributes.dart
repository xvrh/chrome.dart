import 'chrome.dart';

final _EnterpriseNetworkingAttributes =
    ChromeEnterpriseNetworkingAttributes._();

extension ChromeChromeEnterpriseNetworkingAttributesExtension on Chrome {
  ChromeEnterpriseNetworkingAttributes get EnterpriseNetworkingAttributes =>
      _EnterpriseNetworkingAttributes;
}

class ChromeEnterpriseNetworkingAttributes {
  ChromeEnterpriseNetworkingAttributes._();
}
