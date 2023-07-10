import 'chrome.dart';
import 'dart:js_interop';
import 'types.dart';
export 'chrome.dart';

extension JSChromeJSAccessibilityFeaturesExtension on JSChrome {
  /// Use the `chrome.accessibilityFeatures` API to manage Chrome's
  /// accessibility features. This API relies on the <a
  /// href='types#ChromeSetting'>ChromeSetting prototype of the type API</a> for
  /// getting and setting individual accessibility features. In order to get
  /// feature states the extension must request `accessibilityFeatures.read`
  /// permission. For modifying feature state, the extension needs
  /// `accessibilityFeatures.modify` permission. Note that
  /// `accessibilityFeatures.modify` does not imply `accessibilityFeatures.read`
  /// permission.
  external JSAccessibilityFeatures get accessibilityFeatures;
}

@JS()
@staticInterop
class JSAccessibilityFeatures {}

extension JSAccessibilityFeaturesExtension on JSAccessibilityFeatures {
  /// <p><strong>ChromeOS only.</strong></p><p>Spoken feedback (text-to-speech).
  /// The value indicates whether the feature is enabled or not. `get()`
  /// requires `accessibilityFeatures.read` permission. `set()` and `clear()`
  /// require `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get spokenFeedback;

  /// <p><strong>ChromeOS only.</strong></p><p>Enlarged cursor. The value
  /// indicates whether the feature is enabled or not. `get()` requires
  /// `accessibilityFeatures.read` permission. `set()` and `clear()` require
  /// `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get largeCursor;

  /// <p><strong>ChromeOS only.</strong></p><p>Sticky modifier keys (like shift
  /// or alt). The value indicates whether the feature is enabled or not.
  /// `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get stickyKeys;

  /// <p><strong>ChromeOS only.</strong></p><p>High contrast rendering mode. The
  /// value indicates whether the feature is enabled or not. `get()` requires
  /// `accessibilityFeatures.read` permission. `set()` and `clear()` require
  /// `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get highContrast;

  /// <p><strong>ChromeOS only.</strong></p><p>Full screen magnification. The
  /// value indicates whether the feature is enabled or not. `get()` requires
  /// `accessibilityFeatures.read` permission. `set()` and `clear()` require
  /// `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get screenMagnifier;

  /// <p><strong>ChromeOS only.</strong></p><p>Auto mouse click after mouse
  /// stops moving. The value indicates whether the feature is enabled or not.
  /// `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get autoclick;

  /// <p><strong>ChromeOS only.</strong></p><p>Virtual on-screen keyboard. The
  /// value indicates whether the feature is enabled or not. `get()` requires
  /// `accessibilityFeatures.read` permission. `set()` and `clear()` require
  /// `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get virtualKeyboard;

  /// <p><strong>ChromeOS only.</strong></p><p>Caret highlighting. The value
  /// indicates whether the feature is enabled or not. `get()` requires
  /// `accessibilityFeatures.read` permission. `set()` and `clear()` require
  /// `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get caretHighlight;

  /// <p><strong>ChromeOS only.</strong></p><p>Cursor highlighting. The value
  /// indicates whether the feature is enabled or not. `get()` requires
  /// `accessibilityFeatures.read` permission. `set()` and `clear()` require
  /// `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get cursorHighlight;

  /// <p><strong>ChromeOS only.</strong></p><p>Cursor color. The value indicates
  /// whether the feature is enabled or not, doesn't indicate the color of it.
  /// `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get cursorColor;

  /// <p><strong>ChromeOS only.</strong></p><p>Docked magnifier. The value
  /// indicates whether docked magnifier feature is enabled or not. `get()`
  /// requires `accessibilityFeatures.read` permission. `set()` and `clear()`
  /// require `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get dockedMagnifier;

  /// <p><strong>ChromeOS only.</strong></p><p>Focus highlighting. The value
  /// indicates whether the feature is enabled or not. `get()` requires
  /// `accessibilityFeatures.read` permission. `set()` and `clear()` require
  /// `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get focusHighlight;

  /// <p><strong>ChromeOS only.</strong></p><p>Select-to-speak. The value
  /// indicates whether the feature is enabled or not. `get()` requires
  /// `accessibilityFeatures.read` permission. `set()` and `clear()` require
  /// `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get selectToSpeak;

  /// <p><strong>ChromeOS only.</strong></p><p>Switch Access. The value
  /// indicates whether the feature is enabled or not. `get()` requires
  /// `accessibilityFeatures.read` permission. `set()` and `clear()` require
  /// `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get switchAccess;

  /// `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  external ChromeSetting get animationPolicy;

  /// <p><strong>ChromeOS only.</strong></p><p>Dictation. The value indicates
  /// whether the feature is enabled or not. `get()` requires
  /// `accessibilityFeatures.read` permission. `set()` and `clear()` require
  /// `accessibilityFeatures.modify` permission.</p>
  external ChromeSetting get dictation;
}
