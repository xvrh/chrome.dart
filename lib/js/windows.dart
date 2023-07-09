import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSWindowsExtension on JSChrome {
  /// Use the `chrome.windows` API to interact with browser windows. You can use
  /// this API to create, modify, and rearrange windows in the browser.
  external JSWindows get Windows;
}

@JS()
@staticInterop
class JSWindows {}

extension JSWindowsExtension on JSWindows {
  /// Gets details about a window.
  external void get();

  /// Gets the <a href='#current-window'>current window</a>.
  external void getCurrent();

  /// Gets the window that was most recently focused &mdash; typically the
  /// window 'on top'.
  external void getLastFocused();

  /// Gets all windows.
  external void getAll();

  /// Creates (opens) a new browser window with any optional sizing, position,
  /// or default URL provided.
  external void create();

  /// Updates the properties of a window. Specify only the properties that to be
  /// changed; unspecified properties are unchanged.
  external void update();

  /// Removes (closes) a window and all the tabs inside it.
  external void remove();

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
