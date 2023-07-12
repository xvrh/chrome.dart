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
  /// [runtime.lastError].
  external JSAny create(
    CreateProperties createProperties,
    JSAny? callback,
  );

  /// Updates a previously created context menu item.
  external void update(
    JSAny id,
    UpdateProperties updateProperties,
    JSAny? callback,
  );

  /// Removes a context menu item.
  external void remove(
    JSAny menuItemId,
    JSAny? callback,
  );

  /// Removes all context menu items added by this extension.
  external void removeAll(JSAny? callback);

  /// Fired when a context menu item is clicked.
  external ChromeEvent get onClicked;

  /// The maximum number of top level extension items that can be added to an
  /// extension action context menu. Any items beyond this limit will be
  /// ignored.
  external int get ACTION_MENU_TOP_LEVEL_LIMIT;
}

/// The different contexts a menu can appear in. Specifying 'all' is equivalent
/// to the combination of all other contexts except for 'launcher'. The
/// 'launcher' context is only supported by apps and is used to add menu items
/// to the context menu that appears when clicking the app icon in the
/// launcher/taskbar/dock/etc. Different platforms might put limitations on what
/// is actually supported in a launcher context menu.
typedef ContextType = String;

/// The type of menu item.
typedef ItemType = String;

@JS()
@staticInterop
class OnClickData {}

extension OnClickDataExtension on OnClickData {
  /// The ID of the menu item that was clicked.
  external JSAny menuItemId;

  /// The parent ID, if any, for the item clicked.
  external JSAny? parentMenuItemId;

  /// One of 'image', 'video', or 'audio' if the context menu was activated on
  /// one of these types of elements.
  external String? mediaType;

  /// If the element is a link, the URL it points to.
  external String? linkUrl;

  /// Will be present for elements with a 'src' URL.
  external String? srcUrl;

  /// The URL of the page where the menu item was clicked. This property is not
  /// set if the click occured in a context where there is no current page, such
  /// as in a launcher context menu.
  external String? pageUrl;

  ///  The URL of the frame of the element where the context menu was clicked,
  /// if it was in a frame.
  external String? frameUrl;

  ///  The [ID of the frame](webNavigation#frame_ids) of the element where the
  /// context menu was clicked, if it was in a frame.
  external int? frameId;

  /// The text for the context selection, if any.
  external String? selectionText;

  /// A flag indicating whether the element is editable (text input, textarea,
  /// etc.).
  external bool editable;

  /// A flag indicating the state of a checkbox or radio item before it was
  /// clicked.
  external bool? wasChecked;

  /// A flag indicating the state of a checkbox or radio item after it is
  /// clicked.
  external bool? checked;
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
    String? id,

    /// The text to display in the item; this is _required_ unless `type` is
    /// `separator`. When the context is `selection`, use `%s` within the string
    /// to show the selected text. For example, if this parameter's value is
    /// "Translate '%s' to Pig Latin" and the user selects the word "cool", the
    /// context menu item for the selection is "Translate 'cool' to Pig Latin".
    String? title,

    /// The initial state of a checkbox or radio button: `true` for selected,
    /// `false` for unselected. Only one radio button can be selected at a time in
    /// a given group.
    bool? checked,

    /// List of contexts this menu item will appear in. Defaults to `['page']`.
    JSArray? contexts,

    /// Whether the item is visible in the menu.
    bool? visible,

    /// A function that is called back when the menu item is clicked. Event pages
    /// cannot use this; instead, they should register a listener for
    /// [contextMenus.onClicked].
    JSAny? onclick,

    /// The ID of a parent menu item; this makes the item a child of a previously
    /// added item.
    JSAny? parentId,

    /// Restricts the item to apply only to documents or frames whose URL matches
    /// one of the given patterns. For details on pattern formats, see [Match
    /// Patterns](match_patterns).
    JSArray? documentUrlPatterns,

    /// Similar to `documentUrlPatterns`, filters based on the `src` attribute of
    /// `img`, `audio`, and `video` tags and the `href` attribute of `a` tags.
    JSArray? targetUrlPatterns,

    /// Whether this context menu item is enabled or disabled. Defaults to `true`.
    bool? enabled,
  });
}

@JS()
@staticInterop
@anonymous
class UpdateProperties {
  external factory UpdateProperties({
    ItemType? type,
    String? title,
    bool? checked,
    JSArray? contexts,

    /// Whether the item is visible in the menu.
    bool? visible,
    JSAny? onclick,

    /// The ID of the item to be made this item's parent. Note: You cannot set an
    /// item to become a child of its own descendant.
    JSAny? parentId,
    JSArray? documentUrlPatterns,
    JSArray? targetUrlPatterns,
    bool? enabled,
  });
}
