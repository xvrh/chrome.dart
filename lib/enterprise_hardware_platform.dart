import 'src/internal_helpers.dart';
import 'src/js/enterprise_hardware_platform.dart' as $js;
export 'chrome.dart';

final _enterpriseHardwarePlatform = ChromeEnterpriseHardwarePlatform._();

extension ChromeEnterpriseHardwarePlatformExtension on Chrome {
  ChromeEnterpriseHardwarePlatform get enterpriseHardwarePlatform =>
      _enterpriseHardwarePlatform;
}

class ChromeEnterpriseHardwarePlatform {
  ChromeEnterpriseHardwarePlatform._();

  /// Obtains the manufacturer and model for the hardware platform and, if
  /// the extension is authorized, returns it via |callback|.
  /// |callback|: Called with the hardware platform info.
  Future<HardwarePlatformInfo> getHardwarePlatformInfo() =>
      throw UnimplementedError();
}

class HardwarePlatformInfo {
  HardwarePlatformInfo.fromJS(this._wrapped);

  final $js.HardwarePlatformInfo _wrapped;

  $js.HardwarePlatformInfo get toJS => _wrapped;

  String get model => _wrapped.model;
  set model(String v) {
    throw UnimplementedError();
  }

  String get manufacturer => _wrapped.manufacturer;
  set manufacturer(String v) {
    throw UnimplementedError();
  }
}
