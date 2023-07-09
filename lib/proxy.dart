import 'chrome.dart';

final _Proxy = ChromeProxy._();

extension ChromeChromeProxyExtension on Chrome {
  ChromeProxy get Proxy => _Proxy;
}

class ChromeProxy {
  ChromeProxy._();
}
