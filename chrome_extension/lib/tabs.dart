import 'extension_types.dart';
import 'runtime.dart';
import 'src/internal_helpers.dart';
import 'src/js/tabs.dart' as $js;
import 'src/js/windows.dart' as $js_windows;
import 'windows.dart';

export 'src/chrome.dart' show chrome;

final _tabs = ChromeTabs._();

extension ChromeTabsExtension on Chrome {
  ChromeTabs get tabs => _tabs;
}

class ChromeTabs {
  ChromeTabs._();

  /// Retrieves details about the specified tab.
  Future<Tab> get(int tabId) {
    var $completer = Completer<Tab>();
    $js.chrome.tabs.get(
      tabId,
      ($js.Tab tab) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(Tab.fromJS(tab));
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the tab that this script call is being made from. May be undefined if
  /// called from a non-tab context (for example, a background page or popup
  /// view).
  Future<Tab?> getCurrent() {
    var $completer = Completer<Tab?>();
    $js.chrome.tabs.getCurrent(($js.Tab? tab) {
      if (checkRuntimeLastError($completer)) {
        $completer.complete(tab?.let(Tab.fromJS));
      }
    }.toJS);
    return $completer.future;
  }

  /// Connects to the content script(s) in the specified tab. The
  /// [runtime.onConnect] event is fired in each content script running in the
  /// specified tab for the current extension. For more details, see [Content
  /// Script Messaging](messaging).
  Port connect(
    int tabId,
    ConnectInfo? connectInfo,
  ) {
    return Port.fromJS($js.chrome.tabs.connect(
      tabId,
      connectInfo?.toJS,
    ));
  }

  /// Sends a single request to the content script(s) in the specified tab, with
  /// an optional callback to run when a response is sent back.  The
  /// [extension.onRequest] event is fired in each content script running in the
  /// specified tab for the current extension.
  Future<Object> sendRequest(
    int tabId,
    Object request,
  ) {
    var $completer = Completer<Object>();
    $js.chrome.tabs.sendRequest(
      tabId,
      request.toJS,
      (JSAny response) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(response);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Sends a single message to the content script(s) in the specified tab, with
  /// an optional callback to run when a response is sent back.  The
  /// [runtime.onMessage] event is fired in each content script running in the
  /// specified tab for the current extension.
  Future<Object> sendMessage(
    int tabId,
    Object message,
    SendMessageOptions? options,
  ) {
    var $completer = Completer<Object>();
    $js.chrome.tabs.sendMessage(
      tabId,
      message.toJS,
      options?.toJS,
      (JSAny response) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(response);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the tab that is selected in the specified window.
  Future<Tab> getSelected(int? windowId) {
    var $completer = Completer<Tab>();
    $js.chrome.tabs.getSelected(
      windowId,
      ($js.Tab tab) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(Tab.fromJS(tab));
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets details about all tabs in the specified window.
  Future<List<Tab>> getAllInWindow(int? windowId) {
    var $completer = Completer<List<Tab>>();
    $js.chrome.tabs.getAllInWindow(
      windowId,
      (JSArray tabs) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(
              tabs.toDart.cast<$js.Tab>().map((e) => Tab.fromJS(e)).toList());
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Creates a new tab.
  Future<Tab> create(CreateProperties createProperties) {
    var $completer = Completer<Tab>();
    $js.chrome.tabs.create(
      createProperties.toJS,
      ($js.Tab tab) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(Tab.fromJS(tab));
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Duplicates a tab.
  Future<Tab?> duplicate(int tabId) {
    var $completer = Completer<Tab?>();
    $js.chrome.tabs.duplicate(
      tabId,
      ($js.Tab? tab) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(tab?.let(Tab.fromJS));
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets all tabs that have the specified properties, or all tabs if no
  /// properties are specified.
  Future<List<Tab>> query(QueryInfo queryInfo) {
    var $completer = Completer<List<Tab>>();
    $js.chrome.tabs.query(
      queryInfo.toJS,
      (JSArray result) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(
              result.toDart.cast<$js.Tab>().map((e) => Tab.fromJS(e)).toList());
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Highlights the given tabs and focuses on the first of group. Will appear
  /// to do nothing if the specified tab is currently active.
  Future<Window> highlight(HighlightInfo highlightInfo) {
    var $completer = Completer<Window>();
    $js.chrome.tabs.highlight(
      highlightInfo.toJS,
      ($js_windows.Window window) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(Window.fromJS(window));
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Modifies the properties of a tab. Properties that are not specified in
  /// [updateProperties] are not modified.
  Future<Tab?> update(
    int? tabId,
    UpdateProperties updateProperties,
  ) {
    var $completer = Completer<Tab?>();
    $js.chrome.tabs.update(
      tabId,
      updateProperties.toJS,
      ($js.Tab? tab) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(tab?.let(Tab.fromJS));
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Moves one or more tabs to a new position within its window, or to a new
  /// window. Note that tabs can only be moved to and from normal (window.type
  /// === "normal") windows.
  Future<Object> move(
    Object tabIds,
    MoveProperties moveProperties,
  ) {
    var $completer = Completer<Object>();
    $js.chrome.tabs.move(
      tabIds.toJS,
      moveProperties.toJS,
      (JSAny tabs) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(tabs);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Reload a tab.
  Future<void> reload(
    int? tabId,
    ReloadProperties? reloadProperties,
  ) {
    var $completer = Completer<void>();
    $js.chrome.tabs.reload(
      tabId,
      reloadProperties?.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Closes one or more tabs.
  Future<void> remove(Object tabIds) {
    var $completer = Completer<void>();
    $js.chrome.tabs.remove(
      tabIds.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Adds one or more tabs to a specified group, or if no group is specified,
  /// adds the given tabs to a newly created group.
  Future<int> group(GroupOptions options) {
    var $completer = Completer<int>();
    $js.chrome.tabs.group(
      options.toJS,
      (int groupId) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(groupId);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Removes one or more tabs from their respective groups. If any groups
  /// become empty, they are deleted.
  Future<void> ungroup(Object tabIds) {
    var $completer = Completer<void>();
    $js.chrome.tabs.ungroup(
      tabIds.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Detects the primary language of the content in a tab.
  Future<String> detectLanguage(int? tabId) {
    var $completer = Completer<String>();
    $js.chrome.tabs.detectLanguage(
      tabId,
      (String language) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(language);
        }
      }.toJS,
    );
    return $completer.future;
  }

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
  ) {
    var $completer = Completer<String>();
    $js.chrome.tabs.captureVisibleTab(
      windowId,
      options?.toJS,
      (String dataUrl) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(dataUrl);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Injects JavaScript code into a page. For details, see the [programmatic
  /// injection](content_scripts#pi) section of the content scripts doc.
  Future<List<Object>?> executeScript(
    int? tabId,
    InjectDetails details,
  ) {
    var $completer = Completer<List<Object>?>();
    $js.chrome.tabs.executeScript(
      tabId,
      details.toJS,
      (JSArray? result) {
        if (checkRuntimeLastError($completer)) {
          $completer
              .complete(result?.toDart.cast<JSAny>().map((e) => e).toList());
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Injects CSS into a page. Styles inserted with this method can be removed
  /// with [scripting.removeCSS]. For details, see the [programmatic
  /// injection](content_scripts#pi) section of the content scripts doc.
  Future<void> insertCSS(
    int? tabId,
    InjectDetails details,
  ) {
    var $completer = Completer<void>();
    $js.chrome.tabs.insertCSS(
      tabId,
      details.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Removes from a page CSS that was previously injected by a call to
  /// [scripting.insertCSS].
  Future<void> removeCSS(
    int? tabId,
    DeleteInjectionDetails details,
  ) {
    var $completer = Completer<void>();
    $js.chrome.tabs.removeCSS(
      tabId,
      details.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Zooms a specified tab.
  Future<void> setZoom(
    int? tabId,
    double zoomFactor,
  ) {
    var $completer = Completer<void>();
    $js.chrome.tabs.setZoom(
      tabId,
      zoomFactor,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the current zoom factor of a specified tab.
  Future<double> getZoom(int? tabId) {
    var $completer = Completer<double>();
    $js.chrome.tabs.getZoom(
      tabId,
      (double zoomFactor) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(zoomFactor);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Sets the zoom settings for a specified tab, which define how zoom changes
  /// are handled. These settings are reset to defaults upon navigating the tab.
  Future<void> setZoomSettings(
    int? tabId,
    ZoomSettings zoomSettings,
  ) {
    var $completer = Completer<void>();
    $js.chrome.tabs.setZoomSettings(
      tabId,
      zoomSettings.toJS,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets the current zoom settings of a specified tab.
  Future<ZoomSettings> getZoomSettings(int? tabId) {
    var $completer = Completer<ZoomSettings>();
    $js.chrome.tabs.getZoomSettings(
      tabId,
      ($js.ZoomSettings zoomSettings) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(ZoomSettings.fromJS(zoomSettings));
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Discards a tab from memory. Discarded tabs are still visible on the tab
  /// strip and are reloaded when activated.
  Future<Tab?> discard(int? tabId) {
    var $completer = Completer<Tab?>();
    $js.chrome.tabs.discard(
      tabId,
      ($js.Tab? tab) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(tab?.let(Tab.fromJS));
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Go foward to the next page, if one is available.
  Future<void> goForward(int? tabId) {
    var $completer = Completer<void>();
    $js.chrome.tabs.goForward(
      tabId,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Go back to the previous page, if one is available.
  Future<void> goBack(int? tabId) {
    var $completer = Completer<void>();
    $js.chrome.tabs.goBack(
      tabId,
      () {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(null);
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// The maximum number of times that [captureVisibleTab] can be called per
  /// second. [captureVisibleTab] is expensive and should not be called too
  /// often.
  int get maxCaptureVisibleTabCallsPerSecond =>
      ($js.chrome.tabs.MAX_CAPTURE_VISIBLE_TAB_CALLS_PER_SECOND as dynamic);

  /// An ID that represents the absence of a browser tab.
  int get tabIdNone => ($js.chrome.tabs.TAB_ID_NONE as dynamic);

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

  MutedInfo({
    required bool muted,
    MutedInfoReason? reason,
    String? extensionId,
  }) : _wrapped = $js.MutedInfo()
          ..muted = muted
          ..reason = reason?.toJS
          ..extensionId = extensionId;

  final $js.MutedInfo _wrapped;

  $js.MutedInfo get toJS => _wrapped;

  /// Whether the tab is muted (prevented from playing sound). The tab may be
  /// muted even if it has not played or is not currently playing sound.
  /// Equivalent to whether the 'muted' audio indicator is showing.
  bool get muted => _wrapped.muted;
  set muted(bool v) {
    _wrapped.muted = v;
  }

  /// The reason the tab was muted or unmuted. Not set if the tab's mute state
  /// has never been changed.
  MutedInfoReason? get reason => _wrapped.reason?.let(MutedInfoReason.fromJS);
  set reason(MutedInfoReason? v) {
    _wrapped.reason = v?.toJS;
  }

  /// The ID of the extension that changed the muted state. Not set if an
  /// extension was not the reason the muted state last changed.
  String? get extensionId => _wrapped.extensionId;
  set extensionId(String? v) {
    _wrapped.extensionId = v;
  }
}

class Tab {
  Tab.fromJS(this._wrapped);

  Tab({
    int? id,
    required int index,
    required int groupId,
    required int windowId,
    int? openerTabId,
    required bool selected,
    required bool highlighted,
    required bool active,
    required bool pinned,
    bool? audible,
    required bool discarded,
    required bool autoDiscardable,
    MutedInfo? mutedInfo,
    String? url,
    String? pendingUrl,
    String? title,
    String? favIconUrl,
    TabStatus? status,
    required bool incognito,
    int? width,
    int? height,
    String? sessionId,
  }) : _wrapped = $js.Tab()
          ..id = id
          ..index = index
          ..groupId = groupId
          ..windowId = windowId
          ..openerTabId = openerTabId
          ..selected = selected
          ..highlighted = highlighted
          ..active = active
          ..pinned = pinned
          ..audible = audible
          ..discarded = discarded
          ..autoDiscardable = autoDiscardable
          ..mutedInfo = mutedInfo?.toJS
          ..url = url
          ..pendingUrl = pendingUrl
          ..title = title
          ..favIconUrl = favIconUrl
          ..status = status?.toJS
          ..incognito = incognito
          ..width = width
          ..height = height
          ..sessionId = sessionId;

  final $js.Tab _wrapped;

  $js.Tab get toJS => _wrapped;

  /// The ID of the tab. Tab IDs are unique within a browser session. Under some
  /// circumstances a tab may not be assigned an ID; for example, when querying
  /// foreign tabs using the [sessions] API, in which case a session ID may be
  /// present. Tab ID can also be set to `chrome.tabs.TAB_ID_NONE` for apps and
  /// devtools windows.
  int? get id => _wrapped.id;
  set id(int? v) {
    _wrapped.id = v;
  }

  /// The zero-based index of the tab within its window.
  int get index => _wrapped.index;
  set index(int v) {
    _wrapped.index = v;
  }

  /// The ID of the group that the tab belongs to.
  int get groupId => _wrapped.groupId;
  set groupId(int v) {
    _wrapped.groupId = v;
  }

  /// The ID of the window that contains the tab.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    _wrapped.windowId = v;
  }

  /// The ID of the tab that opened this tab, if any. This property is only
  /// present if the opener tab still exists.
  int? get openerTabId => _wrapped.openerTabId;
  set openerTabId(int? v) {
    _wrapped.openerTabId = v;
  }

  /// Whether the tab is selected.
  bool get selected => _wrapped.selected;
  set selected(bool v) {
    _wrapped.selected = v;
  }

  /// Whether the tab is highlighted.
  bool get highlighted => _wrapped.highlighted;
  set highlighted(bool v) {
    _wrapped.highlighted = v;
  }

  /// Whether the tab is active in its window. Does not necessarily mean the
  /// window is focused.
  bool get active => _wrapped.active;
  set active(bool v) {
    _wrapped.active = v;
  }

  /// Whether the tab is pinned.
  bool get pinned => _wrapped.pinned;
  set pinned(bool v) {
    _wrapped.pinned = v;
  }

  /// Whether the tab has produced sound over the past couple of seconds (but it
  /// might not be heard if also muted). Equivalent to whether the 'speaker
  /// audio' indicator is showing.
  bool? get audible => _wrapped.audible;
  set audible(bool? v) {
    _wrapped.audible = v;
  }

  /// Whether the tab is discarded. A discarded tab is one whose content has
  /// been unloaded from memory, but is still visible in the tab strip. Its
  /// content is reloaded the next time it is activated.
  bool get discarded => _wrapped.discarded;
  set discarded(bool v) {
    _wrapped.discarded = v;
  }

  /// Whether the tab can be discarded automatically by the browser when
  /// resources are low.
  bool get autoDiscardable => _wrapped.autoDiscardable;
  set autoDiscardable(bool v) {
    _wrapped.autoDiscardable = v;
  }

  /// The tab's muted state and the reason for the last state change.
  MutedInfo? get mutedInfo => _wrapped.mutedInfo?.let(MutedInfo.fromJS);
  set mutedInfo(MutedInfo? v) {
    _wrapped.mutedInfo = v?.toJS;
  }

  /// The last committed URL of the main frame of the tab. This property is only
  /// present if the extension's manifest includes the `"tabs"` permission and
  /// may be an empty string if the tab has not yet committed. See also
  /// [Tab.pendingUrl].
  String? get url => _wrapped.url;
  set url(String? v) {
    _wrapped.url = v;
  }

  /// The URL the tab is navigating to, before it has committed. This property
  /// is only present if the extension's manifest includes the `"tabs"`
  /// permission and there is a pending navigation.
  String? get pendingUrl => _wrapped.pendingUrl;
  set pendingUrl(String? v) {
    _wrapped.pendingUrl = v;
  }

  /// The title of the tab. This property is only present if the extension's
  /// manifest includes the `"tabs"` permission.
  String? get title => _wrapped.title;
  set title(String? v) {
    _wrapped.title = v;
  }

  /// The URL of the tab's favicon. This property is only present if the
  /// extension's manifest includes the `"tabs"` permission. It may also be an
  /// empty string if the tab is loading.
  String? get favIconUrl => _wrapped.favIconUrl;
  set favIconUrl(String? v) {
    _wrapped.favIconUrl = v;
  }

  /// The tab's loading status.
  TabStatus? get status => _wrapped.status?.let(TabStatus.fromJS);
  set status(TabStatus? v) {
    _wrapped.status = v?.toJS;
  }

  /// Whether the tab is in an incognito window.
  bool get incognito => _wrapped.incognito;
  set incognito(bool v) {
    _wrapped.incognito = v;
  }

  /// The width of the tab in pixels.
  int? get width => _wrapped.width;
  set width(int? v) {
    _wrapped.width = v;
  }

  /// The height of the tab in pixels.
  int? get height => _wrapped.height;
  set height(int? v) {
    _wrapped.height = v;
  }

  /// The session ID used to uniquely identify a tab obtained from the
  /// [sessions] API.
  String? get sessionId => _wrapped.sessionId;
  set sessionId(String? v) {
    _wrapped.sessionId = v;
  }
}

class ZoomSettings {
  ZoomSettings.fromJS(this._wrapped);

  ZoomSettings({
    ZoomSettingsMode? mode,
    ZoomSettingsScope? scope,
    double? defaultZoomFactor,
  }) : _wrapped = $js.ZoomSettings()
          ..mode = mode?.toJS
          ..scope = scope?.toJS
          ..defaultZoomFactor = defaultZoomFactor;

  final $js.ZoomSettings _wrapped;

  $js.ZoomSettings get toJS => _wrapped;

  /// Defines how zoom changes are handled, i.e., which entity is responsible
  /// for the actual scaling of the page; defaults to `automatic`.
  ZoomSettingsMode? get mode => _wrapped.mode?.let(ZoomSettingsMode.fromJS);
  set mode(ZoomSettingsMode? v) {
    _wrapped.mode = v?.toJS;
  }

  /// Defines whether zoom changes persist for the page's origin, or only take
  /// effect in this tab; defaults to `per-origin` when in `automatic` mode, and
  /// `per-tab` otherwise.
  ZoomSettingsScope? get scope => _wrapped.scope?.let(ZoomSettingsScope.fromJS);
  set scope(ZoomSettingsScope? v) {
    _wrapped.scope = v?.toJS;
  }

  /// Used to return the default zoom level for the current tab in calls to
  /// tabs.getZoomSettings.
  double? get defaultZoomFactor => _wrapped.defaultZoomFactor;
  set defaultZoomFactor(double? v) {
    _wrapped.defaultZoomFactor = v;
  }
}

class OnUpdatedChangeInfo {
  OnUpdatedChangeInfo.fromJS(this._wrapped);

  OnUpdatedChangeInfo({
    TabStatus? status,
    String? url,
    int? groupId,
    bool? pinned,
    bool? audible,
    bool? discarded,
    bool? autoDiscardable,
    MutedInfo? mutedInfo,
    String? favIconUrl,
    String? title,
  }) : _wrapped = $js.OnUpdatedChangeInfo()
          ..status = status?.toJS
          ..url = url
          ..groupId = groupId
          ..pinned = pinned
          ..audible = audible
          ..discarded = discarded
          ..autoDiscardable = autoDiscardable
          ..mutedInfo = mutedInfo?.toJS
          ..favIconUrl = favIconUrl
          ..title = title;

  final $js.OnUpdatedChangeInfo _wrapped;

  $js.OnUpdatedChangeInfo get toJS => _wrapped;

  /// The tab's loading status.
  TabStatus? get status => _wrapped.status?.let(TabStatus.fromJS);
  set status(TabStatus? v) {
    _wrapped.status = v?.toJS;
  }

  /// The tab's URL if it has changed.
  String? get url => _wrapped.url;
  set url(String? v) {
    _wrapped.url = v;
  }

  /// The tab's new group.
  int? get groupId => _wrapped.groupId;
  set groupId(int? v) {
    _wrapped.groupId = v;
  }

  /// The tab's new pinned state.
  bool? get pinned => _wrapped.pinned;
  set pinned(bool? v) {
    _wrapped.pinned = v;
  }

  /// The tab's new audible state.
  bool? get audible => _wrapped.audible;
  set audible(bool? v) {
    _wrapped.audible = v;
  }

  /// The tab's new discarded state.
  bool? get discarded => _wrapped.discarded;
  set discarded(bool? v) {
    _wrapped.discarded = v;
  }

  /// The tab's new auto-discardable state.
  bool? get autoDiscardable => _wrapped.autoDiscardable;
  set autoDiscardable(bool? v) {
    _wrapped.autoDiscardable = v;
  }

  /// The tab's new muted state and the reason for the change.
  MutedInfo? get mutedInfo => _wrapped.mutedInfo?.let(MutedInfo.fromJS);
  set mutedInfo(MutedInfo? v) {
    _wrapped.mutedInfo = v?.toJS;
  }

  /// The tab's new favicon URL.
  String? get favIconUrl => _wrapped.favIconUrl;
  set favIconUrl(String? v) {
    _wrapped.favIconUrl = v;
  }

  /// The tab's new title.
  String? get title => _wrapped.title;
  set title(String? v) {
    _wrapped.title = v;
  }
}

class OnMovedMoveInfo {
  OnMovedMoveInfo.fromJS(this._wrapped);

  OnMovedMoveInfo({
    required int windowId,
    required int fromIndex,
    required int toIndex,
  }) : _wrapped = $js.OnMovedMoveInfo()
          ..windowId = windowId
          ..fromIndex = fromIndex
          ..toIndex = toIndex;

  final $js.OnMovedMoveInfo _wrapped;

  $js.OnMovedMoveInfo get toJS => _wrapped;

  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    _wrapped.windowId = v;
  }

  int get fromIndex => _wrapped.fromIndex;
  set fromIndex(int v) {
    _wrapped.fromIndex = v;
  }

  int get toIndex => _wrapped.toIndex;
  set toIndex(int v) {
    _wrapped.toIndex = v;
  }
}

class OnSelectionChangedSelectInfo {
  OnSelectionChangedSelectInfo.fromJS(this._wrapped);

  OnSelectionChangedSelectInfo({required int windowId})
      : _wrapped = $js.OnSelectionChangedSelectInfo()..windowId = windowId;

  final $js.OnSelectionChangedSelectInfo _wrapped;

  $js.OnSelectionChangedSelectInfo get toJS => _wrapped;

  /// The ID of the window the selected tab changed inside of.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    _wrapped.windowId = v;
  }
}

class OnActiveChangedSelectInfo {
  OnActiveChangedSelectInfo.fromJS(this._wrapped);

  OnActiveChangedSelectInfo({required int windowId})
      : _wrapped = $js.OnActiveChangedSelectInfo()..windowId = windowId;

  final $js.OnActiveChangedSelectInfo _wrapped;

  $js.OnActiveChangedSelectInfo get toJS => _wrapped;

  /// The ID of the window the selected tab changed inside of.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    _wrapped.windowId = v;
  }
}

class OnActivatedActiveInfo {
  OnActivatedActiveInfo.fromJS(this._wrapped);

  OnActivatedActiveInfo({
    required int tabId,
    required int windowId,
  }) : _wrapped = $js.OnActivatedActiveInfo()
          ..tabId = tabId
          ..windowId = windowId;

  final $js.OnActivatedActiveInfo _wrapped;

  $js.OnActivatedActiveInfo get toJS => _wrapped;

  /// The ID of the tab that has become active.
  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  /// The ID of the window the active tab changed inside of.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    _wrapped.windowId = v;
  }
}

class OnHighlightChangedSelectInfo {
  OnHighlightChangedSelectInfo.fromJS(this._wrapped);

  OnHighlightChangedSelectInfo({
    required int windowId,
    required List<int> tabIds,
  }) : _wrapped = $js.OnHighlightChangedSelectInfo()
          ..windowId = windowId
          ..tabIds = throw UnimplementedError();

  final $js.OnHighlightChangedSelectInfo _wrapped;

  $js.OnHighlightChangedSelectInfo get toJS => _wrapped;

  /// The window whose tabs changed.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    _wrapped.windowId = v;
  }

  /// All highlighted tabs in the window.
  List<int> get tabIds =>
      _wrapped.tabIds.toDart.cast<int>().map((e) => e).toList();
  set tabIds(List<int> v) {
    _wrapped.tabIds = throw UnimplementedError();
  }
}

class OnHighlightedHighlightInfo {
  OnHighlightedHighlightInfo.fromJS(this._wrapped);

  OnHighlightedHighlightInfo({
    required int windowId,
    required List<int> tabIds,
  }) : _wrapped = $js.OnHighlightedHighlightInfo()
          ..windowId = windowId
          ..tabIds = throw UnimplementedError();

  final $js.OnHighlightedHighlightInfo _wrapped;

  $js.OnHighlightedHighlightInfo get toJS => _wrapped;

  /// The window whose tabs changed.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    _wrapped.windowId = v;
  }

  /// All highlighted tabs in the window.
  List<int> get tabIds =>
      _wrapped.tabIds.toDart.cast<int>().map((e) => e).toList();
  set tabIds(List<int> v) {
    _wrapped.tabIds = throw UnimplementedError();
  }
}

class OnDetachedDetachInfo {
  OnDetachedDetachInfo.fromJS(this._wrapped);

  OnDetachedDetachInfo({
    required int oldWindowId,
    required int oldPosition,
  }) : _wrapped = $js.OnDetachedDetachInfo()
          ..oldWindowId = oldWindowId
          ..oldPosition = oldPosition;

  final $js.OnDetachedDetachInfo _wrapped;

  $js.OnDetachedDetachInfo get toJS => _wrapped;

  int get oldWindowId => _wrapped.oldWindowId;
  set oldWindowId(int v) {
    _wrapped.oldWindowId = v;
  }

  int get oldPosition => _wrapped.oldPosition;
  set oldPosition(int v) {
    _wrapped.oldPosition = v;
  }
}

class OnAttachedAttachInfo {
  OnAttachedAttachInfo.fromJS(this._wrapped);

  OnAttachedAttachInfo({
    required int newWindowId,
    required int newPosition,
  }) : _wrapped = $js.OnAttachedAttachInfo()
          ..newWindowId = newWindowId
          ..newPosition = newPosition;

  final $js.OnAttachedAttachInfo _wrapped;

  $js.OnAttachedAttachInfo get toJS => _wrapped;

  int get newWindowId => _wrapped.newWindowId;
  set newWindowId(int v) {
    _wrapped.newWindowId = v;
  }

  int get newPosition => _wrapped.newPosition;
  set newPosition(int v) {
    _wrapped.newPosition = v;
  }
}

class OnRemovedRemoveInfo {
  OnRemovedRemoveInfo.fromJS(this._wrapped);

  OnRemovedRemoveInfo({
    required int windowId,
    required bool isWindowClosing,
  }) : _wrapped = $js.OnRemovedRemoveInfo()
          ..windowId = windowId
          ..isWindowClosing = isWindowClosing;

  final $js.OnRemovedRemoveInfo _wrapped;

  $js.OnRemovedRemoveInfo get toJS => _wrapped;

  /// The window whose tab is closed.
  int get windowId => _wrapped.windowId;
  set windowId(int v) {
    _wrapped.windowId = v;
  }

  /// True when the tab was closed because its parent window was closed.
  bool get isWindowClosing => _wrapped.isWindowClosing;
  set isWindowClosing(bool v) {
    _wrapped.isWindowClosing = v;
  }
}

class OnZoomChangeZoomChangeInfo {
  OnZoomChangeZoomChangeInfo.fromJS(this._wrapped);

  OnZoomChangeZoomChangeInfo({
    required int tabId,
    required double oldZoomFactor,
    required double newZoomFactor,
    required ZoomSettings zoomSettings,
  }) : _wrapped = $js.OnZoomChangeZoomChangeInfo()
          ..tabId = tabId
          ..oldZoomFactor = oldZoomFactor
          ..newZoomFactor = newZoomFactor
          ..zoomSettings = zoomSettings.toJS;

  final $js.OnZoomChangeZoomChangeInfo _wrapped;

  $js.OnZoomChangeZoomChangeInfo get toJS => _wrapped;

  int get tabId => _wrapped.tabId;
  set tabId(int v) {
    _wrapped.tabId = v;
  }

  double get oldZoomFactor => _wrapped.oldZoomFactor;
  set oldZoomFactor(double v) {
    _wrapped.oldZoomFactor = v;
  }

  double get newZoomFactor => _wrapped.newZoomFactor;
  set newZoomFactor(double v) {
    _wrapped.newZoomFactor = v;
  }

  ZoomSettings get zoomSettings => ZoomSettings.fromJS(_wrapped.zoomSettings);
  set zoomSettings(ZoomSettings v) {
    _wrapped.zoomSettings = v.toJS;
  }
}

class ConnectInfo {
  ConnectInfo.fromJS(this._wrapped);

  ConnectInfo({
    String? name,
    int? frameId,
    String? documentId,
  }) : _wrapped = $js.ConnectInfo(
          name: name,
          frameId: frameId,
          documentId: documentId,
        );

  final $js.ConnectInfo _wrapped;

  $js.ConnectInfo get toJS => _wrapped;
}

class SendMessageOptions {
  SendMessageOptions.fromJS(this._wrapped);

  SendMessageOptions({
    int? frameId,
    String? documentId,
  }) : _wrapped = $js.SendMessageOptions(
          frameId: frameId,
          documentId: documentId,
        );

  final $js.SendMessageOptions _wrapped;

  $js.SendMessageOptions get toJS => _wrapped;
}

class CreateProperties {
  CreateProperties.fromJS(this._wrapped);

  CreateProperties({
    int? windowId,
    int? index,
    String? url,
    bool? active,
    bool? selected,
    bool? pinned,
    int? openerTabId,
  }) : _wrapped = $js.CreateProperties(
          windowId: windowId,
          index: index,
          url: url,
          active: active,
          selected: selected,
          pinned: pinned,
          openerTabId: openerTabId,
        );

  final $js.CreateProperties _wrapped;

  $js.CreateProperties get toJS => _wrapped;
}

class QueryInfo {
  QueryInfo.fromJS(this._wrapped);

  QueryInfo({
    bool? active,
    bool? pinned,
    bool? audible,
    bool? muted,
    bool? highlighted,
    bool? discarded,
    bool? autoDiscardable,
    bool? currentWindow,
    bool? lastFocusedWindow,
    TabStatus? status,
    String? title,
    Object? url,
    int? groupId,
    int? windowId,
    WindowType? windowType,
    int? index,
  }) : _wrapped = $js.QueryInfo(
          active: active,
          pinned: pinned,
          audible: audible,
          muted: muted,
          highlighted: highlighted,
          discarded: discarded,
          autoDiscardable: autoDiscardable,
          currentWindow: currentWindow,
          lastFocusedWindow: lastFocusedWindow,
          status: status?.toJS,
          title: title,
          url: url?.toJS,
          groupId: groupId,
          windowId: windowId,
          windowType: windowType?.toJS,
          index: index,
        );

  final $js.QueryInfo _wrapped;

  $js.QueryInfo get toJS => _wrapped;
}

class HighlightInfo {
  HighlightInfo.fromJS(this._wrapped);

  HighlightInfo({
    int? windowId,
    required Object tabs,
  }) : _wrapped = $js.HighlightInfo(
          windowId: windowId,
          tabs: tabs.toJS,
        );

  final $js.HighlightInfo _wrapped;

  $js.HighlightInfo get toJS => _wrapped;
}

class UpdateProperties {
  UpdateProperties.fromJS(this._wrapped);

  UpdateProperties({
    String? url,
    bool? active,
    bool? highlighted,
    bool? selected,
    bool? pinned,
    bool? muted,
    int? openerTabId,
    bool? autoDiscardable,
  }) : _wrapped = $js.UpdateProperties(
          url: url,
          active: active,
          highlighted: highlighted,
          selected: selected,
          pinned: pinned,
          muted: muted,
          openerTabId: openerTabId,
          autoDiscardable: autoDiscardable,
        );

  final $js.UpdateProperties _wrapped;

  $js.UpdateProperties get toJS => _wrapped;
}

class MoveProperties {
  MoveProperties.fromJS(this._wrapped);

  MoveProperties({
    int? windowId,
    required int index,
  }) : _wrapped = $js.MoveProperties(
          windowId: windowId,
          index: index,
        );

  final $js.MoveProperties _wrapped;

  $js.MoveProperties get toJS => _wrapped;
}

class ReloadProperties {
  ReloadProperties.fromJS(this._wrapped);

  ReloadProperties({bool? bypassCache})
      : _wrapped = $js.ReloadProperties(bypassCache: bypassCache);

  final $js.ReloadProperties _wrapped;

  $js.ReloadProperties get toJS => _wrapped;
}

class GroupOptions {
  GroupOptions.fromJS(this._wrapped);

  GroupOptions({
    required Object tabIds,
    int? groupId,
    GroupOptionsCreateProperties? createProperties,
  }) : _wrapped = $js.GroupOptions(
          tabIds: tabIds.toJS,
          groupId: groupId,
          createProperties: createProperties?.toJS,
        );

  final $js.GroupOptions _wrapped;

  $js.GroupOptions get toJS => _wrapped;
}

class GroupOptionsCreateProperties {
  GroupOptionsCreateProperties.fromJS(this._wrapped);

  GroupOptionsCreateProperties({int? windowId})
      : _wrapped = $js.GroupOptionsCreateProperties(windowId: windowId);

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
