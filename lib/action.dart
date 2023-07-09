import 'chrome.dart';

final _Action = ChromeAction._();

extension ChromeChromeActionExtension on Chrome {
  ChromeAction get Action => _Action;
}

class ChromeAction {
  ChromeAction._();
}
