import 'chrome.dart';
import 'dart:js_interop';
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
  external JSAccessibilityFeatures get AccessibilityFeatures;
}

@JS()
@staticInterop
class JSAccessibilityFeatures {}

extension JSAccessibilityFeaturesExtension on JSAccessibilityFeatures {}
