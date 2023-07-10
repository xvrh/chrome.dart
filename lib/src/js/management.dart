import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSManagementExtension on JSChrome {
  /// The `chrome.management` API provides ways to manage the list of
  /// extensions/apps that are installed and running. It is particularly useful
  /// for extensions that <a href='override'>override</a> the built-in New Tab
  /// page.
  external JSManagement get management;
}

@JS()
@staticInterop
class JSManagement {}

extension JSManagementExtension on JSManagement {
  /// Returns a list of information about installed extensions and apps.
  external JSPromise getAll();

  /// Returns information about the installed extension, app, or theme that has
  /// the given ID.
  external JSPromise get(String id);

  /// Returns information about the calling extension, app, or theme. Note: This
  /// function can be used without requesting the 'management' permission in the
  /// manifest.
  external JSPromise getSelf();

  /// Returns a list of <a href='permission_warnings'>permission warnings</a>
  /// for the given extension id.
  external JSPromise getPermissionWarningsById(String id);

  /// Returns a list of <a href='permission_warnings'>permission warnings</a>
  /// for the given extension manifest string. Note: This function can be used
  /// without requesting the 'management' permission in the manifest.
  external JSPromise getPermissionWarningsByManifest(String manifestStr);

  /// Enables or disables an app or extension. In most cases this function must
  /// be called in the context of a user gesture (e.g. an onclick handler for a
  /// button), and may present the user with a native confirmation UI as a way
  /// of preventing abuse.
  external JSPromise setEnabled(
    String id,
    bool enabled,
  );

  /// Uninstalls a currently installed app or extension. Note: This function
  /// does not work in managed environments when the user is not allowed to
  /// uninstall the specified extension/app. If the uninstall fails (e.g. the
  /// user cancels the dialog) the promise will be rejected or the callback will
  /// be called with $(ref:runtime.lastError) set.
  external JSPromise uninstall(
    String id,
    UninstallOptions? options,
  );

  /// Uninstalls the calling extension. Note: This function can be used without
  /// requesting the 'management' permission in the manifest. This function does
  /// not work in managed environments when the user is not allowed to uninstall
  /// the specified extension/app.
  external JSPromise uninstallSelf(UninstallOptions? options);

  /// Launches an application.
  external JSPromise launchApp(String id);

  /// Display options to create shortcuts for an app. On Mac, only packaged app
  /// shortcuts can be created.
  external JSPromise createAppShortcut(String id);

  /// Set the launch type of an app.
  external JSPromise setLaunchType(
    String id,
    LaunchType launchType,
  );

  /// Generate an app for a URL. Returns the generated bookmark app.
  external JSPromise generateAppForLink(
    String url,
    String title,
  );

  /// Checks if the replacement android app can be installed. Errors generated
  /// by this API are reported by setting $(ref:runtime.lastError) and executing
  /// the function's regular callback.
  external JSPromise canInstallReplacementAndroidApp();

  /// Prompts the user to install the replacement Android app from the manifest.
  /// Errors generated by this API are reported by setting
  /// $(ref:runtime.lastError) and executing the function's regular callback.
  external JSPromise installReplacementAndroidApp();

  /// Launches the replacement_web_app specified in the manifest. Prompts the
  /// user to install if not already installed.
  external JSPromise installReplacementWebApp();

  /// Fired when an app or extension has been installed.
  external ChromeEvent get onInstalled;

  /// Fired when an app or extension has been uninstalled.
  external ChromeEvent get onUninstalled;

  /// Fired when an app or extension has been enabled.
  external ChromeEvent get onEnabled;

  /// Fired when an app or extension has been disabled.
  external ChromeEvent get onDisabled;
}

/// These are all possible app launch types.
typedef LaunchType = JSString;

/// A reason the item is disabled.
typedef ExtensionDisabledReason = JSString;

/// The type of this extension, app, or theme.
typedef ExtensionType = JSString;

/// How the extension was installed. One of
/// `admin`: The extension was installed because of an administrative policy,
/// `development`: The extension was loaded unpacked in developer mode,
/// `normal`: The extension was installed normally via a .crx file,
/// `sideload`: The extension was installed by other software on the machine,
/// `other`: The extension was installed by other means.
typedef ExtensionInstallType = JSString;

@JS()
@staticInterop
class IconInfo {}

extension IconInfoExtension on IconInfo {
  /// A number representing the width and height of the icon. Likely values
  /// include (but are not limited to) 128, 48, 24, and 16.
  external int size;

  /// The URL for this icon image. To display a grayscale version of the icon
  /// (to indicate that an extension is disabled, for example), append
  /// `?grayscale=true` to the URL.
  external String url;
}

@JS()
@staticInterop
class ExtensionInfo {}

extension ExtensionInfoExtension on ExtensionInfo {
  /// The extension's unique identifier.
  external String id;

  /// The name of this extension, app, or theme.
  external String name;

  /// A short version of the name of this extension, app, or theme.
  external String shortName;

  /// The description of this extension, app, or theme.
  external String description;

  /// The <a href='manifest/version'>version</a> of this extension, app, or
  /// theme.
  external String version;

  /// The <a href='manifest/version#version_name'>version name</a> of this
  /// extension, app, or theme if the manifest specified one.
  external String? versionName;

  /// Whether this extension can be disabled or uninstalled by the user.
  external bool mayDisable;

  /// Whether this extension can be enabled by the user. This is only returned
  /// for extensions which are not enabled.
  external bool? mayEnable;

  /// Whether it is currently enabled or disabled.
  external bool enabled;

  /// A reason the item is disabled.
  external ExtensionDisabledReason? disabledReason;

  /// True if this is an app.
  external bool isApp;

  /// The type of this extension, app, or theme.
  external ExtensionType type;

  /// The launch url (only present for apps).
  external String? appLaunchUrl;

  /// The URL of the homepage of this extension, app, or theme.
  external String? homepageUrl;

  /// The update URL of this extension, app, or theme.
  external String? updateUrl;

  /// Whether the extension, app, or theme declares that it supports offline.
  external bool offlineEnabled;

  /// The url for the item's options page, if it has one.
  external String optionsUrl;

  /// A list of icon information. Note that this just reflects what was declared
  /// in the manifest, and the actual image at that url may be larger or smaller
  /// than what was declared, so you might consider using explicit width and
  /// height attributes on img tags referencing these images. See the <a
  /// href='manifest/icons'>manifest documentation on icons</a> for more
  /// details.
  external JSArray? icons;

  /// Returns a list of API based permissions.
  external JSArray permissions;

  /// Returns a list of host based permissions.
  external JSArray hostPermissions;

  /// How the extension was installed.
  external ExtensionInstallType installType;

  /// The app launch type (only present for apps).
  external LaunchType? launchType;

  /// The currently available launch types (only present for apps).
  external JSArray? availableLaunchTypes;
}

@JS()
@staticInterop
class UninstallOptions {}

extension UninstallOptionsExtension on UninstallOptions {
  /// Whether or not a confirm-uninstall dialog should prompt the user. Defaults
  /// to false for self uninstalls. If an extension uninstalls another
  /// extension, this parameter is ignored and the dialog is always shown.
  external bool? showConfirmDialog;
}
