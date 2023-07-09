import 'chrome.dart';

final _TabGroups = ChromeTabGroups._();

extension ChromeChromeTabGroupsExtension on Chrome {
  ChromeTabGroups get TabGroups => _TabGroups;
}

class ChromeTabGroups {
  ChromeTabGroups._();
}
