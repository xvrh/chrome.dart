import 'chrome.dart';
export 'chrome.dart';

final _action = ChromeAction._();

extension ChromeChromeActionExtension on Chrome {
  ChromeAction get action => _action;
}

class ChromeAction {
  ChromeAction._();

  /// Sets the title of the action. This shows up in the tooltip.
  void setTitle(details) => throw UnimplementedError();

  /// Gets the title of the action.
  void getTitle(details) => throw UnimplementedError();

  /// Sets the icon for the action. The icon can be specified either as the path
  /// to an image file or as the pixel data from a canvas element, or as
  /// dictionary of either one of those. Either the <b>path</b> or the
  /// <b>imageData</b> property must be specified.
  void setIcon(details) => throw UnimplementedError();

  /// Sets the HTML document to be opened as a popup when the user clicks on the
  /// action's icon.
  void setPopup(details) => throw UnimplementedError();

  /// Gets the html document set as the popup for this action.
  void getPopup(details) => throw UnimplementedError();

  /// Sets the badge text for the action. The badge is displayed on top of the
  /// icon.
  void setBadgeText(details) => throw UnimplementedError();

  /// Gets the badge text of the action. If no tab is specified, the
  /// non-tab-specific badge text is returned. If <a
  /// href='declarativeNetRequest#setExtensionActionOptions'>displayActionCountAsBadgeText</a>
  /// is enabled, a placeholder text will be returned unless the <a
  /// href='declare_permissions#declarativeNetRequestFeedback'>declarativeNetRequestFeedback</a>
  /// permission is present or tab-specific badge text was provided.
  void getBadgeText(details) => throw UnimplementedError();

  /// Sets the background color for the badge.
  void setBadgeBackgroundColor(details) => throw UnimplementedError();

  /// Gets the background color of the action.
  void getBadgeBackgroundColor(details) => throw UnimplementedError();

  /// Sets the text color for the badge.
  void setBadgeTextColor(details) => throw UnimplementedError();

  /// Gets the text color of the action.
  void getBadgeTextColor(details) => throw UnimplementedError();

  /// Enables the action for a tab. By default, actions are enabled.
  void enable(tabId) => throw UnimplementedError();

  /// Disables the action for a tab.
  void disable(tabId) => throw UnimplementedError();

  /// Indicates whether the extension action is enabled for a tab (or globally
  /// if no `tabId` is provided). Actions enabled using only
  /// $(ref:declarativeContent) always return false.
  void isEnabled(tabId) => throw UnimplementedError();

  /// Returns the user-specified settings relating to an extension's action.
  void getUserSettings() => throw UnimplementedError();

  /// Opens the extension's popup.
  void openPopup(options) => throw UnimplementedError();

  /// Fired when an action icon is clicked.  This event will not fire if the
  /// action has a popup.
  Stream get onClicked => throw UnimplementedError();
}
