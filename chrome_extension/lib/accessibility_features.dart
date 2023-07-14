import 'src/internal_helpers.dart';
import 'src/js/accessibility_features.dart' as $js;
import 'types.dart';

export 'src/chrome.dart' show chrome;

final _accessibilityFeatures = ChromeAccessibilityFeatures._();

extension ChromeAccessibilityFeaturesExtension on Chrome {
  ChromeAccessibilityFeatures get accessibilityFeatures =>
      _accessibilityFeatures;
}

class ChromeAccessibilityFeatures {
  ChromeAccessibilityFeatures._();

  /// *ChromeOS only.*
  ///
  /// Spoken feedback (text-to-speech). The value indicates whether the feature
  /// is enabled or not. `get()` requires `accessibilityFeatures.read`
  /// permission. `set()` and `clear()` require `accessibilityFeatures.modify`
  /// permission.
  ChromeSetting get spokenFeedback =>
      ($js.chrome.accessibilityFeatures.spokenFeedback as dynamic);

  /// *ChromeOS only.*
  ///
  /// Enlarged cursor. The value indicates whether the feature is enabled or
  /// not. `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get largeCursor =>
      ($js.chrome.accessibilityFeatures.largeCursor as dynamic);

  /// *ChromeOS only.*
  ///
  /// Sticky modifier keys (like shift or alt). The value indicates whether the
  /// feature is enabled or not. `get()` requires `accessibilityFeatures.read`
  /// permission. `set()` and `clear()` require `accessibilityFeatures.modify`
  /// permission.
  ChromeSetting get stickyKeys =>
      ($js.chrome.accessibilityFeatures.stickyKeys as dynamic);

  /// *ChromeOS only.*
  ///
  /// High contrast rendering mode. The value indicates whether the feature is
  /// enabled or not. `get()` requires `accessibilityFeatures.read` permission.
  /// `set()` and `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get highContrast =>
      ($js.chrome.accessibilityFeatures.highContrast as dynamic);

  /// *ChromeOS only.*
  ///
  /// Full screen magnification. The value indicates whether the feature is
  /// enabled or not. `get()` requires `accessibilityFeatures.read` permission.
  /// `set()` and `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get screenMagnifier =>
      ($js.chrome.accessibilityFeatures.screenMagnifier as dynamic);

  /// *ChromeOS only.*
  ///
  /// Auto mouse click after mouse stops moving. The value indicates whether the
  /// feature is enabled or not. `get()` requires `accessibilityFeatures.read`
  /// permission. `set()` and `clear()` require `accessibilityFeatures.modify`
  /// permission.
  ChromeSetting get autoclick =>
      ($js.chrome.accessibilityFeatures.autoclick as dynamic);

  /// *ChromeOS only.*
  ///
  /// Virtual on-screen keyboard. The value indicates whether the feature is
  /// enabled or not. `get()` requires `accessibilityFeatures.read` permission.
  /// `set()` and `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get virtualKeyboard =>
      ($js.chrome.accessibilityFeatures.virtualKeyboard as dynamic);

  /// *ChromeOS only.*
  ///
  /// Caret highlighting. The value indicates whether the feature is enabled or
  /// not. `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get caretHighlight =>
      ($js.chrome.accessibilityFeatures.caretHighlight as dynamic);

  /// *ChromeOS only.*
  ///
  /// Cursor highlighting. The value indicates whether the feature is enabled or
  /// not. `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get cursorHighlight =>
      ($js.chrome.accessibilityFeatures.cursorHighlight as dynamic);

  /// *ChromeOS only.*
  ///
  /// Cursor color. The value indicates whether the feature is enabled or not,
  /// doesn't indicate the color of it. `get()` requires
  /// `accessibilityFeatures.read` permission. `set()` and `clear()` require
  /// `accessibilityFeatures.modify` permission.
  ChromeSetting get cursorColor =>
      ($js.chrome.accessibilityFeatures.cursorColor as dynamic);

  /// *ChromeOS only.*
  ///
  /// Docked magnifier. The value indicates whether docked magnifier feature is
  /// enabled or not. `get()` requires `accessibilityFeatures.read` permission.
  /// `set()` and `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get dockedMagnifier =>
      ($js.chrome.accessibilityFeatures.dockedMagnifier as dynamic);

  /// *ChromeOS only.*
  ///
  /// Focus highlighting. The value indicates whether the feature is enabled or
  /// not. `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get focusHighlight =>
      ($js.chrome.accessibilityFeatures.focusHighlight as dynamic);

  /// *ChromeOS only.*
  ///
  /// Select-to-speak. The value indicates whether the feature is enabled or
  /// not. `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get selectToSpeak =>
      ($js.chrome.accessibilityFeatures.selectToSpeak as dynamic);

  /// *ChromeOS only.*
  ///
  /// Switch Access. The value indicates whether the feature is enabled or not.
  /// `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get switchAccess =>
      ($js.chrome.accessibilityFeatures.switchAccess as dynamic);

  /// `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get animationPolicy =>
      ($js.chrome.accessibilityFeatures.animationPolicy as dynamic);

  /// *ChromeOS only.*
  ///
  /// Dictation. The value indicates whether the feature is enabled or not.
  /// `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get dictation =>
      ($js.chrome.accessibilityFeatures.dictation as dynamic);
}
