import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/storage.dart' as $js;

export 'src/chrome.dart' show chrome;

final _storage = ChromeStorage._();

extension ChromeStorageExtension on Chrome {
  /// Use the `chrome.storage` API to store, retrieve, and track changes to user
  /// data.
  ChromeStorage get storage => _storage;
}

class ChromeStorage {
  ChromeStorage._();

  bool get isAvailable => $js.chrome.storageNullable != null;

  /// Items in the `sync` storage area are synced using Chrome Sync.
  StorageArea get sync => StorageArea.fromJS($js.chrome.storage.sync);

  /// Items in the `local` storage area are local to each machine.
  StorageArea get local => StorageArea.fromJS($js.chrome.storage.local);

  /// Items in the `managed` storage area are set by the domain administrator,
  /// and are read-only for the extension; trying to modify this namespace
  /// results in an error.
  StorageArea get managed => StorageArea.fromJS($js.chrome.storage.managed);

  /// Items in the `session` storage area are stored in-memory and will not be
  /// persisted to disk.
  StorageArea get session => StorageArea.fromJS($js.chrome.storage.session);

  /// Fired when one or more items change.
  Stream<OnChangedEvent> get onChanged =>
      $js.chrome.storage.onChanged.asStream(($c) => (
            JSObject changes,
            String areaName,
          ) {
            $c.add(OnChangedEvent(
              changes: (changes.dartify() as Map),
              areaName: areaName,
            ));
          }.toJS);
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

  StorageChange({
    Object? oldValue,
    Object? newValue,
  }) : _wrapped = $js.StorageChange()
          ..oldValue = oldValue?.toJS
          ..newValue = newValue?.toJS;

  final $js.StorageChange _wrapped;

  $js.StorageChange get toJS => _wrapped;

  /// The old value of the item, if there was an old value.
  Object? get oldValue => _wrapped.oldValue;
  set oldValue(Object? v) {
    _wrapped.oldValue = v?.toJS;
  }

  /// The new value of the item, if there is a new value.
  Object? get newValue => _wrapped.newValue;
  set newValue(Object? v) {
    _wrapped.newValue = v?.toJS;
  }
}

class StorageArea {
  StorageArea.fromJS(this._wrapped);

  StorageArea() : _wrapped = $js.StorageArea();

  final $js.StorageArea _wrapped;

  $js.StorageArea get toJS => _wrapped;

  /// Gets one or more items from storage.
  /// [keys] A single key to get, list of keys to get, or a dictionary
  /// specifying default values (see description of the object).  An empty
  /// list or object will return an empty result object.  Pass in `null` to
  /// get the entire contents of storage.
  Future<Map> get(Object? keys) async {
    var $res = await promiseToFuture<JSObject>(_wrapped.get(keys?.toJS));
    return ($res.dartify() as Map);
  }

  /// Gets the amount of space (in bytes) being used by one or more items.
  /// [keys] A single key or list of keys to get the total usage for. An empty
  /// list will return 0. Pass in `null` to get the total usage of all of
  /// storage.
  Future<int> getBytesInUse(Object? keys) async {
    var $res = await promiseToFuture<int>(_wrapped.getBytesInUse(keys?.toJS));
    return $res;
  }

  /// Sets multiple items.
  /// [items] An object which gives each key/value pair to update storage
  /// with. Any other key/value pairs in storage will not be affected.
  ///
  /// Primitive values such as numbers will serialize as expected. Values with
  /// a `typeof` `"object"` and `"function"` will typically serialize to `{}`,
  /// with the exception of `Array` (serializes as expected), `Date`, and
  /// `Regex` (serialize using their `String` representation).
  Future<void> set(Map items) async {
    await promiseToFuture<void>(_wrapped.set(items.toJS));
  }

  /// Removes one or more items from storage.
  /// [keys] A single key or a list of keys for items to remove.
  Future<void> remove(Object keys) async {
    await promiseToFuture<void>(_wrapped.remove(keys.toJS));
  }

  /// Removes all items from storage.
  Future<void> clear() async {
    await promiseToFuture<void>(_wrapped.clear());
  }

  /// Sets the desired access level for the storage area. The default will be
  /// only trusted contexts.
  Future<void> setAccessLevel(SetAccessLevelAccessOptions accessOptions) async {
    await promiseToFuture<void>(_wrapped.setAccessLevel(accessOptions.toJS));
  }

  /// Fired when one or more items change.
  Stream<Map> get onChanged =>
      _wrapped.onChanged.asStream(($c) => (JSObject changes) {
            $c.add((changes.dartify() as Map));
          }.toJS);
}

class SetAccessLevelAccessOptions {
  SetAccessLevelAccessOptions.fromJS(this._wrapped);

  SetAccessLevelAccessOptions({required AccessLevel accessLevel})
      : _wrapped =
            $js.SetAccessLevelAccessOptions(accessLevel: accessLevel.toJS);

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
  final Map changes;

  /// The name of the storage area (`"sync"`, `"local"` or `"managed"`) the
  /// changes are for.
  final String areaName;
}
