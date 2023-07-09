import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSContextMenusExtension on JSChrome {
  /// Use the `chrome.contextMenus` API to add items to Google Chrome's context
  /// menu. You can choose what types of objects your context menu additions
  /// apply to, such as images, hyperlinks, and pages.
  external JSContextMenus get contextMenus;
}

@JS()
@staticInterop
class JSContextMenus {}

extension JSContextMenusExtension on JSContextMenus {
  /// Creates a new context menu item. If an error occurs during creation, it
  /// may not be detected until the creation callback fires; details will be in
  /// $(ref:runtime.lastError).
  external void create(
    createProperties,
    callback,
  );

  /// Updates a previously created context menu item.
  external void update(
    id,
    updateProperties,
    callback,
  );

  /// Removes a context menu item.
  external void remove(
    menuItemId,
    callback,
  );

  /// Removes all context menu items added by this extension.
  external void removeAll(callback);

  /// Fired when a context menu item is clicked.
  external ChromeEvent get onClicked;
}

/// The different contexts a menu can appear in. Specifying 'all' is equivalent
/// to the combination of all other contexts except for 'launcher'. The
/// 'launcher' context is only supported by apps and is used to add menu items
/// to the context menu that appears when clicking the app icon in the
/// launcher/taskbar/dock/etc. Different platforms might put limitations on what
/// is actually supported in a launcher context menu.
typedef ContextType = JSString;

/// The type of menu item.
typedef ItemType = JSString;

@JS()
@staticInterop
class OnClickData {
  /// The ID of the menu item that was clicked.
  external JSAny get menuItemId;

  /// The parent ID, if any, for the item clicked.
  external JSAny? get parentMenuItemId;

  /// One of 'image', 'video', or 'audio' if the context menu was activated on
  /// one of these types of elements.
  external JSAny? get mediaType;

  /// If the element is a link, the URL it points to.
  external JSAny? get linkUrl;

  /// Will be present for elements with a 'src' URL.
  external JSAny? get srcUrl;

  /// The URL of the page where the menu item was clicked. This property is not
  /// set if the click occured in a context where there is no current page, such
  /// as in a launcher context menu.
  external JSAny? get pageUrl;

  ///  The URL of the frame of the element where the context menu was clicked,
  /// if it was in a frame.
  external JSAny? get frameUrl;

  ///  The <a href='webNavigation#frame_ids'>ID of the frame</a> of the element
  /// where the context menu was clicked, if it was in a frame.
  external JSAny? get frameId;

  /// The text for the context selection, if any.
  external JSAny? get selectionText;

  /// A flag indicating whether the element is editable (text input, textarea,
  /// etc.).
  external JSAny get editable;

  /// A flag indicating the state of a checkbox or radio item before it was
  /// clicked.
  external JSAny? get wasChecked;

  /// A flag indicating the state of a checkbox or radio item after it is
  /// clicked.
  external JSAny? get checked;
}
