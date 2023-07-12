import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSStorageExtension on JSChrome {
  /// Use the `chrome.storage` API to store, retrieve, and track changes to user
  /// data.
  external JSStorage get storage;
}

@JS()
@staticInterop
class JSStorage {}

extension JSStorageExtension on JSStorage {
  /// Fired when one or more items change.
  external ChromeEvent get onChanged;

  /// Items in the `sync` storage area are synced using Chrome Sync.
  external StorageSync get sync;

  /// Items in the `local` storage area are local to each machine.
  external StorageLocal get local;

  /// Items in the `managed` storage area are set by the domain administrator,
  /// and are read-only for the extension; trying to modify this namespace
  /// results in an error.
  external StorageArea get managed;

  /// Items in the `session` storage area are stored in-memory and will not be
  /// persisted to disk.
  external StorageSession get session;
}

/// The storage area's access level.
typedef AccessLevel = String;

@JS()
@staticInterop
class StorageChange {}

extension StorageChangeExtension on StorageChange {
  /// The old value of the item, if there was an old value.
  external JSAny? oldValue;

  /// The new value of the item, if there is a new value.
  external JSAny? newValue;
}

@JS()
@staticInterop
class StorageArea {}

extension StorageAreaExtension on StorageArea {
  /// Gets one or more items from storage.
  external void get(
    JSAny? keys,
    JSFunction callback,
  );

  /// Gets the amount of space (in bytes) being used by one or more items.
  external void getBytesInUse(
    JSAny? keys,
    JSFunction callback,
  );

  /// Sets multiple items.
  external void set(
    JSAny items,
    JSFunction callback,
  );

  /// Removes one or more items from storage.
  external void remove(
    JSAny keys,
    JSFunction callback,
  );

  /// Removes all items from storage.
  external void clear(JSFunction callback);

  /// Sets the desired access level for the storage area. The default will be
  /// only trusted contexts.
  external void setAccessLevel(
    SetAccessLevelAccessOptions accessOptions,
    JSFunction callback,
  );

  /// Fired when one or more items change.
  external ChromeEvent get onChanged;
}

@JS()
@staticInterop
class StorageSync {}

extension StorageSyncExtension on StorageSync {
  /// The maximum total amount (in bytes) of data that can be stored in sync
  /// storage, as measured by the JSON stringification of every value plus every
  /// key's length. Updates that would cause this limit to be exceeded fail
  /// immediately and set [runtime.lastError].
  external int QUOTA_BYTES;

  /// The maximum size (in bytes) of each individual item in sync storage, as
  /// measured by the JSON stringification of its value plus its key length.
  /// Updates containing items larger than this limit will fail immediately and
  /// set [runtime.lastError].
  external int QUOTA_BYTES_PER_ITEM;

  /// The maximum number of items that can be stored in sync storage. Updates
  /// that would cause this limit to be exceeded will fail immediately and set
  /// [runtime.lastError].
  external int MAX_ITEMS;

  /// The maximum number of `set`, `remove`, or `clear` operations that can be
  /// performed each hour. This is 1 every 2 seconds, a lower ceiling than the
  /// short term higher writes-per-minute limit.
  ///
  /// Updates that would cause this limit to be exceeded fail immediately and
  /// set [runtime.lastError].
  external int MAX_WRITE_OPERATIONS_PER_HOUR;

  /// The maximum number of `set`, `remove`, or `clear` operations that can be
  /// performed each minute. This is 2 per second, providing higher throughput
  /// than writes-per-hour over a shorter period of time.
  ///
  /// Updates that would cause this limit to be exceeded fail immediately and
  /// set [runtime.lastError].
  external int MAX_WRITE_OPERATIONS_PER_MINUTE;

  external int MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE;
}

@JS()
@staticInterop
class StorageLocal {}

extension StorageLocalExtension on StorageLocal {
  /// The maximum amount (in bytes) of data that can be stored in local storage,
  /// as measured by the JSON stringification of every value plus every key's
  /// length. This value will be ignored if the extension has the
  /// `unlimitedStorage` permission. Updates that would cause this limit to be
  /// exceeded fail immediately and set [runtime.lastError].
  external int QUOTA_BYTES;
}

@JS()
@staticInterop
class StorageSession {}

extension StorageSessionExtension on StorageSession {
  /// The maximum amount (in bytes) of data that can be stored in memory, as
  /// measured by estimating the dynamically allocated memory usage of every
  /// value and key. Updates that would cause this limit to be exceeded fail
  /// immediately and set [runtime.lastError].
  external int QUOTA_BYTES;
}

@JS()
@staticInterop
@anonymous
class SetAccessLevelAccessOptions {
  external factory SetAccessLevelAccessOptions(
      {
      /// The access level of the storage area.
      AccessLevel accessLevel});
}
