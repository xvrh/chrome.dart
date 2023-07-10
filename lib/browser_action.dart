import 'chrome.dart';
export 'chrome.dart';

final _browserAction = ChromeBrowserAction._();

extension ChromeBrowserActionExtension on Chrome {
  ChromeBrowserAction get browserAction => _browserAction;
}

class ChromeBrowserAction {
  ChromeBrowserAction._();

  /// Sets the title of the browser action. This title appears in the tooltip.
  void setTitle(details) => throw UnimplementedError();

  /// Gets the title of the browser action.
  void getTitle(details) => throw UnimplementedError();

  /// Sets the icon for the browser action. The icon can be specified as the
  /// path to an image file, as the pixel data from a canvas element, or as a
  /// dictionary of one of those. Either the `path` or the `imageData` property
  /// must be specified.
  void setIcon(
    details,
    callback,
  ) =>
      throw UnimplementedError();

  /// Sets the HTML document to be opened as a popup when the user clicks the
  /// browser action icon.
  void setPopup(details) => throw UnimplementedError();

  /// Gets the HTML document that is set as the popup for this browser action.
  void getPopup(details) => throw UnimplementedError();

  /// Sets the badge text for the browser action. The badge is displayed on top
  /// of the icon.
  void setBadgeText(details) => throw UnimplementedError();

  /// Gets the badge text of the browser action. If no tab is specified, the
  /// non-tab-specific badge text is returned.
  void getBadgeText(details) => throw UnimplementedError();

  /// Sets the background color for the badge.
  void setBadgeBackgroundColor(details) => throw UnimplementedError();

  /// Gets the background color of the browser action.
  void getBadgeBackgroundColor(details) => throw UnimplementedError();

  /// Enables the browser action for a tab. Defaults to enabled.
  void enable(tabId) => throw UnimplementedError();

  /// Disables the browser action for a tab.
  void disable(tabId) => throw UnimplementedError();

  /// Opens the extension popup window in the active window but does not grant
  /// tab permissions.
  void openPopup(callback) => throw UnimplementedError();

  /// Fired when a browser action icon is clicked. Does not fire if the browser
  /// action has a popup.
  Stream get onClicked => throw UnimplementedError();
}
