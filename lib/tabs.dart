import 'chrome.dart';

final _Tabs = ChromeTabs._();

extension ChromeChromeTabsExtension on Chrome {
  ChromeTabs get Tabs => _Tabs;
}

class ChromeTabs {
  ChromeTabs._();
}
