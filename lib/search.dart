import 'src/internal_helpers.dart';
import 'src/js/search.dart' as $js;
export 'chrome.dart';

final _search = ChromeSearch._();

extension ChromeSearchExtension on Chrome {
  ChromeSearch get search => _search;
}

class ChromeSearch {
  ChromeSearch._();

  /// Used to query the default search provider.
  /// In case of an error,
  /// [runtime.lastError] will be set.
  Future<void> query(QueryInfo queryInfo) => throw UnimplementedError();
}

enum Disposition {
  /// Display results in the calling tab or the tab from the active browser.
  currentTab('CURRENT_TAB'),

  /// Display search results in a new tab.
  newTab('NEW_TAB'),

  /// Display search results in a new window.
  newWindow('NEW_WINDOW');

  const Disposition(this.value);

  final String value;

  String get toJS => value;
  static Disposition fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class QueryInfo {
  QueryInfo.fromJS(this._wrapped);

  final $js.QueryInfo _wrapped;

  $js.QueryInfo get toJS => _wrapped;

  /// String to query with the default search provider.
  String get text => _wrapped.text;
  set text(String v) {
    throw UnimplementedError();
  }

  /// Location where search results should be displayed.
  /// `CURRENT_TAB` is the default.
  Disposition? get disposition => _wrapped.disposition?.let(Disposition.fromJS);
  set disposition(Disposition? v) {
    throw UnimplementedError();
  }

  /// Location where search results should be displayed.
  /// `tabId` cannot be used with `disposition`.
  int? get tabId => _wrapped.tabId;
  set tabId(int? v) {
    throw UnimplementedError();
  }
}
