import 'chrome.dart';
export 'chrome.dart';

final _certificateProvider = ChromeCertificateProvider._();

extension ChromeChromeCertificateProviderExtension on Chrome {
  ChromeCertificateProvider get certificateProvider => _certificateProvider;
}

class ChromeCertificateProvider {
  ChromeCertificateProvider._();

  /// Requests the PIN from the user. Only one ongoing request at a time is
  /// allowed. The requests issued while another flow is ongoing are rejected.
  /// It's the extension's responsibility to try again later if another flow is
  /// in progress.
  /// |details|: Contains the details about the requested dialog.
  /// |callback|: Is called when the dialog is resolved with the user input, or
  /// when the dialog request finishes unsuccessfully (e.g. the dialog was
  /// canceled by the user or was not allowed to be shown).
  void requestPin(details) => throw UnimplementedError();

  /// Stops the pin request started by the $(ref:requestPin) function.
  /// |details|: Contains the details about the reason for stopping the
  /// request flow.
  /// |callback|: To be used by Chrome to send to the extension the status from
  /// their request to close PIN dialog for user.
  void stopPinRequest(details) => throw UnimplementedError();

  /// Sets a list of certificates to use in the browser.
  /// <p>The extension should call this function after initialization and on
  /// every change in the set of currently available certificates. The
  /// extension should also call this function in response to
  /// $(ref:onCertificatesUpdateRequested) every time this event is
  /// received.</p>
  /// |details|: The certificates to set. Invalid certificates will be ignored.
  /// |callback|: Called upon completion.
  void setCertificates(details) => throw UnimplementedError();

  /// Should be called as a response to $(ref:onSignatureRequested).
  /// <p>The extension must eventually call this function for every
  /// $(ref:onSignatureRequested) event; the API implementation will stop
  /// waiting for this call after some time and respond with a timeout
  /// error when this function is called.</p>
  void reportSignature(details) => throw UnimplementedError();

  /// This event fires if the certificates set via $(ref:setCertificates)
  /// are insufficient or the browser requests updated information. The
  /// extension must call $(ref:setCertificates) with the updated list of
  /// certificates and the received `certificatesRequestId`.
  Stream get onCertificatesUpdateRequested => throw UnimplementedError();

  /// This event fires every time the browser needs to sign a message using a
  /// certificate provided by this extension via $(ref:setCertificates).
  /// <p>The extension must sign the input data from `request` using
  /// the appropriate algorithm and private key and return it by calling
  /// $(ref:reportSignature) with the received `signRequestId`.</p>
  Stream get onSignatureRequested => throw UnimplementedError();

  /// <p>This event fires every time the browser requests the current list of
  /// certificates provided by this extension. The extension must call
  /// `reportCallback` exactly once with the current list of
  /// certificates.</p>
  Stream get onCertificatesRequested => throw UnimplementedError();

  /// This event fires every time the browser needs to sign a message using
  /// a certificate provided by this extension in reply to an
  /// $(ref:onCertificatesRequested) event.
  /// The extension must sign the data in `request` using the
  /// appropriate algorithm and private key and return it by calling
  /// `reportCallback`. `reportCallback` must be called
  /// exactly once.
  /// |request|: Contains the details about the sign request.
  Stream get onSignDigestRequested => throw UnimplementedError();
}

/// Types of supported cryptographic signature algorithms.
enum Algorithm {
  /// RSASSA PKCS#1 v1.5 signature algorithm with the MD5-SHA-1 hashing. The
  /// extension must not prepend a DigestInfo prefix but only add PKCS#1
  /// padding. This algorithm is deprecated and will never be requested by
  /// Chrome as of version 109.
  rsassaPkcs1V15Md5Sha1('RSASSA_PKCS1_v1_5_MD5_SHA1'),

  /// RSASSA PKCS#1 v1.5 signature algorithm with the SHA-1 hash function.
  rsassaPkcs1V15Sha1('RSASSA_PKCS1_v1_5_SHA1'),

  /// RSASSA PKCS#1 v1.5 signature algorithm with the SHA-256 hashing function.
  rsassaPkcs1V15Sha256('RSASSA_PKCS1_v1_5_SHA256'),

  /// RSASSA PKCS#1 v1.5 signature algorithm with the SHA-384 hashing function.
  rsassaPkcs1V15Sha384('RSASSA_PKCS1_v1_5_SHA384'),

  /// RSASSA PKCS#1 v1.5 signature algorithm with the SHA-512 hashing function.
  rsassaPkcs1V15Sha512('RSASSA_PKCS1_v1_5_SHA512'),

  /// Since Chrome 89. RSASSA PSS signature algorithm with the SHA-256 hashing
  /// function, MGF1 mask generation function and the salt of the same size as
  /// the hash.
  rsassaPssSha256('RSASSA_PSS_SHA256'),

  /// Since Chrome 89. RSASSA PSS signature algorithm with the SHA-384 hashing
  /// function, MGF1 mask generation function and the salt of the same size as
  /// the hash.
  rsassaPssSha384('RSASSA_PSS_SHA384'),

  /// Since Chrome 89. RSASSA PSS signature algorithm with the SHA-512 hashing
  /// function, MGF1 mask generation function and the salt of the same size as
  /// the hash.
  rsassaPssSha512('RSASSA_PSS_SHA512');

  const Algorithm(this.value);

  final String value;
}

/// Types of errors that the extension can report.
enum Error {
  /// General error that cannot be represented by other more specific error
  /// codes.
  generalError('GENERAL_ERROR');

  const Error(this.value);

  final String value;
}

/// Deprecated. Replaced by $(ref:Algorithm).
enum Hash {
  md5Sha1('MD5_SHA1'),
  sha1('SHA1'),
  sha256('SHA256'),
  sha384('SHA384'),
  sha512('SHA512');

  const Hash(this.value);

  final String value;
}

/// The type of code being requested by the extension with requestPin function.
enum PinRequestType {
  pin('PIN'),
  puk('PUK');

  const PinRequestType(this.value);

  final String value;
}

/// The types of errors that can be presented to the user through the
/// requestPin function.
enum PinRequestErrorType {
  invalidPin('INVALID_PIN'),
  invalidPuk('INVALID_PUK'),
  maxAttemptsExceeded('MAX_ATTEMPTS_EXCEEDED'),
  unknownError('UNKNOWN_ERROR');

  const PinRequestErrorType(this.value);

  final String value;
}
