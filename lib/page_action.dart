import 'chrome.dart';

final _PageAction = ChromePageAction._();

extension ChromeChromePageActionExtension on Chrome {
  ChromePageAction get PageAction => _PageAction;
}

class ChromePageAction {
  ChromePageAction._();
}
