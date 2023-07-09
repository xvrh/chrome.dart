import 'chrome.dart';
export 'chrome.dart';

final _tabs = ChromeTabs._();

extension ChromeChromeTabsExtension on Chrome {
  ChromeTabs get tabs => _tabs;
}

class ChromeTabs {
  ChromeTabs._();
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
