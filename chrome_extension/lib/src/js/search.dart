import 'dart:js_interop';

import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSSearchExtension on JSChrome {
  /// Use the `chrome.search` API to search via the default provider.
  external JSSearch get search;
}

@JS()
@staticInterop
class JSSearch {}

extension JSSearchExtension on JSSearch {
  /// Used to query the default search provider.
  /// In case of an error,
  /// [runtime.lastError] will be set.
  external JSPromise query(QueryInfo queryInfo);
}

typedef Disposition = String;

@JS()
@staticInterop
class QueryInfo {}

extension QueryInfoExtension on QueryInfo {
  /// String to query with the default search provider.
  external String text;

  /// Location where search results should be displayed.
  /// `CURRENT_TAB` is the default.
  external Disposition? disposition;

  /// Location where search results should be displayed.
  /// `tabId` cannot be used with `disposition`.
  external int? tabId;
}