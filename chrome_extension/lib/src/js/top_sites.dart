import 'dart:js_interop';

import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSTopSitesExtension on JSChrome {
  @JS('topSites')
  external JSTopSites? get topSitesNullable;

  /// Use the `chrome.topSites` API to access the top sites (i.e. most visited
  /// sites) that are displayed on the new tab page. These do not include
  /// shortcuts customized by the user.
  JSTopSites get topSites {
    var topSitesNullable = this.topSitesNullable;
    if (topSitesNullable == null) {
      throw ApiNotAvailableException('chrome.topSites');
    }
    return topSitesNullable;
  }
}

@JS()
@staticInterop
class JSTopSites {}

extension JSTopSitesExtension on JSTopSites {
  /// Gets a list of top sites.
  external JSPromise get();
}

@JS()
@staticInterop
class MostVisitedURL {}

extension MostVisitedURLExtension on MostVisitedURL {
  /// The most visited URL.
  external String url;

  /// The title of the page
  external String title;
}
