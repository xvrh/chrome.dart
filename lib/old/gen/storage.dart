/* This file has been generated from storage.json - do not edit */

/**
 * Use the `chrome.storage` API to store, retrieve, and track changes to user
 * data.
 */
library chrome.storage;

import '../src/common.dart';

/**
 * Accessor for the `chrome.storage` namespace.
 */
final ChromeStorage storage = ChromeStorage._();

class ChromeStorage extends ChromeApi {
  JsObject get _storage => chrome['storage'];

  /**
   * Fired when one or more items change.
   */
  Stream<StorageOnChangedEvent> get onChanged => _onChanged.stream;
  late ChromeStreamController<StorageOnChangedEvent> _onChanged;

  ChromeStorage._() {
    var getApi = () => _storage;
    _onChanged = ChromeStreamController<StorageOnChangedEvent>.twoArgs(getApi, 'onChanged', _createOnChangedEvent);
  }

  bool get available => _storage != null;

  /**
   * Items in the `sync` storage area are synced using Chrome Sync.
   */
  SyncStorageArea get sync => _createSyncStorageArea(_storage['sync']);

  /**
   * Items in the `local` storage area are local to each machine.
   */
  LocalStorageArea get local => _createLocalStorageArea(_storage['local']);

  /**
   * Items in the `managed` storage area are set by the domain administrator,
   * and are read-only for the extension; trying to modify this namespace
   * results in an error.
   */
  StorageArea get managed => _createStorageArea(_storage['managed']);

  /**
   * Items in the `session` storage area are stored in-memory and will not be
   * persisted to disk.
   */
  SessionStorageArea get session => _createSessionStorageArea(_storage['session']);
}

/**
 * Fired when one or more items change.
 */
class StorageOnChangedEvent {
  /**
   * Object mapping each key that changed to its corresponding
   * [storage.StorageChange] for that item.
   */
  final Map changes;

  /**
   * The name of the storage area (`"sync"`, `"local"` or `"managed"`) the
   * changes are for.
   */
  final String areaName;

  StorageOnChangedEvent(this.changes, this.areaName);
}

/**
 * The storage area's access level.
 */
class AccessLevel extends ChromeEnum {
  static const AccessLevel TRUSTED_CONTEXTS = const AccessLevel._('TRUSTED_CONTEXTS');
  static const AccessLevel TRUSTED_AND_UNTRUSTED_CONTEXTS = const AccessLevel._('TRUSTED_AND_UNTRUSTED_CONTEXTS');

  static const List<AccessLevel> VALUES = const[TRUSTED_CONTEXTS, TRUSTED_AND_UNTRUSTED_CONTEXTS];

  const AccessLevel._(String str): super(str);
}

class SyncStorageArea extends StorageArea {
  SyncStorageArea();
  SyncStorageArea.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The maximum total amount (in bytes) of data that can be stored in sync
   * storage, as measured by the JSON stringification of every value plus every
   * key's length. Updates that would cause this limit to be exceeded fail
   * immediately and set [runtime.lastError].
   */
  int get QUOTA_BYTES => jsProxy['QUOTA_BYTES'];

  /**
   * The maximum size (in bytes) of each individual item in sync storage, as
   * measured by the JSON stringification of its value plus its key length.
   * Updates containing items larger than this limit will fail immediately and
   * set [runtime.lastError].
   */
  int get QUOTA_BYTES_PER_ITEM => jsProxy['QUOTA_BYTES_PER_ITEM'];

  /**
   * The maximum number of items that can be stored in sync storage. Updates
   * that would cause this limit to be exceeded will fail immediately and set
   * [runtime.lastError].
   */
  int get MAX_ITEMS => jsProxy['MAX_ITEMS'];

  /**
   * The maximum number of `set`, `remove`, or `clear` operations that can be
   * performed each hour. This is 1 every 2 seconds, a lower ceiling than the
   * short term higher writes-per-minute limit.
   * 
   * Updates that would cause this limit to be exceeded fail immediately and set
   * [runtime.lastError].
   */
  int get MAX_WRITE_OPERATIONS_PER_HOUR => jsProxy['MAX_WRITE_OPERATIONS_PER_HOUR'];

  /**
   * The maximum number of `set`, `remove`, or `clear` operations that can be
   * performed each minute. This is 2 per second, providing higher throughput
   * than writes-per-hour over a shorter period of time.
   * 
   * Updates that would cause this limit to be exceeded fail immediately and set
   * [runtime.lastError].
   */
  int get MAX_WRITE_OPERATIONS_PER_MINUTE => jsProxy['MAX_WRITE_OPERATIONS_PER_MINUTE'];

  int get MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE => jsProxy['MAX_SUSTAINED_WRITE_OPERATIONS_PER_MINUTE'];
}

class LocalStorageArea extends StorageArea {
  LocalStorageArea();
  LocalStorageArea.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The maximum amount (in bytes) of data that can be stored in local storage,
   * as measured by the JSON stringification of every value plus every key's
   * length. This value will be ignored if the extension has the
   * `unlimitedStorage` permission. Updates that would cause this limit to be
   * exceeded fail immediately and set [runtime.lastError].
   */
  int get QUOTA_BYTES => jsProxy['QUOTA_BYTES'];
}

class SessionStorageArea extends StorageArea {
  SessionStorageArea();
  SessionStorageArea.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The maximum amount (in bytes) of data that can be stored in memory, as
   * measured by estimating the dynamically allocated memory usage of every
   * value and key. Updates that would cause this limit to be exceeded fail
   * immediately and set [runtime.lastError].
   */
  int get QUOTA_BYTES => jsProxy['QUOTA_BYTES'];
}

class StorageChange extends ChromeObject {
  StorageChange({Object? oldValue, Object? newValue}) {
    if (oldValue != null) this.oldValue = oldValue;
    if (newValue != null) this.newValue = newValue;
  }
  StorageChange.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The old value of the item, if there was an old value.
   */
  Object get oldValue => jsProxy['oldValue'];
  set oldValue(Object value) => jsProxy['oldValue'] = jsify(value);

  /**
   * The new value of the item, if there is a new value.
   */
  Object get newValue => jsProxy['newValue'];
  set newValue(Object value) => jsProxy['newValue'] = jsify(value);
}

class StorageArea extends ChromeObject {
  StorageArea();
  StorageArea.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Gets one or more items from storage.
   * 
   * [keys] A single key to get, list of keys to get, or a dictionary specifying
   * default values (see description of the object).  An empty list or object
   * will return an empty result object.  Pass in `null` to get the entire
   * contents of storage.
   */
  void get([Object? keys]) {
    jsProxy.callMethod('get', [jsify(keys)]);
  }

  /**
   * Gets the amount of space (in bytes) being used by one or more items.
   * 
   * [keys] A single key or list of keys to get the total usage for. An empty
   * list will return 0. Pass in `null` to get the total usage of all of
   * storage.
   */
  void getBytesInUse([Object? keys]) {
    jsProxy.callMethod('getBytesInUse', [jsify(keys)]);
  }

  /**
   * Sets multiple items.
   * 
   * [items] An object which gives each key/value pair to update storage with.
   * Any other key/value pairs in storage will not be affected.
   * 
   * Primitive values such as numbers will serialize as expected. Values with a
   * `typeof` `"object"` and `"function"` will typically serialize to `{}`, with
   * the exception of `Array` (serializes as expected), `Date`, and `Regex`
   * (serialize using their `String` representation).
   */
  void set(Map<String, Object> items) {
    jsProxy.callMethod('set', [jsify(items)]);
  }

  /**
   * Removes one or more items from storage.
   * 
   * [keys] A single key or a list of keys for items to remove.
   */
  void remove(Object keys) {
    jsProxy.callMethod('remove', [jsify(keys)]);
  }

  /**
   * Removes all items from storage.
   */
  void clear() {
    jsProxy.callMethod('clear');
  }

  /**
   * Sets the desired access level for the storage area. The default will be
   * only trusted contexts.
   */
  void setAccessLevel(StorageSetAccessLevelParams accessOptions) {
    jsProxy.callMethod('setAccessLevel', [jsify(accessOptions)]);
  }
}

class StorageSetAccessLevelParams extends ChromeObject {
  StorageSetAccessLevelParams({AccessLevel? accessLevel}) {
    if (accessLevel != null) this.accessLevel = accessLevel;
  }
  StorageSetAccessLevelParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The access level of the storage area.
   */
  AccessLevel get accessLevel => _createAccessLevel(jsProxy['accessLevel']);
  set accessLevel(AccessLevel value) => jsProxy['accessLevel'] = jsify(value);
}

StorageOnChangedEvent _createOnChangedEvent(JsObject changes, String areaName) =>
    StorageOnChangedEvent(mapify(changes), areaName);
SyncStorageArea _createSyncStorageArea(JsObject jsProxy) => SyncStorageArea.fromProxy(jsProxy);
LocalStorageArea _createLocalStorageArea(JsObject jsProxy) => LocalStorageArea.fromProxy(jsProxy);
StorageArea _createStorageArea(JsObject jsProxy) => StorageArea.fromProxy(jsProxy);
SessionStorageArea _createSessionStorageArea(JsObject jsProxy) => SessionStorageArea.fromProxy(jsProxy);
AccessLevel _createAccessLevel(String value) => AccessLevel.VALUES.singleWhere((ChromeEnum e) => e.value == value);
