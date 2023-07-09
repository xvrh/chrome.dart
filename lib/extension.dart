import 'chrome.dart';
export 'chrome.dart';

final _extension = ChromeExtension._();

extension ChromeChromeExtensionExtension on Chrome {
  ChromeExtension get extension => _extension;
}

class ChromeExtension {
  ChromeExtension._();

  /// Sends a single request to other listeners within the extension. Similar to
  /// $(ref:runtime.connect), but only sends a single request with an optional
  /// response. The $(ref:extension.onRequest) event is fired in each page of
  /// the extension.
  void sendRequest(
    extensionId,
    request,
  ) =>
      throw UnimplementedError();

  /// Converts a relative path within an extension install directory to a
  /// fully-qualified URL.
  void getURL(path) => throw UnimplementedError();

  /// Returns an array of the JavaScript 'window' objects for each of the pages
  /// running inside the current extension.
  void getViews(fetchProperties) => throw UnimplementedError();

  /// Returns the JavaScript 'window' object for the background page running
  /// inside the current extension. Returns null if the extension has no
  /// background page.
  void getBackgroundPage() => throw UnimplementedError();

  /// Returns an array of the JavaScript 'window' objects for each of the tabs
  /// running inside the current extension. If `windowId` is specified, returns
  /// only the 'window' objects of tabs attached to the specified window.
  void getExtensionTabs(windowId) => throw UnimplementedError();

  /// Retrieves the state of the extension's access to Incognito-mode. This
  /// corresponds to the user-controlled per-extension 'Allowed in Incognito'
  /// setting accessible via the chrome://extensions page.
  void isAllowedIncognitoAccess() => throw UnimplementedError();

  /// Retrieves the state of the extension's access to the 'file://' scheme.
  /// This corresponds to the user-controlled per-extension 'Allow access to
  /// File URLs' setting accessible via the chrome://extensions page.
  void isAllowedFileSchemeAccess() => throw UnimplementedError();

  /// Sets the value of the ap CGI parameter used in the extension's update URL.
  ///  This value is ignored for extensions that are hosted in the Chrome
  /// Extension Gallery.
  void setUpdateUrlData(data) => throw UnimplementedError();

  /// Fired when a request is sent from either an extension process or a content
  /// script.
  Stream get onRequest => throw UnimplementedError();

  /// Fired when a request is sent from another extension.
  Stream get onRequestExternal => throw UnimplementedError();
}

/// The type of extension view.
enum ViewType {
  tab('tab'),
  popup('popup');

  const ViewType(this.value);

  final String value;
}
