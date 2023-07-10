import 'chrome.dart';
export 'chrome.dart';

final _history = ChromeHistory._();

extension ChromeHistoryExtension on Chrome {
  ChromeHistory get history => _history;
}

class ChromeHistory {
  ChromeHistory._();

  /// Searches the history for the last visit time of each page matching the
  /// query.
  void search(query) => throw UnimplementedError();

  /// Retrieves information about visits to a URL.
  void getVisits(details) => throw UnimplementedError();

  /// Adds a URL to the history at the current time with a <a
  /// href='#transition_types'>transition type</a> of "link".
  void addUrl(details) => throw UnimplementedError();

  /// Removes all occurrences of the given URL from the history.
  void deleteUrl(details) => throw UnimplementedError();

  /// Removes all items within the specified date range from the history.  Pages
  /// will not be removed from the history unless all visits fall within the
  /// range.
  void deleteRange(range) => throw UnimplementedError();

  /// Deletes all items from the history.
  void deleteAll() => throw UnimplementedError();

  /// Fired when a URL is visited, providing the HistoryItem data for that URL.
  /// This event fires before the page has loaded.
  Stream get onVisited => throw UnimplementedError();

  /// Fired when one or more URLs are removed from the history service.  When
  /// all visits have been removed the URL is purged from history.
  Stream get onVisitRemoved => throw UnimplementedError();
}

/// The <a href='#transition_types'>transition type</a> for this visit from its
/// referrer.
enum TransitionType {
  link('link'),
  typed('typed'),
  autoBookmark('auto_bookmark'),
  autoSubframe('auto_subframe'),
  manualSubframe('manual_subframe'),
  generated('generated'),
  autoToplevel('auto_toplevel'),
  formSubmit('form_submit'),
  reload('reload'),
  keyword('keyword'),
  keywordGenerated('keyword_generated');

  const TransitionType(this.value);

  final String value;
}
