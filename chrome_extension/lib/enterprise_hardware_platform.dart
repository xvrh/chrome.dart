import 'enterprise.dart';
import 'src/internal_helpers.dart';
import 'src/js/enterprise_hardware_platform.dart' as $js;

export 'enterprise.dart' show ChromeEnterprise, ChromeEnterpriseExtension;
export 'src/chrome.dart' show chrome;

final _enterpriseHardwarePlatform = ChromeEnterpriseHardwarePlatform._();

extension ChromeEnterpriseHardwarePlatformExtension on ChromeEnterprise {
  ChromeEnterpriseHardwarePlatform get hardwarePlatform =>
      _enterpriseHardwarePlatform;
}

class ChromeEnterpriseHardwarePlatform {
  ChromeEnterpriseHardwarePlatform._();

  /// Obtains the manufacturer and model for the hardware platform and, if
  /// the extension is authorized, returns it via |callback|.
  /// |callback|: Called with the hardware platform info.
  Future<HardwarePlatformInfo> getHardwarePlatformInfo() {
    var $completer = Completer<HardwarePlatformInfo>();
    $js.chrome.enterprise.hardwarePlatform
        .getHardwarePlatformInfo(($js.HardwarePlatformInfo info) {
      if (checkRuntimeLastError($completer)) {
        $completer.complete(HardwarePlatformInfo.fromJS(info));
      }
    }.toJS);
    return $completer.future;
  }
}

class HardwarePlatformInfo {
  HardwarePlatformInfo.fromJS(this._wrapped);

  HardwarePlatformInfo({
    required String model,
    required String manufacturer,
  }) : _wrapped = $js.HardwarePlatformInfo()
          ..model = model
          ..manufacturer = manufacturer;

  final $js.HardwarePlatformInfo _wrapped;

  $js.HardwarePlatformInfo get toJS => _wrapped;

  String get model => _wrapped.model;
  set model(String v) {
    _wrapped.model = v;
  }

  String get manufacturer => _wrapped.manufacturer;
  set manufacturer(String v) {
    _wrapped.manufacturer = v;
  }
}
