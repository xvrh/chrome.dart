/* This file has been generated from dom.json - do not edit */

/**
 * Use the `chrome.dom` API to access special DOM APIs for Extensions
 */
library chrome.dom;

import '../src/common.dart';

/**
 * Accessor for the `chrome.dom` namespace.
 */
final ChromeDom dom = ChromeDom._();

class ChromeDom extends ChromeApi {
  JsObject get _dom => chrome['dom'];

  ChromeDom._();

  bool get available => _dom != null;

  /**
   * Gets the open shadow root or the closed shadow root hosted by the specified
   * element. If the element doesn't attach the shadow root, it will return
   * null.
   * 
   * Returns:
   * See <a
   * href='https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot'>https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot</a>
   */
  Map<String, Object> openOrClosedShadowRoot(HTMLElement element) {
    if (_dom == null) _throwNotAvailable();

    return mapify(_dom.callMethod('openOrClosedShadowRoot', [jsify(element)]));
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.dom' is not available");
  }
}
