import 'chrome.dart';

final _accessibilityFeatures = ChromeAccessibilityFeatures._();

extension ChromeChromeAccessibilityFeaturesExtension on Chrome {
  ChromeAccessibilityFeatures get accessibilityFeatures =>
      _accessibilityFeatures;
}

class ChromeAccessibilityFeatures {
  ChromeAccessibilityFeatures._();
}
