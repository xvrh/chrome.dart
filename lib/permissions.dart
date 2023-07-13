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
  Future<Permissions> getAll() {
    var $completer = Completer<Permissions>();
    $js.chrome.permissions.getAll((Permissions permissions) {
      $completer.complete(null);
    }.toJS);
    return $completer.future;
  }

  /// Checks if the extension has the specified permissions.
  Future<bool> contains(Permissions permissions) {
    var $completer = Completer<bool>();
    $js.chrome.permissions.contains(
      permissions.toJS,
      (bool result) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Requests access to the specified permissions, displaying a prompt to the
  /// user if necessary. These permissions must either be defined in the
  /// `optional_permissions` field of the manifest or be required permissions
  /// that were withheld by the user. Paths on origin patterns will be ignored.
  /// You can request subsets of optional origin permissions; for example, if
  /// you specify `*://*/*` in the `optional_permissions` section of the
  /// manifest, you can request `http://example.com/`. If there are any problems
  /// requesting the permissions, [runtime.lastError] will be set.
  Future<bool> request(Permissions permissions) {
    var $completer = Completer<bool>();
    $js.chrome.permissions.request(
      permissions.toJS,
      (bool granted) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Removes access to the specified permissions. If there are any problems
  /// removing the permissions, [runtime.lastError] will be set.
  Future<bool> remove(Permissions permissions) {
    var $completer = Completer<bool>();
    $js.chrome.permissions.remove(
      permissions.toJS,
      (bool removed) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Fired when the extension acquires new permissions.
  Stream<Permissions> get onAdded => throw UnimplementedError();

  /// Fired when access to permissions has been removed from the extension.
  Stream<Permissions> get onRemoved => throw UnimplementedError();
}

class Permissions {
  Permissions.fromJS(this._wrapped);

  Permissions({
    List<String>? permissions,
    List<String>? origins,
  }) : _wrapped = $js.Permissions()
          ..permissions = throw UnimplementedError()
          ..origins = throw UnimplementedError();

  final $js.Permissions _wrapped;

  $js.Permissions get toJS => _wrapped;

  /// List of named permissions (does not include hosts or origins).
  List<String>? get permissions =>
      _wrapped.permissions?.toDart.cast<String>().map((e) => e).toList();
  set permissions(List<String>? v) {
    _wrapped.permissions = throw UnimplementedError();
  }

  /// The list of host permissions, including those specified in the
  /// `optional_permissions` or `permissions` keys in the manifest, and those
  /// associated with [Content Scripts](content_scripts).
  List<String>? get origins =>
      _wrapped.origins?.toDart.cast<String>().map((e) => e).toList();
  set origins(List<String>? v) {
    _wrapped.origins = throw UnimplementedError();
  }
}
