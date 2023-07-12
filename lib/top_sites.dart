import 'src/internal_helpers.dart';
import 'src/js/top_sites.dart' as $js;
export 'chrome.dart';

final _topSites = ChromeTopSites._();

extension ChromeTopSitesExtension on Chrome {
  ChromeTopSites get topSites => _topSites;
}

class ChromeTopSites {
  ChromeTopSites._();

  /// Gets a list of top sites.
  Future<List<MostVisitedURL>> get() => throw UnimplementedError();
}

class MostVisitedURL {
  MostVisitedURL.fromJS(this._wrapped);

  final $js.MostVisitedURL _wrapped;

  $js.MostVisitedURL get toJS => _wrapped;

  /// The most visited URL.
  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }

  /// The title of the page
  String get title => _wrapped.title;
  set title(String v) {
    throw UnimplementedError();
  }
}
