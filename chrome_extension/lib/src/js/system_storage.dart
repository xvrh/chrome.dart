import 'dart:js_interop';

import 'chrome.dart';
import 'system.dart';

export 'chrome.dart';
export 'system.dart';

extension JSChromeJSSystemStorageExtension on JSChromeSystem {
  /// Use the `chrome.system.storage` API to query storage device
  /// information and be notified when a removable storage device is attached
  /// and
  /// detached.
  external JSSystemStorage get storage;
}

@JS()
@staticInterop
class JSSystemStorage {}

extension JSSystemStorageExtension on JSSystemStorage {
  /// Get the storage information from the system. The argument passed to the
  /// callback is an array of StorageUnitInfo objects.
  external void getInfo(JSFunction callback);

  /// Ejects a removable storage device.
  external void ejectDevice(
    String id,
    JSFunction callback,
  );

  /// Get the available capacity of a specified |id| storage device.
  /// The |id| is the transient device ID from StorageUnitInfo.
  external void getAvailableCapacity(
    String id,
    JSFunction callback,
  );

  /// Fired when a new removable storage is attached to the system.
  external ChromeEvent get onAttached;

  /// Fired when a removable storage is detached from the system.
  external ChromeEvent get onDetached;
}

typedef StorageUnitType = String;

typedef EjectDeviceResultCode = String;

@JS()
@staticInterop
class StorageUnitInfo {}

extension StorageUnitInfoExtension on StorageUnitInfo {
  /// The transient ID that uniquely identifies the storage device.
  /// This ID will be persistent within the same run of a single application.
  /// It will not be a persistent identifier between different runs of an
  /// application, or between different applications.
  external String id;

  /// The name of the storage unit.
  external String name;

  /// The media type of the storage unit.
  external StorageUnitType type;

  /// The total amount of the storage space, in bytes.
  external double capacity;
}

@JS()
@staticInterop
class StorageAvailableCapacityInfo {}

extension StorageAvailableCapacityInfoExtension
    on StorageAvailableCapacityInfo {
  /// A copied |id| of getAvailableCapacity function parameter |id|.
  external String id;

  /// The available capacity of the storage device, in bytes.
  external double availableCapacity;
}
