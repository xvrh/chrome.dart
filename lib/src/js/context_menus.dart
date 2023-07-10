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
  external JSObject create(
    CreateProperties createProperties,
    JSFunction? callback,
  );

  /// Updates a previously created context menu item.
  external void update(
    JSObject id,
    UpdateProperties updateProperties,
    JSFunction? callback,
  );

  /// Removes a context menu item.
  external void remove(
    JSObject menuItemId,
    JSFunction? callback,
  );

  /// Removes all context menu items added by this extension.
  external void removeAll(JSFunction? callback);

  /// Fired when a context menu item is clicked.
  external ChromeEvent get onClicked;

  /// The maximum number of top level extension items that can be added to an
  /// extension action context menu. Any items beyond this limit will be
  /// ignored.
  external JSObject get ACTION_MENU_TOP_LEVEL_LIMIT;
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
class OnClickData {}

extension OnClickDataExtension on OnClickData {
  /// The ID of the menu item that was clicked.
  external JSObject get menuItemId;

  /// The parent ID, if any, for the item clicked.
  external JSObject? get parentMenuItemId;

  /// One of 'image', 'video', or 'audio' if the context menu was activated on
  /// one of these types of elements.
  external JSString? get mediaType;

  /// If the element is a link, the URL it points to.
  external JSString? get linkUrl;

  /// Will be present for elements with a 'src' URL.
  external JSString? get srcUrl;

  /// The URL of the page where the menu item was clicked. This property is not
  /// set if the click occured in a context where there is no current page, such
  /// as in a launcher context menu.
  external JSString? get pageUrl;

  ///  The URL of the frame of the element where the context menu was clicked,
  /// if it was in a frame.
  external JSString? get frameUrl;

  ///  The <a href='webNavigation#frame_ids'>ID of the frame</a> of the element
  /// where the context menu was clicked, if it was in a frame.
  external JSNumber? get frameId;

  /// The text for the context selection, if any.
  external JSString? get selectionText;

  /// A flag indicating whether the element is editable (text input, textarea,
  /// etc.).
  external JSBoolean get editable;

  /// A flag indicating the state of a checkbox or radio item before it was
  /// clicked.
  external JSBoolean? get wasChecked;

  /// A flag indicating the state of a checkbox or radio item after it is
  /// clicked.
  external JSBoolean? get checked;
}

@JS()
@staticInterop
@anonymous
class CreateProperties {
  external factory CreateProperties({
    /// The type of menu item. Defaults to `normal`.
    ItemType? type,

    /// The unique ID to assign to this item. Mandatory for event pages. Cannot be
    /// the same as another ID for this extension.
    JSString? id,

    /// The text to display in the item; this is <em>required</em> unless `type`
    /// is `separator`. When the context is `selection`, use `%s` within the
    /// string to show the selected text. For example, if this parameter's value
    /// is "Translate '%s' to Pig Latin" and the user selects the word "cool", the
    /// context menu item for the selection is "Translate 'cool' to Pig Latin".
    JSString? title,

    /// The initial state of a checkbox or radio button: `true` for selected,
    /// `false` for unselected. Only one radio button can be selected at a time in
    /// a given group.
    JSBoolean? checked,

    /// List of contexts this menu item will appear in. Defaults to `['page']`.
    JSArray? contexts,

    /// Whether the item is visible in the menu.
    JSBoolean? visible,

    /// A function that is called back when the menu item is clicked. Event pages
    /// cannot use this; instead, they should register a listener for
    /// $(ref:contextMenus.onClicked).
    JSFunction? onclick,

    /// The ID of a parent menu item; this makes the item a child of a previously
    /// added item.
    JSObject? parentId,

    /// Restricts the item to apply only to documents or frames whose URL matches
    /// one of the given patterns. For details on pattern formats, see <a
    /// href='match_patterns'>Match Patterns</a>.
    JSArray? documentUrlPatterns,

    /// Similar to `documentUrlPatterns`, filters based on the `src` attribute of
    /// `img`, `audio`, and `video` tags and the `href` attribute of `a` tags.
    JSArray? targetUrlPatterns,

    /// Whether this context menu item is enabled or disabled. Defaults to `true`.
    JSBoolean? enabled,
  });
}

@JS()
@staticInterop
@anonymous
class UpdateProperties {
  external factory UpdateProperties({
    ItemType? type,
    JSString? title,
    JSBoolean? checked,
    JSArray? contexts,

    /// Whether the item is visible in the menu.
    JSBoolean? visible,
    JSFunction? onclick,

    /// The ID of the item to be made this item's parent. Note: You cannot set an
    /// item to become a child of its own descendant.
    JSObject? parentId,
    JSArray? documentUrlPatterns,
    JSArray? targetUrlPatterns,
    JSBoolean? enabled,
  });
}
