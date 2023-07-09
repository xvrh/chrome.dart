import 'chrome.dart';

final _I18n = ChromeI18n._();

extension ChromeChromeI18nExtension on Chrome {
  ChromeI18n get I18n => _I18n;
}

class ChromeI18n {
  ChromeI18n._();
}
