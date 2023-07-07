/* This file has been generated from accessibility_features.json - do not edit */

/**
 * Use the `chrome.accessibilityFeatures` API to manage Chrome's accessibility
 * features. This API relies on the [ChromeSetting prototype of the type
 * API](types#ChromeSetting) for getting and setting individual accessibility
 * features. In order to get feature states the extension must request
 * `accessibilityFeatures.read` permission. For modifying feature state, the
 * extension needs `accessibilityFeatures.modify` permission. Note that
 * `accessibilityFeatures.modify` does not imply `accessibilityFeatures.read`
 * permission.
 */
library chrome.accessibilityFeatures;

import 'types.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.accessibilityFeatures` namespace.
 */
final ChromeAccessibilityFeatures accessibilityFeatures = ChromeAccessibilityFeatures._();

class ChromeAccessibilityFeatures extends ChromeApi {
  JsObject get _accessibilityFeatures => chrome['accessibilityFeatures'];

  ChromeAccessibilityFeatures._();

  bool get available => _accessibilityFeatures != null;

  /**
   * *ChromeOS only.*
   * 
   * Spoken feedback (text-to-speech). The value indicates whether the feature
   * is enabled or not. `get()` requires `accessibilityFeatures.read`
   * permission. `set()` and `clear()` require `accessibilityFeatures.modify`
   * permission.
   */
  ChromeSetting get spokenFeedback => _createChromeSetting(_accessibilityFeatures['spokenFeedback']);

  /**
   * *ChromeOS only.*
   * 
   * Enlarged cursor. The value indicates whether the feature is enabled or not.
   * `get()` requires `accessibilityFeatures.read` permission. `set()` and
   * `clear()` require `accessibilityFeatures.modify` permission.
   */
  ChromeSetting get largeCursor => _createChromeSetting(_accessibilityFeatures['largeCursor']);

  /**
   * *ChromeOS only.*
   * 
   * Sticky modifier keys (like shift or alt). The value indicates whether the
   * feature is enabled or not. `get()` requires `accessibilityFeatures.read`
   * permission. `set()` and `clear()` require `accessibilityFeatures.modify`
   * permission.
   */
  ChromeSetting get stickyKeys => _createChromeSetting(_accessibilityFeatures['stickyKeys']);

  /**
   * *ChromeOS only.*
   * 
   * High contrast rendering mode. The value indicates whether the feature is
   * enabled or not. `get()` requires `accessibilityFeatures.read` permission.
   * `set()` and `clear()` require `accessibilityFeatures.modify` permission.
   */
  ChromeSetting get highContrast => _createChromeSetting(_accessibilityFeatures['highContrast']);

  /**
   * *ChromeOS only.*
   * 
   * Full screen magnification. The value indicates whether the feature is
   * enabled or not. `get()` requires `accessibilityFeatures.read` permission.
   * `set()` and `clear()` require `accessibilityFeatures.modify` permission.
   */
  ChromeSetting get screenMagnifier => _createChromeSetting(_accessibilityFeatures['screenMagnifier']);

  /**
   * *ChromeOS only.*
   * 
   * Auto mouse click after mouse stops moving. The value indicates whether the
   * feature is enabled or not. `get()` requires `accessibilityFeatures.read`
   * permission. `set()` and `clear()` require `accessibilityFeatures.modify`
   * permission.
   */
  ChromeSetting get autoclick => _createChromeSetting(_accessibilityFeatures['autoclick']);

  /**
   * *ChromeOS only.*
   * 
   * Virtual on-screen keyboard. The value indicates whether the feature is
   * enabled or not. `get()` requires `accessibilityFeatures.read` permission.
   * `set()` and `clear()` require `accessibilityFeatures.modify` permission.
   */
  ChromeSetting get virtualKeyboard => _createChromeSetting(_accessibilityFeatures['virtualKeyboard']);

  /**
   * *ChromeOS only.*
   * 
   * Caret highlighting. The value indicates whether the feature is enabled or
   * not. `get()` requires `accessibilityFeatures.read` permission. `set()` and
   * `clear()` require `accessibilityFeatures.modify` permission.
   */
  ChromeSetting get caretHighlight => _createChromeSetting(_accessibilityFeatures['caretHighlight']);

  /**
   * *ChromeOS only.*
   * 
   * Cursor highlighting. The value indicates whether the feature is enabled or
   * not. `get()` requires `accessibilityFeatures.read` permission. `set()` and
   * `clear()` require `accessibilityFeatures.modify` permission.
   */
  ChromeSetting get cursorHighlight => _createChromeSetting(_accessibilityFeatures['cursorHighlight']);

  /**
   * *ChromeOS only.*
   * 
   * Cursor color. The value indicates whether the feature is enabled or not,
   * doesn't indicate the color of it. `get()` requires
   * `accessibilityFeatures.read` permission. `set()` and `clear()` require
   * `accessibilityFeatures.modify` permission.
   */
  ChromeSetting get cursorColor => _createChromeSetting(_accessibilityFeatures['cursorColor']);

  /**
   * *ChromeOS only.*
   * 
   * Docked magnifier. The value indicates whether docked magnifier feature is
   * enabled or not. `get()` requires `accessibilityFeatures.read` permission.
   * `set()` and `clear()` require `accessibilityFeatures.modify` permission.
   */
  ChromeSetting get dockedMagnifier => _createChromeSetting(_accessibilityFeatures['dockedMagnifier']);

  /**
   * *ChromeOS only.*
   * 
   * Focus highlighting. The value indicates whether the feature is enabled or
   * not. `get()` requires `accessibilityFeatures.read` permission. `set()` and
   * `clear()` require `accessibilityFeatures.modify` permission.
   */
  ChromeSetting get focusHighlight => _createChromeSetting(_accessibilityFeatures['focusHighlight']);

  /**
   * *ChromeOS only.*
   * 
   * Select-to-speak. The value indicates whether the feature is enabled or not.
   * `get()` requires `accessibilityFeatures.read` permission. `set()` and
   * `clear()` require `accessibilityFeatures.modify` permission.
   */
  ChromeSetting get selectToSpeak => _createChromeSetting(_accessibilityFeatures['selectToSpeak']);

  /**
   * *ChromeOS only.*
   * 
   * Switch Access. The value indicates whether the feature is enabled or not.
   * `get()` requires `accessibilityFeatures.read` permission. `set()` and
   * `clear()` require `accessibilityFeatures.modify` permission.
   */
  ChromeSetting get switchAccess => _createChromeSetting(_accessibilityFeatures['switchAccess']);

  /**
   * `get()` requires `accessibilityFeatures.read` permission. `set()` and
   * `clear()` require `accessibilityFeatures.modify` permission.
   */
  ChromeSetting get animationPolicy => _createChromeSetting(_accessibilityFeatures['animationPolicy']);

  /**
   * *ChromeOS only.*
   * 
   * Dictation. The value indicates whether the feature is enabled or not.
   * `get()` requires `accessibilityFeatures.read` permission. `set()` and
   * `clear()` require `accessibilityFeatures.modify` permission.
   */
  ChromeSetting get dictation => _createChromeSetting(_accessibilityFeatures['dictation']);
}

ChromeSetting _createChromeSetting(JsObject jsProxy) => ChromeSetting.fromProxy(jsProxy);
