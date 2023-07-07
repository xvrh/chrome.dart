/* This file has been generated from tabs.json - do not edit */

/**
 * Use the `chrome.tabs` API to interact with the browser's tab system. You can
 * use this API to create, modify, and rearrange tabs in the browser.
 */
library chrome.tabs;

import 'extension_types.dart';
import 'runtime.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.tabs` namespace.
 */
final ChromeTabs tabs = ChromeTabs._();

class ChromeTabs extends ChromeApi {
  JsObject get _tabs => chrome['tabs'];

  /**
   * Fired when a tab is created. Note that the tab's URL and tab group
   * membership may not be set at the time this event is fired, but you can
   * listen to onUpdated events so as to be notified when a URL is set or the
   * tab is added to a tab group.
   */
  Stream<Tab> get onCreated => _onCreated.stream;
  late ChromeStreamController<Tab> _onCreated;

  /**
   * Fired when a tab is updated.
   */
  Stream<OnUpdatedEvent> get onUpdated => _onUpdated.stream;
  late ChromeStreamController<OnUpdatedEvent> _onUpdated;

  /**
   * Fired when a tab is moved within a window. Only one move event is fired,
   * representing the tab the user directly moved. Move events are not fired for
   * the other tabs that must move in response to the manually-moved tab. This
   * event is not fired when a tab is moved between windows; for details, see
   * [tabs.onDetached].
   */
  Stream<TabsOnMovedEvent> get onMoved => _onMoved.stream;
  late ChromeStreamController<TabsOnMovedEvent> _onMoved;

  /**
   * Fires when the selected tab in a window changes.
   */
  Stream<OnSelectionChangedEvent> get onSelectionChanged => _onSelectionChanged.stream;
  late ChromeStreamController<OnSelectionChangedEvent> _onSelectionChanged;

  /**
   * Fires when the selected tab in a window changes. Note that the tab's URL
   * may not be set at the time this event fired, but you can listen to
   * [tabs.onUpdated] events so as to be notified when a URL is set.
   */
  Stream<OnActiveChangedEvent> get onActiveChanged => _onActiveChanged.stream;
  late ChromeStreamController<OnActiveChangedEvent> _onActiveChanged;

  /**
   * Fires when the active tab in a window changes. Note that the tab's URL may
   * not be set at the time this event fired, but you can listen to onUpdated
   * events so as to be notified when a URL is set.
   */
  Stream<Map> get onActivated => _onActivated.stream;
  late ChromeStreamController<Map> _onActivated;

  /**
   * Fired when the highlighted or selected tabs in a window changes.
   */
  Stream<Map> get onHighlightChanged => _onHighlightChanged.stream;
  late ChromeStreamController<Map> _onHighlightChanged;

  /**
   * Fired when the highlighted or selected tabs in a window changes.
   */
  Stream<Map> get onHighlighted => _onHighlighted.stream;
  late ChromeStreamController<Map> _onHighlighted;

  /**
   * Fired when a tab is detached from a window; for example, because it was
   * moved between windows.
   */
  Stream<OnDetachedEvent> get onDetached => _onDetached.stream;
  late ChromeStreamController<OnDetachedEvent> _onDetached;

  /**
   * Fired when a tab is attached to a window; for example, because it was moved
   * between windows.
   */
  Stream<OnAttachedEvent> get onAttached => _onAttached.stream;
  late ChromeStreamController<OnAttachedEvent> _onAttached;

  /**
   * Fired when a tab is closed.
   */
  Stream<TabsOnRemovedEvent> get onRemoved => _onRemoved.stream;
  late ChromeStreamController<TabsOnRemovedEvent> _onRemoved;

  /**
   * Fired when a tab is replaced with another tab due to prerendering or
   * instant.
   */
  Stream<OnReplacedEvent> get onReplaced => _onReplaced.stream;
  late ChromeStreamController<OnReplacedEvent> _onReplaced;

  /**
   * Fired when a tab is zoomed.
   */
  Stream<Map> get onZoomChange => _onZoomChange.stream;
  late ChromeStreamController<Map> _onZoomChange;

  ChromeTabs._() {
    var getApi = () => _tabs;
    _onCreated = ChromeStreamController<Tab>.oneArg(getApi, 'onCreated', _createTab);
    _onUpdated = ChromeStreamController<OnUpdatedEvent>.threeArgs(getApi, 'onUpdated', _createOnUpdatedEvent);
    _onMoved = ChromeStreamController<TabsOnMovedEvent>.twoArgs(getApi, 'onMoved', _createOnMovedEvent);
    _onSelectionChanged = ChromeStreamController<OnSelectionChangedEvent>.twoArgs(getApi, 'onSelectionChanged', _createOnSelectionChangedEvent);
    _onActiveChanged = ChromeStreamController<OnActiveChangedEvent>.twoArgs(getApi, 'onActiveChanged', _createOnActiveChangedEvent);
    _onActivated = ChromeStreamController<Map>.oneArg(getApi, 'onActivated', mapify);
    _onHighlightChanged = ChromeStreamController<Map>.oneArg(getApi, 'onHighlightChanged', mapify);
    _onHighlighted = ChromeStreamController<Map>.oneArg(getApi, 'onHighlighted', mapify);
    _onDetached = ChromeStreamController<OnDetachedEvent>.twoArgs(getApi, 'onDetached', _createOnDetachedEvent);
    _onAttached = ChromeStreamController<OnAttachedEvent>.twoArgs(getApi, 'onAttached', _createOnAttachedEvent);
    _onRemoved = ChromeStreamController<TabsOnRemovedEvent>.twoArgs(getApi, 'onRemoved', _createOnRemovedEvent);
    _onReplaced = ChromeStreamController<OnReplacedEvent>.twoArgs(getApi, 'onReplaced', _createOnReplacedEvent);
    _onZoomChange = ChromeStreamController<Map>.oneArg(getApi, 'onZoomChange', mapify);
  }

  bool get available => _tabs != null;

  /**
   * The maximum number of times that [captureVisibleTab] can be called per
   * second. [captureVisibleTab] is expensive and should not be called too
   * often.
   */
  int get MAX_CAPTURE_VISIBLE_TAB_CALLS_PER_SECOND => _tabs['MAX_CAPTURE_VISIBLE_TAB_CALLS_PER_SECOND'];

  /**
   * An ID that represents the absence of a browser tab.
   */
  int get TAB_ID_NONE => _tabs['TAB_ID_NONE'];

  /**
   * Retrieves details about the specified tab.
   */
  void get(int tabId) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('get', [tabId]);
  }

  /**
   * Gets the tab that this script call is being made from. May be undefined if
   * called from a non-tab context (for example, a background page or popup
   * view).
   */
  void getCurrent() {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('getCurrent');
  }

  /**
   * Connects to the content script(s) in the specified tab. The
   * [runtime.onConnect] event is fired in each content script running in the
   * specified tab for the current extension. For more details, see [Content
   * Script Messaging](messaging).
   * 
   * Returns:
   * A port that can be used to communicate with the content scripts running in
   * the specified tab. The port's [runtime.Port] event is fired if the tab
   * closes or does not exist.
   */
  Port connect(int tabId, [TabsConnectParams? connectInfo]) {
    if (_tabs == null) _throwNotAvailable();

    return _createPort(_tabs.callMethod('connect', [tabId, jsify(connectInfo)]));
  }

  /**
   * Sends a single request to the content script(s) in the specified tab, with
   * an optional callback to run when a response is sent back.  The
   * [extension.onRequest] event is fired in each content script running in the
   * specified tab for the current extension.
   */
  void sendRequest(int tabId, Object request) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('sendRequest', [tabId, jsify(request)]);
  }

  /**
   * Sends a single message to the content script(s) in the specified tab, with
   * an optional callback to run when a response is sent back.  The
   * [runtime.onMessage] event is fired in each content script running in the
   * specified tab for the current extension.
   * 
   * [message] The message to send. This message should be a JSON-ifiable
   * object.
   */
  void sendMessage(int tabId, Object message, [TabsSendMessageParams? options]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('sendMessage', [tabId, jsify(message), jsify(options)]);
  }

  /**
   * Gets the tab that is selected in the specified window.
   * 
   * [windowId] Defaults to the [current window](windows#current-window).
   */
  void getSelected([int? windowId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('getSelected', [windowId]);
  }

  /**
   * Gets details about all tabs in the specified window.
   * 
   * [windowId] Defaults to the [current window](windows#current-window).
   */
  void getAllInWindow([int? windowId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('getAllInWindow', [windowId]);
  }

  /**
   * Creates a new tab.
   */
  void create(TabsCreateParams createProperties) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('create', [jsify(createProperties)]);
  }

  /**
   * Duplicates a tab.
   * 
   * [tabId] The ID of the tab to duplicate.
   */
  void duplicate(int tabId) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('duplicate', [tabId]);
  }

  /**
   * Gets all tabs that have the specified properties, or all tabs if no
   * properties are specified.
   */
  void query(TabsQueryParams queryInfo) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('query', [jsify(queryInfo)]);
  }

  /**
   * Highlights the given tabs and focuses on the first of group. Will appear to
   * do nothing if the specified tab is currently active.
   */
  void highlight(TabsHighlightParams highlightInfo) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('highlight', [jsify(highlightInfo)]);
  }

  /**
   * Modifies the properties of a tab. Properties that are not specified in
   * [updateProperties] are not modified.
   * 
   * [tabId] Defaults to the selected tab of the [current
   * window](windows#current-window).
   */
  void update(TabsUpdateParams updateProperties, [int? tabId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('update', [tabId, jsify(updateProperties)]);
  }

  /**
   * Moves one or more tabs to a new position within its window, or to a new
   * window. Note that tabs can only be moved to and from normal (window.type
   * === "normal") windows.
   * 
   * [tabIds] The tab ID or list of tab IDs to move.
   */
  void move(Object tabIds, TabsMoveParams moveProperties) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('move', [jsify(tabIds), jsify(moveProperties)]);
  }

  /**
   * Reload a tab.
   * 
   * [tabId] The ID of the tab to reload; defaults to the selected tab of the
   * current window.
   */
  void reload([int? tabId, TabsReloadParams? reloadProperties]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('reload', [tabId, jsify(reloadProperties)]);
  }

  /**
   * Closes one or more tabs.
   * 
   * [tabIds] The tab ID or list of tab IDs to close.
   */
  void remove(Object tabIds) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('remove', [jsify(tabIds)]);
  }

  /**
   * Adds one or more tabs to a specified group, or if no group is specified,
   * adds the given tabs to a newly created group.
   */
  void group(TabsGroupParams options) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('group', [jsify(options)]);
  }

  /**
   * Removes one or more tabs from their respective groups. If any groups become
   * empty, they are deleted.
   * 
   * [tabIds] The tab ID or list of tab IDs to remove from their respective
   * groups.
   */
  void ungroup(Object tabIds) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('ungroup', [jsify(tabIds)]);
  }

  /**
   * Detects the primary language of the content in a tab.
   * 
   * [tabId] Defaults to the active tab of the [current
   * window](windows#current-window).
   */
  void detectLanguage([int? tabId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('detectLanguage', [tabId]);
  }

  /**
   * Captures the visible area of the currently active tab in the specified
   * window. In order to call this method, the extension must have either the <a
   * href='declare_permissions'><all_urls></a> permission or the
   * [activeTab](activeTab) permission. In addition to sites that extensions can
   * normally access, this method allows extensions to capture sensitive sites
   * that are otherwise restricted, including chrome:-scheme pages, other
   * extensions' pages, and data: URLs. These sensitive sites can only be
   * captured with the activeTab permission. File URLs may be captured only if
   * the extension has been granted file access.
   * 
   * [windowId] The target window. Defaults to the [current
   * window](windows#current-window).
   */
  void captureVisibleTab([int? windowId, ImageDetails? options]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('captureVisibleTab', [windowId, jsify(options)]);
  }

  /**
   * Injects JavaScript code into a page. For details, see the [programmatic
   * injection](content_scripts#pi) section of the content scripts doc.
   * 
   * [tabId] The ID of the tab in which to run the script; defaults to the
   * active tab of the current window.
   * 
   * [details] Details of the script to run. Either the code or the file
   * property must be set, but both may not be set at the same time.
   */
  void executeScript(InjectDetails details, [int? tabId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('executeScript', [tabId, jsify(details)]);
  }

  /**
   * Injects CSS into a page. Styles inserted with this method can be removed
   * with [scripting.removeCSS]. For details, see the [programmatic
   * injection](content_scripts#pi) section of the content scripts doc.
   * 
   * [tabId] The ID of the tab in which to insert the CSS; defaults to the
   * active tab of the current window.
   * 
   * [details] Details of the CSS text to insert. Either the code or the file
   * property must be set, but both may not be set at the same time.
   */
  void insertCSS(InjectDetails details, [int? tabId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('insertCSS', [tabId, jsify(details)]);
  }

  /**
   * Removes from a page CSS that was previously injected by a call to
   * [scripting.insertCSS].
   * 
   * [tabId] The ID of the tab from which to remove the CSS; defaults to the
   * active tab of the current window.
   * 
   * [details] Details of the CSS text to remove. Either the code or the file
   * property must be set, but both may not be set at the same time.
   */
  void removeCSS(DeleteInjectionDetails details, [int? tabId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('removeCSS', [tabId, jsify(details)]);
  }

  /**
   * Zooms a specified tab.
   * 
   * [tabId] The ID of the tab to zoom; defaults to the active tab of the
   * current window.
   * 
   * [zoomFactor] The new zoom factor. A value of `0` sets the tab to its
   * current default zoom factor. Values greater than `0` specify a (possibly
   * non-default) zoom factor for the tab.
   */
  void setZoom(Object zoomFactor, [int? tabId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('setZoom', [tabId, jsify(zoomFactor)]);
  }

  /**
   * Gets the current zoom factor of a specified tab.
   * 
   * [tabId] The ID of the tab to get the current zoom factor from; defaults to
   * the active tab of the current window.
   */
  void getZoom([int? tabId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('getZoom', [tabId]);
  }

  /**
   * Sets the zoom settings for a specified tab, which define how zoom changes
   * are handled. These settings are reset to defaults upon navigating the tab.
   * 
   * [tabId] The ID of the tab to change the zoom settings for; defaults to the
   * active tab of the current window.
   * 
   * [zoomSettings] Defines how zoom changes are handled and at what scope.
   */
  void setZoomSettings(ZoomSettings zoomSettings, [int? tabId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('setZoomSettings', [tabId, jsify(zoomSettings)]);
  }

  /**
   * Gets the current zoom settings of a specified tab.
   * 
   * [tabId] The ID of the tab to get the current zoom settings from; defaults
   * to the active tab of the current window.
   */
  void getZoomSettings([int? tabId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('getZoomSettings', [tabId]);
  }

  /**
   * Discards a tab from memory. Discarded tabs are still visible on the tab
   * strip and are reloaded when activated.
   * 
   * [tabId] The ID of the tab to be discarded. If specified, the tab is
   * discarded unless it is active or already discarded. If omitted, the browser
   * discards the least important tab. This can fail if no discardable tabs
   * exist.
   */
  void discard([int? tabId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('discard', [tabId]);
  }

  /**
   * Go foward to the next page, if one is available.
   * 
   * [tabId] The ID of the tab to navigate forward; defaults to the selected tab
   * of the current window.
   */
  void goForward([int? tabId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('goForward', [tabId]);
  }

  /**
   * Go back to the previous page, if one is available.
   * 
   * [tabId] The ID of the tab to navigate back; defaults to the selected tab of
   * the current window.
   */
  void goBack([int? tabId]) {
    if (_tabs == null) _throwNotAvailable();

    _tabs.callMethod('goBack', [tabId]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.tabs' is not available");
  }
}

/**
 * Fired when a tab is updated.
 */
class OnUpdatedEvent {
  final int tabId;

  /**
   * Lists the changes to the state of the tab that was updated.
   */
  final Map changeInfo;

  /**
   * Gives the state of the tab that was updated.
   */
  final Tab tab;

  OnUpdatedEvent(this.tabId, this.changeInfo, this.tab);
}

/**
 * Fired when a tab is moved within a window. Only one move event is fired,
 * representing the tab the user directly moved. Move events are not fired for
 * the other tabs that must move in response to the manually-moved tab. This
 * event is not fired when a tab is moved between windows; for details, see
 * [tabs.onDetached].
 */
class TabsOnMovedEvent {
  final int tabId;

  final Map moveInfo;

  TabsOnMovedEvent(this.tabId, this.moveInfo);
}

/**
 * Fires when the selected tab in a window changes.
 */
class OnSelectionChangedEvent {
  /**
   * The ID of the tab that has become active.
   */
  final int tabId;

  final Map selectInfo;

  OnSelectionChangedEvent(this.tabId, this.selectInfo);
}

/**
 * Fires when the selected tab in a window changes. Note that the tab's URL may
 * not be set at the time this event fired, but you can listen to
 * [tabs.onUpdated] events so as to be notified when a URL is set.
 */
class OnActiveChangedEvent {
  /**
   * The ID of the tab that has become active.
   */
  final int tabId;

  final Map selectInfo;

  OnActiveChangedEvent(this.tabId, this.selectInfo);
}

/**
 * Fired when a tab is detached from a window; for example, because it was moved
 * between windows.
 */
class OnDetachedEvent {
  final int tabId;

  final Map detachInfo;

  OnDetachedEvent(this.tabId, this.detachInfo);
}

/**
 * Fired when a tab is attached to a window; for example, because it was moved
 * between windows.
 */
class OnAttachedEvent {
  final int tabId;

  final Map attachInfo;

  OnAttachedEvent(this.tabId, this.attachInfo);
}

/**
 * Fired when a tab is closed.
 */
class TabsOnRemovedEvent {
  final int tabId;

  final Map removeInfo;

  TabsOnRemovedEvent(this.tabId, this.removeInfo);
}

/**
 * Fired when a tab is replaced with another tab due to prerendering or instant.
 */
class OnReplacedEvent {
  final int addedTabId;

  final int removedTabId;

  OnReplacedEvent(this.addedTabId, this.removedTabId);
}

/**
 * The tab's loading status.
 */
class TabStatus extends ChromeEnum {
  static const TabStatus UNLOADED = const TabStatus._('unloaded');
  static const TabStatus LOADING = const TabStatus._('loading');
  static const TabStatus COMPLETE = const TabStatus._('complete');

  static const List<TabStatus> VALUES = const[UNLOADED, LOADING, COMPLETE];

  const TabStatus._(String str): super(str);
}

/**
 * An event that caused a muted state change.
 */
class MutedInfoReason extends ChromeEnum {

  static const List<MutedInfoReason> VALUES = const[];

  const MutedInfoReason._(String str): super(str);
}

/**
 * Defines how zoom changes are handled, i.e., which entity is responsible for
 * the actual scaling of the page; defaults to `automatic`.
 */
class ZoomSettingsMode extends ChromeEnum {

  static const List<ZoomSettingsMode> VALUES = const[];

  const ZoomSettingsMode._(String str): super(str);
}

/**
 * Defines whether zoom changes persist for the page's origin, or only take
 * effect in this tab; defaults to `per-origin` when in `automatic` mode, and
 * `per-tab` otherwise.
 */
class ZoomSettingsScope extends ChromeEnum {

  static const List<ZoomSettingsScope> VALUES = const[];

  const ZoomSettingsScope._(String str): super(str);
}

/**
 * The type of window.
 */
class TabsWindowType extends ChromeEnum {
  static const TabsWindowType NORMAL = const TabsWindowType._('normal');
  static const TabsWindowType POPUP = const TabsWindowType._('popup');
  static const TabsWindowType PANEL = const TabsWindowType._('panel');
  static const TabsWindowType APP = const TabsWindowType._('app');
  static const TabsWindowType DEVTOOLS = const TabsWindowType._('devtools');

  static const List<TabsWindowType> VALUES = const[NORMAL, POPUP, PANEL, APP, DEVTOOLS];

  const TabsWindowType._(String str): super(str);
}

class CreatePropertiesTabs extends ChromeObject {
  CreatePropertiesTabs({int? windowId}) {
    if (windowId != null) this.windowId = windowId;
  }
  CreatePropertiesTabs.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The window of the new group. Defaults to the current window.
   */
  int get windowId => jsProxy['windowId'];
  set windowId(int value) => jsProxy['windowId'] = value;
}

/**
 * The tab's muted state and the reason for the last state change.
 */
class MutedInfo extends ChromeObject {
  MutedInfo({bool? muted, MutedInfoReason? reason, String? extensionId}) {
    if (muted != null) this.muted = muted;
    if (reason != null) this.reason = reason;
    if (extensionId != null) this.extensionId = extensionId;
  }
  MutedInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Whether the tab is muted (prevented from playing sound). The tab may be
   * muted even if it has not played or is not currently playing sound.
   * Equivalent to whether the 'muted' audio indicator is showing.
   */
  bool get muted => jsProxy['muted'];
  set muted(bool value) => jsProxy['muted'] = value;

  /**
   * The reason the tab was muted or unmuted. Not set if the tab's mute state
   * has never been changed.
   */
  MutedInfoReason get reason => _createMutedInfoReason(jsProxy['reason']);
  set reason(MutedInfoReason value) => jsProxy['reason'] = jsify(value);

  /**
   * The ID of the extension that changed the muted state. Not set if an
   * extension was not the reason the muted state last changed.
   */
  String get extensionId => jsProxy['extensionId'];
  set extensionId(String value) => jsProxy['extensionId'] = value;
}

class Tab extends ChromeObject {
  Tab({int? id, int? index, int? groupId, int? windowId, int? openerTabId, bool? selected, bool? highlighted, bool? active, bool? pinned, bool? audible, bool? discarded, bool? autoDiscardable, MutedInfo? mutedInfo, String? url, String? pendingUrl, String? title, String? favIconUrl, TabStatus? status, bool? incognito, int? width, int? height, String? sessionId}) {
    if (id != null) this.id = id;
    if (index != null) this.index = index;
    if (groupId != null) this.groupId = groupId;
    if (windowId != null) this.windowId = windowId;
    if (openerTabId != null) this.openerTabId = openerTabId;
    if (selected != null) this.selected = selected;
    if (highlighted != null) this.highlighted = highlighted;
    if (active != null) this.active = active;
    if (pinned != null) this.pinned = pinned;
    if (audible != null) this.audible = audible;
    if (discarded != null) this.discarded = discarded;
    if (autoDiscardable != null) this.autoDiscardable = autoDiscardable;
    if (mutedInfo != null) this.mutedInfo = mutedInfo;
    if (url != null) this.url = url;
    if (pendingUrl != null) this.pendingUrl = pendingUrl;
    if (title != null) this.title = title;
    if (favIconUrl != null) this.favIconUrl = favIconUrl;
    if (status != null) this.status = status;
    if (incognito != null) this.incognito = incognito;
    if (width != null) this.width = width;
    if (height != null) this.height = height;
    if (sessionId != null) this.sessionId = sessionId;
  }
  Tab.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The ID of the tab. Tab IDs are unique within a browser session. Under some
   * circumstances a tab may not be assigned an ID; for example, when querying
   * foreign tabs using the [sessions] API, in which case a session ID may be
   * present. Tab ID can also be set to `chrome.tabs.TAB_ID_NONE` for apps and
   * devtools windows.
   */
  int get id => jsProxy['id'];
  set id(int value) => jsProxy['id'] = value;

  /**
   * The zero-based index of the tab within its window.
   */
  int get index => jsProxy['index'];
  set index(int value) => jsProxy['index'] = value;

  /**
   * The ID of the group that the tab belongs to.
   */
  int get groupId => jsProxy['groupId'];
  set groupId(int value) => jsProxy['groupId'] = value;

  /**
   * The ID of the window that contains the tab.
   */
  int get windowId => jsProxy['windowId'];
  set windowId(int value) => jsProxy['windowId'] = value;

  /**
   * The ID of the tab that opened this tab, if any. This property is only
   * present if the opener tab still exists.
   */
  int get openerTabId => jsProxy['openerTabId'];
  set openerTabId(int value) => jsProxy['openerTabId'] = value;

  /**
   * Whether the tab is selected.
   */
  bool get selected => jsProxy['selected'];
  set selected(bool value) => jsProxy['selected'] = value;

  /**
   * Whether the tab is highlighted.
   */
  bool get highlighted => jsProxy['highlighted'];
  set highlighted(bool value) => jsProxy['highlighted'] = value;

  /**
   * Whether the tab is active in its window. Does not necessarily mean the
   * window is focused.
   */
  bool get active => jsProxy['active'];
  set active(bool value) => jsProxy['active'] = value;

  /**
   * Whether the tab is pinned.
   */
  bool get pinned => jsProxy['pinned'];
  set pinned(bool value) => jsProxy['pinned'] = value;

  /**
   * Whether the tab has produced sound over the past couple of seconds (but it
   * might not be heard if also muted). Equivalent to whether the 'speaker
   * audio' indicator is showing.
   */
  bool get audible => jsProxy['audible'];
  set audible(bool value) => jsProxy['audible'] = value;

  /**
   * Whether the tab is discarded. A discarded tab is one whose content has been
   * unloaded from memory, but is still visible in the tab strip. Its content is
   * reloaded the next time it is activated.
   */
  bool get discarded => jsProxy['discarded'];
  set discarded(bool value) => jsProxy['discarded'] = value;

  /**
   * Whether the tab can be discarded automatically by the browser when
   * resources are low.
   */
  bool get autoDiscardable => jsProxy['autoDiscardable'];
  set autoDiscardable(bool value) => jsProxy['autoDiscardable'] = value;

  /**
   * The tab's muted state and the reason for the last state change.
   */
  MutedInfo get mutedInfo => _createMutedInfo(jsProxy['mutedInfo']);
  set mutedInfo(MutedInfo value) => jsProxy['mutedInfo'] = jsify(value);

  /**
   * The last committed URL of the main frame of the tab. This property is only
   * present if the extension's manifest includes the `"tabs"` permission and
   * may be an empty string if the tab has not yet committed. See also
   * [Tab.pendingUrl].
   */
  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;

  /**
   * The URL the tab is navigating to, before it has committed. This property is
   * only present if the extension's manifest includes the `"tabs"` permission
   * and there is a pending navigation.
   */
  String get pendingUrl => jsProxy['pendingUrl'];
  set pendingUrl(String value) => jsProxy['pendingUrl'] = value;

  /**
   * The title of the tab. This property is only present if the extension's
   * manifest includes the `"tabs"` permission.
   */
  String get title => jsProxy['title'];
  set title(String value) => jsProxy['title'] = value;

  /**
   * The URL of the tab's favicon. This property is only present if the
   * extension's manifest includes the `"tabs"` permission. It may also be an
   * empty string if the tab is loading.
   */
  String get favIconUrl => jsProxy['favIconUrl'];
  set favIconUrl(String value) => jsProxy['favIconUrl'] = value;

  /**
   * The tab's loading status.
   */
  TabStatus get status => _createTabStatus(jsProxy['status']);
  set status(TabStatus value) => jsProxy['status'] = jsify(value);

  /**
   * Whether the tab is in an incognito window.
   */
  bool get incognito => jsProxy['incognito'];
  set incognito(bool value) => jsProxy['incognito'] = value;

  /**
   * The width of the tab in pixels.
   */
  int get width => jsProxy['width'];
  set width(int value) => jsProxy['width'] = value;

  /**
   * The height of the tab in pixels.
   */
  int get height => jsProxy['height'];
  set height(int value) => jsProxy['height'] = value;

  /**
   * The session ID used to uniquely identify a tab obtained from the [sessions]
   * API.
   */
  String get sessionId => jsProxy['sessionId'];
  set sessionId(String value) => jsProxy['sessionId'] = value;
}

/**
 * Defines how zoom changes in a tab are handled and at what scope.
 */
class ZoomSettings extends ChromeObject {
  ZoomSettings({ZoomSettingsMode? mode, ZoomSettingsScope? scope, Object? defaultZoomFactor}) {
    if (mode != null) this.mode = mode;
    if (scope != null) this.scope = scope;
    if (defaultZoomFactor != null) this.defaultZoomFactor = defaultZoomFactor;
  }
  ZoomSettings.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Defines how zoom changes are handled, i.e., which entity is responsible for
   * the actual scaling of the page; defaults to `automatic`.
   */
  ZoomSettingsMode get mode => _createZoomSettingsMode(jsProxy['mode']);
  set mode(ZoomSettingsMode value) => jsProxy['mode'] = jsify(value);

  /**
   * Defines whether zoom changes persist for the page's origin, or only take
   * effect in this tab; defaults to `per-origin` when in `automatic` mode, and
   * `per-tab` otherwise.
   */
  ZoomSettingsScope get scope => _createZoomSettingsScope(jsProxy['scope']);
  set scope(ZoomSettingsScope value) => jsProxy['scope'] = jsify(value);

  /**
   * Used to return the default zoom level for the current tab in calls to
   * tabs.getZoomSettings.
   */
  Object get defaultZoomFactor => jsProxy['defaultZoomFactor'];
  set defaultZoomFactor(Object value) => jsProxy['defaultZoomFactor'] = jsify(value);
}

class TabsConnectParams extends ChromeObject {
  TabsConnectParams({String? name, int? frameId, String? documentId}) {
    if (name != null) this.name = name;
    if (frameId != null) this.frameId = frameId;
    if (documentId != null) this.documentId = documentId;
  }
  TabsConnectParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Is passed into onConnect for content scripts that are listening for the
   * connection event.
   */
  String get name => jsProxy['name'];
  set name(String value) => jsProxy['name'] = value;

  /**
   * Open a port to a specific [frame](webNavigation#frame_ids) identified by
   * `frameId` instead of all frames in the tab.
   */
  int get frameId => jsProxy['frameId'];
  set frameId(int value) => jsProxy['frameId'] = value;

  /**
   * Open a port to a specific [document](webNavigation#document_ids) identified
   * by `documentId` instead of all frames in the tab.
   */
  String get documentId => jsProxy['documentId'];
  set documentId(String value) => jsProxy['documentId'] = value;
}

class TabsSendMessageParams extends ChromeObject {
  TabsSendMessageParams({int? frameId, String? documentId}) {
    if (frameId != null) this.frameId = frameId;
    if (documentId != null) this.documentId = documentId;
  }
  TabsSendMessageParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Send a message to a specific [frame](webNavigation#frame_ids) identified by
   * `frameId` instead of all frames in the tab.
   */
  int get frameId => jsProxy['frameId'];
  set frameId(int value) => jsProxy['frameId'] = value;

  /**
   * Send a message to a specific [document](webNavigation#document_ids)
   * identified by `documentId` instead of all frames in the tab.
   */
  String get documentId => jsProxy['documentId'];
  set documentId(String value) => jsProxy['documentId'] = value;
}

class TabsCreateParams extends ChromeObject {
  TabsCreateParams({int? windowId, int? index, String? url, bool? active, bool? selected, bool? pinned, int? openerTabId}) {
    if (windowId != null) this.windowId = windowId;
    if (index != null) this.index = index;
    if (url != null) this.url = url;
    if (active != null) this.active = active;
    if (selected != null) this.selected = selected;
    if (pinned != null) this.pinned = pinned;
    if (openerTabId != null) this.openerTabId = openerTabId;
  }
  TabsCreateParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The window in which to create the new tab. Defaults to the [current
   * window](windows#current-window).
   */
  int get windowId => jsProxy['windowId'];
  set windowId(int value) => jsProxy['windowId'] = value;

  /**
   * The position the tab should take in the window. The provided value is
   * clamped to between zero and the number of tabs in the window.
   */
  int get index => jsProxy['index'];
  set index(int value) => jsProxy['index'] = value;

  /**
   * The URL to initially navigate the tab to. Fully-qualified URLs must include
   * a scheme (i.e., 'http://www.google.com', not 'www.google.com'). Relative
   * URLs are relative to the current page within the extension. Defaults to the
   * New Tab Page.
   */
  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;

  /**
   * Whether the tab should become the active tab in the window. Does not affect
   * whether the window is focused (see [windows.update]). Defaults to [true].
   */
  bool get active => jsProxy['active'];
  set active(bool value) => jsProxy['active'] = value;

  /**
   * Whether the tab should become the selected tab in the window. Defaults to
   * [true]
   */
  bool get selected => jsProxy['selected'];
  set selected(bool value) => jsProxy['selected'] = value;

  /**
   * Whether the tab should be pinned. Defaults to [false]
   */
  bool get pinned => jsProxy['pinned'];
  set pinned(bool value) => jsProxy['pinned'] = value;

  /**
   * The ID of the tab that opened this tab. If specified, the opener tab must
   * be in the same window as the newly created tab.
   */
  int get openerTabId => jsProxy['openerTabId'];
  set openerTabId(int value) => jsProxy['openerTabId'] = value;
}

class TabsQueryParams extends ChromeObject {
  TabsQueryParams({bool? active, bool? pinned, bool? audible, bool? muted, bool? highlighted, bool? discarded, bool? autoDiscardable, bool? currentWindow, bool? lastFocusedWindow, TabStatus? status, String? title, Object? url, int? groupId, int? windowId, TabsWindowType? windowType, int? index}) {
    if (active != null) this.active = active;
    if (pinned != null) this.pinned = pinned;
    if (audible != null) this.audible = audible;
    if (muted != null) this.muted = muted;
    if (highlighted != null) this.highlighted = highlighted;
    if (discarded != null) this.discarded = discarded;
    if (autoDiscardable != null) this.autoDiscardable = autoDiscardable;
    if (currentWindow != null) this.currentWindow = currentWindow;
    if (lastFocusedWindow != null) this.lastFocusedWindow = lastFocusedWindow;
    if (status != null) this.status = status;
    if (title != null) this.title = title;
    if (url != null) this.url = url;
    if (groupId != null) this.groupId = groupId;
    if (windowId != null) this.windowId = windowId;
    if (windowType != null) this.windowType = windowType;
    if (index != null) this.index = index;
  }
  TabsQueryParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Whether the tabs are active in their windows.
   */
  bool get active => jsProxy['active'];
  set active(bool value) => jsProxy['active'] = value;

  /**
   * Whether the tabs are pinned.
   */
  bool get pinned => jsProxy['pinned'];
  set pinned(bool value) => jsProxy['pinned'] = value;

  /**
   * Whether the tabs are audible.
   */
  bool get audible => jsProxy['audible'];
  set audible(bool value) => jsProxy['audible'] = value;

  /**
   * Whether the tabs are muted.
   */
  bool get muted => jsProxy['muted'];
  set muted(bool value) => jsProxy['muted'] = value;

  /**
   * Whether the tabs are highlighted.
   */
  bool get highlighted => jsProxy['highlighted'];
  set highlighted(bool value) => jsProxy['highlighted'] = value;

  /**
   * Whether the tabs are discarded. A discarded tab is one whose content has
   * been unloaded from memory, but is still visible in the tab strip. Its
   * content is reloaded the next time it is activated.
   */
  bool get discarded => jsProxy['discarded'];
  set discarded(bool value) => jsProxy['discarded'] = value;

  /**
   * Whether the tabs can be discarded automatically by the browser when
   * resources are low.
   */
  bool get autoDiscardable => jsProxy['autoDiscardable'];
  set autoDiscardable(bool value) => jsProxy['autoDiscardable'] = value;

  /**
   * Whether the tabs are in the [current window](windows#current-window).
   */
  bool get currentWindow => jsProxy['currentWindow'];
  set currentWindow(bool value) => jsProxy['currentWindow'] = value;

  /**
   * Whether the tabs are in the last focused window.
   */
  bool get lastFocusedWindow => jsProxy['lastFocusedWindow'];
  set lastFocusedWindow(bool value) => jsProxy['lastFocusedWindow'] = value;

  /**
   * The tab loading status.
   */
  TabStatus get status => _createTabStatus(jsProxy['status']);
  set status(TabStatus value) => jsProxy['status'] = jsify(value);

  /**
   * Match page titles against a pattern. This property is ignored if the
   * extension does not have the `"tabs"` permission.
   */
  String get title => jsProxy['title'];
  set title(String value) => jsProxy['title'] = value;

  /**
   * Match tabs against one or more [URL patterns](match_patterns). Fragment
   * identifiers are not matched. This property is ignored if the extension does
   * not have the `"tabs"` permission.
   */
  Object get url => jsProxy['url'];
  set url(Object value) => jsProxy['url'] = jsify(value);

  /**
   * The ID of the group that the tabs are in, or [tabGroups.TAB_GROUP_ID_NONE]
   * for ungrouped tabs.
   */
  int get groupId => jsProxy['groupId'];
  set groupId(int value) => jsProxy['groupId'] = value;

  /**
   * The ID of the parent window, or [windows.WINDOW_ID_CURRENT] for the
   * [current window](windows#current-window).
   */
  int get windowId => jsProxy['windowId'];
  set windowId(int value) => jsProxy['windowId'] = value;

  /**
   * The type of window the tabs are in.
   */
  TabsWindowType get windowType => _createWindowType(jsProxy['windowType']);
  set windowType(TabsWindowType value) => jsProxy['windowType'] = jsify(value);

  /**
   * The position of the tabs within their windows.
   */
  int get index => jsProxy['index'];
  set index(int value) => jsProxy['index'] = value;
}

class TabsHighlightParams extends ChromeObject {
  TabsHighlightParams({int? windowId, Object? tabs}) {
    if (windowId != null) this.windowId = windowId;
    if (tabs != null) this.tabs = tabs;
  }
  TabsHighlightParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The window that contains the tabs.
   */
  int get windowId => jsProxy['windowId'];
  set windowId(int value) => jsProxy['windowId'] = value;

  /**
   * One or more tab indices to highlight.
   */
  Object get tabs => jsProxy['tabs'];
  set tabs(Object value) => jsProxy['tabs'] = jsify(value);
}

class TabsUpdateParams extends ChromeObject {
  TabsUpdateParams({String? url, bool? active, bool? highlighted, bool? selected, bool? pinned, bool? muted, int? openerTabId, bool? autoDiscardable}) {
    if (url != null) this.url = url;
    if (active != null) this.active = active;
    if (highlighted != null) this.highlighted = highlighted;
    if (selected != null) this.selected = selected;
    if (pinned != null) this.pinned = pinned;
    if (muted != null) this.muted = muted;
    if (openerTabId != null) this.openerTabId = openerTabId;
    if (autoDiscardable != null) this.autoDiscardable = autoDiscardable;
  }
  TabsUpdateParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * A URL to navigate the tab to. JavaScript URLs are not supported; use
   * [scripting.executeScript] instead.
   */
  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;

  /**
   * Whether the tab should be active. Does not affect whether the window is
   * focused (see [windows.update]).
   */
  bool get active => jsProxy['active'];
  set active(bool value) => jsProxy['active'] = value;

  /**
   * Adds or removes the tab from the current selection.
   */
  bool get highlighted => jsProxy['highlighted'];
  set highlighted(bool value) => jsProxy['highlighted'] = value;

  /**
   * Whether the tab should be selected.
   */
  bool get selected => jsProxy['selected'];
  set selected(bool value) => jsProxy['selected'] = value;

  /**
   * Whether the tab should be pinned.
   */
  bool get pinned => jsProxy['pinned'];
  set pinned(bool value) => jsProxy['pinned'] = value;

  /**
   * Whether the tab should be muted.
   */
  bool get muted => jsProxy['muted'];
  set muted(bool value) => jsProxy['muted'] = value;

  /**
   * The ID of the tab that opened this tab. If specified, the opener tab must
   * be in the same window as this tab.
   */
  int get openerTabId => jsProxy['openerTabId'];
  set openerTabId(int value) => jsProxy['openerTabId'] = value;

  /**
   * Whether the tab should be discarded automatically by the browser when
   * resources are low.
   */
  bool get autoDiscardable => jsProxy['autoDiscardable'];
  set autoDiscardable(bool value) => jsProxy['autoDiscardable'] = value;
}

class TabsMoveParams extends ChromeObject {
  TabsMoveParams({int? windowId, int? index}) {
    if (windowId != null) this.windowId = windowId;
    if (index != null) this.index = index;
  }
  TabsMoveParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Defaults to the window the tab is currently in.
   */
  int get windowId => jsProxy['windowId'];
  set windowId(int value) => jsProxy['windowId'] = value;

  /**
   * The position to move the window to. Use `-1` to place the tab at the end of
   * the window.
   */
  int get index => jsProxy['index'];
  set index(int value) => jsProxy['index'] = value;
}

class TabsReloadParams extends ChromeObject {
  TabsReloadParams({bool? bypassCache}) {
    if (bypassCache != null) this.bypassCache = bypassCache;
  }
  TabsReloadParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Whether to bypass local caching. Defaults to `false`.
   */
  bool get bypassCache => jsProxy['bypassCache'];
  set bypassCache(bool value) => jsProxy['bypassCache'] = value;
}

class TabsGroupParams extends ChromeObject {
  TabsGroupParams({Object? tabIds, int? groupId, CreatePropertiesTabs? createProperties}) {
    if (tabIds != null) this.tabIds = tabIds;
    if (groupId != null) this.groupId = groupId;
    if (createProperties != null) this.createProperties = createProperties;
  }
  TabsGroupParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The tab ID or list of tab IDs to add to the specified group.
   */
  Object get tabIds => jsProxy['tabIds'];
  set tabIds(Object value) => jsProxy['tabIds'] = jsify(value);

  /**
   * The ID of the group to add the tabs to. If not specified, a new group will
   * be created.
   */
  int get groupId => jsProxy['groupId'];
  set groupId(int value) => jsProxy['groupId'] = value;

  /**
   * Configurations for creating a group. Cannot be used if groupId is already
   * specified.
   */
  CreatePropertiesTabs get createProperties => _createCreatePropertiesTabs(jsProxy['createProperties']);
  set createProperties(CreatePropertiesTabs value) => jsProxy['createProperties'] = jsify(value);
}

Tab _createTab(JsObject jsProxy) => Tab.fromProxy(jsProxy);
OnUpdatedEvent _createOnUpdatedEvent(int tabId, JsObject changeInfo, JsObject tab) =>
    OnUpdatedEvent(tabId, mapify(changeInfo), _createTab(tab));
TabsOnMovedEvent _createOnMovedEvent(int tabId, JsObject moveInfo) =>
    TabsOnMovedEvent(tabId, mapify(moveInfo));
OnSelectionChangedEvent _createOnSelectionChangedEvent(int tabId, JsObject selectInfo) =>
    OnSelectionChangedEvent(tabId, mapify(selectInfo));
OnActiveChangedEvent _createOnActiveChangedEvent(int tabId, JsObject selectInfo) =>
    OnActiveChangedEvent(tabId, mapify(selectInfo));
OnDetachedEvent _createOnDetachedEvent(int tabId, JsObject detachInfo) =>
    OnDetachedEvent(tabId, mapify(detachInfo));
OnAttachedEvent _createOnAttachedEvent(int tabId, JsObject attachInfo) =>
    OnAttachedEvent(tabId, mapify(attachInfo));
TabsOnRemovedEvent _createOnRemovedEvent(int tabId, JsObject removeInfo) =>
    TabsOnRemovedEvent(tabId, mapify(removeInfo));
OnReplacedEvent _createOnReplacedEvent(int addedTabId, int removedTabId) =>
    OnReplacedEvent(addedTabId, removedTabId);
Port _createPort(JsObject jsProxy) => Port.fromProxy(jsProxy);
MutedInfoReason _createMutedInfoReason(String value) => MutedInfoReason.VALUES.singleWhere((ChromeEnum e) => e.value == value);
MutedInfo _createMutedInfo(JsObject jsProxy) => MutedInfo.fromProxy(jsProxy);
TabStatus _createTabStatus(String value) => TabStatus.VALUES.singleWhere((ChromeEnum e) => e.value == value);
ZoomSettingsMode _createZoomSettingsMode(String value) => ZoomSettingsMode.VALUES.singleWhere((ChromeEnum e) => e.value == value);
ZoomSettingsScope _createZoomSettingsScope(String value) => ZoomSettingsScope.VALUES.singleWhere((ChromeEnum e) => e.value == value);
TabsWindowType _createWindowType(String value) => TabsWindowType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
CreatePropertiesTabs _createCreatePropertiesTabs(JsObject jsProxy) => CreatePropertiesTabs.fromProxy(jsProxy);
