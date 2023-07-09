import 'chrome.dart';
export 'chrome.dart';

final _pageAction = ChromePageAction._();

extension ChromeChromePageActionExtension on Chrome {
  ChromePageAction get pageAction => _pageAction;
}

class ChromePageAction {
  ChromePageAction._();

  /// Shows the page action. The page action is shown whenever the tab is
  /// selected.
  void show(tabId) => throw UnimplementedError();

  /// Hides the page action. Hidden page actions still appear in the Chrome
  /// toolbar, but are grayed out.
  void hide(tabId) => throw UnimplementedError();

  /// Sets the title of the page action. This is displayed in a tooltip over the
  /// page action.
  void setTitle(details) => throw UnimplementedError();

  /// Gets the title of the page action.
  void getTitle(details) => throw UnimplementedError();

  /// Sets the icon for the page action. The icon can be specified either as the
  /// path to an image file or as the pixel data from a canvas element, or as
  /// dictionary of either one of those. Either the <b>path</b> or the
  /// <b>imageData</b> property must be specified.
  void setIcon(details) => throw UnimplementedError();

  /// Sets the HTML document to be opened as a popup when the user clicks on the
  /// page action's icon.
  void setPopup(details) => throw UnimplementedError();

  /// Gets the html document set as the popup for this page action.
  void getPopup(details) => throw UnimplementedError();

  /// Fired when a page action icon is clicked.  This event will not fire if the
  /// page action has a popup.
  Stream get onClicked => throw UnimplementedError();
}
