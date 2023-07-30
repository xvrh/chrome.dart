import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/side_panel.dart' as $js;

export 'src/chrome.dart' show chrome;

final _sidePanel = ChromeSidePanel._();

extension ChromeSidePanelExtension on Chrome {
  /// chrome.sidePanel API
  ChromeSidePanel get sidePanel => _sidePanel;
}

class ChromeSidePanel {
  ChromeSidePanel._();

  bool get isAvailable => $js.chrome.sidePanelNullable != null;

  /// Configures the side panel.
  /// |options|: The configuration options to apply to the panel.
  /// |callback|: Invoked when the options have been set.
  Future<void> setOptions(PanelOptions options) async {
    await promiseToFuture<void>($js.chrome.sidePanel.setOptions(options.toJS));
  }

  /// Returns the active panel configuration.
  /// |options|: Specifies the context to return the configuration for.
  /// |callback|: Called with the active panel configuration.
  Future<PanelOptions> getOptions(GetPanelOptions options) async {
    var $res = await promiseToFuture<$js.PanelOptions>(
        $js.chrome.sidePanel.getOptions(options.toJS));
    return PanelOptions.fromJS($res);
  }

  /// Configures the extension's side panel behavior. This is an upsert
  /// operation.
  /// |behavior|: The new behavior to be set.
  /// |callback|: Called when the new behavior has been set.
  Future<void> setPanelBehavior(PanelBehavior behavior) async {
    await promiseToFuture<void>(
        $js.chrome.sidePanel.setPanelBehavior(behavior.toJS));
  }

  /// Returns the extension's current side panel behavior.
  /// |callback|: Called with the extension's side panel behavior.
  Future<PanelBehavior> getPanelBehavior() async {
    var $res = await promiseToFuture<$js.PanelBehavior>(
        $js.chrome.sidePanel.getPanelBehavior());
    return PanelBehavior.fromJS($res);
  }
}

class SidePanel {
  SidePanel.fromJS(this._wrapped);

  SidePanel(
      {
      /// Developer specified path for side panel display.
      required String default_path})
      : _wrapped = $js.SidePanel()..default_path = default_path;

  final $js.SidePanel _wrapped;

  $js.SidePanel get toJS => _wrapped;

  /// Developer specified path for side panel display.
  String get default_path => _wrapped.default_path;
  set default_path(String v) {
    _wrapped.default_path = v;
  }
}

class ManifestKeys {
  ManifestKeys.fromJS(this._wrapped);

  ManifestKeys({required SidePanel side_panel})
      : _wrapped = $js.ManifestKeys()..side_panel = side_panel.toJS;

  final $js.ManifestKeys _wrapped;

  $js.ManifestKeys get toJS => _wrapped;

  SidePanel get side_panel => SidePanel.fromJS(_wrapped.side_panel);
  set side_panel(SidePanel v) {
    _wrapped.side_panel = v.toJS;
  }
}

class PanelOptions {
  PanelOptions.fromJS(this._wrapped);

  PanelOptions({
    /// If specified, the side panel options will only apply to the tab with
    /// this id. If omitted, these options set the default behavior (used for
    /// any
    /// tab that doesn't have specific settings). Note: if the same path is set
    /// for this tabId and the default tabId, then the panel for this tabId will
    /// be a different instance than the panel for the default tabId.
    int? tabId,

    /// The path to the side panel HTML file to use. This must be a local
    /// resource within the extension package.
    String? path,

    /// Whether the side panel should be enabled. This is optional. The default
    /// value is true.
    bool? enabled,
  }) : _wrapped = $js.PanelOptions(
          tabId: tabId,
          path: path,
          enabled: enabled,
        );

  final $js.PanelOptions _wrapped;

  $js.PanelOptions get toJS => _wrapped;
}

class PanelBehavior {
  PanelBehavior.fromJS(this._wrapped);

  PanelBehavior(
      {
      /// Whether clicking the extension's icon will toggle showing the
      /// extension's
      /// entry in the side panel. Defaults to false.
      bool? openPanelOnActionClick})
      : _wrapped =
            $js.PanelBehavior(openPanelOnActionClick: openPanelOnActionClick);

  final $js.PanelBehavior _wrapped;

  $js.PanelBehavior get toJS => _wrapped;
}

class GetPanelOptions {
  GetPanelOptions.fromJS(this._wrapped);

  GetPanelOptions(
      {
      /// If specified, the side panel options for the given tab will be returned.
      /// Otherwise, returns the default side panel options (used for any tab that
      /// doesn't have specific settings).
      int? tabId})
      : _wrapped = $js.GetPanelOptions(tabId: tabId);

  final $js.GetPanelOptions _wrapped;

  $js.GetPanelOptions get toJS => _wrapped;
}
