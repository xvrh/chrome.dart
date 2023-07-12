import 'src/internal_helpers.dart';
import 'extension_types.dart';
import 'src/js/web_request.dart' as $js;
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
  void handlerBehaviorChanged(JSAny? callback) => throw UnimplementedError();

  /// The maximum number of times that `handlerBehaviorChanged` can be called
  /// per 10 minute sustained interval. `handlerBehaviorChanged` is an expensive
  /// function call that shouldn't be called often.
  int get maxHANDLERBEHAVIORCHANGEDCALLSPER10MINUTES =>
      $js.chrome.webRequest.MAX_HANDLER_BEHAVIOR_CHANGED_CALLS_PER_10_MINUTES
          as dynamic;

  /// Fired when a request is about to occur.
  Stream<OnBeforeRequestDetails> get onBeforeRequest =>
      throw UnimplementedError();

  /// Fired before sending an HTTP request, once the request headers are
  /// available. This may occur after a TCP connection is made to the server,
  /// but before any HTTP data is sent.
  Stream<OnBeforeSendHeadersDetails> get onBeforeSendHeaders =>
      throw UnimplementedError();

  /// Fired just before a request is going to be sent to the server
  /// (modifications of previous onBeforeSendHeaders callbacks are visible by
  /// the time onSendHeaders is fired).
  Stream<OnSendHeadersDetails> get onSendHeaders => throw UnimplementedError();

  /// Fired when HTTP response headers of a request have been received.
  Stream<OnHeadersReceivedDetails> get onHeadersReceived =>
      throw UnimplementedError();

  /// Fired when an authentication failure is received. The listener has three
  /// options: it can provide authentication credentials, it can cancel the
  /// request and display the error page, or it can take no action on the
  /// challenge. If bad user credentials are provided, this may be called
  /// multiple times for the same request. Note, only one of `'blocking'` or
  /// `'asyncBlocking'` modes must be specified in the `extraInfoSpec`
  /// parameter.
  Stream<OnAuthRequiredEvent> get onAuthRequired => throw UnimplementedError();

  /// Fired when the first byte of the response body is received. For HTTP
  /// requests, this means that the status line and response headers are
  /// available.
  Stream<OnResponseStartedDetails> get onResponseStarted =>
      throw UnimplementedError();

  /// Fired when a server-initiated redirect is about to occur.
  Stream<OnBeforeRedirectDetails> get onBeforeRedirect =>
      throw UnimplementedError();

  /// Fired when a request is completed.
  Stream<OnCompletedDetails> get onCompleted => throw UnimplementedError();

  /// Fired when an error occurs.
  Stream<OnErrorOccurredDetails> get onErrorOccurred =>
      throw UnimplementedError();

  /// Fired when an extension's proposed modification to a network request is
  /// ignored. This happens in case of conflicts with other extensions.
  Stream<OnActionIgnoredDetails> get onActionIgnored =>
      throw UnimplementedError();
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

  String get toJS => value;
  static ResourceType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum OnBeforeRequestOptions {
  blocking('blocking'),
  requestBody('requestBody'),
  extraHeaders('extraHeaders');

  const OnBeforeRequestOptions(this.value);

  final String value;

  String get toJS => value;
  static OnBeforeRequestOptions fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum OnBeforeSendHeadersOptions {
  requestHeaders('requestHeaders'),
  blocking('blocking'),
  extraHeaders('extraHeaders');

  const OnBeforeSendHeadersOptions(this.value);

  final String value;

  String get toJS => value;
  static OnBeforeSendHeadersOptions fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum OnSendHeadersOptions {
  requestHeaders('requestHeaders'),
  extraHeaders('extraHeaders');

  const OnSendHeadersOptions(this.value);

  final String value;

  String get toJS => value;
  static OnSendHeadersOptions fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum OnHeadersReceivedOptions {
  blocking('blocking'),
  responseHeaders('responseHeaders'),
  extraHeaders('extraHeaders');

  const OnHeadersReceivedOptions(this.value);

  final String value;

  String get toJS => value;
  static OnHeadersReceivedOptions fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum OnAuthRequiredOptions {
  responseHeaders('responseHeaders'),
  blocking('blocking'),
  asyncBlocking('asyncBlocking'),
  extraHeaders('extraHeaders');

  const OnAuthRequiredOptions(this.value);

  final String value;

  String get toJS => value;
  static OnAuthRequiredOptions fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum OnResponseStartedOptions {
  responseHeaders('responseHeaders'),
  extraHeaders('extraHeaders');

  const OnResponseStartedOptions(this.value);

  final String value;

  String get toJS => value;
  static OnResponseStartedOptions fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum OnBeforeRedirectOptions {
  responseHeaders('responseHeaders'),
  extraHeaders('extraHeaders');

  const OnBeforeRedirectOptions(this.value);

  final String value;

  String get toJS => value;
  static OnBeforeRedirectOptions fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum OnCompletedOptions {
  responseHeaders('responseHeaders'),
  extraHeaders('extraHeaders');

  const OnCompletedOptions(this.value);

  final String value;

  String get toJS => value;
  static OnCompletedOptions fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum OnErrorOccurredOptions {
  extraHeaders('extraHeaders');

  const OnErrorOccurredOptions(this.value);

  final String value;

  String get toJS => value;
  static OnErrorOccurredOptions fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum IgnoredActionType {
  redirect('redirect'),
  requestHeaders('request_headers'),
  responseHeaders('response_headers'),
  authCredentials('auth_credentials');

  const IgnoredActionType(this.value);

  final String value;

  String get toJS => value;
  static IgnoredActionType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// An array of HTTP headers. Each header is represented as a dictionary
/// containing the keys `name` and either `value` or `binaryValue`.
typedef HttpHeaders = List<HttpHeadersItems>;

/// Contains data passed within form data. For urlencoded form it is stored as
/// string if data is utf-8 string and as ArrayBuffer otherwise. For form-data
/// it is ArrayBuffer. If form-data represents uploading file, it is string with
/// filename, if the filename is provided.
typedef FormDataItem = JSAny;

class RequestFilter {
  RequestFilter.fromJS(this._wrapped);

  final $js.RequestFilter _wrapped;

  $js.RequestFilter get toJS => _wrapped;

  /// A list of URLs or URL patterns. Requests that cannot match any of the URLs
  /// will be filtered out.
  List<String> get urls => throw UnimplementedError();
  set urls(List<String> v) {
    throw UnimplementedError();
  }

  /// A list of request types. Requests that cannot match any of the types will
  /// be filtered out.
  List<ResourceType>? get types => throw UnimplementedError();
  set types(List<ResourceType>? v) {
    throw UnimplementedError();
  }

  int? get tabId => _wrapped.tabId;
  set tabId(int? v) {
    throw UnimplementedError();
  }

  int? get windowId => _wrapped.windowId;
  set windowId(int? v) {
    throw UnimplementedError();
  }
}

class BlockingResponse {
  BlockingResponse.fromJS(this._wrapped);

  final $js.BlockingResponse _wrapped;

  $js.BlockingResponse get toJS => _wrapped;

  /// If true, the request is cancelled. This prevents the request from being
  /// sent. This can be used as a response to the onBeforeRequest,
  /// onBeforeSendHeaders, onHeadersReceived and onAuthRequired events.
  bool? get cancel => _wrapped.cancel;
  set cancel(bool? v) {
    throw UnimplementedError();
  }

  /// Only used as a response to the onBeforeRequest and onHeadersReceived
  /// events. If set, the original request is prevented from being
  /// sent/completed and is instead redirected to the given URL. Redirections to
  /// non-HTTP schemes such as `data:` are allowed. Redirects initiated by a
  /// redirect action use the original request method for the redirect, with one
  /// exception: If the redirect is initiated at the onHeadersReceived stage,
  /// then the redirect will be issued using the GET method. Redirects from URLs
  /// with `ws://` and `wss://` schemes are **ignored**.
  String? get redirectUrl => _wrapped.redirectUrl;
  set redirectUrl(String? v) {
    throw UnimplementedError();
  }

  /// Only used as a response to the onBeforeSendHeaders event. If set, the
  /// request is made with these request headers instead.
  HttpHeaders? get requestHeaders => throw UnimplementedError();
  set requestHeaders(HttpHeaders? v) {
    throw UnimplementedError();
  }

  /// Only used as a response to the onHeadersReceived event. If set, the server
  /// is assumed to have responded with these response headers instead. Only
  /// return `responseHeaders` if you really want to modify the headers in order
  /// to limit the number of conflicts (only one extension may modify
  /// `responseHeaders` for each request).
  HttpHeaders? get responseHeaders => throw UnimplementedError();
  set responseHeaders(HttpHeaders? v) {
    throw UnimplementedError();
  }

  /// Only used as a response to the onAuthRequired event. If set, the request
  /// is made using the supplied credentials.
  BlockingResponseAuthCredentials? get authCredentials =>
      _wrapped.authCredentials?.let(BlockingResponseAuthCredentials.fromJS);
  set authCredentials(BlockingResponseAuthCredentials? v) {
    throw UnimplementedError();
  }
}

class UploadData {
  UploadData.fromJS(this._wrapped);

  final $js.UploadData _wrapped;

  $js.UploadData get toJS => _wrapped;

  /// An ArrayBuffer with a copy of the data.
  JSAny? get bytes => _wrapped.bytes;
  set bytes(JSAny? v) {
    throw UnimplementedError();
  }

  /// A string with the file's path and name.
  String? get file => _wrapped.file;
  set file(String? v) {
    throw UnimplementedError();
  }
}

class HttpHeadersItems {
  HttpHeadersItems.fromJS(this._wrapped);

  final $js.HttpHeadersItems _wrapped;

  $js.HttpHeadersItems get toJS => _wrapped;

  /// Name of the HTTP header.
  String get name => _wrapped.name;
  set name(String v) {
    throw UnimplementedError();
  }

  /// Value of the HTTP header if it can be represented by UTF-8.
  String? get value => _wrapped.value;
  set value(String? v) {
    throw UnimplementedError();
  }

  /// Value of the HTTP header if it cannot be represented by UTF-8, stored as
  /// individual byte values (0..255).
  List<int>? get binaryValue => throw UnimplementedError();
  set binaryValue(List<int>? v) {
    throw UnimplementedError();
  }
}

class OnBeforeRequestDetails {
  OnBeforeRequestDetails.fromJS(this._wrapped);

  final $js.OnBeforeRequestDetails _wrapped;

  $js.OnBeforeRequestDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    throw UnimplementedError();
  }

  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    throw UnimplementedError();
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    throw UnimplementedError();
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    throw UnimplementedError();
  }

  /// The UUID of the document making the request.
  String? get documentId => _wrapped.documentId;
  set documentId(String? v) {
    throw UnimplementedError();
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    throw UnimplementedError();
  }

  /// The lifecycle the document is in.
  DocumentLifecycle? get documentLifecycle =>
      _wrapped.documentLifecycle?.let(DocumentLifecycle.fromJS);
  set documentLifecycle(DocumentLifecycle? v) {
    throw UnimplementedError();
  }

  /// The type of frame the request occurred in.
  FrameType? get frameType => _wrapped.frameType?.let(FrameType.fromJS);
  set frameType(FrameType? v) {
    throw UnimplementedError();
  }

  /// Contains the HTTP request body data. Only provided if extraInfoSpec
  /// contains 'requestBody'.
  OnBeforeRequestDetailsRequestBody? get requestBody =>
      _wrapped.requestBody?.let(OnBeforeRequestDetailsRequestBody.fromJS);
  set requestBody(OnBeforeRequestDetailsRequestBody? v) {
    throw UnimplementedError();
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    throw UnimplementedError();
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    throw UnimplementedError();
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    throw UnimplementedError();
  }
}

class OnBeforeSendHeadersDetails {
  OnBeforeSendHeadersDetails.fromJS(this._wrapped);

  final $js.OnBeforeSendHeadersDetails _wrapped;

  $js.OnBeforeSendHeadersDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    throw UnimplementedError();
  }

  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    throw UnimplementedError();
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    throw UnimplementedError();
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    throw UnimplementedError();
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    throw UnimplementedError();
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    throw UnimplementedError();
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    throw UnimplementedError();
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    throw UnimplementedError();
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    throw UnimplementedError();
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    throw UnimplementedError();
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    throw UnimplementedError();
  }

  /// The HTTP request headers that are going to be sent out with this request.
  HttpHeaders? get requestHeaders => throw UnimplementedError();
  set requestHeaders(HttpHeaders? v) {
    throw UnimplementedError();
  }
}

class OnSendHeadersDetails {
  OnSendHeadersDetails.fromJS(this._wrapped);

  final $js.OnSendHeadersDetails _wrapped;

  $js.OnSendHeadersDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    throw UnimplementedError();
  }

  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    throw UnimplementedError();
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    throw UnimplementedError();
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    throw UnimplementedError();
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    throw UnimplementedError();
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    throw UnimplementedError();
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    throw UnimplementedError();
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    throw UnimplementedError();
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    throw UnimplementedError();
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    throw UnimplementedError();
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    throw UnimplementedError();
  }

  /// The HTTP request headers that have been sent out with this request.
  HttpHeaders? get requestHeaders => throw UnimplementedError();
  set requestHeaders(HttpHeaders? v) {
    throw UnimplementedError();
  }
}

class OnHeadersReceivedDetails {
  OnHeadersReceivedDetails.fromJS(this._wrapped);

  final $js.OnHeadersReceivedDetails _wrapped;

  $js.OnHeadersReceivedDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    throw UnimplementedError();
  }

  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    throw UnimplementedError();
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    throw UnimplementedError();
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    throw UnimplementedError();
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    throw UnimplementedError();
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    throw UnimplementedError();
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    throw UnimplementedError();
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    throw UnimplementedError();
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    throw UnimplementedError();
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    throw UnimplementedError();
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    throw UnimplementedError();
  }

  /// HTTP status line of the response or the 'HTTP/0.9 200 OK' string for
  /// HTTP/0.9 responses (i.e., responses that lack a status line).
  String get statusLine => _wrapped.statusLine;
  set statusLine(String v) {
    throw UnimplementedError();
  }

  /// The HTTP response headers that have been received with this response.
  HttpHeaders? get responseHeaders => throw UnimplementedError();
  set responseHeaders(HttpHeaders? v) {
    throw UnimplementedError();
  }

  /// Standard HTTP status code returned by the server.
  int get statusCode => _wrapped.statusCode;
  set statusCode(int v) {
    throw UnimplementedError();
  }
}

class OnAuthRequiredDetails {
  OnAuthRequiredDetails.fromJS(this._wrapped);

  final $js.OnAuthRequiredDetails _wrapped;

  $js.OnAuthRequiredDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    throw UnimplementedError();
  }

  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    throw UnimplementedError();
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    throw UnimplementedError();
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    throw UnimplementedError();
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    throw UnimplementedError();
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    throw UnimplementedError();
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    throw UnimplementedError();
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    throw UnimplementedError();
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    throw UnimplementedError();
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    throw UnimplementedError();
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    throw UnimplementedError();
  }

  /// The authentication scheme, e.g. Basic or Digest.
  String get scheme => _wrapped.scheme;
  set scheme(String v) {
    throw UnimplementedError();
  }

  /// The authentication realm provided by the server, if there is one.
  String? get realm => _wrapped.realm;
  set realm(String? v) {
    throw UnimplementedError();
  }

  /// The server requesting authentication.
  OnAuthRequiredDetailsChallenger get challenger =>
      OnAuthRequiredDetailsChallenger.fromJS(_wrapped.challenger);
  set challenger(OnAuthRequiredDetailsChallenger v) {
    throw UnimplementedError();
  }

  /// True for Proxy-Authenticate, false for WWW-Authenticate.
  bool get isProxy => _wrapped.isProxy;
  set isProxy(bool v) {
    throw UnimplementedError();
  }

  /// The HTTP response headers that were received along with this response.
  HttpHeaders? get responseHeaders => throw UnimplementedError();
  set responseHeaders(HttpHeaders? v) {
    throw UnimplementedError();
  }

  /// HTTP status line of the response or the 'HTTP/0.9 200 OK' string for
  /// HTTP/0.9 responses (i.e., responses that lack a status line) or an empty
  /// string if there are no headers.
  String get statusLine => _wrapped.statusLine;
  set statusLine(String v) {
    throw UnimplementedError();
  }

  /// Standard HTTP status code returned by the server.
  int get statusCode => _wrapped.statusCode;
  set statusCode(int v) {
    throw UnimplementedError();
  }
}

class OnResponseStartedDetails {
  OnResponseStartedDetails.fromJS(this._wrapped);

  final $js.OnResponseStartedDetails _wrapped;

  $js.OnResponseStartedDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    throw UnimplementedError();
  }

  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    throw UnimplementedError();
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    throw UnimplementedError();
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    throw UnimplementedError();
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    throw UnimplementedError();
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    throw UnimplementedError();
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    throw UnimplementedError();
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    throw UnimplementedError();
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    throw UnimplementedError();
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    throw UnimplementedError();
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    throw UnimplementedError();
  }

  /// The server IP address that the request was actually sent to. Note that it
  /// may be a literal IPv6 address.
  String? get ip => _wrapped.ip;
  set ip(String? v) {
    throw UnimplementedError();
  }

  /// Indicates if this response was fetched from disk cache.
  bool get fromCache => _wrapped.fromCache;
  set fromCache(bool v) {
    throw UnimplementedError();
  }

  /// Standard HTTP status code returned by the server.
  int get statusCode => _wrapped.statusCode;
  set statusCode(int v) {
    throw UnimplementedError();
  }

  /// The HTTP response headers that were received along with this response.
  HttpHeaders? get responseHeaders => throw UnimplementedError();
  set responseHeaders(HttpHeaders? v) {
    throw UnimplementedError();
  }

  /// HTTP status line of the response or the 'HTTP/0.9 200 OK' string for
  /// HTTP/0.9 responses (i.e., responses that lack a status line) or an empty
  /// string if there are no headers.
  String get statusLine => _wrapped.statusLine;
  set statusLine(String v) {
    throw UnimplementedError();
  }
}

class OnBeforeRedirectDetails {
  OnBeforeRedirectDetails.fromJS(this._wrapped);

  final $js.OnBeforeRedirectDetails _wrapped;

  $js.OnBeforeRedirectDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    throw UnimplementedError();
  }

  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    throw UnimplementedError();
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    throw UnimplementedError();
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    throw UnimplementedError();
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    throw UnimplementedError();
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    throw UnimplementedError();
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    throw UnimplementedError();
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    throw UnimplementedError();
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    throw UnimplementedError();
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    throw UnimplementedError();
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    throw UnimplementedError();
  }

  /// The server IP address that the request was actually sent to. Note that it
  /// may be a literal IPv6 address.
  String? get ip => _wrapped.ip;
  set ip(String? v) {
    throw UnimplementedError();
  }

  /// Indicates if this response was fetched from disk cache.
  bool get fromCache => _wrapped.fromCache;
  set fromCache(bool v) {
    throw UnimplementedError();
  }

  /// Standard HTTP status code returned by the server.
  int get statusCode => _wrapped.statusCode;
  set statusCode(int v) {
    throw UnimplementedError();
  }

  /// The new URL.
  String get redirectUrl => _wrapped.redirectUrl;
  set redirectUrl(String v) {
    throw UnimplementedError();
  }

  /// The HTTP response headers that were received along with this redirect.
  HttpHeaders? get responseHeaders => throw UnimplementedError();
  set responseHeaders(HttpHeaders? v) {
    throw UnimplementedError();
  }

  /// HTTP status line of the response or the 'HTTP/0.9 200 OK' string for
  /// HTTP/0.9 responses (i.e., responses that lack a status line) or an empty
  /// string if there are no headers.
  String get statusLine => _wrapped.statusLine;
  set statusLine(String v) {
    throw UnimplementedError();
  }
}

class OnCompletedDetails {
  OnCompletedDetails.fromJS(this._wrapped);

  final $js.OnCompletedDetails _wrapped;

  $js.OnCompletedDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    throw UnimplementedError();
  }

  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    throw UnimplementedError();
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    throw UnimplementedError();
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    throw UnimplementedError();
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    throw UnimplementedError();
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    throw UnimplementedError();
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    throw UnimplementedError();
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    throw UnimplementedError();
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    throw UnimplementedError();
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    throw UnimplementedError();
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    throw UnimplementedError();
  }

  /// The server IP address that the request was actually sent to. Note that it
  /// may be a literal IPv6 address.
  String? get ip => _wrapped.ip;
  set ip(String? v) {
    throw UnimplementedError();
  }

  /// Indicates if this response was fetched from disk cache.
  bool get fromCache => _wrapped.fromCache;
  set fromCache(bool v) {
    throw UnimplementedError();
  }

  /// Standard HTTP status code returned by the server.
  int get statusCode => _wrapped.statusCode;
  set statusCode(int v) {
    throw UnimplementedError();
  }

  /// The HTTP response headers that were received along with this response.
  HttpHeaders? get responseHeaders => throw UnimplementedError();
  set responseHeaders(HttpHeaders? v) {
    throw UnimplementedError();
  }

  /// HTTP status line of the response or the 'HTTP/0.9 200 OK' string for
  /// HTTP/0.9 responses (i.e., responses that lack a status line) or an empty
  /// string if there are no headers.
  String get statusLine => _wrapped.statusLine;
  set statusLine(String v) {
    throw UnimplementedError();
  }
}

class OnErrorOccurredDetails {
  OnErrorOccurredDetails.fromJS(this._wrapped);

  final $js.OnErrorOccurredDetails _wrapped;

  $js.OnErrorOccurredDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    throw UnimplementedError();
  }

  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    throw UnimplementedError();
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    throw UnimplementedError();
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    throw UnimplementedError();
  }

  /// The UUID of the document making the request. This value is not present if
  /// the request is a navigation of a frame.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    throw UnimplementedError();
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    throw UnimplementedError();
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    throw UnimplementedError();
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    throw UnimplementedError();
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    throw UnimplementedError();
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    throw UnimplementedError();
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    throw UnimplementedError();
  }

  /// The server IP address that the request was actually sent to. Note that it
  /// may be a literal IPv6 address.
  String? get ip => _wrapped.ip;
  set ip(String? v) {
    throw UnimplementedError();
  }

  /// Indicates if this response was fetched from disk cache.
  bool get fromCache => _wrapped.fromCache;
  set fromCache(bool v) {
    throw UnimplementedError();
  }

  /// The error description. This string is _not_ guaranteed to remain backwards
  /// compatible between releases. You must not parse and act based upon its
  /// content.
  String get error => _wrapped.error;
  set error(String v) {
    throw UnimplementedError();
  }
}

class OnActionIgnoredDetails {
  OnActionIgnoredDetails.fromJS(this._wrapped);

  final $js.OnActionIgnoredDetails _wrapped;

  $js.OnActionIgnoredDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    throw UnimplementedError();
  }

  /// The proposed action which was ignored.
  IgnoredActionType get action => IgnoredActionType.fromJS(_wrapped.action);
  set action(IgnoredActionType v) {
    throw UnimplementedError();
  }
}

class BlockingResponseAuthCredentials {
  BlockingResponseAuthCredentials.fromJS(this._wrapped);

  final $js.BlockingResponseAuthCredentials _wrapped;

  $js.BlockingResponseAuthCredentials get toJS => _wrapped;

  String get username => _wrapped.username;
  set username(String v) {
    throw UnimplementedError();
  }

  String get password => _wrapped.password;
  set password(String v) {
    throw UnimplementedError();
  }
}

class OnBeforeRequestDetailsRequestBody {
  OnBeforeRequestDetailsRequestBody.fromJS(this._wrapped);

  final $js.OnBeforeRequestDetailsRequestBody _wrapped;

  $js.OnBeforeRequestDetailsRequestBody get toJS => _wrapped;

  /// Errors when obtaining request body data.
  String? get error => _wrapped.error;
  set error(String? v) {
    throw UnimplementedError();
  }

  /// If the request method is POST and the body is a sequence of key-value
  /// pairs encoded in UTF8, encoded as either multipart/form-data, or
  /// application/x-www-form-urlencoded, this dictionary is present and for each
  /// key contains the list of all values for that key. If the data is of
  /// another media type, or if it is malformed, the dictionary is not present.
  /// An example value of this dictionary is {'key': ['value1', 'value2']}.
  OnBeforeRequestDetailsRequestBodyFormData? get formData =>
      _wrapped.formData?.let(OnBeforeRequestDetailsRequestBodyFormData.fromJS);
  set formData(OnBeforeRequestDetailsRequestBodyFormData? v) {
    throw UnimplementedError();
  }

  /// If the request method is PUT or POST, and the body is not already parsed
  /// in formData, then the unparsed request body elements are contained in this
  /// array.
  List<UploadData>? get raw => throw UnimplementedError();
  set raw(List<UploadData>? v) {
    throw UnimplementedError();
  }
}

class OnAuthRequiredDetailsChallenger {
  OnAuthRequiredDetailsChallenger.fromJS(this._wrapped);

  final $js.OnAuthRequiredDetailsChallenger _wrapped;

  $js.OnAuthRequiredDetailsChallenger get toJS => _wrapped;

  String get host => _wrapped.host;
  set host(String v) {
    throw UnimplementedError();
  }

  int get port => _wrapped.port;
  set port(int v) {
    throw UnimplementedError();
  }
}

class OnBeforeRequestDetailsRequestBodyFormData {
  OnBeforeRequestDetailsRequestBodyFormData.fromJS(this._wrapped);

  final $js.OnBeforeRequestDetailsRequestBodyFormData _wrapped;

  $js.OnBeforeRequestDetailsRequestBodyFormData get toJS => _wrapped;
}

class OnAuthRequiredEvent {
  OnAuthRequiredEvent({
    required this.details,
    required this.asyncCallback,
  });

  final OnAuthRequiredDetails details;

  /// Only valid if `'asyncBlocking'` is specified as one of the
  /// `OnAuthRequiredOptions`.
  final JSAny? asyncCallback;
}
