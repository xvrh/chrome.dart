import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSystemStorageExtension on JSChrome {
  ///  Use the `chrome.system.storage` API to query storage device
  ///  information and be notified when a removable storage device is attached
  /// and
  ///  detached.
  external JSSystemStorage get systemStorage;
}

@JS()
@staticInterop
class JSSystemStorage {}

extension JSSystemStorageExtension on JSSystemStorage {
  ///  Get the storage information from the system. The argument passed to the
  ///  callback is an array of StorageUnitInfo objects.
  external void getInfo(callback);

  ///  Ejects a removable storage device.
  external void ejectDevice(
    id,
    callback,
  );

  ///  Get the available capacity of a specified |id| storage device.
  ///  The |id| is the transient device ID from StorageUnitInfo.
  external void getAvailableCapacity(
    id,
    callback,
  );

  ///  Fired when a new removable storage is attached to the system.
  external ChromeEvent get onAttached;

  ///  Fired when a removable storage is detached from the system.
  external ChromeEvent get onDetached;
}

typedef StorageUnitType = JSString;

typedef EjectDeviceResultCode = JSString;

@JS()
@staticInterop
class StorageUnitInfo {
  ///  The transient ID that uniquely identifies the storage device.
  ///  This ID will be persistent within the same run of a single application.
  ///  It will not be a persistent identifier between different runs of an
  ///  application, or between different applications.
  external JSAny get id;

  ///  The name of the storage unit.
  external JSAny get name;

  ///  The media type of the storage unit.
  external JSAny get type;

  ///  The total amount of the storage space, in bytes.
  external JSAny get capacity;
}

@JS()
@staticInterop
class StorageAvailableCapacityInfo {
  ///  A copied |id| of getAvailableCapacity function parameter |id|.
  external JSAny get id;

  ///  The available capacity of the storage device, in bytes.
  external JSAny get availableCapacity;
}
