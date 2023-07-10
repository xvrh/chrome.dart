import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSTabGroupsExtension on JSChrome {
  /// Use the `chrome.tabGroups` API to interact with the browser's tab grouping
  /// system. You can use this API to modify and rearrange tab groups in the
  /// browser. To group and ungroup tabs, or to query what tabs are in groups,
  /// use the `chrome.tabs` API.
  external JSTabGroups get tabGroups;
}

@JS()
@staticInterop
class JSTabGroups {}

extension JSTabGroupsExtension on JSTabGroups {
  /// Retrieves details about the specified group.
  external JSPromise get(int groupId);

  /// Gets all groups that have the specified properties, or all groups if no
  /// properties are specified.
  external JSPromise query(QueryInfo queryInfo);

  /// Modifies the properties of a group. Properties that are not specified in
  /// `updateProperties` are not modified.
  external JSPromise update(
    int groupId,
    UpdateProperties updateProperties,
  );

  /// Moves the group and all its tabs within its window, or to a new window.
  external JSPromise move(
    int groupId,
    MoveProperties moveProperties,
  );

  /// Fired when a group is created.
  external ChromeEvent get onCreated;

  /// Fired when a group is updated.
  external ChromeEvent get onUpdated;

  /// Fired when a group is moved within a window. Move events are still fired
  /// for the individual tabs within the group, as well as for the group itself.
  /// This event is not fired when a group is moved between windows; instead, it
  /// will be removed from one window and created in another.
  external ChromeEvent get onMoved;

  /// Fired when a group is closed, either directly by the user or automatically
  /// because it contained zero tabs.
  external ChromeEvent get onRemoved;

  /// An ID that represents the absence of a group.
  external JSObject get TAB_GROUP_ID_NONE;
}

/// The group's color.
typedef Color = JSString;

@JS()
@staticInterop
class TabGroup {}

extension TabGroupExtension on TabGroup {
  /// The ID of the group. Group IDs are unique within a browser session.
  external int id;

  /// Whether the group is collapsed. A collapsed group is one whose tabs are
  /// hidden.
  external bool collapsed;

  /// The group's color.
  external Color color;

  /// The title of the group.
  external String? title;

  /// The ID of the window that contains the group.
  external int windowId;
}

@JS()
@staticInterop
@anonymous
class QueryInfo {
  external factory QueryInfo({
    /// Whether the groups are collapsed.
    bool? collapsed,

    /// The color of the groups.
    Color? color,

    /// Match group titles against a pattern.
    String? title,

    /// The ID of the parent window, or $(ref:windows.WINDOW_ID_CURRENT) for the
    /// <a href='windows#current-window'>current window</a>.
    int? windowId,
  });
}

@JS()
@staticInterop
@anonymous
class UpdateProperties {
  external factory UpdateProperties({
    /// Whether the group should be collapsed.
    bool? collapsed,

    /// The color of the group.
    Color? color,

    /// The title of the group.
    String? title,
  });
}

@JS()
@staticInterop
@anonymous
class MoveProperties {
  external factory MoveProperties({
    /// The window to move the group to. Defaults to the window the group is
    /// currently in. Note that groups can only be moved to and from windows with
    /// $(ref:windows.WindowType) type `"normal"`.
    int? windowId,

    /// The position to move the group to. Use `-1` to place the group at the end
    /// of the window.
    int index,
  });
}
