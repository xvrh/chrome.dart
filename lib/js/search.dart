import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSearchExtension on JSChrome {
  ///  Use the `chrome.search` API to search via the default provider.
  external JSSearch get Search;
}

@JS()
@staticInterop
class JSSearch {}

extension JSSearchExtension on JSSearch {
  ///  Used to query the default search provider.
  ///  In case of an error,
  ///  $(ref:runtime.lastError) will be set.
  external void query();
}
