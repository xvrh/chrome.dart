import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/top_sites.dart' as $js;

export 'src/chrome.dart' show chrome;

final _topSites = ChromeTopSites._();

extension ChromeTopSitesExtension on Chrome {
  ChromeTopSites get topSites => _topSites;
}

class ChromeTopSites {
  ChromeTopSites._();

  /// Gets a list of top sites.
  Future<List<MostVisitedURL>> get() async {
    var $res = await promiseToFuture<JSArray>($js.chrome.topSites.get());
    return $res.toDart
        .cast<$js.MostVisitedURL>()
        .map((e) => MostVisitedURL.fromJS(e))
        .toList();
  }
}

class MostVisitedURL {
  MostVisitedURL.fromJS(this._wrapped);

  MostVisitedURL({
    required String url,
    required String title,
  }) : _wrapped = $js.MostVisitedURL()
          ..url = url
          ..title = title;

  final $js.MostVisitedURL _wrapped;

  $js.MostVisitedURL get toJS => _wrapped;

  /// The most visited URL.
  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// The title of the page
  String get title => _wrapped.title;
  set title(String v) {
    _wrapped.title = v;
  }
}