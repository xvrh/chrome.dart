import 'chrome.dart';
export 'chrome.dart';

final _action = ChromeAction._();

extension ChromeChromeActionExtension on Chrome {
  ChromeAction get action => _action;
}

class ChromeAction {
  ChromeAction._();
}
