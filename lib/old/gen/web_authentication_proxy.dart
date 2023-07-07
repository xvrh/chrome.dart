/* This file has been generated from web_authentication_proxy.idl - do not edit */

/**
 * The `chrome.webAuthenticationProxy`. API lets remote desktop software running
 * on a remote host intercept Web Authentication API (WebAuthn) requests in
 * order to handle them on a local client.
 */
library chrome.webAuthenticationProxy;

import '../src/common.dart';

/**
 * Accessor for the `chrome.webAuthenticationProxy` namespace.
 */
final ChromeWebAuthenticationProxy webAuthenticationProxy = ChromeWebAuthenticationProxy._();

class ChromeWebAuthenticationProxy extends ChromeApi {
  JsObject get _webAuthenticationProxy => chrome['webAuthenticationProxy'];

  Stream get onRemoteSessionStateChange => _onRemoteSessionStateChange.stream;
  late ChromeStreamController _onRemoteSessionStateChange;

  Stream<CreateRequest> get onCreateRequest => _onCreateRequest.stream;
  late ChromeStreamController<CreateRequest> _onCreateRequest;

  Stream<GetRequest> get onGetRequest => _onGetRequest.stream;
  late ChromeStreamController<GetRequest> _onGetRequest;

  Stream<IsUvpaaRequest> get onIsUvpaaRequest => _onIsUvpaaRequest.stream;
  late ChromeStreamController<IsUvpaaRequest> _onIsUvpaaRequest;

  Stream<int> get onRequestCanceled => _onRequestCanceled.stream;
  late ChromeStreamController<int> _onRequestCanceled;

  ChromeWebAuthenticationProxy._() {
    var getApi = () => _webAuthenticationProxy;
    _onRemoteSessionStateChange = new ChromeStreamController.noArgs(getApi, 'onRemoteSessionStateChange');
    _onCreateRequest = ChromeStreamController<CreateRequest>.oneArg(getApi, 'onCreateRequest', _createCreateRequest);
    _onGetRequest = ChromeStreamController<GetRequest>.oneArg(getApi, 'onGetRequest', _createGetRequest);
    _onIsUvpaaRequest = ChromeStreamController<IsUvpaaRequest>.oneArg(getApi, 'onIsUvpaaRequest', _createIsUvpaaRequest);
    _onRequestCanceled = ChromeStreamController<int>.oneArg(getApi, 'onRequestCanceled', selfConverter);
  }

  bool get available => _webAuthenticationProxy != null;

  /**
   * Reports the result of a `navigator.credentials.create()` call. The
   * extension must call this for every `onCreateRequest` event it has received,
   * unless the request was canceled (in which case, an `onRequestCanceled`
   * event is fired).
   */
  Future completeCreateRequest(CreateResponseDetails details) {
    if (_webAuthenticationProxy == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _webAuthenticationProxy.callMethod('completeCreateRequest', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Reports the result of a `navigator.credentials.get()` call. The extension
   * must call this for every `onGetRequest` event it has received, unless the
   * request was canceled (in which case, an `onRequestCanceled` event is
   * fired).
   */
  Future completeGetRequest(GetResponseDetails details) {
    if (_webAuthenticationProxy == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _webAuthenticationProxy.callMethod('completeGetRequest', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Reports the result of a
   * `PublicKeyCredential.isUserVerifyingPlatformAuthenticator()` call. The
   * extension must call this for every `onIsUvpaaRequest` event it has
   * received.
   */
  Future completeIsUvpaaRequest(IsUvpaaResponseDetails details) {
    if (_webAuthenticationProxy == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _webAuthenticationProxy.callMethod('completeIsUvpaaRequest', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Makes this extension the active Web Authentication API request proxy.
   * 
   * Remote desktop extensions typically call this method after detecting
   * attachment of a remote session to this host. Once this method returns
   * without error, regular processing of WebAuthn requests is suspended, and
   * events from this extension API are raised.
   * 
   * This method fails with an error if a different extension is already
   * attached.
   * 
   * The attached extension must call `detach()` once the remote desktop session
   * has ended in order to resume regular WebAuthn request processing.
   * Extensions automatically become detached if they are unloaded.
   * 
   * Refer to the `onRemoteSessionStateChange` event for signaling a change of
   * remote session attachment from a native application to to the (possibly
   * suspended) extension.
   */
  Future<String> attach() {
    if (_webAuthenticationProxy == null) _throwNotAvailable();

    var completer =  ChromeCompleter<String>.oneArg();
    _webAuthenticationProxy.callMethod('attach', [completer.callback]);
    return completer.future;
  }

  /**
   * Removes this extension from being the active Web Authentication API request
   * proxy.
   * 
   * This method is typically called when the extension detects that a remote
   * desktop session was terminated. Once this method returns, the extension
   * ceases to be the active Web Authentication API request proxy.
   * 
   * Refer to the `onRemoteSessionStateChange` event for signaling a change of
   * remote session attachment from a native application to to the (possibly
   * suspended) extension.
   */
  Future<String> detach() {
    if (_webAuthenticationProxy == null) _throwNotAvailable();

    var completer =  ChromeCompleter<String>.oneArg();
    _webAuthenticationProxy.callMethod('detach', [completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.webAuthenticationProxy' is not available");
  }
}

/**
 * An object representing a
 * `PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable()` call.
 */
class IsUvpaaRequest extends ChromeObject {
  IsUvpaaRequest({int? requestId}) {
    if (requestId != null) this.requestId = requestId;
  }
  IsUvpaaRequest.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get requestId => jsProxy['requestId'];
  set requestId(int value) => jsProxy['requestId'] = value;
}

/**
 * An object representing a WebAuthn `navigator.credentials.create()` call.
 */
class CreateRequest extends ChromeObject {
  CreateRequest({int? requestId, String? requestDetailsJson}) {
    if (requestId != null) this.requestId = requestId;
    if (requestDetailsJson != null) this.requestDetailsJson = requestDetailsJson;
  }
  CreateRequest.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get requestId => jsProxy['requestId'];
  set requestId(int value) => jsProxy['requestId'] = value;

  String get requestDetailsJson => jsProxy['requestDetailsJson'];
  set requestDetailsJson(String value) => jsProxy['requestDetailsJson'] = value;
}

/**
 * An object representing a WebAuthn `navigator.credentials.get()` call.
 */
class GetRequest extends ChromeObject {
  GetRequest({int? requestId, String? requestDetailsJson}) {
    if (requestId != null) this.requestId = requestId;
    if (requestDetailsJson != null) this.requestDetailsJson = requestDetailsJson;
  }
  GetRequest.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get requestId => jsProxy['requestId'];
  set requestId(int value) => jsProxy['requestId'] = value;

  String get requestDetailsJson => jsProxy['requestDetailsJson'];
  set requestDetailsJson(String value) => jsProxy['requestDetailsJson'] = value;
}

class DOMExceptionDetails extends ChromeObject {
  DOMExceptionDetails({String? name, String? message}) {
    if (name != null) this.name = name;
    if (message != null) this.message = message;
  }
  DOMExceptionDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get name => jsProxy['name'];
  set name(String value) => jsProxy['name'] = value;

  String get message => jsProxy['message'];
  set message(String value) => jsProxy['message'] = value;
}

class CreateResponseDetails extends ChromeObject {
  CreateResponseDetails({int? requestId, DOMExceptionDetails? error, String? responseJson}) {
    if (requestId != null) this.requestId = requestId;
    if (error != null) this.error = error;
    if (responseJson != null) this.responseJson = responseJson;
  }
  CreateResponseDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get requestId => jsProxy['requestId'];
  set requestId(int value) => jsProxy['requestId'] = value;

  DOMExceptionDetails get error => _createDOMExceptionDetails(jsProxy['error']);
  set error(DOMExceptionDetails value) => jsProxy['error'] = jsify(value);

  String get responseJson => jsProxy['responseJson'];
  set responseJson(String value) => jsProxy['responseJson'] = value;
}

class GetResponseDetails extends ChromeObject {
  GetResponseDetails({int? requestId, DOMExceptionDetails? error, String? responseJson}) {
    if (requestId != null) this.requestId = requestId;
    if (error != null) this.error = error;
    if (responseJson != null) this.responseJson = responseJson;
  }
  GetResponseDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get requestId => jsProxy['requestId'];
  set requestId(int value) => jsProxy['requestId'] = value;

  DOMExceptionDetails get error => _createDOMExceptionDetails(jsProxy['error']);
  set error(DOMExceptionDetails value) => jsProxy['error'] = jsify(value);

  String get responseJson => jsProxy['responseJson'];
  set responseJson(String value) => jsProxy['responseJson'] = value;
}

class IsUvpaaResponseDetails extends ChromeObject {
  IsUvpaaResponseDetails({int? requestId, bool? isUvpaa}) {
    if (requestId != null) this.requestId = requestId;
    if (isUvpaa != null) this.isUvpaa = isUvpaa;
  }
  IsUvpaaResponseDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get requestId => jsProxy['requestId'];
  set requestId(int value) => jsProxy['requestId'] = value;

  bool get isUvpaa => jsProxy['isUvpaa'];
  set isUvpaa(bool value) => jsProxy['isUvpaa'] = value;
}

CreateRequest _createCreateRequest(JsObject jsProxy) => CreateRequest.fromProxy(jsProxy);
GetRequest _createGetRequest(JsObject jsProxy) => GetRequest.fromProxy(jsProxy);
IsUvpaaRequest _createIsUvpaaRequest(JsObject jsProxy) => IsUvpaaRequest.fromProxy(jsProxy);
DOMExceptionDetails _createDOMExceptionDetails(JsObject jsProxy) => DOMExceptionDetails.fromProxy(jsProxy);
