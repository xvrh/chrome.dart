import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSBrowserActionExtension on JSChrome {
  /// Use browser actions to put icons in the main Google Chrome toolbar, to the
  /// right of the address bar. In addition to its <a
  /// href='browserAction#icon'>icon</a>, a browser action can have a <a
  /// href='browserAction#tooltip'>tooltip</a>, a <a
  /// href='browserAction#badge'>badge</a>, and a <a
  /// href='browserAction#popups'>popup</a>.
  external JSBrowserAction get browserAction;
}

@JS()
@staticInterop
class JSBrowserAction {}

extension JSBrowserActionExtension on JSBrowserAction {
  /// Sets the title of the browser action. This title appears in the tooltip.
  external JSPromise setTitle(JSObject details);

  /// Gets the title of the browser action.
  external JSPromise getTitle(TabDetails details);

  /// Sets the icon for the browser action. The icon can be specified as the
  /// path to an image file, as the pixel data from a canvas element, or as a
  /// dictionary of one of those. Either the `path` or the `imageData` property
  /// must be specified.
  external void setIcon(
    JSObject details,
    JSFunction callback,
  );

  /// Sets the HTML document to be opened as a popup when the user clicks the
  /// browser action icon.
  external JSPromise setPopup(JSObject details);

  /// Gets the HTML document that is set as the popup for this browser action.
  external JSPromise getPopup(TabDetails details);

  /// Sets the badge text for the browser action. The badge is displayed on top
  /// of the icon.
  external JSPromise setBadgeText(JSObject details);

  /// Gets the badge text of the browser action. If no tab is specified, the
  /// non-tab-specific badge text is returned.
  external JSPromise getBadgeText(TabDetails details);

  /// Sets the background color for the badge.
  external JSPromise setBadgeBackgroundColor(JSObject details);

  /// Gets the background color of the browser action.
  external JSPromise getBadgeBackgroundColor(TabDetails details);

  /// Enables the browser action for a tab. Defaults to enabled.
  external JSPromise enable(int tabId);

  /// Disables the browser action for a tab.
  external JSPromise disable(int tabId);

  /// Opens the extension popup window in the active window but does not grant
  /// tab permissions.
  external void openPopup(JSFunction callback);

  /// Fired when a browser action icon is clicked. Does not fire if the browser
  /// action has a popup.
  external ChromeEvent get onClicked;
}

@JS()
@staticInterop
class ColorArray {}

@JS()
@staticInterop
class ImageDataType {}

@JS()
@staticInterop
class TabDetails {
  /// The ID of the tab to query state for. If no tab is specified, the
  /// non-tab-specific state is returned.
  external int? get tabId;
}
