import 'chrome.dart';
export 'chrome.dart';

final _enterpriseDeviceAttributes = ChromeEnterpriseDeviceAttributes._();

extension ChromeChromeEnterpriseDeviceAttributesExtension on Chrome {
  ChromeEnterpriseDeviceAttributes get enterpriseDeviceAttributes =>
      _enterpriseDeviceAttributes;
}

class ChromeEnterpriseDeviceAttributes {
  ChromeEnterpriseDeviceAttributes._();
}
