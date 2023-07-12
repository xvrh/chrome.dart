import 'src/internal_helpers.dart';
import 'runtime.dart';
import 'src/js/extension.dart' as $js;
export 'chrome.dart';

final _extension = ChromeExtension._();

extension ChromeExtensionExtension on Chrome {
  ChromeExtension get extension => _extension;
}

class ChromeExtension {
  ChromeExtension._();

  /// Sends a single request to other listeners within the extension. Similar to
  /// [runtime.connect], but only sends a single request with an optional
  /// response. The [extension.onRequest] event is fired in each page of the
  /// extension.
  Future<JSAny> sendRequest(
    String? extensionId,
    JSAny request,
  ) =>
      throw UnimplementedError();

  /// Converts a relative path within an extension install directory to a
  /// fully-qualified URL.
  String getURL(String path) => throw UnimplementedError();

  /// Returns an array of the JavaScript 'window' objects for each of the pages
  /// running inside the current extension.
  List<JSObject> getViews(GetViewsFetchProperties? fetchProperties) =>
      throw UnimplementedError();

  /// Returns the JavaScript 'window' object for the background page running
  /// inside the current extension. Returns null if the extension has no
  /// background page.
  JSObject? getBackgroundPage() => throw UnimplementedError();

  /// Returns an array of the JavaScript 'window' objects for each of the tabs
  /// running inside the current extension. If `windowId` is specified, returns
  /// only the 'window' objects of tabs attached to the specified window.
  List<JSObject> getExtensionTabs(int? windowId) => throw UnimplementedError();

  /// Retrieves the state of the extension's access to Incognito-mode. This
  /// corresponds to the user-controlled per-extension 'Allowed in Incognito'
  /// setting accessible via the chrome://extensions page.
  Future<bool> isAllowedIncognitoAccess() => throw UnimplementedError();

  /// Retrieves the state of the extension's access to the 'file://' scheme.
  /// This corresponds to the user-controlled per-extension 'Allow access to
  /// File URLs' setting accessible via the chrome://extensions page.
  Future<bool> isAllowedFileSchemeAccess() => throw UnimplementedError();

  /// Sets the value of the ap CGI parameter used in the extension's update URL.
  ///  This value is ignored for extensions that are hosted in the Chrome
  /// Extension Gallery.
  void setUpdateUrlData(String data) => throw UnimplementedError();

  /// Set for the lifetime of a callback if an ansychronous extension api has
  /// resulted in an error. If no error has occured lastError will be
  /// [undefined].
  ExtensionLastError? get lastError =>
      $js.chrome.extension.lastError as dynamic;

  /// True for content scripts running inside incognito tabs, and for extension
  /// pages running inside an incognito process. The latter only applies to
  /// extensions with 'split' incognito_behavior.
  bool? get inIncognitoContext =>
      $js.chrome.extension.inIncognitoContext as dynamic;

  /// Fired when a request is sent from either an extension process or a content
  /// script.
  Stream<OnRequestEvent> get onRequest => throw UnimplementedError();

  /// Fired when a request is sent from another extension.
  Stream<OnRequestExternalEvent> get onRequestExternal =>
      throw UnimplementedError();
}

/// The type of extension view.
enum ViewType {
  tab('tab'),
  popup('popup');

  const ViewType(this.value);

  final String value;

  String get toJS => value;
  static ViewType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class GetViewsFetchProperties {
  GetViewsFetchProperties.fromJS(this._wrapped);

  final $js.GetViewsFetchProperties _wrapped;

  $js.GetViewsFetchProperties get toJS => _wrapped;
}

class ExtensionLastError {
  ExtensionLastError.fromJS(this._wrapped);

  final $js.ExtensionLastError _wrapped;

  $js.ExtensionLastError get toJS => _wrapped;

  /// Description of the error that has taken place.
  String get message => _wrapped.message;
  set message(String v) {
    throw UnimplementedError();
  }
}

class OnRequestEvent {
  OnRequestEvent({
    required this.request,
    required this.sender,
    required this.sendResponse,
  });

  /// The request sent by the calling script.
  final JSAny? request;

  final MessageSender sender;

  /// Function to call (at most once) when you have a response. The argument
  /// should be any JSON-ifiable object, or undefined if there is no response.
  /// If you have more than one `onRequest` listener in the same document, then
  /// only one may send a response.
  final JSAny sendResponse;
}

class OnRequestExternalEvent {
  OnRequestExternalEvent({
    required this.request,
    required this.sender,
    required this.sendResponse,
  });

  /// The request sent by the calling script.
  final JSAny? request;

  final MessageSender sender;

  /// Function to call when you have a response. The argument should be any
  /// JSON-ifiable object, or undefined if there is no response.
  final JSAny sendResponse;
}
