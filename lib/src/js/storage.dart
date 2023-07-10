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
}

/// The storage area's access level.
typedef AccessLevel = JSString;

@JS()
@staticInterop
class StorageChange {
  /// The old value of the item, if there was an old value.
  external JSAny? get oldValue;

  /// The new value of the item, if there is a new value.
  external JSAny? get newValue;
}

@JS()
@staticInterop
class StorageArea {}
