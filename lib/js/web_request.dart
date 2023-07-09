import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSWebRequestExtension on JSChrome {
  /// Use the `chrome.webRequest` API to observe and analyze traffic and to
  /// intercept, block, or modify requests in-flight.
  external JSWebRequest get WebRequest;
}

@JS()
@staticInterop
class JSWebRequest {}

extension JSWebRequestExtension on JSWebRequest {
  /// Needs to be called when the behavior of the webRequest handlers has
  /// changed to prevent incorrect handling due to caching. This function call
  /// is expensive. Don't call it often.
  external void handlerBehaviorChanged();

  /// Fired when a request is about to occur.
  external ChromeEvent get onBeforeRequest;

  /// Fired before sending an HTTP request, once the request headers are
  /// available. This may occur after a TCP connection is made to the server,
  /// but before any HTTP data is sent.
  external ChromeEvent get onBeforeSendHeaders;

  /// Fired just before a request is going to be sent to the server
  /// (modifications of previous onBeforeSendHeaders callbacks are visible by
  /// the time onSendHeaders is fired).
  external ChromeEvent get onSendHeaders;

  /// Fired when HTTP response headers of a request have been received.
  external ChromeEvent get onHeadersReceived;

  /// Fired when an authentication failure is received. The listener has three
  /// options: it can provide authentication credentials, it can cancel the
  /// request and display the error page, or it can take no action on the
  /// challenge. If bad user credentials are provided, this may be called
  /// multiple times for the same request. Note, only one of `'blocking'` or
  /// `'asyncBlocking'` modes must be specified in the `extraInfoSpec`
  /// parameter.
  external ChromeEvent get onAuthRequired;

  /// Fired when the first byte of the response body is received. For HTTP
  /// requests, this means that the status line and response headers are
  /// available.
  external ChromeEvent get onResponseStarted;

  /// Fired when a server-initiated redirect is about to occur.
  external ChromeEvent get onBeforeRedirect;

  /// Fired when a request is completed.
  external ChromeEvent get onCompleted;

  /// Fired when an error occurs.
  external ChromeEvent get onErrorOccurred;

  /// Fired when an extension's proposed modification to a network request is
  /// ignored. This happens in case of conflicts with other extensions.
  external ChromeEvent get onActionIgnored;
}
