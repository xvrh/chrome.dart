import 'src/internal_helpers.dart';
import 'runtime.dart';
import 'windows.dart';
import 'extension_types.dart';
import 'src/js/tabs.dart' as $js;
export 'chrome.dart';

final _tabs = ChromeTabs._();

extension ChromeTabsExtension on Chrome {
  ChromeTabs get tabs => _tabs;
}

class ChromeTabs {
  ChromeTabs._();

  /// Retrieves details about the specified tab.
  Future<Tab> get(int tabId) => throw UnimplementedError();

  /// Gets the tab that this script call is being made from. May be undefined if
  /// called from a non-tab context (for example, a background page or popup
  /// view).
  Future<Tab?> getCurrent() => throw UnimplementedError();

  /// Connects to the content script(s) in the specified tab. The
  /// [runtime.onConnect] event is fired in each content script running in the
  /// specified tab for the current extension. For more details, see [Content
  /// Script Messaging](messaging).
  Port connect(
    int tabId,
    ConnectInfo? connectInfo,
  ) =>
      throw UnimplementedError();

  /// Sends a single request to the content script(s) in the specified tab, with
  /// an optional callback to run when a response is sent back.  The
  /// [extension.onRequest] event is fired in each content script running in the
  /// specified tab for the current extension.
  Future<JSAny> sendRequest(
    int tabId,
    JSAny request,
  ) =>
      throw UnimplementedError();

  /// Sends a single message to the content script(s) in the specified tab, with
  /// an optional callback to run when a response is sent back.  The
  /// [runtime.onMessage] event is fired in each content script running in the
  /// specified tab for the current extension.
  Future<JSAny> sendMessage(
    int tabId,
    JSAny message,
    SendMessageOptions? options,
  ) =>
      throw UnimplementedError();

  /// Gets the tab that is selected in the specified window.
  Future<Tab> getSelected(int? windowId) => throw UnimplementedError();

  /// Gets details about all tabs in the specified window.
  Future<List<Tab>> getAllInWindow(int? windowId) => throw UnimplementedError();

  /// Creates a new tab.
  Future<Tab> create(CreateProperties createProperties) =>
      throw UnimplementedError();

  /// Duplicates a tab.
  Future<Tab?> duplicate(int tabId) => throw UnimplementedError();

  /// Gets all tabs that have the specified properties, or all tabs if no
  /// properties are specified.
  Future<List<Tab>> query(QueryInfo queryInfo) => throw UnimplementedError();

  /// Highlights the given tabs and focuses on the first of group. Will appear
  /// to do nothing if the specified tab is currently active.
  Future<Window> highlight(HighlightInfo highlightInfo) =>
      throw UnimplementedError();

  /// Modifies the properties of a tab. Properties that are not specified in
  /// [updateProperties] are not modified.
  Future<Tab?> update(
    int? tabId,
    UpdateProperties updateProperties,
  ) =>
      throw UnimplementedError();

  /// Moves one or more tabs to a new position within its window, or to a new
  /// window. Note that tabs can only be moved to and from normal (window.type
  /// === "normal") windows.
  Future<JSAny> move(
    JSAny tabIds,
    MoveProperties moveProperties,
  ) =>
      throw UnimplementedError();

  /// Reload a tab.
  Future<void> reload(
    int? tabId,
    ReloadProperties? reloadProperties,
  ) =>
      throw UnimplementedError();

  /// Closes one or more tabs.
  Future<void> remove(JSAny tabIds) => throw UnimplementedError();

  /// Adds one or more tabs to a specified group, or if no group is specified,
  /// adds the given tabs to a newly created group.
  Future<int> group(GroupOptions options) => throw UnimplementedError();

  /// Removes one or more tabs from their respective groups. If any groups
  /// become empty, they are deleted.
  Future<void> ungroup(JSAny tabIds) => throw UnimplementedError();

  /// Detects the primary language of the content in a tab.
  Future<String> detectLanguage(int? tabId) => throw UnimplementedError();

  /// Captures the visible area of the currently active tab in the specified
  /// window. In order to call this method, the extension must have either the
  /// <a href='declare_permissions'><all_urls></a> permission or the
  /// [activeTab](activeTab) permission. In addition to sites that extensions
  /// can normally access, this method allows extensions to capture sensitive
  /// sites that are otherwise restricted, including chrome:-scheme pages, other
  /// extensions' pages, and data: URLs. These sensitive sites can only be
  /// captured with the activeTab permission. File URLs may be captured only if
  /// the extension has been granted file access.
  Future<String> captureVisibleTab(
    int? windowId,
    ImageDetails? options,
  ) =>
      throw UnimplementedError();

  /// Injects JavaScript code into a page. For details, see the [programmatic
  /// injection](content_scripts#pi) section of the content scripts doc.
  Future<List<JSAny>?> executeScript(
    int? tabId,
    InjectDetails details,
  ) =>
      throw UnimplementedError();

  /// Injects CSS into a page. Styles inserted with this method can be removed
  /// with [scripting.removeCSS]. For details, see the [programmatic
  /// injection](content_scripts#pi) section of the content scripts doc.
  Future<void> insertCSS(
    int? tabId,
    InjectDetails details,
  ) =>
      throw UnimplementedError();

  /// Removes from a page CSS that was previously injected by a call to
  /// [scripting.insertCSS].
  Future<void> removeCSS(
    int? tabId,
    DeleteInjectionDetails details,
  ) =>
      throw UnimplementedError();

  /// Zooms a specified tab.
  Future<void> setZoom(
    int? tabId,
    double zoomFactor,
  ) =>
      throw UnimplementedError();

  /// Gets the current zoom factor of a specified tab.
  Future<double> getZoom(int? tabId) => throw UnimplementedError();

  /// Sets the zoom settings for a specified tab, which define how zoom changes
  /// are handled. These settings are reset to defaults upon navigating the tab.
  Future<void> setZoomSettings(
    int? tabId,
    ZoomSettings zoomSettings,
  ) =>
      throw UnimplementedError();

  /// Gets the current zoom settings of a specified tab.
  Future<ZoomSettings> getZoomSettings(int? tabId) =>
      throw UnimplementedError();

  /// Discards a tab from memory. Discarded tabs are still visible on the tab
  /// strip and are reloaded when activated.
  Future<Tab?> discard(int? tabId) => throw UnimplementedError();

  /// Go foward to the next page, if one is available.
  Future<void> goForward(int? tabId) => throw UnimplementedError();

  /// Go back to the previous page, if one is available.
  Future<void> goBack(int? tabId) => throw UnimplementedError();

  /// The maximum number of times that [captureVisibleTab] can be called per
  /// second. [captureVisibleTab] is expensive and should not be called too
  /// often.
  int get maxCAPTUREVISIBLETABCALLSPERSECOND =>
      $js.chrome.tabs.MAX_CAPTURE_VISIBLE_TAB_CALLS_PER_SECOND as dynamic;

  /// An ID that represents the absence of a browser tab.
  int get tabIDNONE => $js.chrome.tabs.TAB_ID_NONE as dynamic;

  /// Fired when a tab is created. Note that the tab's URL and tab group
  /// membership may not be set at the time this event is fired, but you can
  /// listen to onUpdated events so as to be notified when a URL is set or the
  /// tab is added to a tab group.
  Stream<Tab> get onCreated => throw UnimplementedError();

  /// Fired when a tab is updated.
  Stream<OnUpdatedEvent> get onUpdated => throw UnimplementedError();

  /// Fired when a tab is moved within a window. Only one move event is fired,
  /// representing the tab the user directly moved. Move events are not fired
  /// for the other tabs that must move in response to the manually-moved tab.
  /// This event is not fired when a tab is moved between windows; for details,
  /// see [tabs.onDetached].
  Stream<OnMovedEvent> get onMoved => throw UnimplementedError();

  /// Fires when the selected tab in a window changes.
  Stream<OnSelectionChangedEvent> get onSelectionChanged =>
      throw UnimplementedError();

  /// Fires when the selected tab in a window changes. Note that the tab's URL
  /// may not be set at the time this event fired, but you can listen to
  /// [tabs.onUpdated] events so as to be notified when a URL is set.
  Stream<OnActiveChangedEvent> get onActiveChanged =>
      throw UnimplementedError();

  /// Fires when the active tab in a window changes. Note that the tab's URL may
  /// not be set at the time this event fired, but you can listen to onUpdated
  /// events so as to be notified when a URL is set.
  Stream<OnActivatedActiveInfo> get onActivated => throw UnimplementedError();

  /// Fired when the highlighted or selected tabs in a window changes.
  Stream<OnHighlightChangedSelectInfo> get onHighlightChanged =>
      throw UnimplementedError();

  /// Fired when the highlighted or selected tabs in a window changes.
  Stream<OnHighlightedHighlightInfo> get onHighlighted =>
      throw UnimplementedError();

  /// Fired when a tab is detached from a window; for example, because it was
  /// moved between windows.
  Stream<OnDetachedEvent> get onDetached => throw UnimplementedError();

  /// Fired when a tab is attached to a window; for example, because it was
  /// moved between windows.
  Stream<OnAttachedEvent> get onAttached => throw UnimplementedError();

  /// Fired when a tab is closed.
  Stream<OnRemovedEvent> get onRemoved => throw UnimplementedError();

  /// Fired when a tab is replaced with another tab due to prerendering or
  /// instant.
  Stream<OnReplacedEvent> get onReplaced => throw UnimplementedError();

  /// Fired when a tab is zoomed.
  Stream<OnZoomChangeZoomChangeInfo> get onZoomChange =>
      throw UnimplementedError();
}

/// The tab's loading status.
enum TabStatus {
  unloaded('unloaded'),
  loading('loading'),
  complete('complete');

  const TabStatus(this.value);

  final String value;

  String get toJS => value;
  static TabStatus fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// An event that caused a muted state change.
enum MutedInfoReason {
  /// A user input action set the muted state.
  user('user'),

  /// Tab capture was started, forcing a muted state change.
  capture('capture'),

  /// An extension, identified by the extensionId field, set the muted state.
  extension('extension');

  const MutedInfoReason(this.value);

  final String value;

  String get toJS => value;
  static MutedInfoReason fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Defines how zoom changes are handled, i.e., which entity is responsible for
/// the actual scaling of the page; defaults to `automatic`.
enum ZoomSettingsMode {
  /// Zoom changes are handled automatically by the browser.
  automatic('automatic'),

  /// Overrides the automatic handling of zoom changes. The `onZoomChange` event
  /// will still be dispatched, and it is the extension's responsibility to
  /// listen for this event and manually scale the page. This mode does not
  /// support `per-origin` zooming, and thus ignores the `scope` zoom setting
  /// and assumes `per-tab`.
  manual('manual'),

  /// Disables all zooming in the tab. The tab reverts to the default zoom
  /// level, and all attempted zoom changes are ignored.
  disabled('disabled');

  const ZoomSettingsMode(this.value);

  final String value;

  String get toJS => value;
  static ZoomSettingsMode fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Defines whether zoom changes persist for the page's origin, or only take
/// effect in this tab; defaults to `per-origin` when in `automatic` mode, and
/// `per-tab` otherwise.
enum ZoomSettingsScope {
  /// Zoom changes persist in the zoomed page's origin, i.e., all other tabs
  /// navigated to that same origin are zoomed as well. Moreover, `per-origin`
  /// zoom changes are saved with the origin, meaning that when navigating to
  /// other pages in the same origin, they are all zoomed to the same zoom
  /// factor. The `per-origin` scope is only available in the `automatic` mode.
  perOrigin('per-origin'),

  /// Zoom changes only take effect in this tab, and zoom changes in other tabs
  /// do not affect the zooming of this tab. Also, `per-tab` zoom changes are
  /// reset on navigation; navigating a tab always loads pages with their
  /// `per-origin` zoom factors.
  perTab('per-tab');

  const ZoomSettingsScope(this.value);

  final String value;

  String get toJS => value;
  static ZoomSettingsScope fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// The type of window.
enum WindowType {
  normal('normal'),
  popup('popup'),
  panel('panel'),
  app('app'),
  devtools('devtools');

  const WindowType(this.value);

  final String value;

  String get toJS => value;
  static WindowType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class MutedInfo {
  MutedInfo.fromJS(this._wrapped);

  final $js.MutedInfo _wrapped;

  $js.MutedInfo get toJS => _wrapped;

  /// Whether the tab is muted (prevented from playing sound). The tab may be
  /// muted even if it has not played or is not currently playing sound.
  /// Equivalent to whether the 'muted' audio indicator is showing.
  bool get muted => _wrapped.muted;
  set muted(bool v) {
    throw UnimplementedError();
  }

  /// The reason the tab was muted or unmuted. Not set if the tab's mute state
  /// has never been changed.
  MutedInfoReason? get reason => _wrapped.reason?.let(MutedInfoReason.fromJS);
  set reason(MutedInfoReason? v) {
    throw UnimplementedError();
  }

  /// The ID of the extension that changed the muted state. Not set if an
  /// extension was not the reason the muted state last changed.
  String? get extensionId => _wrapped.extensionId;
  set extensionId(String? v) {
    throw UnimplementedError();
  }
}

class Tab {
  Tab.fromJS(this._wrapped);

  final $js.Tab _wrapped;

  $js.Tab get toJS => _wrapped;

  /// The ID of the tab. Tab IDs are unique within a browser session. Under some
  /// circumstances a tab may not be assigned an ID; for example, when querying
  /// foreign tabs using the [sessions] API, in which case a session ID may be
  /// present. Tab ID can also be set to `chrome.tabs.TAB_ID_NONE` for apps and
  /// devtools windows.
  int? get id => _wrapped.id;
  set id(int? v) {
    throw UnimplementedError();
  }

  /// The zero-based index of the tab within its window.
  int get index => _wrapped.index;
  set index(int v) {
    throw UnimplementedError();
  }

  /// The ID of the group that the tab belongs to.
  int get groupId => _wrapped.groupId;
  set groupId(int v) {
    throw UnimplementedError();
  }

  /// The ID of the window that contains the tab.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    throw UnimplementedError();
  }

  /// The ID of the tab that opened this tab, if any. This property is only
  /// present if the opener tab still exists.
  int? get openerTabId => _wrapped.openerTabId;
  set openerTabId(int? v) {
    throw UnimplementedError();
  }

  /// Whether the tab is selected.
  bool get selected => _wrapped.selected;
  set selected(bool v) {
    throw UnimplementedError();
  }

  /// Whether the tab is highlighted.
  bool get highlighted => _wrapped.highlighted;
  set highlighted(bool v) {
    throw UnimplementedError();
  }

  /// Whether the tab is active in its window. Does not necessarily mean the
  /// window is focused.
  bool get active => _wrapped.active;
  set active(bool v) {
    throw UnimplementedError();
  }

  /// Whether the tab is pinned.
  bool get pinned => _wrapped.pinned;
  set pinned(bool v) {
    throw UnimplementedError();
  }

  /// Whether the tab has produced sound over the past couple of seconds (but it
  /// might not be heard if also muted). Equivalent to whether the 'speaker
  /// audio' indicator is showing.
  bool? get audible => _wrapped.audible;
  set audible(bool? v) {
    throw UnimplementedError();
  }

  /// Whether the tab is discarded. A discarded tab is one whose content has
  /// been unloaded from memory, but is still visible in the tab strip. Its
  /// content is reloaded the next time it is activated.
  bool get discarded => _wrapped.discarded;
  set discarded(bool v) {
    throw UnimplementedError();
  }

  /// Whether the tab can be discarded automatically by the browser when
  /// resources are low.
  bool get autoDiscardable => _wrapped.autoDiscardable;
  set autoDiscardable(bool v) {
    throw UnimplementedError();
  }

  /// The tab's muted state and the reason for the last state change.
  MutedInfo? get mutedInfo => _wrapped.mutedInfo?.let(MutedInfo.fromJS);
  set mutedInfo(MutedInfo? v) {
    throw UnimplementedError();
  }

  /// The last committed URL of the main frame of the tab. This property is only
  /// present if the extension's manifest includes the `"tabs"` permission and
  /// may be an empty string if the tab has not yet committed. See also
  /// [Tab.pendingUrl].
  String? get url => _wrapped.url;
  set url(String? v) {
    throw UnimplementedError();
  }

  /// The URL the tab is navigating to, before it has committed. This property
  /// is only present if the extension's manifest includes the `"tabs"`
  /// permission and there is a pending navigation.
  String? get pendingUrl => _wrapped.pendingUrl;
  set pendingUrl(String? v) {
    throw UnimplementedError();
  }

  /// The title of the tab. This property is only present if the extension's
  /// manifest includes the `"tabs"` permission.
  String? get title => _wrapped.title;
  set title(String? v) {
    throw UnimplementedError();
  }

  /// The URL of the tab's favicon. This property is only present if the
  /// extension's manifest includes the `"tabs"` permission. It may also be an
  /// empty string if the tab is loading.
  String? get favIconUrl => _wrapped.favIconUrl;
  set favIconUrl(String? v) {
    throw UnimplementedError();
  }

  /// The tab's loading status.
  TabStatus? get status => _wrapped.status?.let(TabStatus.fromJS);
  set status(TabStatus? v) {
    throw UnimplementedError();
  }

  /// Whether the tab is in an incognito window.
  bool get incognito => _wrapped.incognito;
  set incognito(bool v) {
    throw UnimplementedError();
  }

  /// The width of the tab in pixels.
  int? get width => _wrapped.width;
  set width(int? v) {
    throw UnimplementedError();
  }

  /// The height of the tab in pixels.
  int? get height => _wrapped.height;
  set height(int? v) {
    throw UnimplementedError();
  }

  /// The session ID used to uniquely identify a tab obtained from the
  /// [sessions] API.
  String? get sessionId => _wrapped.sessionId;
  set sessionId(String? v) {
    throw UnimplementedError();
  }
}

class ZoomSettings {
  ZoomSettings.fromJS(this._wrapped);

  final $js.ZoomSettings _wrapped;

  $js.ZoomSettings get toJS => _wrapped;

  /// Defines how zoom changes are handled, i.e., which entity is responsible
  /// for the actual scaling of the page; defaults to `automatic`.
  ZoomSettingsMode? get mode => _wrapped.mode?.let(ZoomSettingsMode.fromJS);
  set mode(ZoomSettingsMode? v) {
    throw UnimplementedError();
  }

  /// Defines whether zoom changes persist for the page's origin, or only take
  /// effect in this tab; defaults to `per-origin` when in `automatic` mode, and
  /// `per-tab` otherwise.
  ZoomSettingsScope? get scope => _wrapped.scope?.let(ZoomSettingsScope.fromJS);
  set scope(ZoomSettingsScope? v) {
    throw UnimplementedError();
  }

  /// Used to return the default zoom level for the current tab in calls to
  /// tabs.getZoomSettings.
  double? get defaultZoomFactor => _wrapped.defaultZoomFactor;
  set defaultZoomFactor(double? v) {
    throw UnimplementedError();
  }
}

class OnUpdatedChangeInfo {
  OnUpdatedChangeInfo.fromJS(this._wrapped);

  final $js.OnUpdatedChangeInfo _wrapped;

  $js.OnUpdatedChangeInfo get toJS => _wrapped;

  /// The tab's loading status.
  TabStatus? get status => _wrapped.status?.let(TabStatus.fromJS);
  set status(TabStatus? v) {
    throw UnimplementedError();
  }

  /// The tab's URL if it has changed.
  String? get url => _wrapped.url;
  set url(String? v) {
    throw UnimplementedError();
  }

  /// The tab's new group.
  int? get groupId => _wrapped.groupId;
  set groupId(int? v) {
    throw UnimplementedError();
  }

  /// The tab's new pinned state.
  bool? get pinned => _wrapped.pinned;
  set pinned(bool? v) {
    throw UnimplementedError();
  }

  /// The tab's new audible state.
  bool? get audible => _wrapped.audible;
  set audible(bool? v) {
    throw UnimplementedError();
  }

  /// The tab's new discarded state.
  bool? get discarded => _wrapped.discarded;
  set discarded(bool? v) {
    throw UnimplementedError();
  }

  /// The tab's new auto-discardable state.
  bool? get autoDiscardable => _wrapped.autoDiscardable;
  set autoDiscardable(bool? v) {
    throw UnimplementedError();
  }

  /// The tab's new muted state and the reason for the change.
  MutedInfo? get mutedInfo => _wrapped.mutedInfo?.let(MutedInfo.fromJS);
  set mutedInfo(MutedInfo? v) {
    throw UnimplementedError();
  }

  /// The tab's new favicon URL.
  String? get favIconUrl => _wrapped.favIconUrl;
  set favIconUrl(String? v) {
    throw UnimplementedError();
  }

  /// The tab's new title.
  String? get title => _wrapped.title;
  set title(String? v) {
    throw UnimplementedError();
  }
}

class OnMovedMoveInfo {
  OnMovedMoveInfo.fromJS(this._wrapped);

  final $js.OnMovedMoveInfo _wrapped;

  $js.OnMovedMoveInfo get toJS => _wrapped;

  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    throw UnimplementedError();
  }

  int get fromIndex => _wrapped.fromIndex;
  set fromIndex(int v) {
    throw UnimplementedError();
  }

  int get toIndex => _wrapped.toIndex;
  set toIndex(int v) {
    throw UnimplementedError();
  }
}

class OnSelectionChangedSelectInfo {
  OnSelectionChangedSelectInfo.fromJS(this._wrapped);

  final $js.OnSelectionChangedSelectInfo _wrapped;

  $js.OnSelectionChangedSelectInfo get toJS => _wrapped;

  /// The ID of the window the selected tab changed inside of.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    throw UnimplementedError();
  }
}

class OnActiveChangedSelectInfo {
  OnActiveChangedSelectInfo.fromJS(this._wrapped);

  final $js.OnActiveChangedSelectInfo _wrapped;

  $js.OnActiveChangedSelectInfo get toJS => _wrapped;

  /// The ID of the window the selected tab changed inside of.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    throw UnimplementedError();
  }
}

class OnActivatedActiveInfo {
  OnActivatedActiveInfo.fromJS(this._wrapped);

  final $js.OnActivatedActiveInfo _wrapped;

  $js.OnActivatedActiveInfo get toJS => _wrapped;

  /// The ID of the tab that has become active.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }

  /// The ID of the window the active tab changed inside of.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    throw UnimplementedError();
  }
}

class OnHighlightChangedSelectInfo {
  OnHighlightChangedSelectInfo.fromJS(this._wrapped);

  final $js.OnHighlightChangedSelectInfo _wrapped;

  $js.OnHighlightChangedSelectInfo get toJS => _wrapped;

  /// The window whose tabs changed.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    throw UnimplementedError();
  }

  /// All highlighted tabs in the window.
  List<int> get tabIds => throw UnimplementedError();
  set tabIds(List<int> v) {
    throw UnimplementedError();
  }
}

class OnHighlightedHighlightInfo {
  OnHighlightedHighlightInfo.fromJS(this._wrapped);

  final $js.OnHighlightedHighlightInfo _wrapped;

  $js.OnHighlightedHighlightInfo get toJS => _wrapped;

  /// The window whose tabs changed.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    throw UnimplementedError();
  }

  /// All highlighted tabs in the window.
  List<int> get tabIds => throw UnimplementedError();
  set tabIds(List<int> v) {
    throw UnimplementedError();
  }
}

class OnDetachedDetachInfo {
  OnDetachedDetachInfo.fromJS(this._wrapped);

  final $js.OnDetachedDetachInfo _wrapped;

  $js.OnDetachedDetachInfo get toJS => _wrapped;

  int get oldWindowId => _wrapped.oldWindowId;
  set oldWindowId(int v) {
    throw UnimplementedError();
  }

  int get oldPosition => _wrapped.oldPosition;
  set oldPosition(int v) {
    throw UnimplementedError();
  }
}

class OnAttachedAttachInfo {
  OnAttachedAttachInfo.fromJS(this._wrapped);

  final $js.OnAttachedAttachInfo _wrapped;

  $js.OnAttachedAttachInfo get toJS => _wrapped;

  int get newWindowId => _wrapped.newWindowId;
  set newWindowId(int v) {
    throw UnimplementedError();
  }

  int get newPosition => _wrapped.newPosition;
  set newPosition(int v) {
    throw UnimplementedError();
  }
}

class OnRemovedRemoveInfo {
  OnRemovedRemoveInfo.fromJS(this._wrapped);

  final $js.OnRemovedRemoveInfo _wrapped;

  $js.OnRemovedRemoveInfo get toJS => _wrapped;

  /// The window whose tab is closed.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    throw UnimplementedError();
  }

  /// True when the tab was closed because its parent window was closed.
  bool get isWindowClosing => _wrapped.isWindowClosing;
  set isWindowClosing(bool v) {
    throw UnimplementedError();
  }
}

class OnZoomChangeZoomChangeInfo {
  OnZoomChangeZoomChangeInfo.fromJS(this._wrapped);

  final $js.OnZoomChangeZoomChangeInfo _wrapped;

  $js.OnZoomChangeZoomChangeInfo get toJS => _wrapped;

  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    throw UnimplementedError();
  }

  double get oldZoomFactor => _wrapped.oldZoomFactor;
  set oldZoomFactor(double v) {
    throw UnimplementedError();
  }

  double get newZoomFactor => _wrapped.newZoomFactor;
  set newZoomFactor(double v) {
    throw UnimplementedError();
  }

  ZoomSettings get zoomSettings => ZoomSettings.fromJS(_wrapped.zoomSettings);
  set zoomSettings(ZoomSettings v) {
    throw UnimplementedError();
  }
}

class ConnectInfo {
  ConnectInfo.fromJS(this._wrapped);

  final $js.ConnectInfo _wrapped;

  $js.ConnectInfo get toJS => _wrapped;
}

class SendMessageOptions {
  SendMessageOptions.fromJS(this._wrapped);

  final $js.SendMessageOptions _wrapped;

  $js.SendMessageOptions get toJS => _wrapped;
}

class CreateProperties {
  CreateProperties.fromJS(this._wrapped);

  final $js.CreateProperties _wrapped;

  $js.CreateProperties get toJS => _wrapped;
}

class QueryInfo {
  QueryInfo.fromJS(this._wrapped);

  final $js.QueryInfo _wrapped;

  $js.QueryInfo get toJS => _wrapped;
}

class HighlightInfo {
  HighlightInfo.fromJS(this._wrapped);

  final $js.HighlightInfo _wrapped;

  $js.HighlightInfo get toJS => _wrapped;
}

class UpdateProperties {
  UpdateProperties.fromJS(this._wrapped);

  final $js.UpdateProperties _wrapped;

  $js.UpdateProperties get toJS => _wrapped;
}

class MoveProperties {
  MoveProperties.fromJS(this._wrapped);

  final $js.MoveProperties _wrapped;

  $js.MoveProperties get toJS => _wrapped;
}

class ReloadProperties {
  ReloadProperties.fromJS(this._wrapped);

  final $js.ReloadProperties _wrapped;

  $js.ReloadProperties get toJS => _wrapped;
}

class GroupOptions {
  GroupOptions.fromJS(this._wrapped);

  final $js.GroupOptions _wrapped;

  $js.GroupOptions get toJS => _wrapped;
}

class GroupOptionsCreateProperties {
  GroupOptionsCreateProperties.fromJS(this._wrapped);

  final $js.GroupOptionsCreateProperties _wrapped;

  $js.GroupOptionsCreateProperties get toJS => _wrapped;
}

class OnUpdatedEvent {
  OnUpdatedEvent({
    required this.tabId,
    required this.changeInfo,
    required this.tab,
  });

  final int tabId;

  /// Lists the changes to the state of the tab that was updated.
  final OnUpdatedChangeInfo changeInfo;

  /// Gives the state of the tab that was updated.
  final Tab tab;
}

class OnMovedEvent {
  OnMovedEvent({
    required this.tabId,
    required this.moveInfo,
  });

  final int tabId;

  final OnMovedMoveInfo moveInfo;
}

class OnSelectionChangedEvent {
  OnSelectionChangedEvent({
    required this.tabId,
    required this.selectInfo,
  });

  /// The ID of the tab that has become active.
  final int tabId;

  final OnSelectionChangedSelectInfo selectInfo;
}

class OnActiveChangedEvent {
  OnActiveChangedEvent({
    required this.tabId,
    required this.selectInfo,
  });

  /// The ID of the tab that has become active.
  final int tabId;

  final OnActiveChangedSelectInfo selectInfo;
}

class OnDetachedEvent {
  OnDetachedEvent({
    required this.tabId,
    required this.detachInfo,
  });

  final int tabId;

  final OnDetachedDetachInfo detachInfo;
}

class OnAttachedEvent {
  OnAttachedEvent({
    required this.tabId,
    required this.attachInfo,
  });

  final int tabId;

  final OnAttachedAttachInfo attachInfo;
}

class OnRemovedEvent {
  OnRemovedEvent({
    required this.tabId,
    required this.removeInfo,
  });

  final int tabId;

  final OnRemovedRemoveInfo removeInfo;
}

class OnReplacedEvent {
  OnReplacedEvent({
    required this.addedTabId,
    required this.removedTabId,
  });

  final int addedTabId;

  final int removedTabId;
}
