/* This file has been generated from top_sites.json - do not edit */

/**
 * Use the `chrome.topSites` API to access the top sites (i.e. most visited
 * sites) that are displayed on the new tab page. These do not include shortcuts
 * customized by the user.
 */
library chrome.topSites;

import '../src/common.dart';

/**
 * Accessor for the `chrome.topSites` namespace.
 */
final ChromeTopSites topSites = ChromeTopSites._();

class ChromeTopSites extends ChromeApi {
  JsObject get _topSites => chrome['topSites'];

  ChromeTopSites._();

  bool get available => _topSites != null;

  /**
   * Gets a list of top sites.
   */
  void get() {
    if (_topSites == null) _throwNotAvailable();

    _topSites.callMethod('get');
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.topSites' is not available");
  }
}

/**
 * An object encapsulating a most visited URL, such as the default shortcuts on
 * the new tab page.
 */
class MostVisitedURL extends ChromeObject {
  MostVisitedURL({String? url, String? title}) {
    if (url != null) this.url = url;
    if (title != null) this.title = title;
  }
  MostVisitedURL.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The most visited URL.
   */
  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;

  /**
   * The title of the page
   */
  String get title => jsProxy['title'];
  set title(String value) => jsProxy['title'] = value;
}
