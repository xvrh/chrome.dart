import 'chrome.dart';

final _EnterprisePlatformKeys = ChromeEnterprisePlatformKeys._();

extension ChromeChromeEnterprisePlatformKeysExtension on Chrome {
  ChromeEnterprisePlatformKeys get EnterprisePlatformKeys =>
      _EnterprisePlatformKeys;
}

class ChromeEnterprisePlatformKeys {
  ChromeEnterprisePlatformKeys._();
}
