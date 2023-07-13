import 'dart:js_interop';

import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSBrowserActionExtension on JSChrome {
  /// Use browser actions to put icons in the main Google Chrome toolbar, to the
  /// right of the address bar. In addition to its [icon](browserAction#icon), a
  /// browser action can have a [tooltip](browserAction#tooltip), a
  /// [badge](browserAction#badge), and a [popup](browserAction#popups).
  external JSBrowserAction get browserAction;
}

@JS()
@staticInterop
class JSBrowserAction {}

extension JSBrowserActionExtension on JSBrowserAction {
  /// Sets the title of the browser action. This title appears in the tooltip.
  external void setTitle(
    SetTitleDetails details,
    JSFunction callback,
  );

  /// Gets the title of the browser action.
  external void getTitle(
    TabDetails details,
    JSFunction callback,
  );

  /// Sets the icon for the browser action. The icon can be specified as the
  /// path to an image file, as the pixel data from a canvas element, or as a
  /// dictionary of one of those. Either the `path` or the `imageData` property
  /// must be specified.
  external void setIcon(
    SetIconDetails details,
    JFFunction? callback,
  );

  /// Sets the HTML document to be opened as a popup when the user clicks the
  /// browser action icon.
  external void setPopup(
    SetPopupDetails details,
    JSFunction callback,
  );

  /// Gets the HTML document that is set as the popup for this browser action.
  external void getPopup(
    TabDetails details,
    JSFunction callback,
  );

  /// Sets the badge text for the browser action. The badge is displayed on top
  /// of the icon.
  external void setBadgeText(
    SetBadgeTextDetails details,
    JSFunction callback,
  );

  /// Gets the badge text of the browser action. If no tab is specified, the
  /// non-tab-specific badge text is returned.
  external void getBadgeText(
    TabDetails details,
    JSFunction callback,
  );

  /// Sets the background color for the badge.
  external void setBadgeBackgroundColor(
    SetBadgeBackgroundColorDetails details,
    JSFunction callback,
  );

  /// Gets the background color of the browser action.
  external void getBadgeBackgroundColor(
    TabDetails details,
    JSFunction callback,
  );

  /// Enables the browser action for a tab. Defaults to enabled.
  external void enable(
    int? tabId,
    JSFunction callback,
  );

  /// Disables the browser action for a tab.
  external void disable(
    int? tabId,
    JSFunction callback,
  );

  /// Opens the extension popup window in the active window but does not grant
  /// tab permissions.
  external void openPopup(JFFunction callback);

  /// Fired when a browser action icon is clicked. Does not fire if the browser
  /// action has a popup.
  external ChromeEvent get onClicked;
}

typedef ColorArray = JSArray;

@JS()
@staticInterop
class ImageDataType {}

extension ImageDataTypeExtension on ImageDataType {}

@JS()
@staticInterop
class TabDetails {}

extension TabDetailsExtension on TabDetails {
  /// The ID of the tab to query state for. If no tab is specified, the
  /// non-tab-specific state is returned.
  external int? tabId;
}

@JS()
@staticInterop
@anonymous
class SetTitleDetails {
  external factory SetTitleDetails({
    /// The string the browser action should display when moused over.
    String title,

    /// Limits the change to when a particular tab is selected. Automatically
    /// resets when the tab is closed.
    int? tabId,
  });
}

@JS()
@staticInterop
@anonymous
class SetIconDetails {
  external factory SetIconDetails({
    /// Either an ImageData object or a dictionary {size -> ImageData}
    /// representing an icon to be set. If the icon is specified as a dictionary,
    /// the image used is chosen depending on the screen's pixel density. If the
    /// number of image pixels that fit into one screen space unit equals `scale`,
    /// then an image with size `scale` * n is selected, where <i>n</i> is the
    /// size of the icon in the UI. At least one image must be specified. Note
    /// that 'details.imageData = foo' is equivalent to 'details.imageData =
    /// {'16': foo}'
    JSAny? imageData,

    /// Either a relative image path or a dictionary {size -> relative image path}
    /// pointing to an icon to be set. If the icon is specified as a dictionary,
    /// the image used is chosen depending on the screen's pixel density. If the
    /// number of image pixels that fit into one screen space unit equals `scale`,
    /// then an image with size `scale` * n is selected, where <i>n</i> is the
    /// size of the icon in the UI. At least one image must be specified. Note
    /// that 'details.path = foo' is equivalent to 'details.path = {'16': foo}'
    JSAny? path,

    /// Limits the change to when a particular tab is selected. Automatically
    /// resets when the tab is closed.
    int? tabId,
  });
}

@JS()
@staticInterop
@anonymous
class SetPopupDetails {
  external factory SetPopupDetails({
    /// Limits the change to when a particular tab is selected. Automatically
    /// resets when the tab is closed.
    int? tabId,

    /// The relative path to the HTML file to show in a popup. If set to the empty
    /// string (`''`), no popup is shown.
    String popup,
  });
}

@JS()
@staticInterop
@anonymous
class SetBadgeTextDetails {
  external factory SetBadgeTextDetails({
    /// Any number of characters can be passed, but only about four can fit into
    /// the space. If an empty string (`''`) is passed, the badge text is cleared.
    ///  If `tabId` is specified and `text` is null, the text for the specified
    /// tab is cleared and defaults to the global badge text.
    String? text,

    /// Limits the change to when a particular tab is selected. Automatically
    /// resets when the tab is closed.
    int? tabId,
  });
}

@JS()
@staticInterop
@anonymous
class SetBadgeBackgroundColorDetails {
  external factory SetBadgeBackgroundColorDetails({
    /// An array of four integers in the range 0-255 that make up the RGBA color
    /// of the badge. Can also be a string with a CSS hex color value; for
    /// example, `#FF0000` or `#F00` (red). Renders colors at full opacity.
    JSAny color,

    /// Limits the change to when a particular tab is selected. Automatically
    /// resets when the tab is closed.
    int? tabId,
  });
}
