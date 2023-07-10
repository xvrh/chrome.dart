import 'chrome.dart';
export 'chrome.dart';

final _topSites = ChromeTopSites._();

extension ChromeTopSitesExtension on Chrome {
  ChromeTopSites get topSites => _topSites;
}

class ChromeTopSites {
  ChromeTopSites._();

  /// Gets a list of top sites.
  void get() => throw UnimplementedError();
}
