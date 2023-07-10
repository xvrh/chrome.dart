import 'chrome.dart';
export 'chrome.dart';

final _systemStorage = ChromeSystemStorage._();

extension ChromeChromeSystemStorageExtension on Chrome {
  ChromeSystemStorage get systemStorage => _systemStorage;
}

class ChromeSystemStorage {
  ChromeSystemStorage._();

  /// Get the storage information from the system. The argument passed to the
  /// callback is an array of StorageUnitInfo objects.
  void getInfo() => throw UnimplementedError();

  /// Ejects a removable storage device.
  void ejectDevice(id) => throw UnimplementedError();

  /// Get the available capacity of a specified |id| storage device.
  /// The |id| is the transient device ID from StorageUnitInfo.
  void getAvailableCapacity(id) => throw UnimplementedError();

  /// Fired when a new removable storage is attached to the system.
  Stream get onAttached => throw UnimplementedError();

  /// Fired when a removable storage is detached from the system.
  Stream get onDetached => throw UnimplementedError();
}

enum StorageUnitType {
  /// The storage has fixed media, e.g. hard disk or SSD.
  fixed('fixed'),

  /// The storage is removable, e.g. USB flash drive.
  removable('removable'),

  /// The storage type is unknown.
  unknown('unknown');

  const StorageUnitType(this.value);

  final String value;
}

enum EjectDeviceResultCode {
  /// The ejection command is successful -- the application can prompt the user
  /// to remove the device.
  success('success'),

  /// The device is in use by another application. The ejection did not
  /// succeed; the user should not remove the device until the other
  /// application is done with the device.
  inUse('in_use'),

  /// There is no such device known.
  noSuchDevice('no_such_device'),

  /// The ejection command failed.
  failure('failure');

  const EjectDeviceResultCode(this.value);

  final String value;
}
