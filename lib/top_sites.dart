import 'chrome.dart';
export 'chrome.dart';

final _topSites = ChromeTopSites._();

extension ChromeChromeTopSitesExtension on Chrome {
  ChromeTopSites get topSites => _topSites;
}

class ChromeTopSites {
  ChromeTopSites._();
}
