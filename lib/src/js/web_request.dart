import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSWebRequestExtension on JSChrome {
  /// Use the `chrome.webRequest` API to observe and analyze traffic and to
  /// intercept, block, or modify requests in-flight.
  external JSWebRequest get webRequest;
}

@JS()
@staticInterop
class JSWebRequest {}

extension JSWebRequestExtension on JSWebRequest {
  /// Needs to be called when the behavior of the webRequest handlers has
  /// changed to prevent incorrect handling due to caching. This function call
  /// is expensive. Don't call it often.
  external void handlerBehaviorChanged(JSFunction? callback);

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

  /// The maximum number of times that `handlerBehaviorChanged` can be called
  /// per 10 minute sustained interval. `handlerBehaviorChanged` is an expensive
  /// function call that shouldn't be called often.
  external JSObject get MAX_HANDLER_BEHAVIOR_CHANGED_CALLS_PER_10_MINUTES;
}

typedef ResourceType = JSString;

typedef OnBeforeRequestOptions = JSString;

typedef OnBeforeSendHeadersOptions = JSString;

typedef OnSendHeadersOptions = JSString;

typedef OnHeadersReceivedOptions = JSString;

typedef OnAuthRequiredOptions = JSString;

typedef OnResponseStartedOptions = JSString;

typedef OnBeforeRedirectOptions = JSString;

typedef OnCompletedOptions = JSString;

typedef OnErrorOccurredOptions = JSString;

typedef IgnoredActionType = JSString;

@JS()
@staticInterop
class RequestFilter {}

extension RequestFilterExtension on RequestFilter {
  /// A list of URLs or URL patterns. Requests that cannot match any of the URLs
  /// will be filtered out.
  external JSArray get urls;

  /// A list of request types. Requests that cannot match any of the types will
  /// be filtered out.
  external JSArray? get types;

  external JSNumber? get tabId;

  external JSNumber? get windowId;
}

@JS()
@staticInterop
class HttpHeaders {}

extension HttpHeadersExtension on HttpHeaders {}

@JS()
@staticInterop
class BlockingResponse {}

extension BlockingResponseExtension on BlockingResponse {
  /// If true, the request is cancelled. This prevents the request from being
  /// sent. This can be used as a response to the onBeforeRequest,
  /// onBeforeSendHeaders, onHeadersReceived and onAuthRequired events.
  external JSBoolean? get cancel;

  /// Only used as a response to the onBeforeRequest and onHeadersReceived
  /// events. If set, the original request is prevented from being
  /// sent/completed and is instead redirected to the given URL. Redirections to
  /// non-HTTP schemes such as `data:` are allowed. Redirects initiated by a
  /// redirect action use the original request method for the redirect, with one
  /// exception: If the redirect is initiated at the onHeadersReceived stage,
  /// then the redirect will be issued using the GET method. Redirects from URLs
  /// with `ws://` and `wss://` schemes are **ignored**.
  external JSString? get redirectUrl;

  /// Only used as a response to the onBeforeSendHeaders event. If set, the
  /// request is made with these request headers instead.
  external HttpHeaders? get requestHeaders;

  /// Only used as a response to the onHeadersReceived event. If set, the server
  /// is assumed to have responded with these response headers instead. Only
  /// return `responseHeaders` if you really want to modify the headers in order
  /// to limit the number of conflicts (only one extension may modify
  /// `responseHeaders` for each request).
  external HttpHeaders? get responseHeaders;

  /// Only used as a response to the onAuthRequired event. If set, the request
  /// is made using the supplied credentials.
  external BlockingResponseAuthCredentials? get authCredentials;
}

@JS()
@staticInterop
class UploadData {}

extension UploadDataExtension on UploadData {
  /// An ArrayBuffer with a copy of the data.
  external JSAny? get bytes;

  /// A string with the file's path and name.
  external JSString? get file;
}

@JS()
@staticInterop
class FormDataItem {}

extension FormDataItemExtension on FormDataItem {}

@JS()
@staticInterop
class BlockingResponseAuthCredentials {}

extension BlockingResponseAuthCredentialsExtension
    on BlockingResponseAuthCredentials {
  external JSString get username;

  external JSString get password;
}