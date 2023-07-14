import 'dart:js_interop';

import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSTopSitesExtension on JSChrome {
  /// Use the `chrome.topSites` API to access the top sites (i.e. most visited
  /// sites) that are displayed on the new tab page. These do not include
  /// shortcuts customized by the user.
  external JSTopSites get topSites;
}

@JS()
@staticInterop
class JSTopSites {}

extension JSTopSitesExtension on JSTopSites {
  /// Gets a list of top sites.
  external void get(JSFunction callback);
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
