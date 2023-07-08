import 'chrome.dart';

final _tabs = ChromeTabs._();

extension ChromeChromeTabsExtension on Chrome {
  ChromeTabs get tabs => _tabs;
}

class ChromeTabs {
  ChromeTabs._();
}
