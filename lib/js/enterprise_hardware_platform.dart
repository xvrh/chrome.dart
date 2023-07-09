import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSEnterpriseHardwarePlatformExtension on JSChrome {
  ///  Use the `chrome.enterprise.hardwarePlatform` API to get the
  ///  manufacturer and model of the hardware platform where the browser runs.
  ///  Note: This API is only available to extensions installed by enterprise
  ///  policy.
  external JSEnterpriseHardwarePlatform get EnterpriseHardwarePlatform;
}

@JS()
@staticInterop
class JSEnterpriseHardwarePlatform {}

extension JSEnterpriseHardwarePlatformExtension
    on JSEnterpriseHardwarePlatform {
  ///  Obtains the manufacturer and model for the hardware platform and, if
  ///  the extension is authorized, returns it via |callback|.
  ///  |callback|: Called with the hardware platform info.
  external void getHardwarePlatformInfo();
}
