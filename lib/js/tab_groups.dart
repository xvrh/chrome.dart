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
  external void get(groupId);

  /// Gets all groups that have the specified properties, or all groups if no
  /// properties are specified.
  external void query(queryInfo);

  /// Modifies the properties of a group. Properties that are not specified in
  /// <var>updateProperties</var> are not modified.
  external void update(
    groupId,
    updateProperties,
  );

  /// Moves the group and all its tabs within its window, or to a new window.
  external void move(
    groupId,
    moveProperties,
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
}

/// The group's color.
typedef Color = JSString;

@JS()
@staticInterop
class TabGroup {
  /// The ID of the group. Group IDs are unique within a browser session.
  external JSAny get id;

  /// Whether the group is collapsed. A collapsed group is one whose tabs are
  /// hidden.
  external JSAny get collapsed;

  /// The group's color.
  external JSAny get color;

  /// The title of the group.
  external JSAny? get title;

  /// The ID of the window that contains the group.
  external JSAny get windowId;
}
