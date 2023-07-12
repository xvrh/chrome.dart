import 'src/internal_helpers.dart';
import 'src/js/instance_id.dart' as $js;
export 'chrome.dart';

final _instanceID = ChromeInstanceID._();

extension ChromeInstanceIDExtension on Chrome {
  ChromeInstanceID get instanceID => _instanceID;
}

class ChromeInstanceID {
  ChromeInstanceID._();

  /// Retrieves an identifier for the app instance. The instance ID will be
  /// returned by the `callback`. The same ID will be returned as long as the
  /// application identity has not been revoked or expired.
  Future<String> getID() => throw UnimplementedError();

  /// Retrieves the time when the InstanceID has been generated. The creation
  /// time will be returned by the `callback`.
  Future<double> getCreationTime() => throw UnimplementedError();

  /// Return a token that allows the authorized entity to access the service
  /// defined by scope.
  Future<String> getToken(GetTokenParams getTokenParams) =>
      throw UnimplementedError();

  /// Revokes a granted token.
  Future<void> deleteToken(DeleteTokenParams deleteTokenParams) =>
      throw UnimplementedError();

  /// Resets the app instance identifier and revokes all tokens associated with
  /// it.
  Future<void> deleteID() => throw UnimplementedError();

  /// Fired when all the granted tokens need to be refreshed.
  Stream<void> get onTokenRefresh => throw UnimplementedError();
}

class GetTokenParams {
  GetTokenParams.fromJS(this._wrapped);

  final $js.GetTokenParams _wrapped;

  $js.GetTokenParams get toJS => _wrapped;
}

class DeleteTokenParams {
  DeleteTokenParams.fromJS(this._wrapped);

  final $js.DeleteTokenParams _wrapped;

  $js.DeleteTokenParams get toJS => _wrapped;
}

class GetTokenParamsOptions {
  GetTokenParamsOptions.fromJS(this._wrapped);

  final $js.GetTokenParamsOptions _wrapped;

  $js.GetTokenParamsOptions get toJS => _wrapped;
}
