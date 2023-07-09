import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSCertificateProviderExtension on JSChrome {
  ///  Use this API to expose certificates to the platform which can use these
  ///  certificates for TLS authentications.
  external JSCertificateProvider get CertificateProvider;
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
  external void requestPin();

  ///  Stops the pin request started by the $(ref:requestPin) function.
  ///  |details|: Contains the details about the reason for stopping the
  ///  request flow.
  ///  |callback|: To be used by Chrome to send to the extension the status from
  ///  their request to close PIN dialog for user.
  external void stopPinRequest();

  ///  Sets a list of certificates to use in the browser.
  ///  <p>The extension should call this function after initialization and on
  ///  every change in the set of currently available certificates. The
  ///  extension should also call this function in response to
  ///  $(ref:onCertificatesUpdateRequested) every time this event is
  ///  received.</p>
  ///  |details|: The certificates to set. Invalid certificates will be ignored.
  ///  |callback|: Called upon completion.
  external void setCertificates();

  ///  Should be called as a response to $(ref:onSignatureRequested).
  ///  <p>The extension must eventually call this function for every
  ///  $(ref:onSignatureRequested) event; the API implementation will stop
  ///  waiting for this call after some time and respond with a timeout
  ///  error when this function is called.</p>
  external void reportSignature();

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
