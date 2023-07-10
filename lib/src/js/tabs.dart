import 'chrome.dart';
import 'dart:js_interop';
import 'runtime.dart';
import 'extension_types.dart';
export 'chrome.dart';

extension JSChromeJSTabsExtension on JSChrome {
  /// Use the `chrome.tabs` API to interact with the browser's tab system. You
  /// can use this API to create, modify, and rearrange tabs in the browser.
  external JSTabs get tabs;
}

@JS()
@staticInterop
class JSTabs {}

extension JSTabsExtension on JSTabs {
  /// Retrieves details about the specified tab.
  external JSPromise get(int tabId);

  /// Gets the tab that this script call is being made from. May be undefined if
  /// called from a non-tab context (for example, a background page or popup
  /// view).
  external JSPromise getCurrent();

  /// Connects to the content script(s) in the specified tab. The
  /// $(ref:runtime.onConnect) event is fired in each content script running in
  /// the specified tab for the current extension. For more details, see <a
  /// href='messaging'>Content Script Messaging</a>.
  external Port connect(
    int tabId,
    ConnectInfo? connectInfo,
  );

  /// Sends a single request to the content script(s) in the specified tab, with
  /// an optional callback to run when a response is sent back.  The
  /// $(ref:extension.onRequest) event is fired in each content script running
  /// in the specified tab for the current extension.
  external JSPromise sendRequest(
    int tabId,
    JSAny request,
  );

  /// Sends a single message to the content script(s) in the specified tab, with
  /// an optional callback to run when a response is sent back.  The
  /// $(ref:runtime.onMessage) event is fired in each content script running in
  /// the specified tab for the current extension.
  external JSPromise sendMessage(
    int tabId,
    JSAny message,
    SendMessageOptions? options,
  );

  /// Gets the tab that is selected in the specified window.
  external JSPromise getSelected(int? windowId);

  /// Gets details about all tabs in the specified window.
  external JSPromise getAllInWindow(int? windowId);

  /// Creates a new tab.
  external JSPromise create(CreateProperties createProperties);

  /// Duplicates a tab.
  external JSPromise duplicate(int tabId);

  /// Gets all tabs that have the specified properties, or all tabs if no
  /// properties are specified.
  external JSPromise query(QueryInfo queryInfo);

  /// Highlights the given tabs and focuses on the first of group. Will appear
  /// to do nothing if the specified tab is currently active.
  external JSPromise highlight(HighlightInfo highlightInfo);

  /// Modifies the properties of a tab. Properties that are not specified in
  /// `updateProperties` are not modified.
  external JSPromise update(
    int? tabId,
    UpdateProperties updateProperties,
  );

  /// Moves one or more tabs to a new position within its window, or to a new
  /// window. Note that tabs can only be moved to and from normal (window.type
  /// === "normal") windows.
  external JSPromise move(
    JSObject tabIds,
    MoveProperties moveProperties,
  );

  /// Reload a tab.
  external JSPromise reload(
    int? tabId,
    ReloadProperties? reloadProperties,
  );

  /// Closes one or more tabs.
  external JSPromise remove(JSObject tabIds);

  /// Adds one or more tabs to a specified group, or if no group is specified,
  /// adds the given tabs to a newly created group.
  external JSPromise group(GroupOptions options);

  /// Removes one or more tabs from their respective groups. If any groups
  /// become empty, they are deleted.
  external JSPromise ungroup(JSObject tabIds);

  /// Detects the primary language of the content in a tab.
  external JSPromise detectLanguage(int? tabId);

  /// Captures the visible area of the currently active tab in the specified
  /// window. In order to call this method, the extension must have either the
  /// <a href='declare_permissions'><all_urls></a> permission or the <a
  /// href='activeTab'>activeTab</a> permission. In addition to sites that
  /// extensions can normally access, this method allows extensions to capture
  /// sensitive sites that are otherwise restricted, including chrome:-scheme
  /// pages, other extensions' pages, and data: URLs. These sensitive sites can
  /// only be captured with the activeTab permission. File URLs may be captured
  /// only if the extension has been granted file access.
  external JSPromise captureVisibleTab(
    int? windowId,
    ImageDetails? options,
  );

  /// Injects JavaScript code into a page. For details, see the <a
  /// href='content_scripts#pi'>programmatic injection</a> section of the
  /// content scripts doc.
  external JSPromise executeScript(
    int? tabId,
    InjectDetails details,
  );

  /// Injects CSS into a page. Styles inserted with this method can be removed
  /// with $(ref:scripting.removeCSS). For details, see the <a
  /// href='content_scripts#pi'>programmatic injection</a> section of the
  /// content scripts doc.
  external JSPromise insertCSS(
    int? tabId,
    InjectDetails details,
  );

  /// Removes from a page CSS that was previously injected by a call to
  /// $(ref:scripting.insertCSS).
  external JSPromise removeCSS(
    int? tabId,
    DeleteInjectionDetails details,
  );

  /// Zooms a specified tab.
  external JSPromise setZoom(
    int? tabId,
    num zoomFactor,
  );

  /// Gets the current zoom factor of a specified tab.
  external JSPromise getZoom(int? tabId);

  /// Sets the zoom settings for a specified tab, which define how zoom changes
  /// are handled. These settings are reset to defaults upon navigating the tab.
  external JSPromise setZoomSettings(
    int? tabId,
    ZoomSettings zoomSettings,
  );

  /// Gets the current zoom settings of a specified tab.
  external JSPromise getZoomSettings(int? tabId);

  /// Discards a tab from memory. Discarded tabs are still visible on the tab
  /// strip and are reloaded when activated.
  external JSPromise discard(int? tabId);

  /// Go foward to the next page, if one is available.
  external JSPromise goForward(int? tabId);

  /// Go back to the previous page, if one is available.
  external JSPromise goBack(int? tabId);

  /// Fired when a tab is created. Note that the tab's URL and tab group
  /// membership may not be set at the time this event is fired, but you can
  /// listen to onUpdated events so as to be notified when a URL is set or the
  /// tab is added to a tab group.
  external ChromeEvent get onCreated;

  /// Fired when a tab is updated.
  external ChromeEvent get onUpdated;

  /// Fired when a tab is moved within a window. Only one move event is fired,
  /// representing the tab the user directly moved. Move events are not fired
  /// for the other tabs that must move in response to the manually-moved tab.
  /// This event is not fired when a tab is moved between windows; for details,
  /// see $(ref:tabs.onDetached).
  external ChromeEvent get onMoved;

  /// Fires when the selected tab in a window changes.
  external ChromeEvent get onSelectionChanged;

  /// Fires when the selected tab in a window changes. Note that the tab's URL
  /// may not be set at the time this event fired, but you can listen to
  /// $(ref:tabs.onUpdated) events so as to be notified when a URL is set.
  external ChromeEvent get onActiveChanged;

  /// Fires when the active tab in a window changes. Note that the tab's URL may
  /// not be set at the time this event fired, but you can listen to onUpdated
  /// events so as to be notified when a URL is set.
  external ChromeEvent get onActivated;

  /// Fired when the highlighted or selected tabs in a window changes.
  external ChromeEvent get onHighlightChanged;

  /// Fired when the highlighted or selected tabs in a window changes.
  external ChromeEvent get onHighlighted;

  /// Fired when a tab is detached from a window; for example, because it was
  /// moved between windows.
  external ChromeEvent get onDetached;

  /// Fired when a tab is attached to a window; for example, because it was
  /// moved between windows.
  external ChromeEvent get onAttached;

  /// Fired when a tab is closed.
  external ChromeEvent get onRemoved;

  /// Fired when a tab is replaced with another tab due to prerendering or
  /// instant.
  external ChromeEvent get onReplaced;

  /// Fired when a tab is zoomed.
  external ChromeEvent get onZoomChange;

  /// The maximum number of times that $(ref:captureVisibleTab) can be called
  /// per second. $(ref:captureVisibleTab) is expensive and should not be called
  /// too often.
  external int get MAX_CAPTURE_VISIBLE_TAB_CALLS_PER_SECOND;

  /// An ID that represents the absence of a browser tab.
  external int get TAB_ID_NONE;
}

/// The tab's loading status.
typedef TabStatus = String;

/// An event that caused a muted state change.
typedef MutedInfoReason = String;

/// Defines how zoom changes are handled, i.e., which entity is responsible for
/// the actual scaling of the page; defaults to `automatic`.
typedef ZoomSettingsMode = String;

/// Defines whether zoom changes persist for the page's origin, or only take
/// effect in this tab; defaults to `per-origin` when in `automatic` mode, and
/// `per-tab` otherwise.
typedef ZoomSettingsScope = String;

/// The type of window.
typedef WindowType = String;

@JS()
@staticInterop
class MutedInfo {}

extension MutedInfoExtension on MutedInfo {
  /// Whether the tab is muted (prevented from playing sound). The tab may be
  /// muted even if it has not played or is not currently playing sound.
  /// Equivalent to whether the 'muted' audio indicator is showing.
  external bool muted;

  /// The reason the tab was muted or unmuted. Not set if the tab's mute state
  /// has never been changed.
  external MutedInfoReason? reason;

  /// The ID of the extension that changed the muted state. Not set if an
  /// extension was not the reason the muted state last changed.
  external String? extensionId;
}

@JS()
@staticInterop
class Tab {}

extension TabExtension on Tab {
  /// The ID of the tab. Tab IDs are unique within a browser session. Under some
  /// circumstances a tab may not be assigned an ID; for example, when querying
  /// foreign tabs using the $(ref:sessions) API, in which case a session ID may
  /// be present. Tab ID can also be set to `chrome.tabs.TAB_ID_NONE` for apps
  /// and devtools windows.
  external int? id;

  /// The zero-based index of the tab within its window.
  external int index;

  /// The ID of the group that the tab belongs to.
  external int groupId;

  /// The ID of the window that contains the tab.
  external int windowId;

  /// The ID of the tab that opened this tab, if any. This property is only
  /// present if the opener tab still exists.
  external int? openerTabId;

  /// Whether the tab is selected.
  external bool selected;

  /// Whether the tab is highlighted.
  external bool highlighted;

  /// Whether the tab is active in its window. Does not necessarily mean the
  /// window is focused.
  external bool active;

  /// Whether the tab is pinned.
  external bool pinned;

  /// Whether the tab has produced sound over the past couple of seconds (but it
  /// might not be heard if also muted). Equivalent to whether the 'speaker
  /// audio' indicator is showing.
  external bool? audible;

  /// Whether the tab is discarded. A discarded tab is one whose content has
  /// been unloaded from memory, but is still visible in the tab strip. Its
  /// content is reloaded the next time it is activated.
  external bool discarded;

  /// Whether the tab can be discarded automatically by the browser when
  /// resources are low.
  external bool autoDiscardable;

  /// The tab's muted state and the reason for the last state change.
  external MutedInfo? mutedInfo;

  /// The last committed URL of the main frame of the tab. This property is only
  /// present if the extension's manifest includes the `"tabs"` permission and
  /// may be an empty string if the tab has not yet committed. See also
  /// $(ref:Tab.pendingUrl).
  external String? url;

  /// The URL the tab is navigating to, before it has committed. This property
  /// is only present if the extension's manifest includes the `"tabs"`
  /// permission and there is a pending navigation.
  external String? pendingUrl;

  /// The title of the tab. This property is only present if the extension's
  /// manifest includes the `"tabs"` permission.
  external String? title;

  /// The URL of the tab's favicon. This property is only present if the
  /// extension's manifest includes the `"tabs"` permission. It may also be an
  /// empty string if the tab is loading.
  external String? favIconUrl;

  /// The tab's loading status.
  external TabStatus? status;

  /// Whether the tab is in an incognito window.
  external bool incognito;

  /// The width of the tab in pixels.
  external int? width;

  /// The height of the tab in pixels.
  external int? height;

  /// The session ID used to uniquely identify a tab obtained from the
  /// $(ref:sessions) API.
  external String? sessionId;
}

@JS()
@staticInterop
class ZoomSettings {}

extension ZoomSettingsExtension on ZoomSettings {
  /// Defines how zoom changes are handled, i.e., which entity is responsible
  /// for the actual scaling of the page; defaults to `automatic`.
  external ZoomSettingsMode? mode;

  /// Defines whether zoom changes persist for the page's origin, or only take
  /// effect in this tab; defaults to `per-origin` when in `automatic` mode, and
  /// `per-tab` otherwise.
  external ZoomSettingsScope? scope;

  /// Used to return the default zoom level for the current tab in calls to
  /// tabs.getZoomSettings.
  external num? defaultZoomFactor;
}

@JS()
@staticInterop
class OnUpdatedChangeInfo {}

extension OnUpdatedChangeInfoExtension on OnUpdatedChangeInfo {
  /// The tab's loading status.
  external TabStatus? status;

  /// The tab's URL if it has changed.
  external String? url;

  /// The tab's new group.
  external int? groupId;

  /// The tab's new pinned state.
  external bool? pinned;

  /// The tab's new audible state.
  external bool? audible;

  /// The tab's new discarded state.
  external bool? discarded;

  /// The tab's new auto-discardable state.
  external bool? autoDiscardable;

  /// The tab's new muted state and the reason for the change.
  external MutedInfo? mutedInfo;

  /// The tab's new favicon URL.
  external String? favIconUrl;

  /// The tab's new title.
  external String? title;
}

@JS()
@staticInterop
class OnMovedMoveInfo {}

extension OnMovedMoveInfoExtension on OnMovedMoveInfo {
  external int windowId;

  external int fromIndex;

  external int toIndex;
}

@JS()
@staticInterop
class OnSelectionChangedSelectInfo {}

extension OnSelectionChangedSelectInfoExtension
    on OnSelectionChangedSelectInfo {
  /// The ID of the window the selected tab changed inside of.
  external int windowId;
}

@JS()
@staticInterop
class OnActiveChangedSelectInfo {}

extension OnActiveChangedSelectInfoExtension on OnActiveChangedSelectInfo {
  /// The ID of the window the selected tab changed inside of.
  external int windowId;
}

@JS()
@staticInterop
class OnActivatedActiveInfo {}

extension OnActivatedActiveInfoExtension on OnActivatedActiveInfo {
  /// The ID of the tab that has become active.
  external int tabId;

  /// The ID of the window the active tab changed inside of.
  external int windowId;
}

@JS()
@staticInterop
class OnHighlightChangedSelectInfo {}

extension OnHighlightChangedSelectInfoExtension
    on OnHighlightChangedSelectInfo {
  /// The window whose tabs changed.
  external int windowId;

  /// All highlighted tabs in the window.
  external JSArray tabIds;
}

@JS()
@staticInterop
class OnHighlightedHighlightInfo {}

extension OnHighlightedHighlightInfoExtension on OnHighlightedHighlightInfo {
  /// The window whose tabs changed.
  external int windowId;

  /// All highlighted tabs in the window.
  external JSArray tabIds;
}

@JS()
@staticInterop
class OnDetachedDetachInfo {}

extension OnDetachedDetachInfoExtension on OnDetachedDetachInfo {
  external int oldWindowId;

  external int oldPosition;
}

@JS()
@staticInterop
class OnAttachedAttachInfo {}

extension OnAttachedAttachInfoExtension on OnAttachedAttachInfo {
  external int newWindowId;

  external int newPosition;
}

@JS()
@staticInterop
class OnRemovedRemoveInfo {}

extension OnRemovedRemoveInfoExtension on OnRemovedRemoveInfo {
  /// The window whose tab is closed.
  external int windowId;

  /// True when the tab was closed because its parent window was closed.
  external bool isWindowClosing;
}

@JS()
@staticInterop
class OnZoomChangeZoomChangeInfo {}

extension OnZoomChangeZoomChangeInfoExtension on OnZoomChangeZoomChangeInfo {
  external int tabId;

  external num oldZoomFactor;

  external num newZoomFactor;

  external ZoomSettings zoomSettings;
}

@JS()
@staticInterop
@anonymous
class ConnectInfo {
  external factory ConnectInfo({
    /// Is passed into onConnect for content scripts that are listening for the
    /// connection event.
    String? name,

    /// Open a port to a specific <a href='webNavigation#frame_ids'>frame</a>
    /// identified by `frameId` instead of all frames in the tab.
    int? frameId,

    /// Open a port to a specific <a
    /// href='webNavigation#document_ids'>document</a> identified by `documentId`
    /// instead of all frames in the tab.
    String? documentId,
  });
}

@JS()
@staticInterop
@anonymous
class SendMessageOptions {
  external factory SendMessageOptions({
    /// Send a message to a specific <a href='webNavigation#frame_ids'>frame</a>
    /// identified by `frameId` instead of all frames in the tab.
    int? frameId,

    /// Send a message to a specific <a
    /// href='webNavigation#document_ids'>document</a> identified by `documentId`
    /// instead of all frames in the tab.
    String? documentId,
  });
}

@JS()
@staticInterop
@anonymous
class CreateProperties {
  external factory CreateProperties({
    /// The window in which to create the new tab. Defaults to the <a
    /// href='windows#current-window'>current window</a>.
    int? windowId,

    /// The position the tab should take in the window. The provided value is
    /// clamped to between zero and the number of tabs in the window.
    int? index,

    /// The URL to initially navigate the tab to. Fully-qualified URLs must
    /// include a scheme (i.e., 'http://www.google.com', not 'www.google.com').
    /// Relative URLs are relative to the current page within the extension.
    /// Defaults to the New Tab Page.
    String? url,

    /// Whether the tab should become the active tab in the window. Does not
    /// affect whether the window is focused (see $(ref:windows.update)). Defaults
    /// to `true`.
    bool? active,

    /// Whether the tab should become the selected tab in the window. Defaults to
    /// `true`
    bool? selected,

    /// Whether the tab should be pinned. Defaults to `false`
    bool? pinned,

    /// The ID of the tab that opened this tab. If specified, the opener tab must
    /// be in the same window as the newly created tab.
    int? openerTabId,
  });
}

@JS()
@staticInterop
@anonymous
class QueryInfo {
  external factory QueryInfo({
    /// Whether the tabs are active in their windows.
    bool? active,

    /// Whether the tabs are pinned.
    bool? pinned,

    /// Whether the tabs are audible.
    bool? audible,

    /// Whether the tabs are muted.
    bool? muted,

    /// Whether the tabs are highlighted.
    bool? highlighted,

    /// Whether the tabs are discarded. A discarded tab is one whose content has
    /// been unloaded from memory, but is still visible in the tab strip. Its
    /// content is reloaded the next time it is activated.
    bool? discarded,

    /// Whether the tabs can be discarded automatically by the browser when
    /// resources are low.
    bool? autoDiscardable,

    /// Whether the tabs are in the <a href='windows#current-window'>current
    /// window</a>.
    bool? currentWindow,

    /// Whether the tabs are in the last focused window.
    bool? lastFocusedWindow,

    /// The tab loading status.
    TabStatus? status,

    /// Match page titles against a pattern. This property is ignored if the
    /// extension does not have the `"tabs"` permission.
    String? title,

    /// Match tabs against one or more <a href='match_patterns'>URL patterns</a>.
    /// Fragment identifiers are not matched. This property is ignored if the
    /// extension does not have the `"tabs"` permission.
    JSObject? url,

    /// The ID of the group that the tabs are in, or
    /// $(ref:tabGroups.TAB_GROUP_ID_NONE) for ungrouped tabs.
    int? groupId,

    /// The ID of the parent window, or $(ref:windows.WINDOW_ID_CURRENT) for the
    /// <a href='windows#current-window'>current window</a>.
    int? windowId,

    /// The type of window the tabs are in.
    WindowType? windowType,

    /// The position of the tabs within their windows.
    int? index,
  });
}

@JS()
@staticInterop
@anonymous
class HighlightInfo {
  external factory HighlightInfo({
    /// The window that contains the tabs.
    int? windowId,

    /// One or more tab indices to highlight.
    JSObject tabs,
  });
}

@JS()
@staticInterop
@anonymous
class UpdateProperties {
  external factory UpdateProperties({
    /// A URL to navigate the tab to. JavaScript URLs are not supported; use
    /// $(ref:scripting.executeScript) instead.
    String? url,

    /// Whether the tab should be active. Does not affect whether the window is
    /// focused (see $(ref:windows.update)).
    bool? active,

    /// Adds or removes the tab from the current selection.
    bool? highlighted,

    /// Whether the tab should be selected.
    bool? selected,

    /// Whether the tab should be pinned.
    bool? pinned,

    /// Whether the tab should be muted.
    bool? muted,

    /// The ID of the tab that opened this tab. If specified, the opener tab must
    /// be in the same window as this tab.
    int? openerTabId,

    /// Whether the tab should be discarded automatically by the browser when
    /// resources are low.
    bool? autoDiscardable,
  });
}

@JS()
@staticInterop
@anonymous
class MoveProperties {
  external factory MoveProperties({
    /// Defaults to the window the tab is currently in.
    int? windowId,

    /// The position to move the window to. Use `-1` to place the tab at the end
    /// of the window.
    int index,
  });
}

@JS()
@staticInterop
@anonymous
class ReloadProperties {
  external factory ReloadProperties(
      {
      /// Whether to bypass local caching. Defaults to `false`.
      bool? bypassCache});
}

@JS()
@staticInterop
@anonymous
class GroupOptions {
  external factory GroupOptions({
    /// The tab ID or list of tab IDs to add to the specified group.
    JSObject tabIds,

    /// The ID of the group to add the tabs to. If not specified, a new group will
    /// be created.
    int? groupId,

    /// Configurations for creating a group. Cannot be used if groupId is already
    /// specified.
    GroupOptionsCreateProperties? createProperties,
  });
}

@JS()
@staticInterop
@anonymous
class GroupOptionsCreateProperties {
  external factory GroupOptionsCreateProperties(
      {
      /// The window of the new group. Defaults to the current window.
      int? windowId});
}
