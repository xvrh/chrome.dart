import 'chrome.dart';
export 'chrome.dart';

final _tabs = ChromeTabs._();

extension ChromeTabsExtension on Chrome {
  ChromeTabs get tabs => _tabs;
}

class ChromeTabs {
  ChromeTabs._();

  /// Retrieves details about the specified tab.
  void get(tabId) => throw UnimplementedError();

  /// Gets the tab that this script call is being made from. May be undefined if
  /// called from a non-tab context (for example, a background page or popup
  /// view).
  void getCurrent() => throw UnimplementedError();

  /// Connects to the content script(s) in the specified tab. The
  /// $(ref:runtime.onConnect) event is fired in each content script running in
  /// the specified tab for the current extension. For more details, see <a
  /// href='messaging'>Content Script Messaging</a>.
  void connect(
    tabId,
    connectInfo,
  ) =>
      throw UnimplementedError();

  /// Sends a single request to the content script(s) in the specified tab, with
  /// an optional callback to run when a response is sent back.  The
  /// $(ref:extension.onRequest) event is fired in each content script running
  /// in the specified tab for the current extension.
  void sendRequest(
    tabId,
    request,
  ) =>
      throw UnimplementedError();

  /// Sends a single message to the content script(s) in the specified tab, with
  /// an optional callback to run when a response is sent back.  The
  /// $(ref:runtime.onMessage) event is fired in each content script running in
  /// the specified tab for the current extension.
  void sendMessage(
    tabId,
    message,
    options,
  ) =>
      throw UnimplementedError();

  /// Gets the tab that is selected in the specified window.
  void getSelected(windowId) => throw UnimplementedError();

  /// Gets details about all tabs in the specified window.
  void getAllInWindow(windowId) => throw UnimplementedError();

  /// Creates a new tab.
  void create(createProperties) => throw UnimplementedError();

  /// Duplicates a tab.
  void duplicate(tabId) => throw UnimplementedError();

  /// Gets all tabs that have the specified properties, or all tabs if no
  /// properties are specified.
  void query(queryInfo) => throw UnimplementedError();

  /// Highlights the given tabs and focuses on the first of group. Will appear
  /// to do nothing if the specified tab is currently active.
  void highlight(highlightInfo) => throw UnimplementedError();

  /// Modifies the properties of a tab. Properties that are not specified in
  /// `updateProperties` are not modified.
  void update(
    tabId,
    updateProperties,
  ) =>
      throw UnimplementedError();

  /// Moves one or more tabs to a new position within its window, or to a new
  /// window. Note that tabs can only be moved to and from normal (window.type
  /// === "normal") windows.
  void move(
    tabIds,
    moveProperties,
  ) =>
      throw UnimplementedError();

  /// Reload a tab.
  void reload(
    tabId,
    reloadProperties,
  ) =>
      throw UnimplementedError();

  /// Closes one or more tabs.
  void remove(tabIds) => throw UnimplementedError();

  /// Adds one or more tabs to a specified group, or if no group is specified,
  /// adds the given tabs to a newly created group.
  void group(options) => throw UnimplementedError();

  /// Removes one or more tabs from their respective groups. If any groups
  /// become empty, they are deleted.
  void ungroup(tabIds) => throw UnimplementedError();

  /// Detects the primary language of the content in a tab.
  void detectLanguage(tabId) => throw UnimplementedError();

  /// Captures the visible area of the currently active tab in the specified
  /// window. In order to call this method, the extension must have either the
  /// <a href='declare_permissions'><all_urls></a> permission or the <a
  /// href='activeTab'>activeTab</a> permission. In addition to sites that
  /// extensions can normally access, this method allows extensions to capture
  /// sensitive sites that are otherwise restricted, including chrome:-scheme
  /// pages, other extensions' pages, and data: URLs. These sensitive sites can
  /// only be captured with the activeTab permission. File URLs may be captured
  /// only if the extension has been granted file access.
  void captureVisibleTab(
    windowId,
    options,
  ) =>
      throw UnimplementedError();

  /// Injects JavaScript code into a page. For details, see the <a
  /// href='content_scripts#pi'>programmatic injection</a> section of the
  /// content scripts doc.
  void executeScript(
    tabId,
    details,
  ) =>
      throw UnimplementedError();

  /// Injects CSS into a page. Styles inserted with this method can be removed
  /// with $(ref:scripting.removeCSS). For details, see the <a
  /// href='content_scripts#pi'>programmatic injection</a> section of the
  /// content scripts doc.
  void insertCSS(
    tabId,
    details,
  ) =>
      throw UnimplementedError();

  /// Removes from a page CSS that was previously injected by a call to
  /// $(ref:scripting.insertCSS).
  void removeCSS(
    tabId,
    details,
  ) =>
      throw UnimplementedError();

  /// Zooms a specified tab.
  void setZoom(
    tabId,
    zoomFactor,
  ) =>
      throw UnimplementedError();

  /// Gets the current zoom factor of a specified tab.
  void getZoom(tabId) => throw UnimplementedError();

  /// Sets the zoom settings for a specified tab, which define how zoom changes
  /// are handled. These settings are reset to defaults upon navigating the tab.
  void setZoomSettings(
    tabId,
    zoomSettings,
  ) =>
      throw UnimplementedError();

  /// Gets the current zoom settings of a specified tab.
  void getZoomSettings(tabId) => throw UnimplementedError();

  /// Discards a tab from memory. Discarded tabs are still visible on the tab
  /// strip and are reloaded when activated.
  void discard(tabId) => throw UnimplementedError();

  /// Go foward to the next page, if one is available.
  void goForward(tabId) => throw UnimplementedError();

  /// Go back to the previous page, if one is available.
  void goBack(tabId) => throw UnimplementedError();

  /// Fired when a tab is created. Note that the tab's URL and tab group
  /// membership may not be set at the time this event is fired, but you can
  /// listen to onUpdated events so as to be notified when a URL is set or the
  /// tab is added to a tab group.
  Stream get onCreated => throw UnimplementedError();

  /// Fired when a tab is updated.
  Stream get onUpdated => throw UnimplementedError();

  /// Fired when a tab is moved within a window. Only one move event is fired,
  /// representing the tab the user directly moved. Move events are not fired
  /// for the other tabs that must move in response to the manually-moved tab.
  /// This event is not fired when a tab is moved between windows; for details,
  /// see $(ref:tabs.onDetached).
  Stream get onMoved => throw UnimplementedError();

  /// Fires when the selected tab in a window changes.
  Stream get onSelectionChanged => throw UnimplementedError();

  /// Fires when the selected tab in a window changes. Note that the tab's URL
  /// may not be set at the time this event fired, but you can listen to
  /// $(ref:tabs.onUpdated) events so as to be notified when a URL is set.
  Stream get onActiveChanged => throw UnimplementedError();

  /// Fires when the active tab in a window changes. Note that the tab's URL may
  /// not be set at the time this event fired, but you can listen to onUpdated
  /// events so as to be notified when a URL is set.
  Stream get onActivated => throw UnimplementedError();

  /// Fired when the highlighted or selected tabs in a window changes.
  Stream get onHighlightChanged => throw UnimplementedError();

  /// Fired when the highlighted or selected tabs in a window changes.
  Stream get onHighlighted => throw UnimplementedError();

  /// Fired when a tab is detached from a window; for example, because it was
  /// moved between windows.
  Stream get onDetached => throw UnimplementedError();

  /// Fired when a tab is attached to a window; for example, because it was
  /// moved between windows.
  Stream get onAttached => throw UnimplementedError();

  /// Fired when a tab is closed.
  Stream get onRemoved => throw UnimplementedError();

  /// Fired when a tab is replaced with another tab due to prerendering or
  /// instant.
  Stream get onReplaced => throw UnimplementedError();

  /// Fired when a tab is zoomed.
  Stream get onZoomChange => throw UnimplementedError();
}

/// The tab's loading status.
enum TabStatus {
  unloaded('unloaded'),
  loading('loading'),
  complete('complete');

  const TabStatus(this.value);

  final String value;
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
}
