import 'chrome.dart';

final _AccessibilityFeatures = ChromeAccessibilityFeatures._();

extension ChromeChromeAccessibilityFeaturesExtension on Chrome {
  ChromeAccessibilityFeatures get AccessibilityFeatures =>
      _AccessibilityFeatures;
}

class ChromeAccessibilityFeatures {
  ChromeAccessibilityFeatures._();
}
