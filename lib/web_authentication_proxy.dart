import 'chrome.dart';
export 'chrome.dart';

final _webAuthenticationProxy = ChromeWebAuthenticationProxy._();

extension ChromeChromeWebAuthenticationProxyExtension on Chrome {
  ChromeWebAuthenticationProxy get webAuthenticationProxy =>
      _webAuthenticationProxy;
}

class ChromeWebAuthenticationProxy {
  ChromeWebAuthenticationProxy._();
}
