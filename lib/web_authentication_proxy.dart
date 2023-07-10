import 'chrome.dart';
export 'chrome.dart';

final _webAuthenticationProxy = ChromeWebAuthenticationProxy._();

extension ChromeChromeWebAuthenticationProxyExtension on Chrome {
  ChromeWebAuthenticationProxy get webAuthenticationProxy =>
      _webAuthenticationProxy;
}

class ChromeWebAuthenticationProxy {
  ChromeWebAuthenticationProxy._();

  ///  Reports the result of a `navigator.credentials.create()`
  ///  call. The extension must call this for every
  ///  `onCreateRequest` event it has received, unless the request
  ///  was canceled (in which case, an `onRequestCanceled` event is
  ///  fired).
  void completeCreateRequest(details) => throw UnimplementedError();

  ///  Reports the result of a `navigator.credentials.get()` call.
  ///  The extension must call this for every `onGetRequest` event
  ///  it has received, unless the request was canceled (in which case, an
  ///  `onRequestCanceled` event is fired).
  void completeGetRequest(details) => throw UnimplementedError();

  ///  Reports the result of a
  ///  `PublicKeyCredential.isUserVerifyingPlatformAuthenticator()`
  ///  call. The extension must call this for every
  ///  `onIsUvpaaRequest` event it has received.
  void completeIsUvpaaRequest(details) => throw UnimplementedError();

  ///  Makes this extension the active Web Authentication API request proxy.
  ///
  ///  Remote desktop extensions typically call this method after detecting
  ///  attachment of a remote session to this host. Once this method returns
  ///  without error, regular processing of WebAuthn requests is suspended, and
  ///  events from this extension API are raised.
  ///
  ///  This method fails with an error if a different extension is already
  ///  attached.
  ///
  ///  The attached extension must call `detach()` once the remote
  ///  desktop session has ended in order to resume regular WebAuthn request
  ///  processing. Extensions automatically become detached if they are
  ///  unloaded.
  ///
  ///  Refer to the `onRemoteSessionStateChange` event for signaling
  ///  a change of remote session attachment from a native application to to
  ///  the (possibly suspended) extension.
  void attach() => throw UnimplementedError();

  ///  Removes this extension from being the active Web Authentication API
  ///  request proxy.
  ///
  ///  This method is typically called when the extension detects that a remote
  ///  desktop session was terminated. Once this method returns, the extension
  ///  ceases to be the active Web Authentication API request proxy.
  ///
  ///  Refer to the `onRemoteSessionStateChange` event for signaling
  ///  a change of remote session attachment from a native application to to
  ///  the (possibly suspended) extension.
  void detach() => throw UnimplementedError();

  ///  A native application associated with this extension can cause this
  ///  event to be fired by writing to a file with a name equal to the
  ///  extension's ID in a directory named
  ///  `WebAuthenticationProxyRemoteSessionStateChange` inside the
  ///  <a
  ///
  /// href="https://chromium.googlesource.com/chromium/src/+/main/docs/user_data_dir.md#default-location">default
  ///  user data directory</a>
  ///
  ///  The contents of the file should be empty. I.e., it is not necessary to
  ///  change the contents of the file in order to trigger this event.
  ///
  ///  The native host application may use this event mechanism to signal a
  ///  possible remote session state change (i.e. from detached to attached, or
  ///  vice versa) while the extension service worker is possibly suspended. In
  ///  the handler for this event, the extension can call the
  ///  `attach()` or `detach()` API methods accordingly.
  ///
  ///  The event listener must be registered synchronously at load time.
  Stream get onRemoteSessionStateChange => throw UnimplementedError();

  ///  Fires when a WebAuthn `navigator.credentials.create()` call
  ///  occurs. The extension must supply a response by calling
  ///  `completeCreateRequest()` with the `requestId` from
  ///  `requestInfo`.
  Stream get onCreateRequest => throw UnimplementedError();

  ///  Fires when a WebAuthn navigator.credentials.get() call occurs. The
  ///  extension must supply a response by calling
  ///  `completeGetRequest()` with the `requestId` from
  ///  `requestInfo`
  Stream get onGetRequest => throw UnimplementedError();

  ///  Fires when a
  ///  `PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable()`
  ///  call occurs. The extension must supply a response by calling
  ///  `completeIsUvpaaRequest()` with the `requestId`
  ///  from `requestInfo`
  Stream get onIsUvpaaRequest => throw UnimplementedError();

  ///  Fires when a `onCreateRequest` or `onGetRequest`
  ///  event is canceled (because the WebAuthn request was aborted by the
  ///  caller, or because it timed out). When receiving this event, the
  ///  extension should cancel processing of the corresponding request on the
  ///  client side. Extensions cannot complete a request once it has been
  ///  canceled.
  Stream get onRequestCanceled => throw UnimplementedError();
}
