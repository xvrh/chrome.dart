import 'chrome.dart';
export 'chrome.dart';

final _webRequest = ChromeWebRequest._();

extension ChromeWebRequestExtension on Chrome {
  ChromeWebRequest get webRequest => _webRequest;
}

class ChromeWebRequest {
  ChromeWebRequest._();

  /// Needs to be called when the behavior of the webRequest handlers has
  /// changed to prevent incorrect handling due to caching. This function call
  /// is expensive. Don't call it often.
  void handlerBehaviorChanged(callback) => throw UnimplementedError();

  /// Fired when a request is about to occur.
  Stream get onBeforeRequest => throw UnimplementedError();

  /// Fired before sending an HTTP request, once the request headers are
  /// available. This may occur after a TCP connection is made to the server,
  /// but before any HTTP data is sent.
  Stream get onBeforeSendHeaders => throw UnimplementedError();

  /// Fired just before a request is going to be sent to the server
  /// (modifications of previous onBeforeSendHeaders callbacks are visible by
  /// the time onSendHeaders is fired).
  Stream get onSendHeaders => throw UnimplementedError();

  /// Fired when HTTP response headers of a request have been received.
  Stream get onHeadersReceived => throw UnimplementedError();

  /// Fired when an authentication failure is received. The listener has three
  /// options: it can provide authentication credentials, it can cancel the
  /// request and display the error page, or it can take no action on the
  /// challenge. If bad user credentials are provided, this may be called
  /// multiple times for the same request. Note, only one of `'blocking'` or
  /// `'asyncBlocking'` modes must be specified in the `extraInfoSpec`
  /// parameter.
  Stream get onAuthRequired => throw UnimplementedError();

  /// Fired when the first byte of the response body is received. For HTTP
  /// requests, this means that the status line and response headers are
  /// available.
  Stream get onResponseStarted => throw UnimplementedError();

  /// Fired when a server-initiated redirect is about to occur.
  Stream get onBeforeRedirect => throw UnimplementedError();

  /// Fired when a request is completed.
  Stream get onCompleted => throw UnimplementedError();

  /// Fired when an error occurs.
  Stream get onErrorOccurred => throw UnimplementedError();

  /// Fired when an extension's proposed modification to a network request is
  /// ignored. This happens in case of conflicts with other extensions.
  Stream get onActionIgnored => throw UnimplementedError();
}

enum ResourceType {
  mainFrame('main_frame'),
  subFrame('sub_frame'),
  stylesheet('stylesheet'),
  script('script'),
  image('image'),
  font('font'),
  object('object'),
  xmlhttprequest('xmlhttprequest'),
  ping('ping'),
  cspReport('csp_report'),
  media('media'),
  websocket('websocket'),
  webbundle('webbundle'),
  other('other');

  const ResourceType(this.value);

  final String value;
}

enum OnBeforeRequestOptions {
  blocking('blocking'),
  requestBody('requestBody'),
  extraHeaders('extraHeaders');

  const OnBeforeRequestOptions(this.value);

  final String value;
}

enum OnBeforeSendHeadersOptions {
  requestHeaders('requestHeaders'),
  blocking('blocking'),
  extraHeaders('extraHeaders');

  const OnBeforeSendHeadersOptions(this.value);

  final String value;
}

enum OnSendHeadersOptions {
  requestHeaders('requestHeaders'),
  extraHeaders('extraHeaders');

  const OnSendHeadersOptions(this.value);

  final String value;
}

enum OnHeadersReceivedOptions {
  blocking('blocking'),
  responseHeaders('responseHeaders'),
  extraHeaders('extraHeaders');

  const OnHeadersReceivedOptions(this.value);

  final String value;
}

enum OnAuthRequiredOptions {
  responseHeaders('responseHeaders'),
  blocking('blocking'),
  asyncBlocking('asyncBlocking'),
  extraHeaders('extraHeaders');

  const OnAuthRequiredOptions(this.value);

  final String value;
}

enum OnResponseStartedOptions {
  responseHeaders('responseHeaders'),
  extraHeaders('extraHeaders');

  const OnResponseStartedOptions(this.value);

  final String value;
}

enum OnBeforeRedirectOptions {
  responseHeaders('responseHeaders'),
  extraHeaders('extraHeaders');

  const OnBeforeRedirectOptions(this.value);

  final String value;
}

enum OnCompletedOptions {
  responseHeaders('responseHeaders'),
  extraHeaders('extraHeaders');

  const OnCompletedOptions(this.value);

  final String value;
}

enum OnErrorOccurredOptions {
  extraHeaders('extraHeaders');

  const OnErrorOccurredOptions(this.value);

  final String value;
}

enum IgnoredActionType {
  redirect('redirect'),
  requestHeaders('request_headers'),
  responseHeaders('response_headers'),
  authCredentials('auth_credentials');

  const IgnoredActionType(this.value);

  final String value;
}
