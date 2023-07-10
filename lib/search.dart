import 'chrome.dart';
export 'chrome.dart';

final _search = ChromeSearch._();

extension ChromeSearchExtension on Chrome {
  ChromeSearch get search => _search;
}

class ChromeSearch {
  ChromeSearch._();

  /// Used to query the default search provider.
  /// In case of an error,
  /// $(ref:runtime.lastError) will be set.
  void query(queryInfo) => throw UnimplementedError();
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
}
