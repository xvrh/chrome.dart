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
  external JSPlatformKeys get platformKeys;
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
  external void selectClientCertificates(
    SelectDetails details,
    JSFunction callback,
  );

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
  external void getKeyPair(
    JSArrayBuffer certificate,
    JSObject parameters,
    JSFunction callback,
  );

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
  external void getKeyPairBySpki(
    JSArrayBuffer publicKeySpkiDer,
    JSObject parameters,
    JSFunction callback,
  );

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
  external void verifyTLSServerCertificate(
    VerificationDetails details,
    JSFunction callback,
  );
}

typedef ClientCertificateType = JSString;

@JS()
@staticInterop
class Match {}

extension MatchExtension on Match {
  ///  The DER encoding of a X.509 certificate.
  external JSArrayBuffer get certificate;

  ///  The
  ///  <a href="http://www.w3.org/TR/WebCryptoAPI/#key-algorithm-dictionary">
  ///  KeyAlgorithm</a> of the certified key. This contains algorithm
  ///  parameters that are inherent to the key of the certificate (e.g. the key
  ///  length). Other parameters like the hash function used by the sign
  ///  function are not included.
  external JSObject get keyAlgorithm;
}

@JS()
@staticInterop
class ClientCertificateRequest {}

extension ClientCertificateRequestExtension on ClientCertificateRequest {
  ///  This field is a list of the types of certificates requested, sorted in
  ///  order of the server's preference. Only certificates of a type contained
  ///  in this list will be retrieved. If `certificateTypes` is the
  ///  empty list, however, certificates of any type will be returned.
  external JSArray get certificateTypes;

  ///  List of distinguished names of certificate authorities allowed by the
  ///  server. Each entry must be a DER-encoded X.509 DistinguishedName.
  external JSArray get certificateAuthorities;
}

@JS()
@staticInterop
class SelectDetails {}

extension SelectDetailsExtension on SelectDetails {
  ///  Only certificates that match this request will be returned.
  external ClientCertificateRequest get request;

  ///  If given, the `selectClientCertificates` operates on this
  ///  list. Otherwise, obtains the list of all certificates from the platform's
  ///  certificate stores that are available to this extensions.
  ///  Entries that the extension doesn't have permission for or which doesn't
  ///  match the request, are removed.
  external JSArray? get clientCerts;

  ///  If true, the filtered list is presented to the user to manually select a
  ///  certificate and thereby granting the extension access to the
  ///  certificate(s) and key(s). Only the selected certificate(s) will be
  ///  returned. If is false, the list is reduced to all certificates that the
  ///  extension has been granted access to (automatically or manually).
  external JSBoolean get interactive;
}

@JS()
@staticInterop
class VerificationDetails {}

extension VerificationDetailsExtension on VerificationDetails {
  ///  Each chain entry must be the DER encoding of a X.509 certificate, the
  ///  first entry must be the server certificate and each entry must certify
  ///  the entry preceding it.
  external JSArray get serverCertificateChain;

  ///  The hostname of the server to verify the certificate for, e.g. the server
  ///  that presented the `serverCertificateChain`.
  external JSString get hostname;
}

@JS()
@staticInterop
class VerificationResult {}

extension VerificationResultExtension on VerificationResult {
  ///  The result of the trust verification: true if trust for the given
  ///  verification details could be established and false if trust is rejected
  ///  for any reason.
  external JSBoolean get trusted;

  ///  If the trust verification failed, this array contains the errors reported
  ///  by the underlying network layer. Otherwise, this array is empty.
  ///
  ///  <strong>Note:</strong> This list is meant for debugging only and may not
  ///  contain all relevant errors. The errors returned may change in future
  ///  revisions of this API, and are not guaranteed to be forwards or backwards
  ///  compatible.
  external JSArray get debug_errors;
}
