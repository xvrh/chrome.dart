import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSPlatformKeysExtension on JSChrome {
  ///  Use the `chrome.platformKeys` API to access client certificates
  ///  managed by the platform. If the user or policy grants the permission, an
  ///  extension can use such a certficate in its custom authentication
  /// protocol.
  ///  E.g. this allows usage of platform managed certificates in third party
  /// VPNs
  ///  (see $(ref:vpnProvider chrome.vpnProvider)).
  external JSPlatformKeys get PlatformKeys;
}

@JS()
@staticInterop
class JSPlatformKeys {}

extension JSPlatformKeysExtension on JSPlatformKeys {
  ///  This method filters from a list of client certificates the ones that
  ///  are known to the platform, match `request` and for which the
  ///  extension has permission to access the certificate and its private key.
  ///  If `interactive` is true, the user is presented a dialog where
  ///  they can select from matching certificates and grant the extension access
  ///  to the certificate.
  ///  The selected/filtered client certificates will be passed to
  ///  `callback`.
  external void selectClientCertificates();

  ///  Passes the key pair of `certificate` for usage with
  ///  $(ref:platformKeys.subtleCrypto) to `callback`.
  ///  |certificate|: The certificate of a $(ref:Match) returned by
  ///  $(ref:selectClientCertificates).
  ///  |parameters|: Determines signature/hash algorithm parameters additionally
  ///  to the parameters fixed by the key itself. The same parameters are
  ///  accepted as by WebCrypto's <a
  ///
  /// href="http://www.w3.org/TR/WebCryptoAPI/#SubtleCrypto-method-importKey">importKey</a>
  ///  function, e.g. `RsaHashedImportParams` for a RSASSA-PKCS1-v1_5
  ///  key and `EcKeyImportParams` for EC key.
  ///  Additionally for RSASSA-PKCS1-v1_5 keys, hashing algorithm name parameter
  ///  can be specified with one of the following values: "none", "SHA-1",
  ///  "SHA-256", "SHA-384", or "SHA-512", e.g.
  ///  `{"hash": { "name": "none" } }`. The sign function will then
  ///  apply PKCS#1 v1.5 padding but not hash the given data.
  ///  <p>Currently, this method only supports the "RSASSA-PKCS1-v1_5" and
  ///  "ECDSA" algorithms.</p>
  external void getKeyPair();

  ///  Passes the key pair identified by `publicKeySpkiDer` for
  ///  usage with $(ref:platformKeys.subtleCrypto) to `callback`.
  ///  |publicKeySpkiDer|: A DER-encoded X.509 SubjectPublicKeyInfo, obtained
  ///  e.g. by calling WebCrypto's exportKey function with format="spki".
  ///  |parameters|: Provides signature and hash algorithm parameters, in
  ///  addition to those fixed by the key itself. The same parameters are
  ///  accepted as by WebCrypto's <a
  ///
  /// href="http://www.w3.org/TR/WebCryptoAPI/#SubtleCrypto-method-importKey">importKey</a>
  ///  function, e.g. `RsaHashedImportParams` for a RSASSA-PKCS1-v1_5
  ///  key. For RSASSA-PKCS1-v1_5 keys, we need to also pass a "hash" parameter
  ///  `{ "hash": { "name": string } }`. The "hash" parameter
  ///  represents the name of the hashing algorithm to be used in the digest
  ///  operation before a sign. It is possible to pass "none" as the hash name,
  ///  in which case the sign function will apply PKCS#1 v1.5 padding and but
  ///  not hash the given data.
  ///  <p>Currently, this method supports the "ECDSA" algorithm with
  ///  named-curve P-256 and "RSASSA-PKCS1-v1_5" algorithm with one of the
  ///  hashing algorithms "none", "SHA-1", "SHA-256", "SHA-384", and
  ///  "SHA-512".</p>
  external void getKeyPairBySpki();

  ///  An implementation of WebCrypto's
  ///  <a href="http://www.w3.org/TR/WebCryptoAPI/#subtlecrypto-interface">
  ///  SubtleCrypto</a>
  ///  that allows crypto operations on keys of client certificates that are
  ///  available to this extension.
  external void subtleCrypto();

  ///  Checks whether `details.serverCertificateChain` can be trusted
  ///  for `details.hostname` according to the trust settings of the
  ///  platform.
  ///  Note: The actual behavior of the trust verification is not fully
  ///  specified and might change in the future.
  ///  The API implementation verifies certificate expiration, validates the
  ///  certification path and checks trust by a known CA.
  ///  The implementation is supposed to respect the EKU serverAuth and to
  ///  support subject alternative names.
  external void verifyTLSServerCertificate();
}
