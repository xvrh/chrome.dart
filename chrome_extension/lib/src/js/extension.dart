import 'dart:js_interop';

import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSExtensionExtension on JSChrome {
  /// The `chrome.extension` API has utilities that can be used by any extension
  /// page. It includes support for exchanging messages between an extension and
  /// its content scripts or between extensions, as described in detail in
  /// [Message Passing](messaging).
  external JSExtension get extension;
}

@JS()
@staticInterop
class JSExtension {}

extension JSExtensionExtension on JSExtension {
  /// Sends a single request to other listeners within the extension. Similar to
  /// [runtime.connect], but only sends a single request with an optional
  /// response. The [extension.onRequest] event is fired in each page of the
  /// extension.
  external void sendRequest(
    /// The extension ID of the extension you want to connect to. If omitted,
    /// default is your own extension.
    String? extensionId,
    JSAny request,
    JSFunction? callback,
  );

  /// Converts a relative path within an extension install directory to a
  /// fully-qualified URL.
  external String getURL(

      /// A path to a resource within an extension expressed relative to its
      /// install directory.
      String path);

  /// Returns an array of the JavaScript 'window' objects for each of the pages
  /// running inside the current extension.
  external JSArray getViews(GetViewsFetchProperties? fetchProperties);

  /// Returns the JavaScript 'window' object for the background page running
  /// inside the current extension. Returns null if the extension has no
  /// background page.
  external JSObject? getBackgroundPage();

  /// Returns an array of the JavaScript 'window' objects for each of the tabs
  /// running inside the current extension. If `windowId` is specified, returns
  /// only the 'window' objects of tabs attached to the specified window.
  external JSArray getExtensionTabs(int? windowId);

  /// Retrieves the state of the extension's access to Incognito-mode. This
  /// corresponds to the user-controlled per-extension 'Allowed in Incognito'
  /// setting accessible via the chrome://extensions page.
  external void isAllowedIncognitoAccess(JSFunction callback);

  /// Retrieves the state of the extension's access to the 'file://' scheme.
  /// This corresponds to the user-controlled per-extension 'Allow access to
  /// File URLs' setting accessible via the chrome://extensions page.
  external void isAllowedFileSchemeAccess(JSFunction callback);

  /// Sets the value of the ap CGI parameter used in the extension's update URL.
  ///  This value is ignored for extensions that are hosted in the Chrome
  /// Extension Gallery.
  external void setUpdateUrlData(String data);

  /// Fired when a request is sent from either an extension process or a content
  /// script.
  external ChromeEvent get onRequest;

  /// Fired when a request is sent from another extension.
  external ChromeEvent get onRequestExternal;

  /// Set for the lifetime of a callback if an ansychronous extension api has
  /// resulted in an error. If no error has occured lastError will be
  /// [undefined].
  external ExtensionLastError? get lastError;

  /// True for content scripts running inside incognito tabs, and for extension
  /// pages running inside an incognito process. The latter only applies to
  /// extensions with 'split' incognito_behavior.
  external bool? get inIncognitoContext;
}

/// The type of extension view.
typedef ViewType = String;

@JS()
@staticInterop
@anonymous
class GetViewsFetchProperties {
  external factory GetViewsFetchProperties({
    /// The type of view to get. If omitted, returns all views (including
    /// background pages and tabs).
    ViewType? type,

    /// The window to restrict the search to. If omitted, returns all views.
    int? windowId,

    /// Find a view according to a tab id. If this field is omitted, returns all
    /// views.
    int? tabId,
  });
}

@JS()
@staticInterop
class ExtensionLastError {}

extension ExtensionLastErrorExtension on ExtensionLastError {
  /// Description of the error that has taken place.
  external String message;
}
