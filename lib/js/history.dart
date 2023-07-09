import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSHistoryExtension on JSChrome {
  /// Use the `chrome.history` API to interact with the browser's record of
  /// visited pages. You can add, remove, and query for URLs in the browser's
  /// history. To override the history page with your own version, see <a
  /// href='override'>Override Pages</a>.
  external JSHistory get History;
}

@JS()
@staticInterop
class JSHistory {}

extension JSHistoryExtension on JSHistory {
  /// Searches the history for the last visit time of each page matching the
  /// query.
  external void search();

  /// Retrieves information about visits to a URL.
  external void getVisits();

  /// Adds a URL to the history at the current time with a <a
  /// href='#transition_types'>transition type</a> of "link".
  external void addUrl();

  /// Removes all occurrences of the given URL from the history.
  external void deleteUrl();

  /// Removes all items within the specified date range from the history.  Pages
  /// will not be removed from the history unless all visits fall within the
  /// range.
  external void deleteRange();

  /// Deletes all items from the history.
  external void deleteAll();

  /// Fired when a URL is visited, providing the HistoryItem data for that URL.
  /// This event fires before the page has loaded.
  external ChromeEvent get onVisited;

  /// Fired when one or more URLs are removed from the history service.  When
  /// all visits have been removed the URL is purged from history.
  external ChromeEvent get onVisitRemoved;
}
