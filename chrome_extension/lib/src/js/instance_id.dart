import 'dart:js_interop';

import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSInstanceIdExtension on JSChrome {
  /// Use `chrome.instanceID` to access the Instance ID service.
  external JSInstanceId get instanceId;
}

@JS()
@staticInterop
class JSInstanceId {}

extension JSInstanceIdExtension on JSInstanceId {
  /// Retrieves an identifier for the app instance. The instance ID will be
  /// returned by the `callback`. The same ID will be returned as long as the
  /// application identity has not been revoked or expired.
  external void getID(JSFunction callback);

  /// Retrieves the time when the InstanceID has been generated. The creation
  /// time will be returned by the `callback`.
  external void getCreationTime(JSFunction callback);

  /// Return a token that allows the authorized entity to access the service
  /// defined by scope.
  external void getToken(
    GetTokenParams getTokenParams,
    JSFunction callback,
  );

  /// Revokes a granted token.
  external void deleteToken(
    DeleteTokenParams deleteTokenParams,
    JSFunction callback,
  );

  /// Resets the app instance identifier and revokes all tokens associated with
  /// it.
  external void deleteID(JSFunction callback);

  /// Fired when all the granted tokens need to be refreshed.
  external ChromeEvent get onTokenRefresh;
}

@JS()
@staticInterop
@anonymous
class GetTokenParams {
  external factory GetTokenParams({
    /// Identifies the entity that is authorized to access resources associated
    /// with this Instance ID. It can be a project ID from [Google developer
    /// console](https://code.google.com/apis/console).
    String authorizedEntity,

    /// Identifies authorized actions that the authorized entity can take. E.g.
    /// for sending GCM messages, `GCM` scope should be used.
    String scope,

    /// Allows including a small number of string key/value pairs that will be
    /// associated with the token and may be used in processing the request.
    GetTokenParamsOptions? options,
  });
}

@JS()
@staticInterop
@anonymous
class DeleteTokenParams {
  external factory DeleteTokenParams({
    /// The authorized entity that is used to obtain the token.
    String authorizedEntity,

    /// The scope that is used to obtain the token.
    String scope,
  });
}

@JS()
@staticInterop
@anonymous
class GetTokenParamsOptions {
  external factory GetTokenParamsOptions();
}
