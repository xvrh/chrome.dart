import 'chrome.dart';
export 'chrome.dart';

final _instanceID = ChromeInstanceID._();

extension ChromeChromeInstanceIDExtension on Chrome {
  ChromeInstanceID get instanceID => _instanceID;
}

class ChromeInstanceID {
  ChromeInstanceID._();

  /// Retrieves an identifier for the app instance. The instance ID will be
  /// returned by the `callback`. The same ID will be returned as long as the
  /// application identity has not been revoked or expired.
  void getID() => throw UnimplementedError();

  /// Retrieves the time when the InstanceID has been generated. The creation
  /// time will be returned by the `callback`.
  void getCreationTime() => throw UnimplementedError();

  /// Return a token that allows the authorized entity to access the service
  /// defined by scope.
  void getToken(getTokenParams) => throw UnimplementedError();

  /// Revokes a granted token.
  void deleteToken(deleteTokenParams) => throw UnimplementedError();

  /// Resets the app instance identifier and revokes all tokens associated with
  /// it.
  void deleteID() => throw UnimplementedError();

  /// Fired when all the granted tokens need to be refreshed.
  Stream get onTokenRefresh => throw UnimplementedError();
}
