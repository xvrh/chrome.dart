import 'chrome.dart';

final _ContentSettings = ChromeContentSettings._();

extension ChromeChromeContentSettingsExtension on Chrome {
  ChromeContentSettings get ContentSettings => _ContentSettings;
}

class ChromeContentSettings {
  ChromeContentSettings._();
}
