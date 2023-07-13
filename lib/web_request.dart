import 'extension_types.dart';
import 'src/internal_helpers.dart';
import 'src/js/web_request.dart' as $js;

export 'src/chrome.dart' show chrome;

final _webRequest = ChromeWebRequest._();

extension ChromeWebRequestExtension on Chrome {
  ChromeWebRequest get webRequest => _webRequest;
}

class ChromeWebRequest {
  ChromeWebRequest._();

  /// Needs to be called when the behavior of the webRequest handlers has
  /// changed to prevent incorrect handling due to caching. This function call
  /// is expensive. Don't call it often.
  void handlerBehaviorChanged(JFFunction? callback) {
    $js.chrome.webRequest.handlerBehaviorChanged(callback);
  }

  /// The maximum number of times that `handlerBehaviorChanged` can be called
  /// per 10 minute sustained interval. `handlerBehaviorChanged` is an expensive
  /// function call that shouldn't be called often.
  int get maxHandlerBehaviorChangedCallsPer10Minutes =>
      ($js.chrome.webRequest.MAX_HANDLER_BEHAVIOR_CHANGED_CALLS_PER_10_MINUTES
          as dynamic);

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

  RequestFilter({
    required List<String> urls,
    List<ResourceType>? types,
    int? tabId,
    int? windowId,
  }) : _wrapped = $js.RequestFilter()
          ..urls = throw UnimplementedError()
          ..types = throw UnimplementedError()
          ..tabId = tabId
          ..windowId = windowId;

  final $js.RequestFilter _wrapped;

  $js.RequestFilter get toJS => _wrapped;

  /// A list of URLs or URL patterns. Requests that cannot match any of the URLs
  /// will be filtered out.
  List<String> get urls =>
      _wrapped.urls.toDart.cast<String>().map((e) => e).toList();
  set urls(List<String> v) {
    _wrapped.urls = throw UnimplementedError();
  }

  /// A list of request types. Requests that cannot match any of the types will
  /// be filtered out.
  List<ResourceType>? get types => _wrapped.types?.toDart
      .cast<$js.ResourceType>()
      .map((e) => ResourceType.fromJS(e))
      .toList();
  set types(List<ResourceType>? v) {
    _wrapped.types = throw UnimplementedError();
  }

  int? get tabId => _wrapped.tabId;
  set tabId(int? v) {
    _wrapped.tabId = v;
  }

  int? get windowId => _wrapped.windowId;
  set windowId(int? v) {
    _wrapped.windowId = v;
  }
}

class BlockingResponse {
  BlockingResponse.fromJS(this._wrapped);

  BlockingResponse({
    bool? cancel,
    String? redirectUrl,
    HttpHeaders? requestHeaders,
    HttpHeaders? responseHeaders,
    BlockingResponseAuthCredentials? authCredentials,
  }) : _wrapped = $js.BlockingResponse()
          ..cancel = cancel
          ..redirectUrl = redirectUrl
          ..requestHeaders = throw UnimplementedError()
          ..responseHeaders = throw UnimplementedError()
          ..authCredentials = authCredentials?.toJS;

  final $js.BlockingResponse _wrapped;

  $js.BlockingResponse get toJS => _wrapped;

  /// If true, the request is cancelled. This prevents the request from being
  /// sent. This can be used as a response to the onBeforeRequest,
  /// onBeforeSendHeaders, onHeadersReceived and onAuthRequired events.
  bool? get cancel => _wrapped.cancel;
  set cancel(bool? v) {
    _wrapped.cancel = v;
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
    _wrapped.redirectUrl = v;
  }

  /// Only used as a response to the onBeforeSendHeaders event. If set, the
  /// request is made with these request headers instead.
  HttpHeaders? get requestHeaders => _wrapped.requestHeaders?.toDart
      .cast<$js.HttpHeadersItems>()
      .map((e) => HttpHeadersItems.fromJS(e))
      .toList();
  set requestHeaders(HttpHeaders? v) {
    _wrapped.requestHeaders = throw UnimplementedError();
  }

  /// Only used as a response to the onHeadersReceived event. If set, the server
  /// is assumed to have responded with these response headers instead. Only
  /// return `responseHeaders` if you really want to modify the headers in order
  /// to limit the number of conflicts (only one extension may modify
  /// `responseHeaders` for each request).
  HttpHeaders? get responseHeaders => _wrapped.responseHeaders?.toDart
      .cast<$js.HttpHeadersItems>()
      .map((e) => HttpHeadersItems.fromJS(e))
      .toList();
  set responseHeaders(HttpHeaders? v) {
    _wrapped.responseHeaders = throw UnimplementedError();
  }

  /// Only used as a response to the onAuthRequired event. If set, the request
  /// is made using the supplied credentials.
  BlockingResponseAuthCredentials? get authCredentials =>
      _wrapped.authCredentials?.let(BlockingResponseAuthCredentials.fromJS);
  set authCredentials(BlockingResponseAuthCredentials? v) {
    _wrapped.authCredentials = v?.toJS;
  }
}

class UploadData {
  UploadData.fromJS(this._wrapped);

  UploadData({
    JSAny? bytes,
    String? file,
  }) : _wrapped = $js.UploadData()
          ..bytes = bytes
          ..file = file;

  final $js.UploadData _wrapped;

  $js.UploadData get toJS => _wrapped;

  /// An ArrayBuffer with a copy of the data.
  JSAny? get bytes => _wrapped.bytes;
  set bytes(JSAny? v) {
    _wrapped.bytes = v;
  }

  /// A string with the file's path and name.
  String? get file => _wrapped.file;
  set file(String? v) {
    _wrapped.file = v;
  }
}

class HttpHeadersItems {
  HttpHeadersItems.fromJS(this._wrapped);

  HttpHeadersItems({
    required String name,
    String? value,
    List<int>? binaryValue,
  }) : _wrapped = $js.HttpHeadersItems()
          ..name = name
          ..value = value
          ..binaryValue = throw UnimplementedError();

  final $js.HttpHeadersItems _wrapped;

  $js.HttpHeadersItems get toJS => _wrapped;

  /// Name of the HTTP header.
  String get name => _wrapped.name;
  set name(String v) {
    _wrapped.name = v;
  }

  /// Value of the HTTP header if it can be represented by UTF-8.
  String? get value => _wrapped.value;
  set value(String? v) {
    _wrapped.value = v;
  }

  /// Value of the HTTP header if it cannot be represented by UTF-8, stored as
  /// individual byte values (0..255).
  List<int>? get binaryValue =>
      _wrapped.binaryValue?.toDart.cast<int>().map((e) => e).toList();
  set binaryValue(List<int>? v) {
    _wrapped.binaryValue = throw UnimplementedError();
  }
}

class OnBeforeRequestDetails {
  OnBeforeRequestDetails.fromJS(this._wrapped);

  OnBeforeRequestDetails({
    required String requestId,
    required String url,
    required String method,
    required int frameId,
    required int parentFrameId,
    String? documentId,
    String? parentDocumentId,
    DocumentLifecycle? documentLifecycle,
    FrameType? frameType,
    OnBeforeRequestDetailsRequestBody? requestBody,
    required int tabId,
    required ResourceType type,
    String? initiator,
    required double timeStamp,
  }) : _wrapped = $js.OnBeforeRequestDetails()
          ..requestId = requestId
          ..url = url
          ..method = method
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle?.toJS
          ..frameType = frameType?.toJS
          ..requestBody = requestBody?.toJS
          ..tabId = tabId
          ..type = type.toJS
          ..initiator = initiator
          ..timeStamp = timeStamp;

  final $js.OnBeforeRequestDetails _wrapped;

  $js.OnBeforeRequestDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    _wrapped.requestId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    _wrapped.method = v;
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The UUID of the document making the request.
  String? get documentId => _wrapped.documentId;
  set documentId(String? v) {
    _wrapped.documentId = v;
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle? get documentLifecycle =>
      _wrapped.documentLifecycle?.let(DocumentLifecycle.fromJS);
  set documentLifecycle(DocumentLifecycle? v) {
    _wrapped.documentLifecycle = v?.toJS;
  }

  /// The type of frame the request occurred in.
  FrameType? get frameType => _wrapped.frameType?.let(FrameType.fromJS);
  set frameType(FrameType? v) {
    _wrapped.frameType = v?.toJS;
  }

  /// Contains the HTTP request body data. Only provided if extraInfoSpec
  /// contains 'requestBody'.
  OnBeforeRequestDetailsRequestBody? get requestBody =>
      _wrapped.requestBody?.let(OnBeforeRequestDetailsRequestBody.fromJS);
  set requestBody(OnBeforeRequestDetailsRequestBody? v) {
    _wrapped.requestBody = v?.toJS;
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    _wrapped.type = v.toJS;
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    _wrapped.initiator = v;
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }
}

class OnBeforeSendHeadersDetails {
  OnBeforeSendHeadersDetails.fromJS(this._wrapped);

  OnBeforeSendHeadersDetails({
    required String requestId,
    required String url,
    required String method,
    required int frameId,
    required int parentFrameId,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
    required int tabId,
    String? initiator,
    required ResourceType type,
    required double timeStamp,
    HttpHeaders? requestHeaders,
  }) : _wrapped = $js.OnBeforeSendHeadersDetails()
          ..requestId = requestId
          ..url = url
          ..method = method
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS
          ..tabId = tabId
          ..initiator = initiator
          ..type = type.toJS
          ..timeStamp = timeStamp
          ..requestHeaders = throw UnimplementedError();

  final $js.OnBeforeSendHeadersDetails _wrapped;

  $js.OnBeforeSendHeadersDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    _wrapped.requestId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    _wrapped.method = v;
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    _wrapped.initiator = v;
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    _wrapped.type = v.toJS;
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// The HTTP request headers that are going to be sent out with this request.
  HttpHeaders? get requestHeaders => _wrapped.requestHeaders?.toDart
      .cast<$js.HttpHeadersItems>()
      .map((e) => HttpHeadersItems.fromJS(e))
      .toList();
  set requestHeaders(HttpHeaders? v) {
    _wrapped.requestHeaders = throw UnimplementedError();
  }
}

class OnSendHeadersDetails {
  OnSendHeadersDetails.fromJS(this._wrapped);

  OnSendHeadersDetails({
    required String requestId,
    required String url,
    required String method,
    required int frameId,
    required int parentFrameId,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
    required int tabId,
    required ResourceType type,
    String? initiator,
    required double timeStamp,
    HttpHeaders? requestHeaders,
  }) : _wrapped = $js.OnSendHeadersDetails()
          ..requestId = requestId
          ..url = url
          ..method = method
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS
          ..tabId = tabId
          ..type = type.toJS
          ..initiator = initiator
          ..timeStamp = timeStamp
          ..requestHeaders = throw UnimplementedError();

  final $js.OnSendHeadersDetails _wrapped;

  $js.OnSendHeadersDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    _wrapped.requestId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    _wrapped.method = v;
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    _wrapped.type = v.toJS;
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    _wrapped.initiator = v;
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// The HTTP request headers that have been sent out with this request.
  HttpHeaders? get requestHeaders => _wrapped.requestHeaders?.toDart
      .cast<$js.HttpHeadersItems>()
      .map((e) => HttpHeadersItems.fromJS(e))
      .toList();
  set requestHeaders(HttpHeaders? v) {
    _wrapped.requestHeaders = throw UnimplementedError();
  }
}

class OnHeadersReceivedDetails {
  OnHeadersReceivedDetails.fromJS(this._wrapped);

  OnHeadersReceivedDetails({
    required String requestId,
    required String url,
    required String method,
    required int frameId,
    required int parentFrameId,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
    required int tabId,
    required ResourceType type,
    String? initiator,
    required double timeStamp,
    required String statusLine,
    HttpHeaders? responseHeaders,
    required int statusCode,
  }) : _wrapped = $js.OnHeadersReceivedDetails()
          ..requestId = requestId
          ..url = url
          ..method = method
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS
          ..tabId = tabId
          ..type = type.toJS
          ..initiator = initiator
          ..timeStamp = timeStamp
          ..statusLine = statusLine
          ..responseHeaders = throw UnimplementedError()
          ..statusCode = statusCode;

  final $js.OnHeadersReceivedDetails _wrapped;

  $js.OnHeadersReceivedDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    _wrapped.requestId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    _wrapped.method = v;
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    _wrapped.type = v.toJS;
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    _wrapped.initiator = v;
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// HTTP status line of the response or the 'HTTP/0.9 200 OK' string for
  /// HTTP/0.9 responses (i.e., responses that lack a status line).
  String get statusLine => _wrapped.statusLine;
  set statusLine(String v) {
    _wrapped.statusLine = v;
  }

  /// The HTTP response headers that have been received with this response.
  HttpHeaders? get responseHeaders => _wrapped.responseHeaders?.toDart
      .cast<$js.HttpHeadersItems>()
      .map((e) => HttpHeadersItems.fromJS(e))
      .toList();
  set responseHeaders(HttpHeaders? v) {
    _wrapped.responseHeaders = throw UnimplementedError();
  }

  /// Standard HTTP status code returned by the server.
  int get statusCode => _wrapped.statusCode;
  set statusCode(int v) {
    _wrapped.statusCode = v;
  }
}

class OnAuthRequiredDetails {
  OnAuthRequiredDetails.fromJS(this._wrapped);

  OnAuthRequiredDetails({
    required String requestId,
    required String url,
    required String method,
    required int frameId,
    required int parentFrameId,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
    required int tabId,
    required ResourceType type,
    String? initiator,
    required double timeStamp,
    required String scheme,
    String? realm,
    required OnAuthRequiredDetailsChallenger challenger,
    required bool isProxy,
    HttpHeaders? responseHeaders,
    required String statusLine,
    required int statusCode,
  }) : _wrapped = $js.OnAuthRequiredDetails()
          ..requestId = requestId
          ..url = url
          ..method = method
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS
          ..tabId = tabId
          ..type = type.toJS
          ..initiator = initiator
          ..timeStamp = timeStamp
          ..scheme = scheme
          ..realm = realm
          ..challenger = challenger.toJS
          ..isProxy = isProxy
          ..responseHeaders = throw UnimplementedError()
          ..statusLine = statusLine
          ..statusCode = statusCode;

  final $js.OnAuthRequiredDetails _wrapped;

  $js.OnAuthRequiredDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    _wrapped.requestId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    _wrapped.method = v;
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    _wrapped.type = v.toJS;
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    _wrapped.initiator = v;
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// The authentication scheme, e.g. Basic or Digest.
  String get scheme => _wrapped.scheme;
  set scheme(String v) {
    _wrapped.scheme = v;
  }

  /// The authentication realm provided by the server, if there is one.
  String? get realm => _wrapped.realm;
  set realm(String? v) {
    _wrapped.realm = v;
  }

  /// The server requesting authentication.
  OnAuthRequiredDetailsChallenger get challenger =>
      OnAuthRequiredDetailsChallenger.fromJS(_wrapped.challenger);
  set challenger(OnAuthRequiredDetailsChallenger v) {
    _wrapped.challenger = v.toJS;
  }

  /// True for Proxy-Authenticate, false for WWW-Authenticate.
  bool get isProxy => _wrapped.isProxy;
  set isProxy(bool v) {
    _wrapped.isProxy = v;
  }

  /// The HTTP response headers that were received along with this response.
  HttpHeaders? get responseHeaders => _wrapped.responseHeaders?.toDart
      .cast<$js.HttpHeadersItems>()
      .map((e) => HttpHeadersItems.fromJS(e))
      .toList();
  set responseHeaders(HttpHeaders? v) {
    _wrapped.responseHeaders = throw UnimplementedError();
  }

  /// HTTP status line of the response or the 'HTTP/0.9 200 OK' string for
  /// HTTP/0.9 responses (i.e., responses that lack a status line) or an empty
  /// string if there are no headers.
  String get statusLine => _wrapped.statusLine;
  set statusLine(String v) {
    _wrapped.statusLine = v;
  }

  /// Standard HTTP status code returned by the server.
  int get statusCode => _wrapped.statusCode;
  set statusCode(int v) {
    _wrapped.statusCode = v;
  }
}

class OnResponseStartedDetails {
  OnResponseStartedDetails.fromJS(this._wrapped);

  OnResponseStartedDetails({
    required String requestId,
    required String url,
    required String method,
    required int frameId,
    required int parentFrameId,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
    required int tabId,
    required ResourceType type,
    String? initiator,
    required double timeStamp,
    String? ip,
    required bool fromCache,
    required int statusCode,
    HttpHeaders? responseHeaders,
    required String statusLine,
  }) : _wrapped = $js.OnResponseStartedDetails()
          ..requestId = requestId
          ..url = url
          ..method = method
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS
          ..tabId = tabId
          ..type = type.toJS
          ..initiator = initiator
          ..timeStamp = timeStamp
          ..ip = ip
          ..fromCache = fromCache
          ..statusCode = statusCode
          ..responseHeaders = throw UnimplementedError()
          ..statusLine = statusLine;

  final $js.OnResponseStartedDetails _wrapped;

  $js.OnResponseStartedDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    _wrapped.requestId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    _wrapped.method = v;
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    _wrapped.type = v.toJS;
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    _wrapped.initiator = v;
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// The server IP address that the request was actually sent to. Note that it
  /// may be a literal IPv6 address.
  String? get ip => _wrapped.ip;
  set ip(String? v) {
    _wrapped.ip = v;
  }

  /// Indicates if this response was fetched from disk cache.
  bool get fromCache => _wrapped.fromCache;
  set fromCache(bool v) {
    _wrapped.fromCache = v;
  }

  /// Standard HTTP status code returned by the server.
  int get statusCode => _wrapped.statusCode;
  set statusCode(int v) {
    _wrapped.statusCode = v;
  }

  /// The HTTP response headers that were received along with this response.
  HttpHeaders? get responseHeaders => _wrapped.responseHeaders?.toDart
      .cast<$js.HttpHeadersItems>()
      .map((e) => HttpHeadersItems.fromJS(e))
      .toList();
  set responseHeaders(HttpHeaders? v) {
    _wrapped.responseHeaders = throw UnimplementedError();
  }

  /// HTTP status line of the response or the 'HTTP/0.9 200 OK' string for
  /// HTTP/0.9 responses (i.e., responses that lack a status line) or an empty
  /// string if there are no headers.
  String get statusLine => _wrapped.statusLine;
  set statusLine(String v) {
    _wrapped.statusLine = v;
  }
}

class OnBeforeRedirectDetails {
  OnBeforeRedirectDetails.fromJS(this._wrapped);

  OnBeforeRedirectDetails({
    required String requestId,
    required String url,
    required String method,
    required int frameId,
    required int parentFrameId,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
    required int tabId,
    required ResourceType type,
    String? initiator,
    required double timeStamp,
    String? ip,
    required bool fromCache,
    required int statusCode,
    required String redirectUrl,
    HttpHeaders? responseHeaders,
    required String statusLine,
  }) : _wrapped = $js.OnBeforeRedirectDetails()
          ..requestId = requestId
          ..url = url
          ..method = method
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS
          ..tabId = tabId
          ..type = type.toJS
          ..initiator = initiator
          ..timeStamp = timeStamp
          ..ip = ip
          ..fromCache = fromCache
          ..statusCode = statusCode
          ..redirectUrl = redirectUrl
          ..responseHeaders = throw UnimplementedError()
          ..statusLine = statusLine;

  final $js.OnBeforeRedirectDetails _wrapped;

  $js.OnBeforeRedirectDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    _wrapped.requestId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    _wrapped.method = v;
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    _wrapped.type = v.toJS;
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    _wrapped.initiator = v;
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// The server IP address that the request was actually sent to. Note that it
  /// may be a literal IPv6 address.
  String? get ip => _wrapped.ip;
  set ip(String? v) {
    _wrapped.ip = v;
  }

  /// Indicates if this response was fetched from disk cache.
  bool get fromCache => _wrapped.fromCache;
  set fromCache(bool v) {
    _wrapped.fromCache = v;
  }

  /// Standard HTTP status code returned by the server.
  int get statusCode => _wrapped.statusCode;
  set statusCode(int v) {
    _wrapped.statusCode = v;
  }

  /// The new URL.
  String get redirectUrl => _wrapped.redirectUrl;
  set redirectUrl(String v) {
    _wrapped.redirectUrl = v;
  }

  /// The HTTP response headers that were received along with this redirect.
  HttpHeaders? get responseHeaders => _wrapped.responseHeaders?.toDart
      .cast<$js.HttpHeadersItems>()
      .map((e) => HttpHeadersItems.fromJS(e))
      .toList();
  set responseHeaders(HttpHeaders? v) {
    _wrapped.responseHeaders = throw UnimplementedError();
  }

  /// HTTP status line of the response or the 'HTTP/0.9 200 OK' string for
  /// HTTP/0.9 responses (i.e., responses that lack a status line) or an empty
  /// string if there are no headers.
  String get statusLine => _wrapped.statusLine;
  set statusLine(String v) {
    _wrapped.statusLine = v;
  }
}

class OnCompletedDetails {
  OnCompletedDetails.fromJS(this._wrapped);

  OnCompletedDetails({
    required String requestId,
    required String url,
    required String method,
    required int frameId,
    required int parentFrameId,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
    required int tabId,
    required ResourceType type,
    String? initiator,
    required double timeStamp,
    String? ip,
    required bool fromCache,
    required int statusCode,
    HttpHeaders? responseHeaders,
    required String statusLine,
  }) : _wrapped = $js.OnCompletedDetails()
          ..requestId = requestId
          ..url = url
          ..method = method
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS
          ..tabId = tabId
          ..type = type.toJS
          ..initiator = initiator
          ..timeStamp = timeStamp
          ..ip = ip
          ..fromCache = fromCache
          ..statusCode = statusCode
          ..responseHeaders = throw UnimplementedError()
          ..statusLine = statusLine;

  final $js.OnCompletedDetails _wrapped;

  $js.OnCompletedDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    _wrapped.requestId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    _wrapped.method = v;
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The UUID of the document making the request.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    _wrapped.type = v.toJS;
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    _wrapped.initiator = v;
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// The server IP address that the request was actually sent to. Note that it
  /// may be a literal IPv6 address.
  String? get ip => _wrapped.ip;
  set ip(String? v) {
    _wrapped.ip = v;
  }

  /// Indicates if this response was fetched from disk cache.
  bool get fromCache => _wrapped.fromCache;
  set fromCache(bool v) {
    _wrapped.fromCache = v;
  }

  /// Standard HTTP status code returned by the server.
  int get statusCode => _wrapped.statusCode;
  set statusCode(int v) {
    _wrapped.statusCode = v;
  }

  /// The HTTP response headers that were received along with this response.
  HttpHeaders? get responseHeaders => _wrapped.responseHeaders?.toDart
      .cast<$js.HttpHeadersItems>()
      .map((e) => HttpHeadersItems.fromJS(e))
      .toList();
  set responseHeaders(HttpHeaders? v) {
    _wrapped.responseHeaders = throw UnimplementedError();
  }

  /// HTTP status line of the response or the 'HTTP/0.9 200 OK' string for
  /// HTTP/0.9 responses (i.e., responses that lack a status line) or an empty
  /// string if there are no headers.
  String get statusLine => _wrapped.statusLine;
  set statusLine(String v) {
    _wrapped.statusLine = v;
  }
}

class OnErrorOccurredDetails {
  OnErrorOccurredDetails.fromJS(this._wrapped);

  OnErrorOccurredDetails({
    required String requestId,
    required String url,
    required String method,
    required int frameId,
    required int parentFrameId,
    required String documentId,
    String? parentDocumentId,
    required DocumentLifecycle documentLifecycle,
    required FrameType frameType,
    required int tabId,
    required ResourceType type,
    String? initiator,
    required double timeStamp,
    String? ip,
    required bool fromCache,
    required String error,
  }) : _wrapped = $js.OnErrorOccurredDetails()
          ..requestId = requestId
          ..url = url
          ..method = method
          ..frameId = frameId
          ..parentFrameId = parentFrameId
          ..documentId = documentId
          ..parentDocumentId = parentDocumentId
          ..documentLifecycle = documentLifecycle.toJS
          ..frameType = frameType.toJS
          ..tabId = tabId
          ..type = type.toJS
          ..initiator = initiator
          ..timeStamp = timeStamp
          ..ip = ip
          ..fromCache = fromCache
          ..error = error;

  final $js.OnErrorOccurredDetails _wrapped;

  $js.OnErrorOccurredDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    _wrapped.requestId = v;
  }

  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// Standard HTTP method.
  String get method => _wrapped.method;
  set method(String v) {
    _wrapped.method = v;
  }

  /// The value 0 indicates that the request happens in the main frame; a
  /// positive value indicates the ID of a subframe in which the request
  /// happens. If the document of a (sub-)frame is loaded (`type` is
  /// `main_frame` or `sub_frame`), `frameId` indicates the ID of this frame,
  /// not the ID of the outer frame. Frame IDs are unique within a tab.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// ID of frame that wraps the frame which sent the request. Set to -1 if no
  /// parent frame exists.
  int get parentFrameId => _wrapped.parentFrameId;
  set parentFrameId(int v) {
    _wrapped.parentFrameId = v;
  }

  /// The UUID of the document making the request. This value is not present if
  /// the request is a navigation of a frame.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }

  /// The UUID of the parent document owning this frame. This is not set if
  /// there is no parent.
  String? get parentDocumentId => _wrapped.parentDocumentId;
  set parentDocumentId(String? v) {
    _wrapped.parentDocumentId = v;
  }

  /// The lifecycle the document is in.
  DocumentLifecycle get documentLifecycle =>
      DocumentLifecycle.fromJS(_wrapped.documentLifecycle);
  set documentLifecycle(DocumentLifecycle v) {
    _wrapped.documentLifecycle = v.toJS;
  }

  /// The type of frame the request occurred in.
  FrameType get frameType => FrameType.fromJS(_wrapped.frameType);
  set frameType(FrameType v) {
    _wrapped.frameType = v.toJS;
  }

  /// The ID of the tab in which the request takes place. Set to -1 if the
  /// request isn't related to a tab.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  /// How the requested resource will be used.
  ResourceType get type => ResourceType.fromJS(_wrapped.type);
  set type(ResourceType v) {
    _wrapped.type = v.toJS;
  }

  /// The origin where the request was initiated. This does not change through
  /// redirects. If this is an opaque origin, the string 'null' will be used.
  String? get initiator => _wrapped.initiator;
  set initiator(String? v) {
    _wrapped.initiator = v;
  }

  /// The time when this signal is triggered, in milliseconds since the epoch.
  double get timeStamp => _wrapped.timeStamp;
  set timeStamp(double v) {
    _wrapped.timeStamp = v;
  }

  /// The server IP address that the request was actually sent to. Note that it
  /// may be a literal IPv6 address.
  String? get ip => _wrapped.ip;
  set ip(String? v) {
    _wrapped.ip = v;
  }

  /// Indicates if this response was fetched from disk cache.
  bool get fromCache => _wrapped.fromCache;
  set fromCache(bool v) {
    _wrapped.fromCache = v;
  }

  /// The error description. This string is _not_ guaranteed to remain backwards
  /// compatible between releases. You must not parse and act based upon its
  /// content.
  String get error => _wrapped.error;
  set error(String v) {
    _wrapped.error = v;
  }
}

class OnActionIgnoredDetails {
  OnActionIgnoredDetails.fromJS(this._wrapped);

  OnActionIgnoredDetails({
    required String requestId,
    required IgnoredActionType action,
  }) : _wrapped = $js.OnActionIgnoredDetails()
          ..requestId = requestId
          ..action = action.toJS;

  final $js.OnActionIgnoredDetails _wrapped;

  $js.OnActionIgnoredDetails get toJS => _wrapped;

  /// The ID of the request. Request IDs are unique within a browser session. As
  /// a result, they could be used to relate different events of the same
  /// request.
  String get requestId => _wrapped.requestId;
  set requestId(String v) {
    _wrapped.requestId = v;
  }

  /// The proposed action which was ignored.
  IgnoredActionType get action => IgnoredActionType.fromJS(_wrapped.action);
  set action(IgnoredActionType v) {
    _wrapped.action = v.toJS;
  }
}

class BlockingResponseAuthCredentials {
  BlockingResponseAuthCredentials.fromJS(this._wrapped);

  BlockingResponseAuthCredentials({
    required String username,
    required String password,
  }) : _wrapped = $js.BlockingResponseAuthCredentials()
          ..username = username
          ..password = password;

  final $js.BlockingResponseAuthCredentials _wrapped;

  $js.BlockingResponseAuthCredentials get toJS => _wrapped;

  String get username => _wrapped.username;
  set username(String v) {
    _wrapped.username = v;
  }

  String get password => _wrapped.password;
  set password(String v) {
    _wrapped.password = v;
  }
}

class OnBeforeRequestDetailsRequestBody {
  OnBeforeRequestDetailsRequestBody.fromJS(this._wrapped);

  OnBeforeRequestDetailsRequestBody({
    String? error,
    OnBeforeRequestDetailsRequestBodyFormData? formData,
    List<UploadData>? raw,
  }) : _wrapped = $js.OnBeforeRequestDetailsRequestBody()
          ..error = error
          ..formData = formData?.toJS
          ..raw = throw UnimplementedError();

  final $js.OnBeforeRequestDetailsRequestBody _wrapped;

  $js.OnBeforeRequestDetailsRequestBody get toJS => _wrapped;

  /// Errors when obtaining request body data.
  String? get error => _wrapped.error;
  set error(String? v) {
    _wrapped.error = v;
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
    _wrapped.formData = v?.toJS;
  }

  /// If the request method is PUT or POST, and the body is not already parsed
  /// in formData, then the unparsed request body elements are contained in this
  /// array.
  List<UploadData>? get raw => _wrapped.raw?.toDart
      .cast<$js.UploadData>()
      .map((e) => UploadData.fromJS(e))
      .toList();
  set raw(List<UploadData>? v) {
    _wrapped.raw = throw UnimplementedError();
  }
}

class OnAuthRequiredDetailsChallenger {
  OnAuthRequiredDetailsChallenger.fromJS(this._wrapped);

  OnAuthRequiredDetailsChallenger({
    required String host,
    required int port,
  }) : _wrapped = $js.OnAuthRequiredDetailsChallenger()
          ..host = host
          ..port = port;

  final $js.OnAuthRequiredDetailsChallenger _wrapped;

  $js.OnAuthRequiredDetailsChallenger get toJS => _wrapped;

  String get host => _wrapped.host;
  set host(String v) {
    _wrapped.host = v;
  }

  int get port => _wrapped.port;
  set port(int v) {
    _wrapped.port = v;
  }
}

class OnBeforeRequestDetailsRequestBodyFormData {
  OnBeforeRequestDetailsRequestBodyFormData.fromJS(this._wrapped);

  OnBeforeRequestDetailsRequestBodyFormData()
      : _wrapped = $js.OnBeforeRequestDetailsRequestBodyFormData();

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
  final JFFunction? asyncCallback;
}
