import 'chrome.dart';

final _FontSettings = ChromeFontSettings._();

extension ChromeChromeFontSettingsExtension on Chrome {
  ChromeFontSettings get FontSettings => _FontSettings;
}

class ChromeFontSettings {
  ChromeFontSettings._();
}
