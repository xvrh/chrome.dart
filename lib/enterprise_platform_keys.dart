import 'chrome.dart';
export 'chrome.dart';

final _enterprisePlatformKeys = ChromeEnterprisePlatformKeys._();

extension ChromeChromeEnterprisePlatformKeysExtension on Chrome {
  ChromeEnterprisePlatformKeys get enterprisePlatformKeys =>
      _enterprisePlatformKeys;
}

class ChromeEnterprisePlatformKeys {
  ChromeEnterprisePlatformKeys._();

  /// Returns the available Tokens. In a regular user's session the list will
  /// always contain the user's token with `id` `"user"`.
  /// If a system-wide TPM token is available, the returned list will also
  /// contain the system-wide token with `id` `"system"`.
  /// The system-wide token will be the same for all sessions on this device
  /// (device in the sense of e.g. a Chromebook).
  void getTokens() => throw UnimplementedError();

  /// Returns the list of all client certificates available from the given
  /// token. Can be used to check for the existence and expiration of client
  /// certificates that are usable for a certain authentication.
  /// |tokenId|: The id of a Token returned by `getTokens`.
  /// |callback|: Called back with the list of the available certificates.
  void getCertificates(tokenId) => throw UnimplementedError();

  /// Imports `certificate` to the given token if the certified key
  /// is already stored in this token.
  /// After a successful certification request, this function should be used to
  /// store the obtained certificate and to make it available to the operating
  /// system and browser for authentication.
  /// |tokenId|: The id of a Token returned by `getTokens`.
  /// |certificate|: The DER encoding of a X.509 certificate.
  /// |callback|: Called back when this operation is finished.
  void importCertificate(
    tokenId,
    certificate,
  ) =>
      throw UnimplementedError();

  /// Removes `certificate` from the given token if present.
  /// Should be used to remove obsolete certificates so that they are not
  /// considered during authentication and do not clutter the certificate
  /// choice. Should be used to free storage in the certificate store.
  /// |tokenId|: The id of a Token returned by `getTokens`.
  /// |certificate|: The DER encoding of a X.509 certificate.
  /// |callback|: Called back when this operation is finished.
  void removeCertificate(
    tokenId,
    certificate,
  ) =>
      throw UnimplementedError();

  /// Similar to `challengeMachineKey` and
  /// `challengeUserKey`, but allows specifying the algorithm of a
  /// registered key. Challenges a hardware-backed Enterprise Machine Key and
  /// emits the response as part of a remote attestation protocol. Only useful
  /// on Chrome OS and in conjunction with the Verified Access Web API which
  /// both issues challenges and verifies responses.
  ///
  /// A successful verification by the Verified Access Web API is a strong
  /// signal that the current device is a legitimate Chrome OS device, the
  /// current device is managed by the domain specified during verification,
  /// the current signed-in user is managed by the domain specified during
  /// verification, and the current device state complies with enterprise
  /// device policy. For example, a policy may specify that the device must not
  /// be in developer mode.  Any device identity emitted by the verification is
  /// tightly bound to the hardware of the current device. If
  /// `"user"` Scope is specified, the identity is also tighly bound
  /// to the current signed-in user.
  ///
  /// This function is highly restricted and will fail if the current device is
  /// not managed, the current user is not managed, or if this operation has
  /// not explicitly been enabled for the caller by enterprise device policy.
  /// The challenged key does not reside in the `"system"` or
  /// `"user"` token and is not accessible by any other API.
  /// |options|: Object containing the fields defined in
  ///            $(ref:ChallengeKeyOptions).
  /// |callback|: Called back with the challenge response.
  void challengeKey(options) => throw UnimplementedError();

  /// Challenges a hardware-backed Enterprise Machine Key and emits the
  /// response as part of a remote attestation protocol. Only useful on Chrome
  /// OS and in conjunction with the Verified Access Web API which both issues
  /// challenges and verifies responses. A successful verification by the
  /// Verified Access Web API is a strong signal of all of the following:
  /// * The current device is a legitimate Chrome OS device.
  /// * The current device is managed by the domain specified during
  ///   verification.
  /// * The current signed-in user is managed by the domain specified during
  ///   verification.
  /// * The current device state complies with enterprise device policy. For
  ///   example, a policy may specify that the device must not be in developer
  ///   mode.
  /// * Any device identity emitted by the verification is tightly bound to the
  ///   hardware of the current device.
  /// This function is highly restricted and will fail if the current device
  /// is not managed, the current user is not managed, or if this operation
  /// has not explicitly been enabled for the caller by enterprise device
  /// policy. The Enterprise Machine Key does not reside in the
  /// `"system"` token and is not accessible by any other API.
  /// |challenge|: A challenge as emitted by the Verified Access Web API.
  /// |registerKey|: If set, the current Enterprise Machine Key is registered
  ///                with the `"system"` token and relinquishes the
  ///                Enterprise Machine Key role. The key can then be
  ///                associated with a certificate and used like any other
  ///                signing key. This key is 2048-bit RSA. Subsequent calls
  ///                to this function will then generate a new Enterprise
  ///                Machine Key.
  /// |callback|: Called back with the challenge response.
  void challengeMachineKey(
    challenge,
    registerKey,
  ) =>
      throw UnimplementedError();

  /// Challenges a hardware-backed Enterprise User Key and emits the response
  /// as part of a remote attestation protocol. Only useful on Chrome OS and in
  /// conjunction with the Verified Access Web API which both issues challenges
  /// and verifies responses. A successful verification by the Verified Access
  /// Web API is a strong signal of all of the following:
  /// * The current device is a legitimate Chrome OS device.
  /// * The current device is managed by the domain specified during
  ///   verification.
  /// * The current signed-in user is managed by the domain specified during
  ///   verification.
  /// * The current device state complies with enterprise user policy. For
  ///   example, a policy may specify that the device must not be in developer
  ///   mode.
  /// * The public key emitted by the verification is tightly bound to the
  ///   hardware of the current device and to the current signed-in user.
  /// This function is highly restricted and will fail if the current device is
  /// not managed, the current user is not managed, or if this operation has
  /// not explicitly been enabled for the caller by enterprise user policy.
  /// The Enterprise User Key does not reside in the `"user"` token
  /// and is not accessible by any other API.
  /// |challenge|: A challenge as emitted by the Verified Access Web API.
  /// |registerKey|: If set, the current Enterprise User Key is registered with
  ///                the `"user"` token and relinquishes the
  ///                Enterprise User Key role. The key can then be associated
  ///                with a certificate and used like any other signing key.
  ///                This key is 2048-bit RSA. Subsequent calls to this
  ///                function will then generate a new Enterprise User Key.
  /// |callback|: Called back with the challenge response.
  void challengeUserKey(
    challenge,
    registerKey,
  ) =>
      throw UnimplementedError();
}

/// Whether to use the Enterprise User Key or the Enterprise Machine Key.
enum Scope {
  user('USER'),
  machine('MACHINE');

  const Scope(this.value);

  final String value;
}

/// Type of key to generate.
enum Algorithm {
  rsa('RSA'),
  ecdsa('ECDSA');

  const Algorithm(this.value);

  final String value;
}
