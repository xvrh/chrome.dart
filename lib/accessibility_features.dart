import 'chrome.dart';
export 'chrome.dart';

final _accessibilityFeatures = ChromeAccessibilityFeatures._();

extension ChromeAccessibilityFeaturesExtension on Chrome {
  ChromeAccessibilityFeatures get accessibilityFeatures =>
      _accessibilityFeatures;
}

class ChromeAccessibilityFeatures {
  ChromeAccessibilityFeatures._();
}
