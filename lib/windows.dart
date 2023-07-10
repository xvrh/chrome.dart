import 'chrome.dart';
export 'chrome.dart';

final _windows = ChromeWindows._();

extension ChromeChromeWindowsExtension on Chrome {
  ChromeWindows get windows => _windows;
}

class ChromeWindows {
  ChromeWindows._();

  /// Gets details about a window.
  void get(
    windowId,
    queryOptions,
  ) =>
      throw UnimplementedError();

  /// Gets the <a href='#current-window'>current window</a>.
  void getCurrent(queryOptions) => throw UnimplementedError();

  /// Gets the window that was most recently focused &mdash; typically the
  /// window 'on top'.
  void getLastFocused(queryOptions) => throw UnimplementedError();

  /// Gets all windows.
  void getAll(queryOptions) => throw UnimplementedError();

  /// Creates (opens) a new browser window with any optional sizing, position,
  /// or default URL provided.
  void create(createData) => throw UnimplementedError();

  /// Updates the properties of a window. Specify only the properties that to be
  /// changed; unspecified properties are unchanged.
  void update(
    windowId,
    updateInfo,
  ) =>
      throw UnimplementedError();

  /// Removes (closes) a window and all the tabs inside it.
  void remove(windowId) => throw UnimplementedError();

  /// Fired when a window is created.
  Stream get onCreated => throw UnimplementedError();

  /// Fired when a window is removed (closed).
  Stream get onRemoved => throw UnimplementedError();

  /// Fired when the currently focused window changes. Returns
  /// `chrome.windows.WINDOW_ID_NONE` if all Chrome windows have lost focus.
  /// **Note:** On some Linux window managers, `WINDOW_ID_NONE` is always sent
  /// immediately preceding a switch from one Chrome window to another.
  Stream get onFocusChanged => throw UnimplementedError();

  /// Fired when a window has been resized; this event is only dispatched when
  /// the new bounds are committed, and not for in-progress changes.
  Stream get onBoundsChanged => throw UnimplementedError();
}

/// The type of browser window this is. In some circumstances a window may not
/// be assigned a `type` property; for example, when querying closed windows
/// from the $(ref:sessions) API.
enum WindowType {
  /// A normal browser window.
  normal('normal'),

  /// A browser popup.
  popup('popup'),

  /// <i>Deprecated in this API.</i> A Chrome App panel-style window. Extensions
  /// can only see their own panel windows.
  panel('panel'),

  /// <i>Deprecated in this API.</i> A Chrome App window. Extensions can only
  /// see their app own windows.
  app('app'),

  /// A Developer Tools window.
  devtools('devtools');

  const WindowType(this.value);

  final String value;
}

/// The state of this browser window. In some circumstances a window may not be
/// assigned a `state` property; for example, when querying closed windows from
/// the $(ref:sessions) API.
enum WindowState {
  /// Normal window state (not minimized, maximized, or fullscreen).
  normal('normal'),

  /// Minimized window state.
  minimized('minimized'),

  /// Maximized window state.
  maximized('maximized'),

  /// Fullscreen window state.
  fullscreen('fullscreen'),

  /// Locked fullscreen window state. This fullscreen state cannot be exited by
  /// user action and is available only to allowlisted extensions on Chrome OS.
  lockedFullscreen('locked-fullscreen');

  const WindowState(this.value);

  final String value;
}

/// Specifies what type of browser window to create. 'panel' is deprecated and
/// is available only to existing allowlisted extensions on Chrome OS.
enum CreateType {
  normal('normal'),
  popup('popup'),
  panel('panel');

  const CreateType(this.value);

  final String value;
}
