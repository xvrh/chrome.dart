import 'chrome.dart';
export 'chrome.dart';

final _certificateProvider = ChromeCertificateProvider._();

extension ChromeChromeCertificateProviderExtension on Chrome {
  ChromeCertificateProvider get certificateProvider => _certificateProvider;
}

class ChromeCertificateProvider {
  ChromeCertificateProvider._();
}

///  Types of supported cryptographic signature algorithms.
enum Algorithm {
  ///  RSASSA PKCS#1 v1.5 signature algorithm with the MD5-SHA-1 hashing. The
  ///  extension must not prepend a DigestInfo prefix but only add PKCS#1
  ///  padding. This algorithm is deprecated and will never be requested by
  ///  Chrome as of version 109.
  rsassaPKCS1V15MD5SHA1('RSASSA_PKCS1_v1_5_MD5_SHA1'),

  ///  RSASSA PKCS#1 v1.5 signature algorithm with the SHA-1 hash function.
  rsassaPKCS1V15SHA1('RSASSA_PKCS1_v1_5_SHA1'),

  ///  RSASSA PKCS#1 v1.5 signature algorithm with the SHA-256 hashing function.
  rsassaPKCS1V15SHA256('RSASSA_PKCS1_v1_5_SHA256'),

  ///  RSASSA PKCS#1 v1.5 signature algorithm with the SHA-384 hashing function.
  rsassaPKCS1V15SHA384('RSASSA_PKCS1_v1_5_SHA384'),

  ///  RSASSA PKCS#1 v1.5 signature algorithm with the SHA-512 hashing function.
  rsassaPKCS1V15SHA512('RSASSA_PKCS1_v1_5_SHA512'),

  ///  Since Chrome 89. RSASSA PSS signature algorithm with the SHA-256 hashing
  ///  function, MGF1 mask generation function and the salt of the same size as
  ///  the hash.
  rsassaPSSSHA256('RSASSA_PSS_SHA256'),

  ///  Since Chrome 89. RSASSA PSS signature algorithm with the SHA-384 hashing
  ///  function, MGF1 mask generation function and the salt of the same size as
  ///  the hash.
  rsassaPSSSHA384('RSASSA_PSS_SHA384'),

  ///  Since Chrome 89. RSASSA PSS signature algorithm with the SHA-512 hashing
  ///  function, MGF1 mask generation function and the salt of the same size as
  ///  the hash.
  rsassaPSSSHA512('RSASSA_PSS_SHA512');

  const Algorithm(this.value);

  final String value;
}

///  Types of errors that the extension can report.
enum Error {
  ///  General error that cannot be represented by other more specific error
  ///  codes.
  generalERROR('GENERAL_ERROR');

  const Error(this.value);

  final String value;
}

///  Deprecated. Replaced by $(ref:Algorithm).
enum Hash {
  md5SHA1('MD5_SHA1'),
  sha1('SHA1'),
  sha256('SHA256'),
  sha384('SHA384'),
  sha512('SHA512');

  const Hash(this.value);

  final String value;
}

///  The type of code being requested by the extension with requestPin function.
enum PinRequestType {
  pin('PIN'),
  puk('PUK');

  const PinRequestType(this.value);

  final String value;
}

///  The types of errors that can be presented to the user through the
///  requestPin function.
enum PinRequestErrorType {
  invalidPIN('INVALID_PIN'),
  invalidPUK('INVALID_PUK'),
  maxATTEMPTSEXCEEDED('MAX_ATTEMPTS_EXCEEDED'),
  unknownERROR('UNKNOWN_ERROR');

  const PinRequestErrorType(this.value);

  final String value;
}
