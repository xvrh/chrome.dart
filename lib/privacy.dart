import 'chrome.dart';

final _Privacy = ChromePrivacy._();

extension ChromeChromePrivacyExtension on Chrome {
  ChromePrivacy get Privacy => _Privacy;
}

class ChromePrivacy {
  ChromePrivacy._();
}
