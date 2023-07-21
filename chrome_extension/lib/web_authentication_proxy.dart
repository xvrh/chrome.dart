import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/web_authentication_proxy.dart' as $js;

export 'src/chrome.dart' show chrome;

final _webAuthenticationProxy = ChromeWebAuthenticationProxy._();

extension ChromeWebAuthenticationProxyExtension on Chrome {
  ChromeWebAuthenticationProxy get webAuthenticationProxy =>
      _webAuthenticationProxy;
}

class ChromeWebAuthenticationProxy {
  ChromeWebAuthenticationProxy._();

  /// Reports the result of a `navigator.credentials.create()`
  /// call. The extension must call this for every
  /// `onCreateRequest` event it has received, unless the request
  /// was canceled (in which case, an `onRequestCanceled` event is
  /// fired).
  Future<void> completeCreateRequest(CreateResponseDetails details) async {
    await promiseToFuture<void>(
        $js.chrome.webAuthenticationProxy.completeCreateRequest(details.toJS));
  }

  /// Reports the result of a `navigator.credentials.get()` call.
  /// The extension must call this for every `onGetRequest` event
  /// it has received, unless the request was canceled (in which case, an
  /// `onRequestCanceled` event is fired).
  Future<void> completeGetRequest(GetResponseDetails details) async {
    await promiseToFuture<void>(
        $js.chrome.webAuthenticationProxy.completeGetRequest(details.toJS));
  }

  /// Reports the result of a
  /// `PublicKeyCredential.isUserVerifyingPlatformAuthenticator()`
  /// call. The extension must call this for every
  /// `onIsUvpaaRequest` event it has received.
  Future<void> completeIsUvpaaRequest(IsUvpaaResponseDetails details) async {
    await promiseToFuture<void>(
        $js.chrome.webAuthenticationProxy.completeIsUvpaaRequest(details.toJS));
  }

  /// Makes this extension the active Web Authentication API request proxy.
  ///
  /// Remote desktop extensions typically call this method after detecting
  /// attachment of a remote session to this host. Once this method returns
  /// without error, regular processing of WebAuthn requests is suspended, and
  /// events from this extension API are raised.
  ///
  /// This method fails with an error if a different extension is already
  /// attached.
  ///
  /// The attached extension must call `detach()` once the remote
  /// desktop session has ended in order to resume regular WebAuthn request
  /// processing. Extensions automatically become detached if they are
  /// unloaded.
  ///
  /// Refer to the `onRemoteSessionStateChange` event for signaling
  /// a change of remote session attachment from a native application to to
  /// the (possibly suspended) extension.
  Future<String?> attach() async {
    var $res = await promiseToFuture<String?>(
        $js.chrome.webAuthenticationProxy.attach());
    return $res;
  }

  /// Removes this extension from being the active Web Authentication API
  /// request proxy.
  ///
  /// This method is typically called when the extension detects that a remote
  /// desktop session was terminated. Once this method returns, the extension
  /// ceases to be the active Web Authentication API request proxy.
  ///
  /// Refer to the `onRemoteSessionStateChange` event for signaling
  /// a change of remote session attachment from a native application to to
  /// the (possibly suspended) extension.
  Future<String?> detach() async {
    var $res = await promiseToFuture<String?>(
        $js.chrome.webAuthenticationProxy.detach());
    return $res;
  }

  /// A native application associated with this extension can cause this
  /// event to be fired by writing to a file with a name equal to the
  /// extension's ID in a directory named
  /// `WebAuthenticationProxyRemoteSessionStateChange` inside the
  /// <a
  /// href="https://chromium.googlesource.com/chromium/src/+/main/docs/user_data_dir.md#default-location">default
  /// user data directory</a>
  ///
  /// The contents of the file should be empty. I.e., it is not necessary to
  /// change the contents of the file in order to trigger this event.
  ///
  /// The native host application may use this event mechanism to signal a
  /// possible remote session state change (i.e. from detached to attached, or
  /// vice versa) while the extension service worker is possibly suspended. In
  /// the handler for this event, the extension can call the
  /// `attach()` or `detach()` API methods accordingly.
  ///
  /// The event listener must be registered synchronously at load time.
  Stream<void> get onRemoteSessionStateChange =>
      $js.chrome.webAuthenticationProxy.onRemoteSessionStateChange
          .asStream(($c) => () {
                $c.add(null);
              }.toJS);

  /// Fires when a WebAuthn `navigator.credentials.create()` call
  /// occurs. The extension must supply a response by calling
  /// `completeCreateRequest()` with the `requestId` from
  /// `requestInfo`.
  Stream<CreateRequest> get onCreateRequest =>
      $js.chrome.webAuthenticationProxy.onCreateRequest
          .asStream(($c) => ($js.CreateRequest requestInfo) {
                $c.add(CreateRequest.fromJS(requestInfo));
              }.toJS);

  /// Fires when a WebAuthn navigator.credentials.get() call occurs. The
  /// extension must supply a response by calling
  /// `completeGetRequest()` with the `requestId` from
  /// `requestInfo`
  Stream<GetRequest> get onGetRequest =>
      $js.chrome.webAuthenticationProxy.onGetRequest
          .asStream(($c) => ($js.GetRequest requestInfo) {
                $c.add(GetRequest.fromJS(requestInfo));
              }.toJS);

  /// Fires when a
  /// `PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable()`
  /// call occurs. The extension must supply a response by calling
  /// `completeIsUvpaaRequest()` with the `requestId`
  /// from `requestInfo`
  Stream<IsUvpaaRequest> get onIsUvpaaRequest =>
      $js.chrome.webAuthenticationProxy.onIsUvpaaRequest
          .asStream(($c) => ($js.IsUvpaaRequest requestInfo) {
                $c.add(IsUvpaaRequest.fromJS(requestInfo));
              }.toJS);

  /// Fires when a `onCreateRequest` or `onGetRequest`
  /// event is canceled (because the WebAuthn request was aborted by the
  /// caller, or because it timed out). When receiving this event, the
  /// extension should cancel processing of the corresponding request on the
  /// client side. Extensions cannot complete a request once it has been
  /// canceled.
  Stream<int> get onRequestCanceled =>
      $js.chrome.webAuthenticationProxy.onRequestCanceled
          .asStream(($c) => (int requestId) {
                $c.add(requestId);
              }.toJS);
}

class IsUvpaaRequest {
  IsUvpaaRequest.fromJS(this._wrapped);

  IsUvpaaRequest({required int requestId})
      : _wrapped = $js.IsUvpaaRequest()..requestId = requestId;

  final $js.IsUvpaaRequest _wrapped;

  $js.IsUvpaaRequest get toJS => _wrapped;

  /// An opaque identifier for the request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }
}

class CreateRequest {
  CreateRequest.fromJS(this._wrapped);

  CreateRequest({
    required int requestId,
    required String requestDetailsJson,
  }) : _wrapped = $js.CreateRequest()
          ..requestId = requestId
          ..requestDetailsJson = requestDetailsJson;

  final $js.CreateRequest _wrapped;

  $js.CreateRequest get toJS => _wrapped;

  /// An opaque identifier for the request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The `PublicKeyCredentialCreationOptions` passed to
  /// `navigator.credentials.create()`, serialized as a JSON
  /// string. The serialization format is compatible with <a
  /// href="https://w3c.github.io/webauthn/#sctn-parseCreationOptionsFromJSON">
  /// `PublicKeyCredential.parseCreationOptionsFromJSON()`</a>.
  String get requestDetailsJson => _wrapped.requestDetailsJson;
  set requestDetailsJson(String v) {
    _wrapped.requestDetailsJson = v;
  }
}

class GetRequest {
  GetRequest.fromJS(this._wrapped);

  GetRequest({
    required int requestId,
    required String requestDetailsJson,
  }) : _wrapped = $js.GetRequest()
          ..requestId = requestId
          ..requestDetailsJson = requestDetailsJson;

  final $js.GetRequest _wrapped;

  $js.GetRequest get toJS => _wrapped;

  /// An opaque identifier for the request.
  int get requestId => _wrapped.requestId;
  set requestId(int v) {
    _wrapped.requestId = v;
  }

  /// The `PublicKeyCredentialRequestOptions` passed to
  /// `navigator.credentials.get()`, serialized as a JSON string.
  /// The serialization format is compatible with <a
  /// href="https://w3c.github.io/webauthn/#sctn-parseRequestOptionsFromJSON">
  /// `PublicKeyCredential.parseRequestOptionsFromJSON()`</a>.
  String get requestDetailsJson => _wrapped.requestDetailsJson;
  set requestDetailsJson(String v) {
    _wrapped.requestDetailsJson = v;
  }
}

class DOMExceptionDetails {
  DOMExceptionDetails.fromJS(this._wrapped);

  DOMExceptionDetails({
    required String name,
    required String message,
  }) : _wrapped = $js.DOMExceptionDetails(
          name: name,
          message: message,
        );

  final $js.DOMExceptionDetails _wrapped;

  $js.DOMExceptionDetails get toJS => _wrapped;
}

class CreateResponseDetails {
  CreateResponseDetails.fromJS(this._wrapped);

  CreateResponseDetails({
    required int requestId,
    DOMExceptionDetails? error,
    String? responseJson,
  }) : _wrapped = $js.CreateResponseDetails(
          requestId: requestId,
          error: error?.toJS,
          responseJson: responseJson,
        );

  final $js.CreateResponseDetails _wrapped;

  $js.CreateResponseDetails get toJS => _wrapped;
}

class GetResponseDetails {
  GetResponseDetails.fromJS(this._wrapped);

  GetResponseDetails({
    required int requestId,
    DOMExceptionDetails? error,
    String? responseJson,
  }) : _wrapped = $js.GetResponseDetails(
          requestId: requestId,
          error: error?.toJS,
          responseJson: responseJson,
        );

  final $js.GetResponseDetails _wrapped;

  $js.GetResponseDetails get toJS => _wrapped;
}

class IsUvpaaResponseDetails {
  IsUvpaaResponseDetails.fromJS(this._wrapped);

  IsUvpaaResponseDetails({
    required int requestId,
    required bool isUvpaa,
  }) : _wrapped = $js.IsUvpaaResponseDetails(
          requestId: requestId,
          isUvpaa: isUvpaa,
        );

  final $js.IsUvpaaResponseDetails _wrapped;

  $js.IsUvpaaResponseDetails get toJS => _wrapped;
}
