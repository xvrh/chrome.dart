import 'dart:js_util';

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
  Future<String> getID() async {
    var $res = await promiseToFuture<String>($js.chrome.instanceId.getID());
    return $res;
  }

  /// Retrieves the time when the InstanceID has been generated. The creation
  /// time will be returned by the `callback`.
  Future<double> getCreationTime() async {
    var $res =
        await promiseToFuture<double>($js.chrome.instanceId.getCreationTime());
    return $res;
  }

  /// Return a token that allows the authorized entity to access the service
  /// defined by scope.
  /// [getTokenParams] Parameters for getToken.
  Future<String> getToken(GetTokenParams getTokenParams) async {
    var $res = await promiseToFuture<String>(
        $js.chrome.instanceId.getToken(getTokenParams.toJS));
    return $res;
  }

  /// Revokes a granted token.
  /// [deleteTokenParams] Parameters for deleteToken.
  Future<void> deleteToken(DeleteTokenParams deleteTokenParams) async {
    await promiseToFuture<void>(
        $js.chrome.instanceId.deleteToken(deleteTokenParams.toJS));
  }

  /// Resets the app instance identifier and revokes all tokens associated with
  /// it.
  Future<void> deleteID() async {
    await promiseToFuture<void>($js.chrome.instanceId.deleteID());
  }

  /// Fired when all the granted tokens need to be refreshed.
  Stream<void> get onTokenRefresh =>
      $js.chrome.instanceId.onTokenRefresh.asStream(($c) => () {
            $c.add(null);
          }.toJS);
}

class GetTokenParams {
  GetTokenParams.fromJS(this._wrapped);

  GetTokenParams({
    required String authorizedEntity,
    required String scope,
    Map? options,
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
