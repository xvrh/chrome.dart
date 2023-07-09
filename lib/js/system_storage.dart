import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSystemStorageExtension on JSChrome {
  ///  Use the `chrome.system.storage` API to query storage device
  ///  information and be notified when a removable storage device is attached
  /// and
  ///  detached.
  external JSSystemStorage get SystemStorage;
}

@JS()
@staticInterop
class JSSystemStorage {}

extension JSSystemStorageExtension on JSSystemStorage {
  ///  Get the storage information from the system. The argument passed to the
  ///  callback is an array of StorageUnitInfo objects.
  external void getInfo();

  ///  Ejects a removable storage device.
  external void ejectDevice();

  ///  Get the available capacity of a specified |id| storage device.
  ///  The |id| is the transient device ID from StorageUnitInfo.
  external void getAvailableCapacity();

  ///  Fired when a new removable storage is attached to the system.
  external ChromeEvent get onAttached;

  ///  Fired when a removable storage is detached from the system.
  external ChromeEvent get onDetached;
}
