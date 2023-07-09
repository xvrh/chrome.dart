import 'chrome.dart';
export 'chrome.dart';

final _enterprisePlatformKeys = ChromeEnterprisePlatformKeys._();

extension ChromeChromeEnterprisePlatformKeysExtension on Chrome {
  ChromeEnterprisePlatformKeys get enterprisePlatformKeys =>
      _enterprisePlatformKeys;
}

class ChromeEnterprisePlatformKeys {
  ChromeEnterprisePlatformKeys._();
}

///  Whether to use the Enterprise User Key or the Enterprise Machine Key.
enum Scope {
  user('USER'),
  machine('MACHINE');

  const Scope(this.value);

  final String value;
}

///  Type of key to generate.
enum Algorithm {
  rsa('RSA'),
  ecdsa('ECDSA');

  const Algorithm(this.value);

  final String value;
}
