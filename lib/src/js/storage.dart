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
  external StorageArea get sync;

  /// Items in the `local` storage area are local to each machine.
  external StorageArea get local;

  /// Items in the `managed` storage area are set by the domain administrator,
  /// and are read-only for the extension; trying to modify this namespace
  /// results in an error.
  external StorageArea get managed;

  /// Items in the `session` storage area are stored in-memory and will not be
  /// persisted to disk.
  external StorageArea get session;
}

/// The storage area's access level.
typedef AccessLevel = JSString;

@JS()
@staticInterop
class StorageChange {}

extension StorageChangeExtension on StorageChange {
  /// The old value of the item, if there was an old value.
  external JSAny? get oldValue;

  /// The new value of the item, if there is a new value.
  external JSAny? get newValue;
}

@JS()
@staticInterop
class StorageArea {}

extension StorageAreaExtension on StorageArea {
  /// Gets one or more items from storage.
  external JSPromise get(JSObject? keys);

  /// Gets the amount of space (in bytes) being used by one or more items.
  external JSPromise getBytesInUse(JSObject? keys);

  /// Sets multiple items.
  external JSPromise set(JSObject items);

  /// Removes one or more items from storage.
  external JSPromise remove(JSObject keys);

  /// Removes all items from storage.
  external JSPromise clear();

  /// Sets the desired access level for the storage area. The default will be
  /// only trusted contexts.
  external JSPromise setAccessLevel(SetAccessLevelAccessOptions accessOptions);

  /// Fired when one or more items change.
  external ChromeEvent get onChanged;
}

@JS()
@staticInterop
@anonymous
class SetAccessLevelAccessOptions {
  external factory SetAccessLevelAccessOptions(

      /// The access level of the storage area.
      AccessLevel accessLevel);
}
