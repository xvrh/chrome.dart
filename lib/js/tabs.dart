import 'chrome.dart';
import 'dart:js_interop';
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
  external void get();

  /// Gets the tab that this script call is being made from. May be undefined if
  /// called from a non-tab context (for example, a background page or popup
  /// view).
  external void getCurrent();

  /// Connects to the content script(s) in the specified tab. The
  /// $(ref:runtime.onConnect) event is fired in each content script running in
  /// the specified tab for the current extension. For more details, see <a
  /// href='messaging'>Content Script Messaging</a>.
  external void connect();

  /// Sends a single request to the content script(s) in the specified tab, with
  /// an optional callback to run when a response is sent back.  The
  /// $(ref:extension.onRequest) event is fired in each content script running
  /// in the specified tab for the current extension.
  external void sendRequest();

  /// Sends a single message to the content script(s) in the specified tab, with
  /// an optional callback to run when a response is sent back.  The
  /// $(ref:runtime.onMessage) event is fired in each content script running in
  /// the specified tab for the current extension.
  external void sendMessage();

  /// Gets the tab that is selected in the specified window.
  external void getSelected();

  /// Gets details about all tabs in the specified window.
  external void getAllInWindow();

  /// Creates a new tab.
  external void create();

  /// Duplicates a tab.
  external void duplicate();

  /// Gets all tabs that have the specified properties, or all tabs if no
  /// properties are specified.
  external void query();

  /// Highlights the given tabs and focuses on the first of group. Will appear
  /// to do nothing if the specified tab is currently active.
  external void highlight();

  /// Modifies the properties of a tab. Properties that are not specified in
  /// <var>updateProperties</var> are not modified.
  external void update();

  /// Moves one or more tabs to a new position within its window, or to a new
  /// window. Note that tabs can only be moved to and from normal (window.type
  /// === "normal") windows.
  external void move();

  /// Reload a tab.
  external void reload();

  /// Closes one or more tabs.
  external void remove();

  /// Adds one or more tabs to a specified group, or if no group is specified,
  /// adds the given tabs to a newly created group.
  external void group();

  /// Removes one or more tabs from their respective groups. If any groups
  /// become empty, they are deleted.
  external void ungroup();

  /// Detects the primary language of the content in a tab.
  external void detectLanguage();

  /// Captures the visible area of the currently active tab in the specified
  /// window. In order to call this method, the extension must have either the
  /// <a href='declare_permissions'><all_urls></a> permission or the <a
  /// href='activeTab'>activeTab</a> permission. In addition to sites that
  /// extensions can normally access, this method allows extensions to capture
  /// sensitive sites that are otherwise restricted, including chrome:-scheme
  /// pages, other extensions' pages, and data: URLs. These sensitive sites can
  /// only be captured with the activeTab permission. File URLs may be captured
  /// only if the extension has been granted file access.
  external void captureVisibleTab();

  /// Injects JavaScript code into a page. For details, see the <a
  /// href='content_scripts#pi'>programmatic injection</a> section of the
  /// content scripts doc.
  external void executeScript();

  /// Injects CSS into a page. Styles inserted with this method can be removed
  /// with $(ref:scripting.removeCSS). For details, see the <a
  /// href='content_scripts#pi'>programmatic injection</a> section of the
  /// content scripts doc.
  external void insertCSS();

  /// Removes from a page CSS that was previously injected by a call to
  /// $(ref:scripting.insertCSS).
  external void removeCSS();

  /// Zooms a specified tab.
  external void setZoom();

  /// Gets the current zoom factor of a specified tab.
  external void getZoom();

  /// Sets the zoom settings for a specified tab, which define how zoom changes
  /// are handled. These settings are reset to defaults upon navigating the tab.
  external void setZoomSettings();

  /// Gets the current zoom settings of a specified tab.
  external void getZoomSettings();

  /// Discards a tab from memory. Discarded tabs are still visible on the tab
  /// strip and are reloaded when activated.
  external void discard();

  /// Go foward to the next page, if one is available.
  external void goForward();

  /// Go back to the previous page, if one is available.
  external void goBack();

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
}
