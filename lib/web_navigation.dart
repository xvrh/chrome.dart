import 'chrome.dart';

final _WebNavigation = ChromeWebNavigation._();

extension ChromeChromeWebNavigationExtension on Chrome {
  ChromeWebNavigation get WebNavigation => _WebNavigation;
}

class ChromeWebNavigation {
  ChromeWebNavigation._();
}
