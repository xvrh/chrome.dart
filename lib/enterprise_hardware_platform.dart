import 'chrome.dart';
export 'chrome.dart';

final _enterpriseHardwarePlatform = ChromeEnterpriseHardwarePlatform._();

extension ChromeChromeEnterpriseHardwarePlatformExtension on Chrome {
  ChromeEnterpriseHardwarePlatform get enterpriseHardwarePlatform =>
      _enterpriseHardwarePlatform;
}

class ChromeEnterpriseHardwarePlatform {
  ChromeEnterpriseHardwarePlatform._();

  /// Obtains the manufacturer and model for the hardware platform and, if
  /// the extension is authorized, returns it via |callback|.
  /// |callback|: Called with the hardware platform info.
  void getHardwarePlatformInfo() => throw UnimplementedError();
}
