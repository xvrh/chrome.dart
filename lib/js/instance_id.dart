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
  external JSPromise getToken(JSObject getTokenParams);

  /// Revokes a granted token.
  external JSPromise deleteToken(JSObject deleteTokenParams);

  /// Resets the app instance identifier and revokes all tokens associated with
  /// it.
  external JSPromise deleteID();

  /// Fired when all the granted tokens need to be refreshed.
  external ChromeEvent get onTokenRefresh;
}
