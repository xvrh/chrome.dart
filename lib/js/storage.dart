import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSStorageExtension on JSChrome {
  /// Use the `chrome.storage` API to store, retrieve, and track changes to user
  /// data.
  external JSStorage get Storage;
}

@JS()
@staticInterop
class JSStorage {}

extension JSStorageExtension on JSStorage {
  /// Fired when one or more items change.
  external ChromeEvent get onChanged;
}
