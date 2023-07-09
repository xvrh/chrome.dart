import 'chrome.dart';

final _EnterpriseHardwarePlatform = ChromeEnterpriseHardwarePlatform._();

extension ChromeChromeEnterpriseHardwarePlatformExtension on Chrome {
  ChromeEnterpriseHardwarePlatform get EnterpriseHardwarePlatform =>
      _EnterpriseHardwarePlatform;
}

class ChromeEnterpriseHardwarePlatform {
  ChromeEnterpriseHardwarePlatform._();
}
