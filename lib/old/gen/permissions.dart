/* This file has been generated from permissions.json - do not edit */

/**
 * Use the `chrome.permissions` API to request [declared optional
 * permissions](permissions#manifest) at run time rather than install time, so
 * users understand why the permissions are needed and grant only those that are
 * necessary.
 */
library chrome.permissions;

import '../src/common.dart';

/**
 * Accessor for the `chrome.permissions` namespace.
 */
final ChromePermissions permissions = ChromePermissions._();

class ChromePermissions extends ChromeApi {
  JsObject get _permissions => chrome['permissions'];

  /**
   * Fired when the extension acquires new permissions.
   */
  Stream<Permissions> get onAdded => _onAdded.stream;
  late ChromeStreamController<Permissions> _onAdded;

  /**
   * Fired when access to permissions has been removed from the extension.
   */
  Stream<Permissions> get onRemoved => _onRemoved.stream;
  late ChromeStreamController<Permissions> _onRemoved;

  ChromePermissions._() {
    var getApi = () => _permissions;
    _onAdded = ChromeStreamController<Permissions>.oneArg(getApi, 'onAdded', _createPermissions);
    _onRemoved = ChromeStreamController<Permissions>.oneArg(getApi, 'onRemoved', _createPermissions);
  }

  bool get available => _permissions != null;

  /**
   * Gets the extension's current set of permissions.
   */
  void getAll() {
    if (_permissions == null) _throwNotAvailable();

    _permissions.callMethod('getAll');
  }

  /**
   * Checks if the extension has the specified permissions.
   */
  void contains(Permissions permissions) {
    if (_permissions == null) _throwNotAvailable();

    _permissions.callMethod('contains', [jsify(permissions)]);
  }

  /**
   * Requests access to the specified permissions, displaying a prompt to the
   * user if necessary. These permissions must either be defined in the
   * `optional_permissions` field of the manifest or be required permissions
   * that were withheld by the user. Paths on origin patterns will be ignored.
   * You can request subsets of optional origin permissions; for example, if you
   * specify `*:///\*` in the `optional_permissions` section of the manifest,
   * you can request `http://example.com/`. If there are any problems requesting
   * the permissions, [runtime.lastError] will be set.
   */
  void request(Permissions permissions) {
    if (_permissions == null) _throwNotAvailable();

    _permissions.callMethod('request', [jsify(permissions)]);
  }

  /**
   * Removes access to the specified permissions. If there are any problems
   * removing the permissions, [runtime.lastError] will be set.
   */
  void remove(Permissions permissions) {
    if (_permissions == null) _throwNotAvailable();

    _permissions.callMethod('remove', [jsify(permissions)]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.permissions' is not available");
  }
}

class Permissions extends ChromeObject {
  Permissions({List<String>? permissions, List<String>? origins}) {
    if (permissions != null) this.permissions = permissions;
    if (origins != null) this.origins = origins;
  }
  Permissions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * List of named permissions (does not include hosts or origins).
   */
  List<String> get permissions => listify(jsProxy['permissions']);
  set permissions(List<String> value) => jsProxy['permissions'] = jsify(value);

  /**
   * The list of host permissions, including those specified in the
   * `optional_permissions` or `permissions` keys in the manifest, and those
   * associated with [Content Scripts](content_scripts).
   */
  List<String> get origins => listify(jsProxy['origins']);
  set origins(List<String> value) => jsProxy['origins'] = jsify(value);
}

Permissions _createPermissions(JsObject jsProxy) => Permissions.fromProxy(jsProxy);
