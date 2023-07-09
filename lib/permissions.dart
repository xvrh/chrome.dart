import 'chrome.dart';
export 'chrome.dart';

final _permissions = ChromePermissions._();

extension ChromeChromePermissionsExtension on Chrome {
  ChromePermissions get permissions => _permissions;
}

class ChromePermissions {
  ChromePermissions._();

  /// Gets the extension's current set of permissions.
  void getAll() => throw UnimplementedError();

  /// Checks if the extension has the specified permissions.
  void contains(permissions) => throw UnimplementedError();

  /// Requests access to the specified permissions, displaying a prompt to the
  /// user if necessary. These permissions must either be defined in the
  /// `optional_permissions` field of the manifest or be required permissions
  /// that were withheld by the user. Paths on origin patterns will be ignored.
  /// You can request subsets of optional origin permissions; for example, if
  /// you specify `*://*/*` in the `optional_permissions` section of the
  /// manifest, you can request `http://example.com/`. If there are any problems
  /// requesting the permissions, $(ref:runtime.lastError) will be set.
  void request(permissions) => throw UnimplementedError();

  /// Removes access to the specified permissions. If there are any problems
  /// removing the permissions, $(ref:runtime.lastError) will be set.
  void remove(permissions) => throw UnimplementedError();

  /// Fired when the extension acquires new permissions.
  Stream get onAdded => throw UnimplementedError();

  /// Fired when access to permissions has been removed from the extension.
  Stream get onRemoved => throw UnimplementedError();
}
