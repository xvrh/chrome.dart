import 'src/internal_helpers.dart';
import 'src/js/storage.dart' as $js;
export 'chrome.dart';

final _storage = ChromeStorage._();

extension ChromeStorageExtension on Chrome {
  ChromeStorage get storage => _storage;
}

class ChromeStorage {
  ChromeStorage._();

  /// Items in the `sync` storage area are synced using Chrome Sync.
  StorageSync get sync => $js.chrome.storage.sync as dynamic;

  /// Items in the `local` storage area are local to each machine.
  StorageLocal get local => $js.chrome.storage.local as dynamic;

  /// Items in the `managed` storage area are set by the domain administrator,
  /// and are read-only for the extension; trying to modify this namespace
  /// results in an error.
  StorageArea get managed => $js.chrome.storage.managed as dynamic;

  /// Items in the `session` storage area are stored in-memory and will not be
  /// persisted to disk.
  StorageSession get session => $js.chrome.storage.session as dynamic;

  /// Fired when one or more items change.
  Stream<OnChangedEvent> get onChanged => throw UnimplementedError();
}

/// The storage area's access level.
enum AccessLevel {
  trustedContexts('TRUSTED_CONTEXTS'),
  trustedAndUntrustedContexts('TRUSTED_AND_UNTRUSTED_CONTEXTS');

  const AccessLevel(this.value);

  final String value;

  String get toJS => value;
  static AccessLevel fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class StorageChange {
  StorageChange.fromJS(this._wrapped);

  final $js.StorageChange _wrapped;

  $js.StorageChange get toJS => _wrapped;

  /// The old value of the item, if there was an old value.
  JSAny? get oldValue => _wrapped.oldValue;
  set oldValue(JSAny? v) {
    throw UnimplementedError();
  }

  /// The new value of the item, if there is a new value.
  JSAny? get newValue => _wrapped.newValue;
  set newValue(JSAny? v) {
    throw UnimplementedError();
  }
}

class StorageArea {
  StorageArea.fromJS(this._wrapped);

  final $js.StorageArea _wrapped;

  $js.StorageArea get toJS => _wrapped;

  /// Gets one or more items from storage.
  Future<JSAny> get(JSAny? keys) => throw UnimplementedError();

  /// Gets the amount of space (in bytes) being used by one or more items.
  Future<int> getBytesInUse(JSAny? keys) => throw UnimplementedError();

  /// Sets multiple items.
  Future<void> set(JSAny items) => throw UnimplementedError();

  /// Removes one or more items from storage.
  Future<void> remove(JSAny keys) => throw UnimplementedError();

  /// Removes all items from storage.
  Future<void> clear() => throw UnimplementedError();

  /// Sets the desired access level for the storage area. The default will be
  /// only trusted contexts.
  Future<void> setAccessLevel(SetAccessLevelAccessOptions accessOptions) =>
      throw UnimplementedError();

  /// Fired when one or more items change.
  Stream<JSAny> get onChanged => throw UnimplementedError();
}

class StorageSync {
  StorageSync.fromJS(this._wrapped);

  final $js.StorageSync _wrapped;

  $js.StorageSync get toJS => _wrapped;

  /// The maximum total amount (in bytes) of data that can be stored in sync
  /// storage, as measured by the JSON stringification of every value plus every
  /// key's length. Updates that would cause this limit to be exceeded fail
  /// immediately and set [runtime.lastError].
  int get QUOTA_BYTES => _wrapped.QUOTA_BYTES;
  set QUOTA_BYTES(int v) {
    throw UnimplementedError();
  }

  /// The maximum size (in bytes) of each individual item in sync storage, as
  /// measured by the JSON stringification of its value plus its key length.
  /// Updates containing items larger than this limit will fail immediately and
  /// set [runtime.lastError].
  int get QUOTA_BYTES_PER_ITEM => _wrapped.QUOTA_BYTES_PER_ITEM;
  set QUOTA_BYTES_PER_ITEM(int v) {
    throw UnimplementedError();
  }

  /// The maximum number of items that can be stored in sync storage. Updates
  /// that would cause this limit to be exceeded will fail immediately and set
  /// [runtime.lastError].
  int get MAX_ITEMS => _wrapped.MAX_ITEMS;
  set MAX_ITEMS(int v) {
    throw UnimplementedError();
  }

  /// The maximum number of `set`, `remove`, or `clear` operations that can be
  /// performed each hour. This is 1 every 2 seconds, a lower ceiling than the
  /// short term higher writes-per-minute limit.
  ///
  /// Updates that would cause this limit to be exceeded fail immediately and
  /// set [runtime.lastError].
  int get MAX_WRITE_OPERATIONS_PER_HOUR =>
      _wrapped.MAX_WRITE_OPERATIONS_PER_HOUR;
  set MAX_WRITE_OPERATIONS_PER_HOUR(int v) {
    throw UnimplementedError();
  }

  /// The maximum number of `set`, `remove`, or `clear` operations that can be
  /// performed each minute. This is 2 per second, providing higher throughput
  /// than writes-per-hour over a shorter period of time.
  ///
  /// Updates that would cause this limit to be exceeded fail immediately and
  /// set [runtime.lastError].
  int get MAX_WRITE_OPERATIONS_PER_MINUTE =>
      _wrapped.MAX_WRITE_OPERATIONS_PER_MINUTE;
  set MAX_WRITE_OPERATIONS_PER_MINUTE(int v) {
    throw UnimplementedError();
  }

  int get MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE =>
      _wrapped.MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE;
  set MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE(int v) {
    throw UnimplementedError();
  }
}

class StorageLocal {
  StorageLocal.fromJS(this._wrapped);

  final $js.StorageLocal _wrapped;

  $js.StorageLocal get toJS => _wrapped;

  /// The maximum amount (in bytes) of data that can be stored in local storage,
  /// as measured by the JSON stringification of every value plus every key's
  /// length. This value will be ignored if the extension has the
  /// `unlimitedStorage` permission. Updates that would cause this limit to be
  /// exceeded fail immediately and set [runtime.lastError].
  int get QUOTA_BYTES => _wrapped.QUOTA_BYTES;
  set QUOTA_BYTES(int v) {
    throw UnimplementedError();
  }
}

class StorageSession {
  StorageSession.fromJS(this._wrapped);

  final $js.StorageSession _wrapped;

  $js.StorageSession get toJS => _wrapped;

  /// The maximum amount (in bytes) of data that can be stored in memory, as
  /// measured by estimating the dynamically allocated memory usage of every
  /// value and key. Updates that would cause this limit to be exceeded fail
  /// immediately and set [runtime.lastError].
  int get QUOTA_BYTES => _wrapped.QUOTA_BYTES;
  set QUOTA_BYTES(int v) {
    throw UnimplementedError();
  }
}

class SetAccessLevelAccessOptions {
  SetAccessLevelAccessOptions.fromJS(this._wrapped);

  final $js.SetAccessLevelAccessOptions _wrapped;

  $js.SetAccessLevelAccessOptions get toJS => _wrapped;
}

class OnChangedEvent {
  OnChangedEvent({
    required this.changes,
    required this.areaName,
  });

  /// Object mapping each key that changed to its corresponding
  /// [storage.StorageChange] for that item.
  final JSAny changes;

  /// The name of the storage area (`"sync"`, `"local"` or `"managed"`) the
  /// changes are for.
  final String areaName;
}
