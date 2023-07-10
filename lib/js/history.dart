import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSHistoryExtension on JSChrome {
  /// Use the `chrome.history` API to interact with the browser's record of
  /// visited pages. You can add, remove, and query for URLs in the browser's
  /// history. To override the history page with your own version, see <a
  /// href='override'>Override Pages</a>.
  external JSHistory get history;
}

@JS()
@staticInterop
class JSHistory {}

extension JSHistoryExtension on JSHistory {
  /// Searches the history for the last visit time of each page matching the
  /// query.
  external JSPromise search(JSObject query);

  /// Retrieves information about visits to a URL.
  external JSPromise getVisits(UrlDetails details);

  /// Adds a URL to the history at the current time with a <a
  /// href='#transition_types'>transition type</a> of "link".
  external JSPromise addUrl(UrlDetails details);

  /// Removes all occurrences of the given URL from the history.
  external JSPromise deleteUrl(UrlDetails details);

  /// Removes all items within the specified date range from the history.  Pages
  /// will not be removed from the history unless all visits fall within the
  /// range.
  external JSPromise deleteRange(JSObject range);

  /// Deletes all items from the history.
  external JSPromise deleteAll();

  /// Fired when a URL is visited, providing the HistoryItem data for that URL.
  /// This event fires before the page has loaded.
  external ChromeEvent get onVisited;

  /// Fired when one or more URLs are removed from the history service.  When
  /// all visits have been removed the URL is purged from history.
  external ChromeEvent get onVisitRemoved;
}

/// The <a href='#transition_types'>transition type</a> for this visit from its
/// referrer.
typedef TransitionType = JSString;

@JS()
@staticInterop
class HistoryItem {
  /// The unique identifier for the item.
  external String get id;

  /// The URL navigated to by a user.
  external String? get url;

  /// The title of the page when it was last loaded.
  external String? get title;

  /// When this page was last loaded, represented in milliseconds since the
  /// epoch.
  external num? get lastVisitTime;

  /// The number of times the user has navigated to this page.
  external int? get visitCount;

  /// The number of times the user has navigated to this page by typing in the
  /// address.
  external int? get typedCount;
}

@JS()
@staticInterop
class VisitItem {
  /// The unique identifier for the item.
  external String get id;

  /// The unique identifier for this visit.
  external String get visitId;

  /// When this visit occurred, represented in milliseconds since the epoch.
  external num? get visitTime;

  /// The visit ID of the referrer.
  external String get referringVisitId;

  /// The <a href='#transition_types'>transition type</a> for this visit from
  /// its referrer.
  external TransitionType get transition;
}

@JS()
@staticInterop
class UrlDetails {
  /// The URL for the operation. It must be in the format as returned from a
  /// call to history.search.
  external String get url;
}
