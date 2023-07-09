import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSPageActionExtension on JSChrome {
  /// Use the `chrome.pageAction` API to put icons in the main Google Chrome
  /// toolbar, to the right of the address bar. Page actions represent actions
  /// that can be taken on the current page, but that aren't applicable to all
  /// pages. Page actions appear grayed out when inactive.
  external JSPageAction get PageAction;
}

@JS()
@staticInterop
class JSPageAction {}

extension JSPageActionExtension on JSPageAction {
  /// Shows the page action. The page action is shown whenever the tab is
  /// selected.
  external void show();

  /// Hides the page action. Hidden page actions still appear in the Chrome
  /// toolbar, but are grayed out.
  external void hide();

  /// Sets the title of the page action. This is displayed in a tooltip over the
  /// page action.
  external void setTitle();

  /// Gets the title of the page action.
  external void getTitle();

  /// Sets the icon for the page action. The icon can be specified either as the
  /// path to an image file or as the pixel data from a canvas element, or as
  /// dictionary of either one of those. Either the <b>path</b> or the
  /// <b>imageData</b> property must be specified.
  external void setIcon();

  /// Sets the HTML document to be opened as a popup when the user clicks on the
  /// page action's icon.
  external void setPopup();

  /// Gets the html document set as the popup for this page action.
  external void getPopup();

  /// Fired when a page action icon is clicked.  This event will not fire if the
  /// page action has a popup.
  external ChromeEvent get onClicked;
}
