import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/search.dart' as $js;

export 'src/chrome.dart' show chrome;

final _search = ChromeSearch._();

extension ChromeSearchExtension on Chrome {
  ChromeSearch get search => _search;
}

class ChromeSearch {
  ChromeSearch._();

  bool get isAvailable => $js.chrome.searchNullable != null;

  /// Used to query the default search provider.
  /// In case of an error,
  /// [runtime.lastError] will be set.
  Future<void> query(QueryInfo queryInfo) async {
    await promiseToFuture<void>($js.chrome.search.query(queryInfo.toJS));
  }
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

  QueryInfo({
    required String text,
    Disposition? disposition,
    int? tabId,
  }) : _wrapped = $js.QueryInfo(
          text: text,
          disposition: disposition?.toJS,
          tabId: tabId,
        );

  final $js.QueryInfo _wrapped;

  $js.QueryInfo get toJS => _wrapped;
}
