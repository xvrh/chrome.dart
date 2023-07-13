import 'src/internal_helpers.dart';
import 'src/js/side_panel.dart' as $js;

export 'src/chrome.dart' show chrome;

final _sidePanel = ChromeSidePanel._();

extension ChromeSidePanelExtension on Chrome {
  ChromeSidePanel get sidePanel => _sidePanel;
}

class ChromeSidePanel {
  ChromeSidePanel._();

  /// Configures the side panel.
  /// |options|: The configuration options to apply to the panel.
  /// |callback|: Invoked when the options have been set.
  Future<void> setOptions(PanelOptions options) {
    var $completer = Completer<void>();
    $js.chrome.sidePanel.setOptions(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Returns the active panel configuration.
  /// |options|: Specifies the context to return the configuration for.
  /// |callback|: Called with the active panel configuration.
  Future<PanelOptions> getOptions(GetPanelOptions options) {
    var $completer = Completer<PanelOptions>();
    $js.chrome.sidePanel.getOptions(
      options.toJS,
      ($js.PanelOptions options) {
        $completer.complete(PanelOptions.fromJS(options));
      }.toJS,
    );
    return $completer.future;
  }

  /// Configures the extension's side panel behavior. This is an upsert
  /// operation.
  /// |behavior|: The new behavior to be set.
  /// |callback|: Called when the new behavior has been set.
  Future<void> setPanelBehavior(PanelBehavior behavior) {
    var $completer = Completer<void>();
    $js.chrome.sidePanel.setPanelBehavior(
      behavior.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Returns the extension's current side panel behavior.
  /// |callback|: Called with the extension's side panel behavior.
  Future<PanelBehavior> getPanelBehavior() {
    var $completer = Completer<PanelBehavior>();
    $js.chrome.sidePanel.getPanelBehavior(($js.PanelBehavior behavior) {
      $completer.complete(PanelBehavior.fromJS(behavior));
    }.toJS);
    return $completer.future;
  }
}

class SidePanel {
  SidePanel.fromJS(this._wrapped);

  SidePanel({required String default_path})
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
    int? tabId,
    String? path,
    bool? enabled,
  }) : _wrapped = $js.PanelOptions()
          ..tabId = tabId
          ..path = path
          ..enabled = enabled;

  final $js.PanelOptions _wrapped;

  $js.PanelOptions get toJS => _wrapped;

  /// If specified, the side panel options will only apply to the tab with
  /// this id. If omitted, these options set the default behavior (used for any
  /// tab that doesn't have specific settings). Note: if the same path is set
  /// for this tabId and the default tabId, then the panel for this tabId will
  /// be a different instance than the panel for the default tabId.
  int? get tabId => _wrapped.tabId;
  set tabId(int? v) {
    _wrapped.tabId = v;
  }

  /// The path to the side panel HTML file to use. This must be a local
  /// resource within the extension package.
  String? get path => _wrapped.path;
  set path(String? v) {
    _wrapped.path = v;
  }

  /// Whether the side panel should be enabled. This is optional. The default
  /// value is true.
  bool? get enabled => _wrapped.enabled;
  set enabled(bool? v) {
    _wrapped.enabled = v;
  }
}

class PanelBehavior {
  PanelBehavior.fromJS(this._wrapped);

  PanelBehavior({bool? openPanelOnActionClick})
      : _wrapped = $js.PanelBehavior()
          ..openPanelOnActionClick = openPanelOnActionClick;

  final $js.PanelBehavior _wrapped;

  $js.PanelBehavior get toJS => _wrapped;

  /// Whether clicking the extension's icon will toggle showing the extension's
  /// entry in the side panel. Defaults to false.
  bool? get openPanelOnActionClick => _wrapped.openPanelOnActionClick;
  set openPanelOnActionClick(bool? v) {
    _wrapped.openPanelOnActionClick = v;
  }
}

class GetPanelOptions {
  GetPanelOptions.fromJS(this._wrapped);

  GetPanelOptions({int? tabId})
      : _wrapped = $js.GetPanelOptions()..tabId = tabId;

  final $js.GetPanelOptions _wrapped;

  $js.GetPanelOptions get toJS => _wrapped;

  /// If specified, the side panel options for the given tab will be returned.
  /// Otherwise, returns the default side panel options (used for any tab that
  /// doesn't have specific settings).
  int? get tabId => _wrapped.tabId;
  set tabId(int? v) {
    _wrapped.tabId = v;
  }
}
