import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSCertificateProviderExtension on JSChrome {
  ///  Use this API to expose certificates to the platform which can use these
  ///  certificates for TLS authentications.
  external JSCertificateProvider get certificateProvider;
}

@JS()
@staticInterop
class JSCertificateProvider {}

extension JSCertificateProviderExtension on JSCertificateProvider {
  ///  Requests the PIN from the user. Only one ongoing request at a time is
  ///  allowed. The requests issued while another flow is ongoing are rejected.
  ///  It's the extension's responsibility to try again later if another flow is
  ///  in progress.
  ///  |details|: Contains the details about the requested dialog.
  ///  |callback|: Is called when the dialog is resolved with the user input, or
  ///  when the dialog request finishes unsuccessfully (e.g. the dialog was
  ///  canceled by the user or was not allowed to be shown).
  external void requestPin(
    RequestPinDetails details,
    JSFunction callback,
  );

  ///  Stops the pin request started by the $(ref:requestPin) function.
  ///  |details|: Contains the details about the reason for stopping the
  ///  request flow.
  ///  |callback|: To be used by Chrome to send to the extension the status from
  ///  their request to close PIN dialog for user.
  external void stopPinRequest(
    StopPinRequestDetails details,
    JSFunction callback,
  );

  ///  Sets a list of certificates to use in the browser.
  ///  <p>The extension should call this function after initialization and on
  ///  every change in the set of currently available certificates. The
  ///  extension should also call this function in response to
  ///  $(ref:onCertificatesUpdateRequested) every time this event is
  ///  received.</p>
  ///  |details|: The certificates to set. Invalid certificates will be ignored.
  ///  |callback|: Called upon completion.
  external void setCertificates(
    SetCertificatesDetails details,
    JSFunction callback,
  );

  ///  Should be called as a response to $(ref:onSignatureRequested).
  ///  <p>The extension must eventually call this function for every
  ///  $(ref:onSignatureRequested) event; the API implementation will stop
  ///  waiting for this call after some time and respond with a timeout
  ///  error when this function is called.</p>
  external void reportSignature(
    ReportSignatureDetails details,
    JSFunction callback,
  );

  ///  This event fires if the certificates set via $(ref:setCertificates)
  ///  are insufficient or the browser requests updated information. The
  ///  extension must call $(ref:setCertificates) with the updated list of
  ///  certificates and the received `certificatesRequestId`.
  external ChromeEvent get onCertificatesUpdateRequested;

  ///  This event fires every time the browser needs to sign a message using a
  ///  certificate provided by this extension via $(ref:setCertificates).
  ///  <p>The extension must sign the input data from `request` using
  ///  the appropriate algorithm and private key and return it by calling
  ///  $(ref:reportSignature) with the received `signRequestId`.</p>
  external ChromeEvent get onSignatureRequested;

  ///  <p>This event fires every time the browser requests the current list of
  ///  certificates provided by this extension. The extension must call
  ///  `reportCallback` exactly once with the current list of
  ///  certificates.</p>
  external ChromeEvent get onCertificatesRequested;

  ///  This event fires every time the browser needs to sign a message using
  ///  a certificate provided by this extension in reply to an
  ///  $(ref:onCertificatesRequested) event.
  ///  The extension must sign the data in `request` using the
  ///  appropriate algorithm and private key and return it by calling
  ///  `reportCallback`. `reportCallback` must be called
  ///  exactly once.
  ///  |request|: Contains the details about the sign request.
  external ChromeEvent get onSignDigestRequested;
}

///  Types of supported cryptographic signature algorithms.
typedef Algorithm = JSString;

///  Types of errors that the extension can report.
typedef Error = JSString;

///  Deprecated. Replaced by $(ref:Algorithm).
typedef Hash = JSString;

///  The type of code being requested by the extension with requestPin function.
typedef PinRequestType = JSString;

///  The types of errors that can be presented to the user through the
///  requestPin function.
typedef PinRequestErrorType = JSString;

@JS()
@staticInterop
class ClientCertificateInfo {}

extension ClientCertificateInfoExtension on ClientCertificateInfo {
  ///  The array must contain the DER encoding of the X.509 client certificate
  ///  as its first element.
  ///  <p>This must include exactly one certificate.</p>
  external JSArray get certificateChain;

  ///  All algorithms supported for this certificate. The extension will only be
  ///  asked for signatures using one of these algorithms.
  external JSArray get supportedAlgorithms;
}

@JS()
@staticInterop
class SetCertificatesDetails {}

extension SetCertificatesDetailsExtension on SetCertificatesDetails {
  ///  When called in response to $(ref:onCertificatesUpdateRequested), should
  ///  contain the received `certificatesRequestId` value. Otherwise,
  ///  should be unset.
  external int? get certificatesRequestId;

  ///  Error that occurred while extracting the certificates, if any. This error
  ///  will be surfaced to the user when appropriate.
  external Error? get error;

  ///  List of currently available client certificates.
  external JSArray get clientCertificates;
}

@JS()
@staticInterop
class CertificatesUpdateRequest {}

extension CertificatesUpdateRequestExtension on CertificatesUpdateRequest {
  ///  Request identifier to be passed to $(ref:setCertificates).
  external int get certificatesRequestId;
}

@JS()
@staticInterop
class SignatureRequest {}

extension SignatureRequestExtension on SignatureRequest {
  ///  Request identifier to be passed to $(ref:reportSignature).
  external int get signRequestId;

  ///  Data to be signed. Note that the data is not hashed.
  external JSArrayBuffer get input;

  ///  Signature algorithm to be used.
  external Algorithm get algorithm;

  ///  The DER encoding of a X.509 certificate. The extension must sign
  ///  `input` using the associated private key.
  external JSArrayBuffer get certificate;
}

@JS()
@staticInterop
class ReportSignatureDetails {}

extension ReportSignatureDetailsExtension on ReportSignatureDetails {
  ///  Request identifier that was received via the $(ref:onSignatureRequested)
  ///  event.
  external int get signRequestId;

  ///  Error that occurred while generating the signature, if any.
  external Error? get error;

  ///  The signature, if successfully generated.
  external JSArrayBuffer? get signature;
}

@JS()
@staticInterop
class CertificateInfo {}

extension CertificateInfoExtension on CertificateInfo {
  ///  Must be the DER encoding of a X.509 certificate. Currently, only
  ///  certificates of RSA keys are supported.
  external JSArrayBuffer get certificate;

  ///  Must be set to all hashes supported for this certificate. This extension
  ///  will only be asked for signatures of digests calculated with one of these
  ///  hash algorithms. This should be in order of decreasing hash preference.
  external JSArray get supportedHashes;
}

@JS()
@staticInterop
class SignRequest {}

extension SignRequestExtension on SignRequest {
  ///  The unique ID to be used by the extension should it need to call a method
  ///  that requires it, e.g. requestPin.
  external int get signRequestId;

  ///  The digest that must be signed.
  external JSArrayBuffer get digest;

  ///  Refers to the hash algorithm that was used to create `digest`.
  external Hash get hash;

  ///  The DER encoding of a X.509 certificate. The extension must sign
  ///  `digest` using the associated private key.
  external JSArrayBuffer get certificate;
}

@JS()
@staticInterop
class RequestPinDetails {}

extension RequestPinDetailsExtension on RequestPinDetails {
  ///  The ID given by Chrome in SignRequest.
  external int get signRequestId;

  ///  The type of code requested. Default is PIN.
  external PinRequestType? get requestType;

  ///  The error template displayed to the user. This should be set if the
  ///  previous request failed, to notify the user of the failure reason.
  external PinRequestErrorType? get errorType;

  ///  The number of attempts left. This is provided so that any UI can present
  ///  this information to the user. Chrome is not expected to enforce this,
  ///  instead stopPinRequest should be called by the extension with
  ///  errorType = MAX_ATTEMPTS_EXCEEDED when the number of pin requests is
  ///  exceeded.
  external int? get attemptsLeft;
}

@JS()
@staticInterop
class StopPinRequestDetails {}

extension StopPinRequestDetailsExtension on StopPinRequestDetails {
  ///  The ID given by Chrome in SignRequest.
  external int get signRequestId;

  ///  The error template. If present it is displayed to user. Intended to
  ///  contain the reason for stopping the flow if it was caused by an error,
  ///  e.g. MAX_ATTEMPTS_EXCEEDED.
  external PinRequestErrorType? get errorType;
}

@JS()
@staticInterop
class PinResponseDetails {}

extension PinResponseDetailsExtension on PinResponseDetails {
  ///  The code provided by the user. Empty if user closed the dialog or some
  ///  other error occurred.
  external String? get userInput;
}
