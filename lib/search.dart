import 'chrome.dart';
export 'chrome.dart';

final _search = ChromeSearch._();

extension ChromeChromeSearchExtension on Chrome {
  ChromeSearch get search => _search;
}

class ChromeSearch {
  ChromeSearch._();
}

enum Disposition {
  ///  Display results in the calling tab or the tab from the active browser.
  currentTAB('CURRENT_TAB'),

  ///  Display search results in a new tab.
  newTAB('NEW_TAB'),

  ///  Display search results in a new window.
  newWINDOW('NEW_WINDOW');

  const Disposition(this.value);

  final String value;
}
