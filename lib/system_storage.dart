import 'src/internal_helpers.dart';
import 'src/js/system_storage.dart' as $js;
import 'system.dart';

export 'src/chrome.dart' show chrome;
export 'system.dart' show ChromeSystem, ChromeSystemExtension;

final _systemStorage = ChromeSystemStorage._();

extension ChromeSystemStorageExtension on ChromeSystem {
  ChromeSystemStorage get storage => _systemStorage;
}

class ChromeSystemStorage {
  ChromeSystemStorage._();

  /// Get the storage information from the system. The argument passed to the
  /// callback is an array of StorageUnitInfo objects.
  Future<List<StorageUnitInfo>> getInfo() {
    var $completer = Completer<List<StorageUnitInfo>>();
    $js.chrome.system.storage.getInfo((JSArray info) {
      $completer.complete(null);
    }.toJS);
    return $completer.future;
  }

  /// Ejects a removable storage device.
  Future<EjectDeviceResultCode> ejectDevice(String id) {
    var $completer = Completer<EjectDeviceResultCode>();
    $js.chrome.system.storage.ejectDevice(
      id,
      (EjectDeviceResultCode result) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Get the available capacity of a specified |id| storage device.
  /// The |id| is the transient device ID from StorageUnitInfo.
  Future<StorageAvailableCapacityInfo> getAvailableCapacity(String id) {
    var $completer = Completer<StorageAvailableCapacityInfo>();
    $js.chrome.system.storage.getAvailableCapacity(
      id,
      (StorageAvailableCapacityInfo info) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Fired when a new removable storage is attached to the system.
  Stream<StorageUnitInfo> get onAttached => throw UnimplementedError();

  /// Fired when a removable storage is detached from the system.
  Stream<String> get onDetached => throw UnimplementedError();
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

  String get toJS => value;
  static StorageUnitType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
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

  String get toJS => value;
  static EjectDeviceResultCode fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class StorageUnitInfo {
  StorageUnitInfo.fromJS(this._wrapped);

  StorageUnitInfo({
    required String id,
    required String name,
    required StorageUnitType type,
    required double capacity,
  }) : _wrapped = $js.StorageUnitInfo()
          ..id = id
          ..name = name
          ..type = type.toJS
          ..capacity = capacity;

  final $js.StorageUnitInfo _wrapped;

  $js.StorageUnitInfo get toJS => _wrapped;

  /// The transient ID that uniquely identifies the storage device.
  /// This ID will be persistent within the same run of a single application.
  /// It will not be a persistent identifier between different runs of an
  /// application, or between different applications.
  String get id => _wrapped.id;
  set id(String v) {
    _wrapped.id = v;
  }

  /// The name of the storage unit.
  String get name => _wrapped.name;
  set name(String v) {
    _wrapped.name = v;
  }

  /// The media type of the storage unit.
  StorageUnitType get type => StorageUnitType.fromJS(_wrapped.type);
  set type(StorageUnitType v) {
    _wrapped.type = v.toJS;
  }

  /// The total amount of the storage space, in bytes.
  double get capacity => _wrapped.capacity;
  set capacity(double v) {
    _wrapped.capacity = v;
  }
}

class StorageAvailableCapacityInfo {
  StorageAvailableCapacityInfo.fromJS(this._wrapped);

  StorageAvailableCapacityInfo({
    required String id,
    required double availableCapacity,
  }) : _wrapped = $js.StorageAvailableCapacityInfo()
          ..id = id
          ..availableCapacity = availableCapacity;

  final $js.StorageAvailableCapacityInfo _wrapped;

  $js.StorageAvailableCapacityInfo get toJS => _wrapped;

  /// A copied |id| of getAvailableCapacity function parameter |id|.
  String get id => _wrapped.id;
  set id(String v) {
    _wrapped.id = v;
  }

  /// The available capacity of the storage device, in bytes.
  double get availableCapacity => _wrapped.availableCapacity;
  set availableCapacity(double v) {
    _wrapped.availableCapacity = v;
  }
}
