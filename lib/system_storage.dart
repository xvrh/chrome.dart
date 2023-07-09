import 'chrome.dart';
export 'chrome.dart';

final _systemStorage = ChromeSystemStorage._();

extension ChromeChromeSystemStorageExtension on Chrome {
  ChromeSystemStorage get systemStorage => _systemStorage;
}

class ChromeSystemStorage {
  ChromeSystemStorage._();
}

enum StorageUnitType {
  ///  The storage has fixed media, e.g. hard disk or SSD.
  fixed('fixed'),

  ///  The storage is removable, e.g. USB flash drive.
  removable('removable'),

  ///  The storage type is unknown.
  unknown('unknown');

  const StorageUnitType(this.value);

  final String value;
}

enum EjectDeviceResultCode {
  ///  The ejection command is successful -- the application can prompt the user
  ///  to remove the device.
  success('success'),

  ///  The device is in use by another application. The ejection did not
  ///  succeed; the user should not remove the device until the other
  ///  application is done with the device.
  inUse('in_use'),

  ///  There is no such device known.
  noSuchDevice('no_such_device'),

  ///  The ejection command failed.
  failure('failure');

  const EjectDeviceResultCode(this.value);

  final String value;
}
