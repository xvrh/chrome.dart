import 'chrome.dart';

final _BrowserAction = ChromeBrowserAction._();

extension ChromeChromeBrowserActionExtension on Chrome {
  ChromeBrowserAction get BrowserAction => _BrowserAction;
}

class ChromeBrowserAction {
  ChromeBrowserAction._();
}
