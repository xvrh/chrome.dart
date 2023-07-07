/* This file has been generated from certificate_provider.idl - do not edit */

/**
 * Use this API to expose certificates to the platform which can use these
 * certificates for TLS authentications.
 */
library chrome.certificateProvider;

import '../src/common.dart';

/**
 * Accessor for the `chrome.certificateProvider` namespace.
 */
final ChromeCertificateProvider certificateProvider = ChromeCertificateProvider._();

class ChromeCertificateProvider extends ChromeApi {
  JsObject get _certificateProvider => chrome['certificateProvider'];

  Stream<CertificatesUpdateRequest> get onCertificatesUpdateRequested => _onCertificatesUpdateRequested.stream;
  late ChromeStreamController<CertificatesUpdateRequest> _onCertificatesUpdateRequested;

  Stream<SignatureRequest> get onSignatureRequested => _onSignatureRequested.stream;
  late ChromeStreamController<SignatureRequest> _onSignatureRequested;

  Stream<CertificatesCallback> get onCertificatesRequested => _onCertificatesRequested.stream;
  late ChromeStreamController<CertificatesCallback> _onCertificatesRequested;

  Stream<OnSignDigestRequestedEvent> get onSignDigestRequested => _onSignDigestRequested.stream;
  late ChromeStreamController<OnSignDigestRequestedEvent> _onSignDigestRequested;

  ChromeCertificateProvider._() {
    var getApi = () => _certificateProvider;
    _onCertificatesUpdateRequested = ChromeStreamController<CertificatesUpdateRequest>.oneArg(getApi, 'onCertificatesUpdateRequested', _createCertificatesUpdateRequest);
    _onSignatureRequested = ChromeStreamController<SignatureRequest>.oneArg(getApi, 'onSignatureRequested', _createSignatureRequest);
    _onCertificatesRequested = ChromeStreamController<CertificatesCallback>.oneArg(getApi, 'onCertificatesRequested', _createCertificatesCallback);
    _onSignDigestRequested = ChromeStreamController<OnSignDigestRequestedEvent>.twoArgs(getApi, 'onSignDigestRequested', _createOnSignDigestRequestedEvent);
  }

  bool get available => _certificateProvider != null;

  /**
   * Requests the PIN from the user. Only one ongoing request at a time is
   * allowed. The requests issued while another flow is ongoing are rejected.
   * It's the extension's responsibility to try again later if another flow is
   * in progress.
   * [details]: Contains the details about the requested dialog.
   * [callback]: Is called when the dialog is resolved with the user input, or
   * when the dialog request finishes unsuccessfully (e.g. the dialog was
   * canceled by the user or was not allowed to be shown).
   */
  Future<PinResponseDetails> requestPin(RequestPinDetails details) {
    if (_certificateProvider == null) _throwNotAvailable();

    var completer =  ChromeCompleter<PinResponseDetails>.oneArg(_createPinResponseDetails);
    _certificateProvider.callMethod('requestPin', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Stops the pin request started by the [requestPin] function.
   * [details]: Contains the details about the reason for stopping the request
   * flow.
   * [callback]: To be used by Chrome to send to the extension the status from
   * their request to close PIN dialog for user.
   */
  Future stopPinRequest(StopPinRequestDetails details) {
    if (_certificateProvider == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _certificateProvider.callMethod('stopPinRequest', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Sets a list of certificates to use in the browser. <p>The extension should
   * call this function after initialization and on every change in the set of
   * currently available certificates. The extension should also call this
   * function in response to [onCertificatesUpdateRequested] every time this
   * event is received.</p>
   * [details]: The certificates to set. Invalid certificates will be ignored.
   * [callback]: Called upon completion.
   */
  Future setCertificates(SetCertificatesDetails details) {
    if (_certificateProvider == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _certificateProvider.callMethod('setCertificates', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Should be called as a response to [onSignatureRequested]. <p>The extension
   * must eventually call this function for every [onSignatureRequested] event;
   * the API implementation will stop waiting for this call after some time and
   * respond with a timeout error when this function is called.</p>
   */
  Future reportSignature(ReportSignatureDetails details) {
    if (_certificateProvider == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _certificateProvider.callMethod('reportSignature', [jsify(details), completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.certificateProvider' is not available");
  }
}

class OnSignDigestRequestedEvent {
  final SignRequest request;

  final SignCallback reportCallback;

  OnSignDigestRequestedEvent(this.request, this.reportCallback);
}

/**
 * Types of supported cryptographic signature algorithms.
 */
class Algorithm extends ChromeEnum {
  static const Algorithm _R_S_A_S_S_A__P_K_C_S1_V1_5__M_D5__S_H_A1 = const Algorithm._('RSASSA_PKCS1_v1_5_MD5_SHA1');
  static const Algorithm _R_S_A_S_S_A__P_K_C_S1_V1_5__S_H_A1 = const Algorithm._('RSASSA_PKCS1_v1_5_SHA1');
  static const Algorithm _R_S_A_S_S_A__P_K_C_S1_V1_5__S_H_A256 = const Algorithm._('RSASSA_PKCS1_v1_5_SHA256');
  static const Algorithm _R_S_A_S_S_A__P_K_C_S1_V1_5__S_H_A384 = const Algorithm._('RSASSA_PKCS1_v1_5_SHA384');
  static const Algorithm _R_S_A_S_S_A__P_K_C_S1_V1_5__S_H_A512 = const Algorithm._('RSASSA_PKCS1_v1_5_SHA512');
  static const Algorithm RSASSA_PSS_SHA256 = const Algorithm._('RSASSA_PSS_SHA256');
  static const Algorithm RSASSA_PSS_SHA384 = const Algorithm._('RSASSA_PSS_SHA384');
  static const Algorithm RSASSA_PSS_SHA512 = const Algorithm._('RSASSA_PSS_SHA512');

  static const List<Algorithm> VALUES = const[_R_S_A_S_S_A__P_K_C_S1_V1_5__M_D5__S_H_A1, _R_S_A_S_S_A__P_K_C_S1_V1_5__S_H_A1, _R_S_A_S_S_A__P_K_C_S1_V1_5__S_H_A256, _R_S_A_S_S_A__P_K_C_S1_V1_5__S_H_A384, _R_S_A_S_S_A__P_K_C_S1_V1_5__S_H_A512, RSASSA_PSS_SHA256, RSASSA_PSS_SHA384, RSASSA_PSS_SHA512];

  const Algorithm._(String str): super(str);
}

/**
 * Types of errors that the extension can report.
 */
class Error extends ChromeEnum {
  static const Error GENERAL_ERROR = const Error._('GENERAL_ERROR');

  static const List<Error> VALUES = const[GENERAL_ERROR];

  const Error._(String str): super(str);
}

/**
 * Deprecated. Replaced by [Algorithm].
 */
class Hash extends ChromeEnum {
  static const Hash MD5_SHA1 = const Hash._('MD5_SHA1');
  static const Hash SHA1 = const Hash._('SHA1');
  static const Hash SHA256 = const Hash._('SHA256');
  static const Hash SHA384 = const Hash._('SHA384');
  static const Hash SHA512 = const Hash._('SHA512');

  static const List<Hash> VALUES = const[MD5_SHA1, SHA1, SHA256, SHA384, SHA512];

  const Hash._(String str): super(str);
}

/**
 * The type of code being requested by the extension with requestPin function.
 */
class PinRequestType extends ChromeEnum {
  static const PinRequestType PIN = const PinRequestType._('PIN');
  static const PinRequestType PUK = const PinRequestType._('PUK');

  static const List<PinRequestType> VALUES = const[PIN, PUK];

  const PinRequestType._(String str): super(str);
}

/**
 * The types of errors that can be presented to the user through the requestPin
 * function.
 */
class PinRequestErrorType extends ChromeEnum {
  static const PinRequestErrorType INVALID_PIN = const PinRequestErrorType._('INVALID_PIN');
  static const PinRequestErrorType INVALID_PUK = const PinRequestErrorType._('INVALID_PUK');
  static const PinRequestErrorType MAX_ATTEMPTS_EXCEEDED = const PinRequestErrorType._('MAX_ATTEMPTS_EXCEEDED');
  static const PinRequestErrorType UNKNOWN_ERROR = const PinRequestErrorType._('UNKNOWN_ERROR');

  static const List<PinRequestErrorType> VALUES = const[INVALID_PIN, INVALID_PUK, MAX_ATTEMPTS_EXCEEDED, UNKNOWN_ERROR];

  const PinRequestErrorType._(String str): super(str);
}

/**
 * Information about a client certificate.
 */
class ClientCertificateInfo extends ChromeObject {
  ClientCertificateInfo({List<ArrayBuffer>? certificateChain, List<Algorithm>? supportedAlgorithms}) {
    if (certificateChain != null) this.certificateChain = certificateChain;
    if (supportedAlgorithms != null) this.supportedAlgorithms = supportedAlgorithms;
  }
  ClientCertificateInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  List<ArrayBuffer> get certificateChain => listify(jsProxy['certificateChain'], _createArrayBuffer);
  set certificateChain(List<ArrayBuffer> value) => jsProxy['certificateChain'] = jsify(value);

  List<Algorithm> get supportedAlgorithms => listify(jsProxy['supportedAlgorithms'], _createAlgorithm);
  set supportedAlgorithms(List<Algorithm> value) => jsProxy['supportedAlgorithms'] = jsify(value);
}

class SetCertificatesDetails extends ChromeObject {
  SetCertificatesDetails({int? certificatesRequestId, Error? error, List<ClientCertificateInfo>? clientCertificates}) {
    if (certificatesRequestId != null) this.certificatesRequestId = certificatesRequestId;
    if (error != null) this.error = error;
    if (clientCertificates != null) this.clientCertificates = clientCertificates;
  }
  SetCertificatesDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get certificatesRequestId => jsProxy['certificatesRequestId'];
  set certificatesRequestId(int value) => jsProxy['certificatesRequestId'] = value;

  Error get error => _createError(jsProxy['error']);
  set error(Error value) => jsProxy['error'] = jsify(value);

  List<ClientCertificateInfo> get clientCertificates => listify(jsProxy['clientCertificates'], _createClientCertificateInfo);
  set clientCertificates(List<ClientCertificateInfo> value) => jsProxy['clientCertificates'] = jsify(value);
}

class CertificatesUpdateRequest extends ChromeObject {
  CertificatesUpdateRequest({int? certificatesRequestId}) {
    if (certificatesRequestId != null) this.certificatesRequestId = certificatesRequestId;
  }
  CertificatesUpdateRequest.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get certificatesRequestId => jsProxy['certificatesRequestId'];
  set certificatesRequestId(int value) => jsProxy['certificatesRequestId'] = value;
}

class SignatureRequest extends ChromeObject {
  SignatureRequest({int? signRequestId, ArrayBuffer? input, Algorithm? algorithm, ArrayBuffer? certificate}) {
    if (signRequestId != null) this.signRequestId = signRequestId;
    if (input != null) this.input = input;
    if (algorithm != null) this.algorithm = algorithm;
    if (certificate != null) this.certificate = certificate;
  }
  SignatureRequest.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get signRequestId => jsProxy['signRequestId'];
  set signRequestId(int value) => jsProxy['signRequestId'] = value;

  ArrayBuffer get input => _createArrayBuffer(jsProxy['input']);
  set input(ArrayBuffer value) => jsProxy['input'] = jsify(value);

  Algorithm get algorithm => _createAlgorithm(jsProxy['algorithm']);
  set algorithm(Algorithm value) => jsProxy['algorithm'] = jsify(value);

  ArrayBuffer get certificate => _createArrayBuffer(jsProxy['certificate']);
  set certificate(ArrayBuffer value) => jsProxy['certificate'] = jsify(value);
}

class ReportSignatureDetails extends ChromeObject {
  ReportSignatureDetails({int? signRequestId, Error? error, ArrayBuffer? signature}) {
    if (signRequestId != null) this.signRequestId = signRequestId;
    if (error != null) this.error = error;
    if (signature != null) this.signature = signature;
  }
  ReportSignatureDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get signRequestId => jsProxy['signRequestId'];
  set signRequestId(int value) => jsProxy['signRequestId'] = value;

  Error get error => _createError(jsProxy['error']);
  set error(Error value) => jsProxy['error'] = jsify(value);

  ArrayBuffer get signature => _createArrayBuffer(jsProxy['signature']);
  set signature(ArrayBuffer value) => jsProxy['signature'] = jsify(value);
}

/**
 * Deprecated. Replaced by [ClientCertificateInfo].
 */
class CertificateInfo extends ChromeObject {
  CertificateInfo({ArrayBuffer? certificate, List<Hash>? supportedHashes}) {
    if (certificate != null) this.certificate = certificate;
    if (supportedHashes != null) this.supportedHashes = supportedHashes;
  }
  CertificateInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  ArrayBuffer get certificate => _createArrayBuffer(jsProxy['certificate']);
  set certificate(ArrayBuffer value) => jsProxy['certificate'] = jsify(value);

  List<Hash> get supportedHashes => listify(jsProxy['supportedHashes'], _createHash);
  set supportedHashes(List<Hash> value) => jsProxy['supportedHashes'] = jsify(value);
}

/**
 * Deprecated. Replaced by [SignatureRequest].
 */
class SignRequest extends ChromeObject {
  SignRequest({int? signRequestId, ArrayBuffer? digest, Hash? hash, ArrayBuffer? certificate}) {
    if (signRequestId != null) this.signRequestId = signRequestId;
    if (digest != null) this.digest = digest;
    if (hash != null) this.hash = hash;
    if (certificate != null) this.certificate = certificate;
  }
  SignRequest.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get signRequestId => jsProxy['signRequestId'];
  set signRequestId(int value) => jsProxy['signRequestId'] = value;

  ArrayBuffer get digest => _createArrayBuffer(jsProxy['digest']);
  set digest(ArrayBuffer value) => jsProxy['digest'] = jsify(value);

  Hash get hash => _createHash(jsProxy['hash']);
  set hash(Hash value) => jsProxy['hash'] = jsify(value);

  ArrayBuffer get certificate => _createArrayBuffer(jsProxy['certificate']);
  set certificate(ArrayBuffer value) => jsProxy['certificate'] = jsify(value);
}

class RequestPinDetails extends ChromeObject {
  RequestPinDetails({int? signRequestId, PinRequestType? requestType, PinRequestErrorType? errorType, int? attemptsLeft}) {
    if (signRequestId != null) this.signRequestId = signRequestId;
    if (requestType != null) this.requestType = requestType;
    if (errorType != null) this.errorType = errorType;
    if (attemptsLeft != null) this.attemptsLeft = attemptsLeft;
  }
  RequestPinDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get signRequestId => jsProxy['signRequestId'];
  set signRequestId(int value) => jsProxy['signRequestId'] = value;

  PinRequestType get requestType => _createPinRequestType(jsProxy['requestType']);
  set requestType(PinRequestType value) => jsProxy['requestType'] = jsify(value);

  PinRequestErrorType get errorType => _createPinRequestErrorType(jsProxy['errorType']);
  set errorType(PinRequestErrorType value) => jsProxy['errorType'] = jsify(value);

  int get attemptsLeft => jsProxy['attemptsLeft'];
  set attemptsLeft(int value) => jsProxy['attemptsLeft'] = value;
}

class StopPinRequestDetails extends ChromeObject {
  StopPinRequestDetails({int? signRequestId, PinRequestErrorType? errorType}) {
    if (signRequestId != null) this.signRequestId = signRequestId;
    if (errorType != null) this.errorType = errorType;
  }
  StopPinRequestDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get signRequestId => jsProxy['signRequestId'];
  set signRequestId(int value) => jsProxy['signRequestId'] = value;

  PinRequestErrorType get errorType => _createPinRequestErrorType(jsProxy['errorType']);
  set errorType(PinRequestErrorType value) => jsProxy['errorType'] = jsify(value);
}

class PinResponseDetails extends ChromeObject {
  PinResponseDetails({String? userInput}) {
    if (userInput != null) this.userInput = userInput;
  }
  PinResponseDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get userInput => jsProxy['userInput'];
  set userInput(String value) => jsProxy['userInput'] = value;
}

CertificatesUpdateRequest _createCertificatesUpdateRequest(JsObject jsProxy) => CertificatesUpdateRequest.fromProxy(jsProxy);
SignatureRequest _createSignatureRequest(JsObject jsProxy) => SignatureRequest.fromProxy(jsProxy);
CertificatesCallback _createCertificatesCallback(JsObject jsProxy) => CertificatesCallback.fromProxy(jsProxy);
OnSignDigestRequestedEvent _createOnSignDigestRequestedEvent(JsObject request, JsObject reportCallback) =>
    OnSignDigestRequestedEvent(_createSignRequest(request), _createSignCallback(reportCallback));
PinResponseDetails _createPinResponseDetails(JsObject jsProxy) => PinResponseDetails.fromProxy(jsProxy);
ArrayBuffer _createArrayBuffer(/*JsObject*/ jsProxy) => ArrayBuffer.fromProxy(jsProxy);
Algorithm _createAlgorithm(String value) => Algorithm.VALUES.singleWhere((ChromeEnum e) => e.value == value);
Error _createError(String value) => Error.VALUES.singleWhere((ChromeEnum e) => e.value == value);
ClientCertificateInfo _createClientCertificateInfo(JsObject jsProxy) => ClientCertificateInfo.fromProxy(jsProxy);
Hash _createHash(String value) => Hash.VALUES.singleWhere((ChromeEnum e) => e.value == value);
PinRequestType _createPinRequestType(String value) => PinRequestType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
PinRequestErrorType _createPinRequestErrorType(String value) => PinRequestErrorType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
SignRequest _createSignRequest(JsObject jsProxy) => SignRequest.fromProxy(jsProxy);
SignCallback _createSignCallback(JsObject jsProxy) => SignCallback.fromProxy(jsProxy);
