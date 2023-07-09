import 'chrome.dart';

final _CertificateProvider = ChromeCertificateProvider._();

extension ChromeChromeCertificateProviderExtension on Chrome {
  ChromeCertificateProvider get CertificateProvider => _CertificateProvider;
}

class ChromeCertificateProvider {
  ChromeCertificateProvider._();
}
