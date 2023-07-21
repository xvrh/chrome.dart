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

  bool get isAvailable => $js.chrome.accessibilityFeaturesNullable != null;

  /// *ChromeOS only.*
  ///
  /// Spoken feedback (text-to-speech). The value indicates whether the feature
  /// is enabled or not. `get()` requires `accessibilityFeatures.read`
  /// permission. `set()` and `clear()` require `accessibilityFeatures.modify`
  /// permission.
  ChromeSetting get spokenFeedback =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.spokenFeedback);

  /// *ChromeOS only.*
  ///
  /// Enlarged cursor. The value indicates whether the feature is enabled or
  /// not. `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get largeCursor =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.largeCursor);

  /// *ChromeOS only.*
  ///
  /// Sticky modifier keys (like shift or alt). The value indicates whether the
  /// feature is enabled or not. `get()` requires `accessibilityFeatures.read`
  /// permission. `set()` and `clear()` require `accessibilityFeatures.modify`
  /// permission.
  ChromeSetting get stickyKeys =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.stickyKeys);

  /// *ChromeOS only.*
  ///
  /// High contrast rendering mode. The value indicates whether the feature is
  /// enabled or not. `get()` requires `accessibilityFeatures.read` permission.
  /// `set()` and `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get highContrast =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.highContrast);

  /// *ChromeOS only.*
  ///
  /// Full screen magnification. The value indicates whether the feature is
  /// enabled or not. `get()` requires `accessibilityFeatures.read` permission.
  /// `set()` and `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get screenMagnifier =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.screenMagnifier);

  /// *ChromeOS only.*
  ///
  /// Auto mouse click after mouse stops moving. The value indicates whether the
  /// feature is enabled or not. `get()` requires `accessibilityFeatures.read`
  /// permission. `set()` and `clear()` require `accessibilityFeatures.modify`
  /// permission.
  ChromeSetting get autoclick =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.autoclick);

  /// *ChromeOS only.*
  ///
  /// Virtual on-screen keyboard. The value indicates whether the feature is
  /// enabled or not. `get()` requires `accessibilityFeatures.read` permission.
  /// `set()` and `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get virtualKeyboard =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.virtualKeyboard);

  /// *ChromeOS only.*
  ///
  /// Caret highlighting. The value indicates whether the feature is enabled or
  /// not. `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get caretHighlight =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.caretHighlight);

  /// *ChromeOS only.*
  ///
  /// Cursor highlighting. The value indicates whether the feature is enabled or
  /// not. `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get cursorHighlight =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.cursorHighlight);

  /// *ChromeOS only.*
  ///
  /// Cursor color. The value indicates whether the feature is enabled or not,
  /// doesn't indicate the color of it. `get()` requires
  /// `accessibilityFeatures.read` permission. `set()` and `clear()` require
  /// `accessibilityFeatures.modify` permission.
  ChromeSetting get cursorColor =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.cursorColor);

  /// *ChromeOS only.*
  ///
  /// Docked magnifier. The value indicates whether docked magnifier feature is
  /// enabled or not. `get()` requires `accessibilityFeatures.read` permission.
  /// `set()` and `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get dockedMagnifier =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.dockedMagnifier);

  /// *ChromeOS only.*
  ///
  /// Focus highlighting. The value indicates whether the feature is enabled or
  /// not. `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get focusHighlight =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.focusHighlight);

  /// *ChromeOS only.*
  ///
  /// Select-to-speak. The value indicates whether the feature is enabled or
  /// not. `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get selectToSpeak =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.selectToSpeak);

  /// *ChromeOS only.*
  ///
  /// Switch Access. The value indicates whether the feature is enabled or not.
  /// `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get switchAccess =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.switchAccess);

  /// `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get animationPolicy =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.animationPolicy);

  /// *ChromeOS only.*
  ///
  /// Dictation. The value indicates whether the feature is enabled or not.
  /// `get()` requires `accessibilityFeatures.read` permission. `set()` and
  /// `clear()` require `accessibilityFeatures.modify` permission.
  ChromeSetting get dictation =>
      ChromeSetting.fromJS($js.chrome.accessibilityFeatures.dictation);
}
