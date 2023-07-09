import 'chrome.dart';

final _TopSites = ChromeTopSites._();

extension ChromeChromeTopSitesExtension on Chrome {
  ChromeTopSites get TopSites => _TopSites;
}

class ChromeTopSites {
  ChromeTopSites._();
}
