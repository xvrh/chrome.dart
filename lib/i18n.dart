import 'chrome.dart';
export 'chrome.dart';

final _i18N = ChromeI18n._();

extension ChromeChromeI18nExtension on Chrome {
  ChromeI18n get i18N => _i18N;
}

class ChromeI18n {
  ChromeI18n._();
}
