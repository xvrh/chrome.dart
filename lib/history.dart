import 'src/internal_helpers.dart';
import 'src/js/history.dart' as $js;
export 'chrome.dart';

final _history = ChromeHistory._();

extension ChromeHistoryExtension on Chrome {
  ChromeHistory get history => _history;
}

class ChromeHistory {
  ChromeHistory._();

  /// Searches the history for the last visit time of each page matching the
  /// query.
  Future<List<HistoryItem>> search(SearchQuery query) =>
      throw UnimplementedError();

  /// Retrieves information about visits to a URL.
  Future<List<VisitItem>> getVisits(UrlDetails details) =>
      throw UnimplementedError();

  /// Adds a URL to the history at the current time with a [transition
  /// type](#transition_types) of "link".
  Future<void> addUrl(UrlDetails details) => throw UnimplementedError();

  /// Removes all occurrences of the given URL from the history.
  Future<void> deleteUrl(UrlDetails details) => throw UnimplementedError();

  /// Removes all items within the specified date range from the history.  Pages
  /// will not be removed from the history unless all visits fall within the
  /// range.
  Future<void> deleteRange(DeleteRangeRange range) =>
      throw UnimplementedError();

  /// Deletes all items from the history.
  Future<void> deleteAll() => throw UnimplementedError();

  /// Fired when a URL is visited, providing the HistoryItem data for that URL.
  /// This event fires before the page has loaded.
  Stream<HistoryItem> get onVisited => throw UnimplementedError();

  /// Fired when one or more URLs are removed from the history service.  When
  /// all visits have been removed the URL is purged from history.
  Stream<OnVisitRemovedRemoved> get onVisitRemoved =>
      throw UnimplementedError();
}

/// The [transition type](#transition_types) for this visit from its referrer.
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

  String get toJS => value;
  static TransitionType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class HistoryItem {
  HistoryItem.fromJS(this._wrapped);

  final $js.HistoryItem _wrapped;

  $js.HistoryItem get toJS => _wrapped;

  /// The unique identifier for the item.
  String get id => _wrapped.id;
  set id(String v) {
    throw UnimplementedError();
  }

  /// The URL navigated to by a user.
  String? get url => _wrapped.url;
  set url(String? v) {
    throw UnimplementedError();
  }

  /// The title of the page when it was last loaded.
  String? get title => _wrapped.title;
  set title(String? v) {
    throw UnimplementedError();
  }

  /// When this page was last loaded, represented in milliseconds since the
  /// epoch.
  double? get lastVisitTime => _wrapped.lastVisitTime;
  set lastVisitTime(double? v) {
    throw UnimplementedError();
  }

  /// The number of times the user has navigated to this page.
  int? get visitCount => _wrapped.visitCount;
  set visitCount(int? v) {
    throw UnimplementedError();
  }

  /// The number of times the user has navigated to this page by typing in the
  /// address.
  int? get typedCount => _wrapped.typedCount;
  set typedCount(int? v) {
    throw UnimplementedError();
  }
}

class VisitItem {
  VisitItem.fromJS(this._wrapped);

  final $js.VisitItem _wrapped;

  $js.VisitItem get toJS => _wrapped;

  /// The unique identifier for the item.
  String get id => _wrapped.id;
  set id(String v) {
    throw UnimplementedError();
  }

  /// The unique identifier for this visit.
  String get visitId => _wrapped.visitId;
  set visitId(String v) {
    throw UnimplementedError();
  }

  /// When this visit occurred, represented in milliseconds since the epoch.
  double? get visitTime => _wrapped.visitTime;
  set visitTime(double? v) {
    throw UnimplementedError();
  }

  /// The visit ID of the referrer.
  String get referringVisitId => _wrapped.referringVisitId;
  set referringVisitId(String v) {
    throw UnimplementedError();
  }

  /// The [transition type](#transition_types) for this visit from its referrer.
  TransitionType get transition => TransitionType.fromJS(_wrapped.transition);
  set transition(TransitionType v) {
    throw UnimplementedError();
  }
}

class UrlDetails {
  UrlDetails.fromJS(this._wrapped);

  final $js.UrlDetails _wrapped;

  $js.UrlDetails get toJS => _wrapped;

  /// The URL for the operation. It must be in the format as returned from a
  /// call to history.search.
  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }
}

class OnVisitRemovedRemoved {
  OnVisitRemovedRemoved.fromJS(this._wrapped);

  final $js.OnVisitRemovedRemoved _wrapped;

  $js.OnVisitRemovedRemoved get toJS => _wrapped;

  /// True if all history was removed.  If true, then urls will be empty.
  bool get allHistory => _wrapped.allHistory;
  set allHistory(bool v) {
    throw UnimplementedError();
  }

  List<String>? get urls => throw UnimplementedError();
  set urls(List<String>? v) {
    throw UnimplementedError();
  }
}

class SearchQuery {
  SearchQuery.fromJS(this._wrapped);

  final $js.SearchQuery _wrapped;

  $js.SearchQuery get toJS => _wrapped;
}

class DeleteRangeRange {
  DeleteRangeRange.fromJS(this._wrapped);

  final $js.DeleteRangeRange _wrapped;

  $js.DeleteRangeRange get toJS => _wrapped;
}
