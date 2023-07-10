import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSActionExtension on JSChrome {
  /// Use the `chrome.action` API to control the extension's icon in the Google
  /// Chrome toolbar.
  external JSAction get action;
}

@JS()
@staticInterop
class JSAction {}

extension JSActionExtension on JSAction {
  /// Sets the title of the action. This shows up in the tooltip.
  external JSPromise setTitle(SetTitleDetails details);

  /// Gets the title of the action.
  external JSPromise getTitle(TabDetails details);

  /// Sets the icon for the action. The icon can be specified either as the path
  /// to an image file or as the pixel data from a canvas element, or as
  /// dictionary of either one of those. Either the **path** or the
  /// **imageData** property must be specified.
  external JSPromise setIcon(SetIconDetails details);

  /// Sets the HTML document to be opened as a popup when the user clicks on the
  /// action's icon.
  external JSPromise setPopup(SetPopupDetails details);

  /// Gets the html document set as the popup for this action.
  external JSPromise getPopup(TabDetails details);

  /// Sets the badge text for the action. The badge is displayed on top of the
  /// icon.
  external JSPromise setBadgeText(SetBadgeTextDetails details);

  /// Gets the badge text of the action. If no tab is specified, the
  /// non-tab-specific badge text is returned. If <a
  /// href='declarativeNetRequest#setExtensionActionOptions'>displayActionCountAsBadgeText</a>
  /// is enabled, a placeholder text will be returned unless the <a
  /// href='declare_permissions#declarativeNetRequestFeedback'>declarativeNetRequestFeedback</a>
  /// permission is present or tab-specific badge text was provided.
  external JSPromise getBadgeText(TabDetails details);

  /// Sets the background color for the badge.
  external JSPromise setBadgeBackgroundColor(
      SetBadgeBackgroundColorDetails details);

  /// Gets the background color of the action.
  external JSPromise getBadgeBackgroundColor(TabDetails details);

  /// Sets the text color for the badge.
  external JSPromise setBadgeTextColor(SetBadgeTextColorDetails details);

  /// Gets the text color of the action.
  external JSPromise getBadgeTextColor(TabDetails details);

  /// Enables the action for a tab. By default, actions are enabled.
  external JSPromise enable(int tabId);

  /// Disables the action for a tab.
  external JSPromise disable(int tabId);

  /// Indicates whether the extension action is enabled for a tab (or globally
  /// if no `tabId` is provided). Actions enabled using only
  /// $(ref:declarativeContent) always return false.
  external JSPromise isEnabled(int tabId);

  /// Returns the user-specified settings relating to an extension's action.
  external JSPromise getUserSettings();

  /// Opens the extension's popup.
  external JSPromise openPopup(OpenPopupOptions options);

  /// Fired when an action icon is clicked.  This event will not fire if the
  /// action has a popup.
  external ChromeEvent get onClicked;
}

@JS()
@staticInterop
class TabDetails {
  /// The ID of the tab to query state for. If no tab is specified, the
  /// non-tab-specific state is returned.
  external int? get tabId;
}

@JS()
@staticInterop
class UserSettings {
  /// Whether the extension's action icon is visible on browser windows'
  /// top-level toolbar (i.e., whether the extension has been 'pinned' by the
  /// user).
  external bool get isOnToolbar;
}

@JS()
@staticInterop
class OpenPopupOptions {
  /// The id of the window to open the action popup in. Defaults to the
  /// currently-active window if unspecified.
  external int? get windowId;
}

@JS()
@staticInterop
class SetTitleDetails {
  /// The string the action should display when moused over.
  external String get title;

  /// Limits the change to when a particular tab is selected. Automatically
  /// resets when the tab is closed.
  external int? get tabId;
}

@JS()
@staticInterop
class SetIconDetails {
  /// Either an ImageData object or a dictionary {size -> ImageData}
  /// representing icon to be set. If the icon is specified as a dictionary, the
  /// actual image to be used is chosen depending on screen's pixel density. If
  /// the number of image pixels that fit into one screen space unit equals
  /// `scale`, then image with size `scale` * n will be selected, where n is the
  /// size of the icon in the UI. At least one image must be specified. Note
  /// that 'details.imageData = foo' is equivalent to 'details.imageData =
  /// {'16': foo}'
  external JSObject? get imageData;

  /// Either a relative image path or a dictionary {size -> relative image path}
  /// pointing to icon to be set. If the icon is specified as a dictionary, the
  /// actual image to be used is chosen depending on screen's pixel density. If
  /// the number of image pixels that fit into one screen space unit equals
  /// `scale`, then image with size `scale` * n will be selected, where n is the
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
  /// Any number of characters can be passed, but only about four can fit in the
  /// space.
  external String get text;

  /// Limits the change to when a particular tab is selected. Automatically
  /// resets when the tab is closed.
  external int? get tabId;
}

@JS()
@staticInterop
class SetBadgeBackgroundColorDetails {
  /// An array of four integers in the range [0,255] that make up the RGBA color
  /// of the badge. For example, opaque red is `[255, 0, 0, 255]`. Can also be a
  /// string with a CSS value, with opaque red being `#FF0000` or `#F00`.
  external JSObject get color;

  /// Limits the change to when a particular tab is selected. Automatically
  /// resets when the tab is closed.
  external int? get tabId;
}

@JS()
@staticInterop
class SetBadgeTextColorDetails {
  /// An array of four integers in the range [0,255] that make up the RGBA color
  /// of the badge. For example, opaque red is `[255, 0, 0, 255]`. Can also be a
  /// string with a CSS value, with opaque red being `#FF0000` or `#F00`. Not
  /// setting this value will cause a color to be automatically chosen that will
  /// contrast with the badge's background color so the text will be visible.
  /// Colors with alpha values equivalent to 0 will not be set and will return
  /// an error.
  external JSObject get color;

  /// Limits the change to when a particular tab is selected. Automatically
  /// resets when the tab is closed.
  external int? get tabId;
}
