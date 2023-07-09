import 'chrome.dart';

final _Cookies = ChromeCookies._();

extension ChromeChromeCookiesExtension on Chrome {
  ChromeCookies get Cookies => _Cookies;
}

class ChromeCookies {
  ChromeCookies._();
}
