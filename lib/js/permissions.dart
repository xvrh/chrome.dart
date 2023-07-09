import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSPermissionsExtension on JSChrome {
  /// Use the `chrome.permissions` API to request <a
  /// href='permissions#manifest'>declared optional permissions</a> at run time
  /// rather than install time, so users understand why the permissions are
  /// needed and grant only those that are necessary.
  external JSPermissions get Permissions;
}

@JS()
@staticInterop
class JSPermissions {}

extension JSPermissionsExtension on JSPermissions {
  /// Gets the extension's current set of permissions.
  external void getAll();

  /// Checks if the extension has the specified permissions.
  external void contains();

  /// Requests access to the specified permissions, displaying a prompt to the
  /// user if necessary. These permissions must either be defined in the
  /// `optional_permissions` field of the manifest or be required permissions
  /// that were withheld by the user. Paths on origin patterns will be ignored.
  /// You can request subsets of optional origin permissions; for example, if
  /// you specify `*://*/*` in the `optional_permissions` section of the
  /// manifest, you can request `http://example.com/`. If there are any problems
  /// requesting the permissions, $(ref:runtime.lastError) will be set.
  external void request();

  /// Removes access to the specified permissions. If there are any problems
  /// removing the permissions, $(ref:runtime.lastError) will be set.
  external void remove();

  /// Fired when the extension acquires new permissions.
  external ChromeEvent get onAdded;

  /// Fired when access to permissions has been removed from the extension.
  external ChromeEvent get onRemoved;
}
