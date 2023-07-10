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
  external JSPromise setTitle(SetTitleDetails details);

  /// Gets the title of the browser action.
  external JSPromise getTitle(TabDetails details);

  /// Sets the icon for the browser action. The icon can be specified as the
  /// path to an image file, as the pixel data from a canvas element, or as a
  /// dictionary of one of those. Either the `path` or the `imageData` property
  /// must be specified.
  external void setIcon(
    SetIconDetails details,
    JSFunction callback,
  );

  /// Sets the HTML document to be opened as a popup when the user clicks the
  /// browser action icon.
  external JSPromise setPopup(SetPopupDetails details);

  /// Gets the HTML document that is set as the popup for this browser action.
  external JSPromise getPopup(TabDetails details);

  /// Sets the badge text for the browser action. The badge is displayed on top
  /// of the icon.
  external JSPromise setBadgeText(SetBadgeTextDetails details);

  /// Gets the badge text of the browser action. If no tab is specified, the
  /// non-tab-specific badge text is returned.
  external JSPromise getBadgeText(TabDetails details);

  /// Sets the background color for the badge.
  external JSPromise setBadgeBackgroundColor(
      SetBadgeBackgroundColorDetails details);

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

@JS()
@staticInterop
class SetTitleDetails {
  /// The string the browser action should display when moused over.
  external String get title;

  /// Limits the change to when a particular tab is selected. Automatically
  /// resets when the tab is closed.
  external int? get tabId;
}

@JS()
@staticInterop
class SetIconDetails {
  /// Either an ImageData object or a dictionary {size -> ImageData}
  /// representing an icon to be set. If the icon is specified as a dictionary,
  /// the image used is chosen depending on the screen's pixel density. If the
  /// number of image pixels that fit into one screen space unit equals `scale`,
  /// then an image with size `scale` * n is selected, where <i>n</i> is the
  /// size of the icon in the UI. At least one image must be specified. Note
  /// that 'details.imageData = foo' is equivalent to 'details.imageData =
  /// {'16': foo}'
  external JSObject? get imageData;

  /// Either a relative image path or a dictionary {size -> relative image path}
  /// pointing to an icon to be set. If the icon is specified as a dictionary,
  /// the image used is chosen depending on the screen's pixel density. If the
  /// number of image pixels that fit into one screen space unit equals `scale`,
  /// then an image with size `scale` * n is selected, where <i>n</i> is the
  /// size of the icon in the UI. At least one image must be specified. Note
  /// that 'details.path = foo' is equivalent to 'details.path = {'16': foo}'
  external JSObject? get path;

  /// Limits the change to when a particular tab is selected. Automatically
  /// resets when the tab is closed.
  external int? get tabId;
}

@JS()
@staticInterop
class SetPopupDetails {
  /// Limits the change to when a particular tab is selected. Automatically
  /// resets when the tab is closed.
  external int? get tabId;

  /// The relative path to the HTML file to show in a popup. If set to the empty
  /// string (`''`), no popup is shown.
  external String get popup;
}

@JS()
@staticInterop
class SetBadgeTextDetails {
  /// Any number of characters can be passed, but only about four can fit into
  /// the space. If an empty string (`''`) is passed, the badge text is cleared.
  ///  If `tabId` is specified and `text` is null, the text for the specified
  /// tab is cleared and defaults to the global badge text.
  external String? get text;

  /// Limits the change to when a particular tab is selected. Automatically
  /// resets when the tab is closed.
  external int? get tabId;
}

@JS()
@staticInterop
class SetBadgeBackgroundColorDetails {
  /// An array of four integers in the range 0-255 that make up the RGBA color
  /// of the badge. Can also be a string with a CSS hex color value; for
  /// example, `#FF0000` or `#F00` (red). Renders colors at full opacity.
  external JSObject get color;

  /// Limits the change to when a particular tab is selected. Automatically
  /// resets when the tab is closed.
  external int? get tabId;
}
