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
  external JSPromise setTitle(JSObject details);

  /// Gets the title of the action.
  external JSPromise getTitle(TabDetails details);

  /// Sets the icon for the action. The icon can be specified either as the path
  /// to an image file or as the pixel data from a canvas element, or as
  /// dictionary of either one of those. Either the **path** or the
  /// **imageData** property must be specified.
  external JSPromise setIcon(JSObject details);

  /// Sets the HTML document to be opened as a popup when the user clicks on the
  /// action's icon.
  external JSPromise setPopup(JSObject details);

  /// Gets the html document set as the popup for this action.
  external JSPromise getPopup(TabDetails details);

  /// Sets the badge text for the action. The badge is displayed on top of the
  /// icon.
  external JSPromise setBadgeText(JSObject details);

  /// Gets the badge text of the action. If no tab is specified, the
  /// non-tab-specific badge text is returned. If <a
  /// href='declarativeNetRequest#setExtensionActionOptions'>displayActionCountAsBadgeText</a>
  /// is enabled, a placeholder text will be returned unless the <a
  /// href='declare_permissions#declarativeNetRequestFeedback'>declarativeNetRequestFeedback</a>
  /// permission is present or tab-specific badge text was provided.
  external JSPromise getBadgeText(TabDetails details);

  /// Sets the background color for the badge.
  external JSPromise setBadgeBackgroundColor(JSObject details);

  /// Gets the background color of the action.
  external JSPromise getBadgeBackgroundColor(TabDetails details);

  /// Sets the text color for the badge.
  external JSPromise setBadgeTextColor(JSObject details);

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
