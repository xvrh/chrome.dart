/* This file has been generated from history.json - do not edit */

/**
 * Use the `chrome.history` API to interact with the browser's record of visited
 * pages. You can add, remove, and query for URLs in the browser's history. To
 * override the history page with your own version, see [Override
 * Pages](override).
 */
library chrome.history;

import '../src/common.dart';

/**
 * Accessor for the `chrome.history` namespace.
 */
final ChromeHistory history = ChromeHistory._();

class ChromeHistory extends ChromeApi {
  JsObject get _history => chrome['history'];

  /**
   * Fired when a URL is visited, providing the HistoryItem data for that URL.
   * This event fires before the page has loaded.
   */
  Stream<HistoryItem> get onVisited => _onVisited.stream;
  late ChromeStreamController<HistoryItem> _onVisited;

  /**
   * Fired when one or more URLs are removed from the history service.  When all
   * visits have been removed the URL is purged from history.
   */
  Stream<Map> get onVisitRemoved => _onVisitRemoved.stream;
  late ChromeStreamController<Map> _onVisitRemoved;

  ChromeHistory._() {
    var getApi = () => _history;
    _onVisited = ChromeStreamController<HistoryItem>.oneArg(getApi, 'onVisited', _createHistoryItem);
    _onVisitRemoved = ChromeStreamController<Map>.oneArg(getApi, 'onVisitRemoved', mapify);
  }

  bool get available => _history != null;

  /**
   * Searches the history for the last visit time of each page matching the
   * query.
   */
  void search(HistorySearchParams query) {
    if (_history == null) _throwNotAvailable();

    _history.callMethod('search', [jsify(query)]);
  }

  /**
   * Retrieves information about visits to a URL.
   */
  void getVisits(UrlDetails details) {
    if (_history == null) _throwNotAvailable();

    _history.callMethod('getVisits', [jsify(details)]);
  }

  /**
   * Adds a URL to the history at the current time with a [transition
   * type](#transition_types) of "link".
   */
  void addUrl(UrlDetails details) {
    if (_history == null) _throwNotAvailable();

    _history.callMethod('addUrl', [jsify(details)]);
  }

  /**
   * Removes all occurrences of the given URL from the history.
   */
  void deleteUrl(UrlDetails details) {
    if (_history == null) _throwNotAvailable();

    _history.callMethod('deleteUrl', [jsify(details)]);
  }

  /**
   * Removes all items within the specified date range from the history.  Pages
   * will not be removed from the history unless all visits fall within the
   * range.
   */
  void deleteRange(HistoryDeleteRangeParams range) {
    if (_history == null) _throwNotAvailable();

    _history.callMethod('deleteRange', [jsify(range)]);
  }

  /**
   * Deletes all items from the history.
   */
  void deleteAll() {
    if (_history == null) _throwNotAvailable();

    _history.callMethod('deleteAll');
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.history' is not available");
  }
}

/**
 * The [transition type](#transition_types) for this visit from its referrer.
 */
class HistoryTransitionType extends ChromeEnum {
  static const HistoryTransitionType LINK = const HistoryTransitionType._('link');
  static const HistoryTransitionType TYPED = const HistoryTransitionType._('typed');
  static const HistoryTransitionType AUTO_BOOKMARK = const HistoryTransitionType._('auto_bookmark');
  static const HistoryTransitionType AUTO_SUBFRAME = const HistoryTransitionType._('auto_subframe');
  static const HistoryTransitionType MANUAL_SUBFRAME = const HistoryTransitionType._('manual_subframe');
  static const HistoryTransitionType GENERATED = const HistoryTransitionType._('generated');
  static const HistoryTransitionType AUTO_TOPLEVEL = const HistoryTransitionType._('auto_toplevel');
  static const HistoryTransitionType FORM_SUBMIT = const HistoryTransitionType._('form_submit');
  static const HistoryTransitionType RELOAD = const HistoryTransitionType._('reload');
  static const HistoryTransitionType KEYWORD = const HistoryTransitionType._('keyword');
  static const HistoryTransitionType KEYWORD_GENERATED = const HistoryTransitionType._('keyword_generated');

  static const List<HistoryTransitionType> VALUES = const[LINK, TYPED, AUTO_BOOKMARK, AUTO_SUBFRAME, MANUAL_SUBFRAME, GENERATED, AUTO_TOPLEVEL, FORM_SUBMIT, RELOAD, KEYWORD, KEYWORD_GENERATED];

  const HistoryTransitionType._(String str): super(str);
}

/**
 * An object encapsulating one result of a history query.
 */
class HistoryItem extends ChromeObject {
  HistoryItem({String? id, String? url, String? title, Object? lastVisitTime, int? visitCount, int? typedCount}) {
    if (id != null) this.id = id;
    if (url != null) this.url = url;
    if (title != null) this.title = title;
    if (lastVisitTime != null) this.lastVisitTime = lastVisitTime;
    if (visitCount != null) this.visitCount = visitCount;
    if (typedCount != null) this.typedCount = typedCount;
  }
  HistoryItem.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The unique identifier for the item.
   */
  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;

  /**
   * The URL navigated to by a user.
   */
  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;

  /**
   * The title of the page when it was last loaded.
   */
  String get title => jsProxy['title'];
  set title(String value) => jsProxy['title'] = value;

  /**
   * When this page was last loaded, represented in milliseconds since the
   * epoch.
   */
  Object get lastVisitTime => jsProxy['lastVisitTime'];
  set lastVisitTime(Object value) => jsProxy['lastVisitTime'] = jsify(value);

  /**
   * The number of times the user has navigated to this page.
   */
  int get visitCount => jsProxy['visitCount'];
  set visitCount(int value) => jsProxy['visitCount'] = value;

  /**
   * The number of times the user has navigated to this page by typing in the
   * address.
   */
  int get typedCount => jsProxy['typedCount'];
  set typedCount(int value) => jsProxy['typedCount'] = value;
}

/**
 * An object encapsulating one visit to a URL.
 */
class VisitItem extends ChromeObject {
  VisitItem({String? id, String? visitId, Object? visitTime, String? referringVisitId, HistoryTransitionType? transition}) {
    if (id != null) this.id = id;
    if (visitId != null) this.visitId = visitId;
    if (visitTime != null) this.visitTime = visitTime;
    if (referringVisitId != null) this.referringVisitId = referringVisitId;
    if (transition != null) this.transition = transition;
  }
  VisitItem.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The unique identifier for the item.
   */
  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;

  /**
   * The unique identifier for this visit.
   */
  String get visitId => jsProxy['visitId'];
  set visitId(String value) => jsProxy['visitId'] = value;

  /**
   * When this visit occurred, represented in milliseconds since the epoch.
   */
  Object get visitTime => jsProxy['visitTime'];
  set visitTime(Object value) => jsProxy['visitTime'] = jsify(value);

  /**
   * The visit ID of the referrer.
   */
  String get referringVisitId => jsProxy['referringVisitId'];
  set referringVisitId(String value) => jsProxy['referringVisitId'] = value;

  /**
   * The [transition type](#transition_types) for this visit from its referrer.
   */
  HistoryTransitionType get transition => _createTransitionType(jsProxy['transition']);
  set transition(HistoryTransitionType value) => jsProxy['transition'] = jsify(value);
}

class UrlDetails extends ChromeObject {
  UrlDetails({String? url}) {
    if (url != null) this.url = url;
  }
  UrlDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The URL for the operation. It must be in the format as returned from a call
   * to history.search.
   */
  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;
}

class HistorySearchParams extends ChromeObject {
  HistorySearchParams({String? text, Object? startTime, Object? endTime, int? maxResults}) {
    if (text != null) this.text = text;
    if (startTime != null) this.startTime = startTime;
    if (endTime != null) this.endTime = endTime;
    if (maxResults != null) this.maxResults = maxResults;
  }
  HistorySearchParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * A free-text query to the history service.  Leave empty to retrieve all
   * pages.
   */
  String get text => jsProxy['text'];
  set text(String value) => jsProxy['text'] = value;

  /**
   * Limit results to those visited after this date, represented in milliseconds
   * since the epoch. If not specified, this defaults to 24 hours in the past.
   */
  Object get startTime => jsProxy['startTime'];
  set startTime(Object value) => jsProxy['startTime'] = jsify(value);

  /**
   * Limit results to those visited before this date, represented in
   * milliseconds since the epoch.
   */
  Object get endTime => jsProxy['endTime'];
  set endTime(Object value) => jsProxy['endTime'] = jsify(value);

  /**
   * The maximum number of results to retrieve.  Defaults to 100.
   */
  int get maxResults => jsProxy['maxResults'];
  set maxResults(int value) => jsProxy['maxResults'] = value;
}

class HistoryDeleteRangeParams extends ChromeObject {
  HistoryDeleteRangeParams({Object? startTime, Object? endTime}) {
    if (startTime != null) this.startTime = startTime;
    if (endTime != null) this.endTime = endTime;
  }
  HistoryDeleteRangeParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Items added to history after this date, represented in milliseconds since
   * the epoch.
   */
  Object get startTime => jsProxy['startTime'];
  set startTime(Object value) => jsProxy['startTime'] = jsify(value);

  /**
   * Items added to history before this date, represented in milliseconds since
   * the epoch.
   */
  Object get endTime => jsProxy['endTime'];
  set endTime(Object value) => jsProxy['endTime'] = jsify(value);
}

HistoryItem _createHistoryItem(JsObject jsProxy) => HistoryItem.fromProxy(jsProxy);
HistoryTransitionType _createTransitionType(String value) => HistoryTransitionType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
