import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSInstanceIDExtension on JSChrome {
  /// Use `chrome.instanceID` to access the Instance ID service.
  external JSInstanceID get instanceID;
}

@JS()
@staticInterop
class JSInstanceID {}

extension JSInstanceIDExtension on JSInstanceID {
  /// Retrieves an identifier for the app instance. The instance ID will be
  /// returned by the `callback`. The same ID will be returned as long as the
  /// application identity has not been revoked or expired.
  external JSPromise getID();

  /// Retrieves the time when the InstanceID has been generated. The creation
  /// time will be returned by the `callback`.
  external JSPromise getCreationTime();

  /// Return a token that allows the authorized entity to access the service
  /// defined by scope.
  external JSPromise getToken(GetTokenParams getTokenParams);

  /// Revokes a granted token.
  external JSPromise deleteToken(DeleteTokenParams deleteTokenParams);

  /// Resets the app instance identifier and revokes all tokens associated with
  /// it.
  external JSPromise deleteID();

  /// Fired when all the granted tokens need to be refreshed.
  external ChromeEvent get onTokenRefresh;
}

@JS()
@staticInterop
@anonymous
class GetTokenParams {
  external factory GetTokenParams(
    /// Identifies the entity that is authorized to access resources associated
    /// with this Instance ID. It can be a project ID from <a
    /// href='https://code.google.com/apis/console'>Google developer console</a>.
    JSString authorizedEntity,

    /// Identifies authorized actions that the authorized entity can take. E.g.
    /// for sending GCM messages, `GCM` scope should be used.
    JSString scope,

    /// Allows including a small number of string key/value pairs that will be
    /// associated with the token and may be used in processing the request.
    GetTokenParamsOptions? options,
  );
}

@JS()
@staticInterop
@anonymous
class DeleteTokenParams {
  external factory DeleteTokenParams(
    /// The authorized entity that is used to obtain the token.
    JSString authorizedEntity,

    /// The scope that is used to obtain the token.
    JSString scope,
  );
}

@JS()
@staticInterop
@anonymous
class GetTokenParamsOptions {
  external factory GetTokenParamsOptions();
}
