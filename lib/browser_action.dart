import 'chrome.dart';
export 'chrome.dart';

final _browserAction = ChromeBrowserAction._();

extension ChromeChromeBrowserActionExtension on Chrome {
  ChromeBrowserAction get browserAction => _browserAction;
}

class ChromeBrowserAction {
  ChromeBrowserAction._();
}
