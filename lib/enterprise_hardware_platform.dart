import 'chrome.dart';
export 'chrome.dart';

final _enterpriseHardwarePlatform = ChromeEnterpriseHardwarePlatform._();

extension ChromeChromeEnterpriseHardwarePlatformExtension on Chrome {
  ChromeEnterpriseHardwarePlatform get enterpriseHardwarePlatform =>
      _enterpriseHardwarePlatform;
}

class ChromeEnterpriseHardwarePlatform {
  ChromeEnterpriseHardwarePlatform._();
}
