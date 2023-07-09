import 'chrome.dart';
export 'chrome.dart';

final _platformKeys = ChromePlatformKeys._();

extension ChromeChromePlatformKeysExtension on Chrome {
  ChromePlatformKeys get platformKeys => _platformKeys;
}

class ChromePlatformKeys {
  ChromePlatformKeys._();
}

enum ClientCertificateType {
  rsaSign('rsaSign'),
  ecdsaSign('ecdsaSign');

  const ClientCertificateType(this.value);

  final String value;
}
