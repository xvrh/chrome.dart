import 'src/internal_helpers.dart';
import 'src/js/instance_id.dart' as $js;

export 'src/chrome.dart' show chrome;

final _instanceId = ChromeInstanceId._();

extension ChromeInstanceIdExtension on Chrome {
  ChromeInstanceId get instanceId => _instanceId;
}

class ChromeInstanceId {
  ChromeInstanceId._();

  /// Retrieves an identifier for the app instance. The instance ID will be
  /// returned by the `callback`. The same ID will be returned as long as the
  /// application identity has not been revoked or expired.
  Future<String> getID() {
    var $completer = Completer<String>();
    $js.chrome.instanceId.getID((String instanceID) {
      $completer.complete(instanceID);
    }.toJS);
    return $completer.future;
  }

  /// Retrieves the time when the InstanceID has been generated. The creation
  /// time will be returned by the `callback`.
  Future<double> getCreationTime() {
    var $completer = Completer<double>();
    $js.chrome.instanceId.getCreationTime((double creationTime) {
      $completer.complete(creationTime);
    }.toJS);
    return $completer.future;
  }

  /// Return a token that allows the authorized entity to access the service
  /// defined by scope.
  Future<String> getToken(GetTokenParams getTokenParams) {
    var $completer = Completer<String>();
    $js.chrome.instanceId.getToken(
      getTokenParams.toJS,
      (String token) {
        $completer.complete(token);
      }.toJS,
    );
    return $completer.future;
  }

  /// Revokes a granted token.
  Future<void> deleteToken(DeleteTokenParams deleteTokenParams) {
    var $completer = Completer<void>();
    $js.chrome.instanceId.deleteToken(
      deleteTokenParams.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Resets the app instance identifier and revokes all tokens associated with
  /// it.
  Future<void> deleteID() {
    var $completer = Completer<void>();
    $js.chrome.instanceId.deleteID(() {
      $completer.complete(null);
    }.toJS);
    return $completer.future;
  }

  /// Fired when all the granted tokens need to be refreshed.
  Stream<void> get onTokenRefresh => throw UnimplementedError();
}

class GetTokenParams {
  GetTokenParams.fromJS(this._wrapped);

  GetTokenParams({
    required String authorizedEntity,
    required String scope,
    GetTokenParamsOptions? options,
  }) : _wrapped = $js.GetTokenParams(
          authorizedEntity: authorizedEntity,
          scope: scope,
          options: options?.toJS,
        );

  final $js.GetTokenParams _wrapped;

  $js.GetTokenParams get toJS => _wrapped;
}

class DeleteTokenParams {
  DeleteTokenParams.fromJS(this._wrapped);

  DeleteTokenParams({
    required String authorizedEntity,
    required String scope,
  }) : _wrapped = $js.DeleteTokenParams(
          authorizedEntity: authorizedEntity,
          scope: scope,
        );

  final $js.DeleteTokenParams _wrapped;

  $js.DeleteTokenParams get toJS => _wrapped;
}

class GetTokenParamsOptions {
  GetTokenParamsOptions.fromJS(this._wrapped);

  GetTokenParamsOptions() : _wrapped = $js.GetTokenParamsOptions();

  final $js.GetTokenParamsOptions _wrapped;

  $js.GetTokenParamsOptions get toJS => _wrapped;
}
