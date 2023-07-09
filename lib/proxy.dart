import 'chrome.dart';
export 'chrome.dart';

final _proxy = ChromeProxy._();

extension ChromeChromeProxyExtension on Chrome {
  ChromeProxy get proxy => _proxy;
}

class ChromeProxy {
  ChromeProxy._();

  /// Notifies about proxy errors.
  Stream get onProxyError => throw UnimplementedError();
}

enum Scheme {
  http('http'),
  https('https'),
  quic('quic'),
  socks4('socks4'),
  socks5('socks5');

  const Scheme(this.value);

  final String value;
}

enum Mode {
  direct('direct'),
  autoDetect('auto_detect'),
  pacScript('pac_script'),
  fixedServers('fixed_servers'),
  system('system');

  const Mode(this.value);

  final String value;
}
