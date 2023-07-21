import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/permissions.dart' as $js;

export 'src/chrome.dart' show chrome;

final _permissions = ChromePermissions._();

extension ChromePermissionsExtension on Chrome {
  ChromePermissions get permissions => _permissions;
}

class ChromePermissions {
  ChromePermissions._();

  /// Gets the extension's current set of permissions.
  Future<Permissions> getAll() async {
    var $res =
        await promiseToFuture<$js.Permissions>($js.chrome.permissions.getAll());
    return Permissions.fromJS($res);
  }

  /// Checks if the extension has the specified permissions.
  Future<bool> contains(Permissions permissions) async {
    var $res = await promiseToFuture<bool>(
        $js.chrome.permissions.contains(permissions.toJS));
    return $res;
  }

  /// Requests access to the specified permissions, displaying a prompt to the
  /// user if necessary. These permissions must either be defined in the
  /// `optional_permissions` field of the manifest or be required permissions
  /// that were withheld by the user. Paths on origin patterns will be ignored.
  /// You can request subsets of optional origin permissions; for example, if
  /// you specify `*://*/*` in the `optional_permissions` section of the
  /// manifest, you can request `http://example.com/`. If there are any problems
  /// requesting the permissions, [runtime.lastError] will be set.
  Future<bool> request(Permissions permissions) async {
    var $res = await promiseToFuture<bool>(
        $js.chrome.permissions.request(permissions.toJS));
    return $res;
  }

  /// Removes access to the specified permissions. If there are any problems
  /// removing the permissions, [runtime.lastError] will be set.
  Future<bool> remove(Permissions permissions) async {
    var $res = await promiseToFuture<bool>(
        $js.chrome.permissions.remove(permissions.toJS));
    return $res;
  }

  /// Fired when the extension acquires new permissions.
  Stream<Permissions> get onAdded => $js.chrome.permissions.onAdded
      .asStream(($c) => ($js.Permissions permissions) {
            $c.add(Permissions.fromJS(permissions));
          }.toJS);

  /// Fired when access to permissions has been removed from the extension.
  Stream<Permissions> get onRemoved => $js.chrome.permissions.onRemoved
      .asStream(($c) => ($js.Permissions permissions) {
            $c.add(Permissions.fromJS(permissions));
          }.toJS);
}

class Permissions {
  Permissions.fromJS(this._wrapped);

  Permissions({
    List<String>? permissions,
    List<String>? origins,
  }) : _wrapped = $js.Permissions(
          permissions: permissions?.toJSArray((e) => e),
          origins: origins?.toJSArray((e) => e),
        );

  final $js.Permissions _wrapped;

  $js.Permissions get toJS => _wrapped;
}
