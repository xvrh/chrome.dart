import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/tabs.dart' as $js_tabs;
import 'src/js/windows.dart' as $js;
import 'tabs.dart';

export 'src/chrome.dart' show chrome;

final _windows = ChromeWindows._();

extension ChromeWindowsExtension on Chrome {
  /// Use the `chrome.windows` API to interact with browser windows. You can use
  /// this API to create, modify, and rearrange windows in the browser.
  ChromeWindows get windows => _windows;
}

class ChromeWindows {
  ChromeWindows._();

  bool get isAvailable => $js.chrome.windowsNullable != null;

  /// Gets details about a window.
  Future<Window> get(
    int windowId,
    QueryOptions? queryOptions,
  ) async {
    var $res = await promiseToFuture<$js.Window>($js.chrome.windows.get(
      windowId,
      queryOptions?.toJS,
    ));
    return Window.fromJS($res);
  }

  /// Gets the [current window](#current-window).
  Future<Window> getCurrent(QueryOptions? queryOptions) async {
    var $res = await promiseToFuture<$js.Window>(
        $js.chrome.windows.getCurrent(queryOptions?.toJS));
    return Window.fromJS($res);
  }

  /// Gets the window that was most recently focused - typically the window 'on
  /// top'.
  Future<Window> getLastFocused(QueryOptions? queryOptions) async {
    var $res = await promiseToFuture<$js.Window>(
        $js.chrome.windows.getLastFocused(queryOptions?.toJS));
    return Window.fromJS($res);
  }

  /// Gets all windows.
  Future<List<Window>> getAll(QueryOptions? queryOptions) async {
    var $res = await promiseToFuture<JSArray>(
        $js.chrome.windows.getAll(queryOptions?.toJS));
    return $res.toDart.cast<$js.Window>().map((e) => Window.fromJS(e)).toList();
  }

  /// Creates (opens) a new browser window with any optional sizing, position,
  /// or default URL provided.
  Future<Window?> create(CreateData? createData) async {
    var $res = await promiseToFuture<$js.Window?>(
        $js.chrome.windows.create(createData?.toJS));
    return $res?.let(Window.fromJS);
  }

  /// Updates the properties of a window. Specify only the properties that to be
  /// changed; unspecified properties are unchanged.
  Future<Window> update(
    int windowId,
    UpdateInfo updateInfo,
  ) async {
    var $res = await promiseToFuture<$js.Window>($js.chrome.windows.update(
      windowId,
      updateInfo.toJS,
    ));
    return Window.fromJS($res);
  }

  /// Removes (closes) a window and all the tabs inside it.
  Future<void> remove(int windowId) async {
    await promiseToFuture<void>($js.chrome.windows.remove(windowId));
  }

  /// The windowId value that represents the absence of a Chrome browser window.
  int get windowIdNone => $js.chrome.windows.WINDOW_ID_NONE;

  /// The windowId value that represents the [current
  /// window](windows#current-window).
  int get windowIdCurrent => $js.chrome.windows.WINDOW_ID_CURRENT;

  /// Fired when a window is created.
  Stream<Window> get onCreated =>
      $js.chrome.windows.onCreated.asStream(($c) => ($js.Window window) {
            $c.add(Window.fromJS(window));
          }.toJS);

  /// Fired when a window is removed (closed).
  Stream<int> get onRemoved =>
      $js.chrome.windows.onRemoved.asStream(($c) => (int windowId) {
            $c.add(windowId);
          }.toJS);

  /// Fired when the currently focused window changes. Returns
  /// `chrome.windows.WINDOW_ID_NONE` if all Chrome windows have lost focus.
  /// **Note:** On some Linux window managers, `WINDOW_ID_NONE` is always sent
  /// immediately preceding a switch from one Chrome window to another.
  Stream<int> get onFocusChanged =>
      $js.chrome.windows.onFocusChanged.asStream(($c) => (int windowId) {
            $c.add(windowId);
          }.toJS);

  /// Fired when a window has been resized; this event is only dispatched when
  /// the new bounds are committed, and not for in-progress changes.
  Stream<Window> get onBoundsChanged =>
      $js.chrome.windows.onBoundsChanged.asStream(($c) => ($js.Window window) {
            $c.add(Window.fromJS(window));
          }.toJS);
}

/// The type of browser window this is. In some circumstances a window may not
/// be assigned a `type` property; for example, when querying closed windows
/// from the [sessions] API.
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

  String get toJS => value;
  static WindowType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// The state of this browser window. In some circumstances a window may not be
/// assigned a `state` property; for example, when querying closed windows from
/// the [sessions] API.
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

  String get toJS => value;
  static WindowState fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Specifies what type of browser window to create. 'panel' is deprecated and
/// is available only to existing allowlisted extensions on Chrome OS.
enum CreateType {
  normal('normal'),
  popup('popup'),
  panel('panel');

  const CreateType(this.value);

  final String value;

  String get toJS => value;
  static CreateType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class Window {
  Window.fromJS(this._wrapped);

  Window({
    int? id,
    required bool focused,
    int? top,
    int? left,
    int? width,
    int? height,
    List<Tab>? tabs,
    required bool incognito,
    WindowType? type,
    WindowState? state,
    required bool alwaysOnTop,
    String? sessionId,
  }) : _wrapped = $js.Window()
          ..id = id
          ..focused = focused
          ..top = top
          ..left = left
          ..width = width
          ..height = height
          ..tabs = tabs?.toJSArray((e) => e.toJS)
          ..incognito = incognito
          ..type = type?.toJS
          ..state = state?.toJS
          ..alwaysOnTop = alwaysOnTop
          ..sessionId = sessionId;

  final $js.Window _wrapped;

  $js.Window get toJS => _wrapped;

  /// The ID of the window. Window IDs are unique within a browser session. In
  /// some circumstances a window may not be assigned an `ID` property; for
  /// example, when querying windows using the [sessions] API, in which case a
  /// session ID may be present.
  int? get id => _wrapped.id;
  set id(int? v) {
    _wrapped.id = v;
  }

  /// Whether the window is currently the focused window.
  bool get focused => _wrapped.focused;
  set focused(bool v) {
    _wrapped.focused = v;
  }

  /// The offset of the window from the top edge of the screen in pixels. In
  /// some circumstances a window may not be assigned a `top` property; for
  /// example, when querying closed windows from the [sessions] API.
  int? get top => _wrapped.top;
  set top(int? v) {
    _wrapped.top = v;
  }

  /// The offset of the window from the left edge of the screen in pixels. In
  /// some circumstances a window may not be assigned a `left` property; for
  /// example, when querying closed windows from the [sessions] API.
  int? get left => _wrapped.left;
  set left(int? v) {
    _wrapped.left = v;
  }

  /// The width of the window, including the frame, in pixels. In some
  /// circumstances a window may not be assigned a `width` property; for
  /// example, when querying closed windows from the [sessions] API.
  int? get width => _wrapped.width;
  set width(int? v) {
    _wrapped.width = v;
  }

  /// The height of the window, including the frame, in pixels. In some
  /// circumstances a window may not be assigned a `height` property; for
  /// example, when querying closed windows from the [sessions] API.
  int? get height => _wrapped.height;
  set height(int? v) {
    _wrapped.height = v;
  }

  /// Array of [tabs.Tab] objects representing the current tabs in the window.
  List<Tab>? get tabs => _wrapped.tabs?.toDart
      .cast<$js_tabs.Tab>()
      .map((e) => Tab.fromJS(e))
      .toList();
  set tabs(List<Tab>? v) {
    _wrapped.tabs = v?.toJSArray((e) => e.toJS);
  }

  /// Whether the window is incognito.
  bool get incognito => _wrapped.incognito;
  set incognito(bool v) {
    _wrapped.incognito = v;
  }

  /// The type of browser window this is.
  WindowType? get type => _wrapped.type?.let(WindowType.fromJS);
  set type(WindowType? v) {
    _wrapped.type = v?.toJS;
  }

  /// The state of this browser window.
  WindowState? get state => _wrapped.state?.let(WindowState.fromJS);
  set state(WindowState? v) {
    _wrapped.state = v?.toJS;
  }

  /// Whether the window is set to be always on top.
  bool get alwaysOnTop => _wrapped.alwaysOnTop;
  set alwaysOnTop(bool v) {
    _wrapped.alwaysOnTop = v;
  }

  /// The session ID used to uniquely identify a window, obtained from the
  /// [sessions] API.
  String? get sessionId => _wrapped.sessionId;
  set sessionId(String? v) {
    _wrapped.sessionId = v;
  }
}

class QueryOptions {
  QueryOptions.fromJS(this._wrapped);

  QueryOptions({
    bool? populate,
    List<WindowType>? windowTypes,
  }) : _wrapped = $js.QueryOptions(
          populate: populate,
          windowTypes: windowTypes?.toJSArray((e) => e.toJS),
        );

  final $js.QueryOptions _wrapped;

  $js.QueryOptions get toJS => _wrapped;
}

class CreateData {
  CreateData.fromJS(this._wrapped);

  CreateData({
    Object? url,
    int? tabId,
    int? left,
    int? top,
    int? width,
    int? height,
    bool? focused,
    bool? incognito,
    CreateType? type,
    WindowState? state,
    bool? setSelfAsOpener,
  }) : _wrapped = $js.CreateData(
          url: switch (url) {
            _ => throw UnsupportedError(
                'Received type: ${url.runtimeType}. Supported types are: String, List<String>')
          },
          tabId: tabId,
          left: left,
          top: top,
          width: width,
          height: height,
          focused: focused,
          incognito: incognito,
          type: type?.toJS,
          state: state?.toJS,
          setSelfAsOpener: setSelfAsOpener,
        );

  final $js.CreateData _wrapped;

  $js.CreateData get toJS => _wrapped;
}

class UpdateInfo {
  UpdateInfo.fromJS(this._wrapped);

  UpdateInfo({
    int? left,
    int? top,
    int? width,
    int? height,
    bool? focused,
    bool? drawAttention,
    WindowState? state,
  }) : _wrapped = $js.UpdateInfo(
          left: left,
          top: top,
          width: width,
          height: height,
          focused: focused,
          drawAttention: drawAttention,
          state: state?.toJS,
        );

  final $js.UpdateInfo _wrapped;

  $js.UpdateInfo get toJS => _wrapped;
}
