import 'chrome.dart';
export 'chrome.dart';

final _windows = ChromeWindows._();

extension ChromeChromeWindowsExtension on Chrome {
  ChromeWindows get windows => _windows;
}

class ChromeWindows {
  ChromeWindows._();
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
