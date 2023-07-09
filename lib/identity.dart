import 'chrome.dart';

final _Identity = ChromeIdentity._();

extension ChromeChromeIdentityExtension on Chrome {
  ChromeIdentity get Identity => _Identity;
}

class ChromeIdentity {
  ChromeIdentity._();
}
