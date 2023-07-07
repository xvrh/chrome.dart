/* This file has been generated from side_panel.idl - do not edit */

/**
 * chrome.sidePanel API
 */
library chrome.sidePanel;

import '../src/common.dart';

/**
 * Accessor for the `chrome.sidePanel` namespace.
 */
final ChromeSidePanel sidePanel = ChromeSidePanel._();

class ChromeSidePanel extends ChromeApi {
  JsObject get _sidePanel => chrome['sidePanel'];

  ChromeSidePanel._();

  bool get available => _sidePanel != null;

  /**
   * Configures the side panel.
   * [options]: The configuration options to apply to the panel.
   * [callback]: Invoked when the options have been set.
   */
  Future setOptions(PanelOptions options) {
    if (_sidePanel == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _sidePanel.callMethod('setOptions', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Returns the active panel configuration.
   * [options]: Specifies the context to return the configuration for.
   * [callback]: Called with the active panel configuration.
   */
  Future<PanelOptions> getOptions(GetPanelOptions options) {
    if (_sidePanel == null) _throwNotAvailable();

    var completer =  ChromeCompleter<PanelOptions>.oneArg(_createPanelOptions);
    _sidePanel.callMethod('getOptions', [jsify(options), completer.callback]);
    return completer.future;
  }

  /**
   * Configures the extension's side panel behavior. This is an upsert
   * operation.
   * [behavior]: The new behavior to be set.
   * [callback]: Called when the new behavior has been set.
   */
  Future setPanelBehavior(PanelBehavior behavior) {
    if (_sidePanel == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _sidePanel.callMethod('setPanelBehavior', [jsify(behavior), completer.callback]);
    return completer.future;
  }

  /**
   * Returns the extension's current side panel behavior.
   * [callback]: Called with the extension's side panel behavior.
   */
  Future<PanelBehavior> getPanelBehavior() {
    if (_sidePanel == null) _throwNotAvailable();

    var completer =  ChromeCompleter<PanelBehavior>.oneArg(_createPanelBehavior);
    _sidePanel.callMethod('getPanelBehavior', [completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.sidePanel' is not available");
  }
}

class SidePanel extends ChromeObject {
  SidePanel({String? default_path}) {
    if (default_path != null) this.default_path = default_path;
  }
  SidePanel.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get default_path => jsProxy['default_path'];
  set default_path(String value) => jsProxy['default_path'] = value;
}

class ManifestKeys extends ChromeObject {
  ManifestKeys({SidePanel? side_panel}) {
    if (side_panel != null) this.side_panel = side_panel;
  }
  ManifestKeys.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  SidePanel get side_panel => _createSidePanel(jsProxy['side_panel']);
  set side_panel(SidePanel value) => jsProxy['side_panel'] = jsify(value);
}

/**
 * The options used when setting a side panel. Omitted properties are unchanged.
 */
class PanelOptions extends ChromeObject {
  PanelOptions({int? tabId, String? path, bool? enabled}) {
    if (tabId != null) this.tabId = tabId;
    if (path != null) this.path = path;
    if (enabled != null) this.enabled = enabled;
  }
  PanelOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;

  String get path => jsProxy['path'];
  set path(String value) => jsProxy['path'] = value;

  bool get enabled => jsProxy['enabled'];
  set enabled(bool value) => jsProxy['enabled'] = value;
}

/**
 * A dictionary containing the extension's options for how its side panel
 * behaves.
 */
class PanelBehavior extends ChromeObject {
  PanelBehavior({bool? openPanelOnActionClick}) {
    if (openPanelOnActionClick != null) this.openPanelOnActionClick = openPanelOnActionClick;
  }
  PanelBehavior.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  bool get openPanelOnActionClick => jsProxy['openPanelOnActionClick'];
  set openPanelOnActionClick(bool value) => jsProxy['openPanelOnActionClick'] = value;
}

class GetPanelOptions extends ChromeObject {
  GetPanelOptions({int? tabId}) {
    if (tabId != null) this.tabId = tabId;
  }
  GetPanelOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;
}

PanelOptions _createPanelOptions(JsObject jsProxy) => PanelOptions.fromProxy(jsProxy);
PanelBehavior _createPanelBehavior(JsObject jsProxy) => PanelBehavior.fromProxy(jsProxy);
SidePanel _createSidePanel(JsObject jsProxy) => SidePanel.fromProxy(jsProxy);
