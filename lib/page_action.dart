import 'chrome.dart';
export 'chrome.dart';

final _pageAction = ChromePageAction._();

extension ChromeChromePageActionExtension on Chrome {
  ChromePageAction get pageAction => _pageAction;
}

class ChromePageAction {
  ChromePageAction._();
}
