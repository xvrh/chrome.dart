import 'src/internal_helpers.dart';
import 'src/js/permissions.dart' as $js;
export 'chrome.dart';

final _permissions = ChromePermissions._();

extension ChromePermissionsExtension on Chrome {
  ChromePermissions get permissions => _permissions;
}

class ChromePermissions {
  ChromePermissions._();

  /// Gets the extension's current set of permissions.
  Future<Permissions> getAll() => throw UnimplementedError();

  /// Checks if the extension has the specified permissions.
  Future<bool> contains(Permissions permissions) => throw UnimplementedError();

  /// Requests access to the specified permissions, displaying a prompt to the
  /// user if necessary. These permissions must either be defined in the
  /// `optional_permissions` field of the manifest or be required permissions
  /// that were withheld by the user. Paths on origin patterns will be ignored.
  /// You can request subsets of optional origin permissions; for example, if
  /// you specify `*://*/*` in the `optional_permissions` section of the
  /// manifest, you can request `http://example.com/`. If there are any problems
  /// requesting the permissions, [runtime.lastError] will be set.
  Future<bool> request(Permissions permissions) => throw UnimplementedError();

  /// Removes access to the specified permissions. If there are any problems
  /// removing the permissions, [runtime.lastError] will be set.
  Future<bool> remove(Permissions permissions) => throw UnimplementedError();

  /// Fired when the extension acquires new permissions.
  Stream<Permissions> get onAdded => throw UnimplementedError();

  /// Fired when access to permissions has been removed from the extension.
  Stream<Permissions> get onRemoved => throw UnimplementedError();
}

class Permissions {
  Permissions.fromJS(this._wrapped);

  final $js.Permissions _wrapped;

  $js.Permissions get toJS => _wrapped;

  /// List of named permissions (does not include hosts or origins).
  List<String>? get permissions => throw UnimplementedError();
  set permissions(List<String>? v) {
    _wrapped.permissions = throw UnimplementedError();
  }

  /// The list of host permissions, including those specified in the
  /// `optional_permissions` or `permissions` keys in the manifest, and those
  /// associated with [Content Scripts](content_scripts).
  List<String>? get origins => throw UnimplementedError();
  set origins(List<String>? v) {
    _wrapped.origins = throw UnimplementedError();
  }
}
