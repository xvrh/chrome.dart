import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSActionExtension on JSChrome {
  /// Use the `chrome.action` API to control the extension's icon in the Google
  /// Chrome toolbar.
  external JSAction get Action;
}

@JS()
@staticInterop
class JSAction {}

extension JSActionExtension on JSAction {
  /// Sets the title of the action. This shows up in the tooltip.
  external void setTitle();

  /// Gets the title of the action.
  external void getTitle();

  /// Sets the icon for the action. The icon can be specified either as the path
  /// to an image file or as the pixel data from a canvas element, or as
  /// dictionary of either one of those. Either the <b>path</b> or the
  /// <b>imageData</b> property must be specified.
  external void setIcon();

  /// Sets the HTML document to be opened as a popup when the user clicks on the
  /// action's icon.
  external void setPopup();

  /// Gets the html document set as the popup for this action.
  external void getPopup();

  /// Sets the badge text for the action. The badge is displayed on top of the
  /// icon.
  external void setBadgeText();

  /// Gets the badge text of the action. If no tab is specified, the
  /// non-tab-specific badge text is returned. If <a
  /// href='declarativeNetRequest#setExtensionActionOptions'>displayActionCountAsBadgeText</a>
  /// is enabled, a placeholder text will be returned unless the <a
  /// href='declare_permissions#declarativeNetRequestFeedback'>declarativeNetRequestFeedback</a>
  /// permission is present or tab-specific badge text was provided.
  external void getBadgeText();

  /// Sets the background color for the badge.
  external void setBadgeBackgroundColor();

  /// Gets the background color of the action.
  external void getBadgeBackgroundColor();

  /// Sets the text color for the badge.
  external void setBadgeTextColor();

  /// Gets the text color of the action.
  external void getBadgeTextColor();

  /// Enables the action for a tab. By default, actions are enabled.
  external void enable();

  /// Disables the action for a tab.
  external void disable();

  /// Indicates whether the extension action is enabled for a tab (or globally
  /// if no `tabId` is provided). Actions enabled using only
  /// $(ref:declarativeContent) always return false.
  external void isEnabled();

  /// Returns the user-specified settings relating to an extension's action.
  external void getUserSettings();

  /// Opens the extension's popup.
  external void openPopup();

  /// Fired when an action icon is clicked.  This event will not fire if the
  /// action has a popup.
  external ChromeEvent get onClicked;
}
