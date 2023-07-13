import 'dart:js_interop';

import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSPageActionExtension on JSChrome {
  /// Use the `chrome.pageAction` API to put icons in the main Google Chrome
  /// toolbar, to the right of the address bar. Page actions represent actions
  /// that can be taken on the current page, but that aren't applicable to all
  /// pages. Page actions appear grayed out when inactive.
  external JSPageAction get pageAction;
}

@JS()
@staticInterop
class JSPageAction {}

extension JSPageActionExtension on JSPageAction {
  /// Shows the page action. The page action is shown whenever the tab is
  /// selected.
  external void show(
    int tabId,
    JSFunction callback,
  );

  /// Hides the page action. Hidden page actions still appear in the Chrome
  /// toolbar, but are grayed out.
  external void hide(
    int tabId,
    JSFunction callback,
  );

  /// Sets the title of the page action. This is displayed in a tooltip over the
  /// page action.
  external void setTitle(
    SetTitleDetails details,
    JSFunction callback,
  );

  /// Gets the title of the page action.
  external void getTitle(
    TabDetails details,
    JSFunction callback,
  );

  /// Sets the icon for the page action. The icon can be specified either as the
  /// path to an image file or as the pixel data from a canvas element, or as
  /// dictionary of either one of those. Either the **path** or the
  /// **imageData** property must be specified.
  external void setIcon(
    SetIconDetails details,
    JSFunction callback,
  );

  /// Sets the HTML document to be opened as a popup when the user clicks on the
  /// page action's icon.
  external void setPopup(
    SetPopupDetails details,
    JSFunction callback,
  );

  /// Gets the html document set as the popup for this page action.
  external void getPopup(
    TabDetails details,
    JSFunction callback,
  );

  /// Fired when a page action icon is clicked.  This event will not fire if the
  /// page action has a popup.
  external ChromeEvent get onClicked;
}

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
    /// The id of the tab for which you want to modify the page action.
    int tabId,

    /// The tooltip string.
    String title,
  });
}

@JS()
@staticInterop
@anonymous
class SetIconDetails {
  external factory SetIconDetails({
    /// The id of the tab for which you want to modify the page action.
    int tabId,

    /// Either an ImageData object or a dictionary {size -> ImageData}
    /// representing icon to be set. If the icon is specified as a dictionary, the
    /// actual image to be used is chosen depending on screen's pixel density. If
    /// the number of image pixels that fit into one screen space unit equals
    /// `scale`, then image with size `scale` * n will be selected, where n is the
    /// size of the icon in the UI. At least one image must be specified. Note
    /// that 'details.imageData = foo' is equivalent to 'details.imageData =
    /// {'16': foo}'
    JSAny? imageData,

    /// Either a relative image path or a dictionary {size -> relative image path}
    /// pointing to icon to be set. If the icon is specified as a dictionary, the
    /// actual image to be used is chosen depending on screen's pixel density. If
    /// the number of image pixels that fit into one screen space unit equals
    /// `scale`, then image with size `scale` * n will be selected, where n is the
    /// size of the icon in the UI. At least one image must be specified. Note
    /// that 'details.path = foo' is equivalent to 'details.path = {'16': foo}'
    JSAny? path,

    /// **Deprecated.** This argument is ignored.
    int? iconIndex,
  });
}

@JS()
@staticInterop
@anonymous
class SetPopupDetails {
  external factory SetPopupDetails({
    /// The id of the tab for which you want to modify the page action.
    int tabId,

    /// The relative path to the HTML file to show in a popup. If set to the empty
    /// string (`''`), no popup is shown.
    String popup,
  });
}
