import 'chrome.dart';

final _PlatformKeys = ChromePlatformKeys._();

extension ChromeChromePlatformKeysExtension on Chrome {
  ChromePlatformKeys get PlatformKeys => _PlatformKeys;
}

class ChromePlatformKeys {
  ChromePlatformKeys._();
}
