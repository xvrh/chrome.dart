import 'chrome.dart';

final _EnterpriseDeviceAttributes = ChromeEnterpriseDeviceAttributes._();

extension ChromeChromeEnterpriseDeviceAttributesExtension on Chrome {
  ChromeEnterpriseDeviceAttributes get EnterpriseDeviceAttributes =>
      _EnterpriseDeviceAttributes;
}

class ChromeEnterpriseDeviceAttributes {
  ChromeEnterpriseDeviceAttributes._();
}
