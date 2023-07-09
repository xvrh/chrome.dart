import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSWindowsExtension on JSChrome {
  /// Use the `chrome.windows` API to interact with browser windows. You can use
  /// this API to create, modify, and rearrange windows in the browser.
  external JSWindows get windows;
}

@JS()
@staticInterop
class JSWindows {}

extension JSWindowsExtension on JSWindows {
  /// Gets details about a window.
  external void get(
    windowId,
    queryOptions,
  );

  /// Gets the <a href='#current-window'>current window</a>.
  external void getCurrent(queryOptions);

  /// Gets the window that was most recently focused &mdash; typically the
  /// window 'on top'.
  external void getLastFocused(queryOptions);

  /// Gets all windows.
  external void getAll(queryOptions);

  /// Creates (opens) a new browser window with any optional sizing, position,
  /// or default URL provided.
  external void create(createData);

  /// Updates the properties of a window. Specify only the properties that to be
  /// changed; unspecified properties are unchanged.
  external void update(
    windowId,
    updateInfo,
  );

  /// Removes (closes) a window and all the tabs inside it.
  external void remove(windowId);

  /// Fired when a window is created.
  external ChromeEvent get onCreated;

  /// Fired when a window is removed (closed).
  external ChromeEvent get onRemoved;

  /// Fired when the currently focused window changes. Returns
  /// `chrome.windows.WINDOW_ID_NONE` if all Chrome windows have lost focus.
  /// <b>Note:</b> On some Linux window managers, `WINDOW_ID_NONE` is always
  /// sent immediately preceding a switch from one Chrome window to another.
  external ChromeEvent get onFocusChanged;

  /// Fired when a window has been resized; this event is only dispatched when
  /// the new bounds are committed, and not for in-progress changes.
  external ChromeEvent get onBoundsChanged;
}

@JS()
@staticInterop
class WindowType {}

@JS()
@staticInterop
class WindowState {}

@JS()
@staticInterop
class Window {
  /// The ID of the window. Window IDs are unique within a browser session. In
  /// some circumstances a window may not be assigned an `ID` property; for
  /// example, when querying windows using the $(ref:sessions) API, in which
  /// case a session ID may be present.
  external JSAny? get id;

  /// Whether the window is currently the focused window.
  external JSAny get focused;

  /// The offset of the window from the top edge of the screen in pixels. In
  /// some circumstances a window may not be assigned a `top` property; for
  /// example, when querying closed windows from the $(ref:sessions) API.
  external JSAny? get top;

  /// The offset of the window from the left edge of the screen in pixels. In
  /// some circumstances a window may not be assigned a `left` property; for
  /// example, when querying closed windows from the $(ref:sessions) API.
  external JSAny? get left;

  /// The width of the window, including the frame, in pixels. In some
  /// circumstances a window may not be assigned a `width` property; for
  /// example, when querying closed windows from the $(ref:sessions) API.
  external JSAny? get width;

  /// The height of the window, including the frame, in pixels. In some
  /// circumstances a window may not be assigned a `height` property; for
  /// example, when querying closed windows from the $(ref:sessions) API.
  external JSAny? get height;

  /// Array of $(ref:tabs.Tab) objects representing the current tabs in the
  /// window.
  external JSArray? get tabs;

  /// Whether the window is incognito.
  external JSAny get incognito;

  /// The type of browser window this is.
  external JSAny? get type;

  /// The state of this browser window.
  external JSAny? get state;

  /// Whether the window is set to be always on top.
  external JSAny get alwaysOnTop;

  /// The session ID used to uniquely identify a window, obtained from the
  /// $(ref:sessions) API.
  external JSAny? get sessionId;
}

@JS()
@staticInterop
class CreateType {}

@JS()
@staticInterop
class QueryOptions {
  /// If true, the $(ref:windows.Window) object has a <var>tabs</var> property
  /// that contains a list of the $(ref:tabs.Tab) objects. The `Tab` objects
  /// only contain the `url`, `pendingUrl`, `title`, and `favIconUrl` properties
  /// if the extension's manifest file includes the `"tabs"` permission.
  external JSAny? get populate;

  /// If set, the $(ref:windows.Window) returned is filtered based on its type.
  /// If unset, the default filter is set to `['normal', 'popup']`.
  external JSArray? get windowTypes;
}
