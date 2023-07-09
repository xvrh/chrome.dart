import 'chrome.dart';

final _WebAuthenticationProxy = ChromeWebAuthenticationProxy._();

extension ChromeChromeWebAuthenticationProxyExtension on Chrome {
  ChromeWebAuthenticationProxy get WebAuthenticationProxy =>
      _WebAuthenticationProxy;
}

class ChromeWebAuthenticationProxy {
  ChromeWebAuthenticationProxy._();
}
