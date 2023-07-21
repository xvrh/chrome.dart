import 'dart:typed_data';

import 'src/internal_helpers.dart';
import 'src/js/platform_keys.dart' as $js;

export 'src/chrome.dart' show chrome;

final _platformKeys = ChromePlatformKeys._();

extension ChromePlatformKeysExtension on Chrome {
  ChromePlatformKeys get platformKeys => _platformKeys;
}

class ChromePlatformKeys {
  ChromePlatformKeys._();

  bool get isAvailable => $js.chrome.platformKeysNullable != null;

  /// This method filters from a list of client certificates the ones that
  /// are known to the platform, match `request` and for which the
  /// extension has permission to access the certificate and its private key.
  /// If `interactive` is true, the user is presented a dialog where
  /// they can select from matching certificates and grant the extension access
  /// to the certificate.
  /// The selected/filtered client certificates will be passed to
  /// `callback`.
  Future<List<Match>> selectClientCertificates(SelectDetails details) {
    var $completer = Completer<List<Match>>();
    $js.chrome.platformKeys.selectClientCertificates(
      details.toJS,
      (JSArray matches) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(matches.toDart
              .cast<$js.Match>()
              .map((e) => Match.fromJS(e))
              .toList());
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Passes the key pair of `certificate` for usage with
  /// [platformKeys.subtleCrypto] to `callback`.
  /// |certificate|: The certificate of a [Match] returned by
  /// [selectClientCertificates].
  /// |parameters|: Determines signature/hash algorithm parameters additionally
  /// to the parameters fixed by the key itself. The same parameters are
  /// accepted as by WebCrypto's <a
  /// href="http://www.w3.org/TR/WebCryptoAPI/#SubtleCrypto-method-importKey">importKey</a>
  /// function, e.g. `RsaHashedImportParams` for a RSASSA-PKCS1-v1_5
  /// key and `EcKeyImportParams` for EC key.
  /// Additionally for RSASSA-PKCS1-v1_5 keys, hashing algorithm name parameter
  /// can be specified with one of the following values: "none", "SHA-1",
  /// "SHA-256", "SHA-384", or "SHA-512", e.g.
  /// `{"hash": { "name": "none" } }`. The sign function will then
  /// apply PKCS#1 v1.5 padding but not hash the given data.
  /// Currently, this method only supports the "RSASSA-PKCS1-v1_5" and
  /// "ECDSA" algorithms.
  Future<GetKeyPairResult> getKeyPair(
    ByteBuffer certificate,
    Object parameters,
  ) {
    var $completer = Completer<GetKeyPairResult>();
    $js.chrome.platformKeys.getKeyPair(
      certificate.toJS,
      parameters.toJS,
      (
        JSAny publicKey,
        JSAny? privateKey,
      ) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(GetKeyPairResult(
            publicKey: publicKey,
            privateKey: privateKey,
          ));
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Passes the key pair identified by `publicKeySpkiDer` for
  /// usage with [platformKeys.subtleCrypto] to `callback`.
  /// |publicKeySpkiDer|: A DER-encoded X.509 SubjectPublicKeyInfo, obtained
  /// e.g. by calling WebCrypto's exportKey function with format="spki".
  /// |parameters|: Provides signature and hash algorithm parameters, in
  /// addition to those fixed by the key itself. The same parameters are
  /// accepted as by WebCrypto's <a
  /// href="http://www.w3.org/TR/WebCryptoAPI/#SubtleCrypto-method-importKey">importKey</a>
  /// function, e.g. `RsaHashedImportParams` for a RSASSA-PKCS1-v1_5
  /// key. For RSASSA-PKCS1-v1_5 keys, we need to also pass a "hash" parameter
  /// `{ "hash": { "name": string } }`. The "hash" parameter
  /// represents the name of the hashing algorithm to be used in the digest
  /// operation before a sign. It is possible to pass "none" as the hash name,
  /// in which case the sign function will apply PKCS#1 v1.5 padding and but
  /// not hash the given data.
  /// Currently, this method supports the "ECDSA" algorithm with
  /// named-curve P-256 and "RSASSA-PKCS1-v1_5" algorithm with one of the
  /// hashing algorithms "none", "SHA-1", "SHA-256", "SHA-384", and
  /// "SHA-512".
  Future<GetKeyPairBySpkiResult> getKeyPairBySpki(
    ByteBuffer publicKeySpkiDer,
    Object parameters,
  ) {
    var $completer = Completer<GetKeyPairBySpkiResult>();
    $js.chrome.platformKeys.getKeyPairBySpki(
      publicKeySpkiDer.toJS,
      parameters.toJS,
      (
        JSAny publicKey,
        JSAny? privateKey,
      ) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(GetKeyPairBySpkiResult(
            publicKey: publicKey,
            privateKey: privateKey,
          ));
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// An implementation of WebCrypto's
  /// <a href="http://www.w3.org/TR/WebCryptoAPI/#subtlecrypto-interface">
  /// SubtleCrypto</a>
  /// that allows crypto operations on keys of client certificates that are
  /// available to this extension.
  Object subtleCrypto() {
    return $js.chrome.platformKeys.subtleCrypto();
  }

  /// Checks whether `details.serverCertificateChain` can be trusted
  /// for `details.hostname` according to the trust settings of the
  /// platform.
  /// Note: The actual behavior of the trust verification is not fully
  /// specified and might change in the future.
  /// The API implementation verifies certificate expiration, validates the
  /// certification path and checks trust by a known CA.
  /// The implementation is supposed to respect the EKU serverAuth and to
  /// support subject alternative names.
  Future<VerificationResult> verifyTLSServerCertificate(
      VerificationDetails details) {
    var $completer = Completer<VerificationResult>();
    $js.chrome.platformKeys.verifyTLSServerCertificate(
      details.toJS,
      ($js.VerificationResult result) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(VerificationResult.fromJS(result));
        }
      }.toJS,
    );
    return $completer.future;
  }
}

enum ClientCertificateType {
  rsaSign('rsaSign'),
  ecdsaSign('ecdsaSign');

  const ClientCertificateType(this.value);

  final String value;

  String get toJS => value;
  static ClientCertificateType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class Match {
  Match.fromJS(this._wrapped);

  Match({
    required ByteBuffer certificate,
    required Object keyAlgorithm,
  }) : _wrapped = $js.Match()
          ..certificate = certificate.toJS
          ..keyAlgorithm = keyAlgorithm.toJS;

  final $js.Match _wrapped;

  $js.Match get toJS => _wrapped;

  /// The DER encoding of a X.509 certificate.
  ByteBuffer get certificate => _wrapped.certificate.toDart;
  set certificate(ByteBuffer v) {
    _wrapped.certificate = v.toJS;
  }

  /// The
  /// <a href="http://www.w3.org/TR/WebCryptoAPI/#key-algorithm-dictionary">
  /// KeyAlgorithm</a> of the certified key. This contains algorithm
  /// parameters that are inherent to the key of the certificate (e.g. the key
  /// length). Other parameters like the hash function used by the sign
  /// function are not included.
  Object get keyAlgorithm => _wrapped.keyAlgorithm;
  set keyAlgorithm(Object v) {
    _wrapped.keyAlgorithm = v.toJS;
  }
}

class ClientCertificateRequest {
  ClientCertificateRequest.fromJS(this._wrapped);

  ClientCertificateRequest({
    required List<ClientCertificateType> certificateTypes,
    required List<ByteBuffer> certificateAuthorities,
  }) : _wrapped = $js.ClientCertificateRequest(
          certificateTypes: certificateTypes.toJSArray((e) => e.toJS),
          certificateAuthorities:
              certificateAuthorities.toJSArray((e) => e.toJS),
        );

  final $js.ClientCertificateRequest _wrapped;

  $js.ClientCertificateRequest get toJS => _wrapped;
}

class SelectDetails {
  SelectDetails.fromJS(this._wrapped);

  SelectDetails({
    required ClientCertificateRequest request,
    List<ByteBuffer>? clientCerts,
    required bool interactive,
  }) : _wrapped = $js.SelectDetails(
          request: request.toJS,
          clientCerts: clientCerts?.toJSArray((e) => e.toJS),
          interactive: interactive,
        );

  final $js.SelectDetails _wrapped;

  $js.SelectDetails get toJS => _wrapped;
}

class VerificationDetails {
  VerificationDetails.fromJS(this._wrapped);

  VerificationDetails({
    required List<ByteBuffer> serverCertificateChain,
    required String hostname,
  }) : _wrapped = $js.VerificationDetails(
          serverCertificateChain:
              serverCertificateChain.toJSArray((e) => e.toJS),
          hostname: hostname,
        );

  final $js.VerificationDetails _wrapped;

  $js.VerificationDetails get toJS => _wrapped;
}

class VerificationResult {
  VerificationResult.fromJS(this._wrapped);

  VerificationResult({
    required bool trusted,
    required List<String> debug_errors,
  }) : _wrapped = $js.VerificationResult()
          ..trusted = trusted
          ..debug_errors = debug_errors.toJSArray((e) => e);

  final $js.VerificationResult _wrapped;

  $js.VerificationResult get toJS => _wrapped;

  /// The result of the trust verification: true if trust for the given
  /// verification details could be established and false if trust is rejected
  /// for any reason.
  bool get trusted => _wrapped.trusted;
  set trusted(bool v) {
    _wrapped.trusted = v;
  }

  /// If the trust verification failed, this array contains the errors reported
  /// by the underlying network layer. Otherwise, this array is empty.
  ///
  /// *Note:* This list is meant for debugging only and may not
  /// contain all relevant errors. The errors returned may change in future
  /// revisions of this API, and are not guaranteed to be forwards or backwards
  /// compatible.
  List<String> get debug_errors =>
      _wrapped.debug_errors.toDart.cast<String>().map((e) => e).toList();
  set debug_errors(List<String> v) {
    _wrapped.debug_errors = v.toJSArray((e) => e);
  }
}

class GetKeyPairResult {
  GetKeyPairResult({
    required this.publicKey,
    required this.privateKey,
  });

  final Object publicKey;

  final Object? privateKey;
}

class GetKeyPairBySpkiResult {
  GetKeyPairBySpkiResult({
    required this.publicKey,
    required this.privateKey,
  });

  final Object publicKey;

  final Object? privateKey;
}
