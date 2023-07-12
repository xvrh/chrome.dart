import 'src/internal_helpers.dart';
import 'src/js/side_panel.dart' as $js;
export 'chrome.dart';

final _sidePanel = ChromeSidePanel._();

extension ChromeSidePanelExtension on Chrome {
  ChromeSidePanel get sidePanel => _sidePanel;
}

class ChromeSidePanel {
  ChromeSidePanel._();

  /// Configures the side panel.
  /// |options|: The configuration options to apply to the panel.
  /// |callback|: Invoked when the options have been set.
  Future<void> setOptions(PanelOptions options) => throw UnimplementedError();

  /// Returns the active panel configuration.
  /// |options|: Specifies the context to return the configuration for.
  /// |callback|: Called with the active panel configuration.
  Future<PanelOptions> getOptions(GetPanelOptions options) =>
      throw UnimplementedError();

  /// Configures the extension's side panel behavior. This is an upsert
  /// operation.
  /// |behavior|: The new behavior to be set.
  /// |callback|: Called when the new behavior has been set.
  Future<void> setPanelBehavior(PanelBehavior behavior) =>
      throw UnimplementedError();

  /// Returns the extension's current side panel behavior.
  /// |callback|: Called with the extension's side panel behavior.
  Future<PanelBehavior> getPanelBehavior() => throw UnimplementedError();
}

class SidePanel {
  SidePanel.fromJS(this._wrapped);

  final $js.SidePanel _wrapped;

  $js.SidePanel get toJS => _wrapped;

  /// Developer specified path for side panel display.
  String get default_path => _wrapped.default_path;
  set default_path(String v) {
    throw UnimplementedError();
  }
}

class ManifestKeys {
  ManifestKeys.fromJS(this._wrapped);

  final $js.ManifestKeys _wrapped;

  $js.ManifestKeys get toJS => _wrapped;

  SidePanel get side_panel => SidePanel.fromJS(_wrapped.side_panel);
  set side_panel(SidePanel v) {
    throw UnimplementedError();
  }
}

class PanelOptions {
  PanelOptions.fromJS(this._wrapped);

  final $js.PanelOptions _wrapped;

  $js.PanelOptions get toJS => _wrapped;

  /// If specified, the side panel options will only apply to the tab with
  /// this id. If omitted, these options set the default behavior (used for any
  /// tab that doesn't have specific settings). Note: if the same path is set
  /// for this tabId and the default tabId, then the panel for this tabId will
  /// be a different instance than the panel for the default tabId.
  int? get tabId => _wrapped.tabId;
  set tabId(int? v) {
    throw UnimplementedError();
  }

  /// The path to the side panel HTML file to use. This must be a local
  /// resource within the extension package.
  String? get path => _wrapped.path;
  set path(String? v) {
    throw UnimplementedError();
  }

  /// Whether the side panel should be enabled. This is optional. The default
  /// value is true.
  bool? get enabled => _wrapped.enabled;
  set enabled(bool? v) {
    throw UnimplementedError();
  }
}

class PanelBehavior {
  PanelBehavior.fromJS(this._wrapped);

  final $js.PanelBehavior _wrapped;

  $js.PanelBehavior get toJS => _wrapped;

  /// Whether clicking the extension's icon will toggle showing the extension's
  /// entry in the side panel. Defaults to false.
  bool? get openPanelOnActionClick => _wrapped.openPanelOnActionClick;
  set openPanelOnActionClick(bool? v) {
    throw UnimplementedError();
  }
}

class GetPanelOptions {
  GetPanelOptions.fromJS(this._wrapped);

  final $js.GetPanelOptions _wrapped;

  $js.GetPanelOptions get toJS => _wrapped;

  /// If specified, the side panel options for the given tab will be returned.
  /// Otherwise, returns the default side panel options (used for any tab that
  /// doesn't have specific settings).
  int? get tabId => _wrapped.tabId;
  set tabId(int? v) {
    throw UnimplementedError();
  }
}
