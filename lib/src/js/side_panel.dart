import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSidePanelExtension on JSChrome {
  /// chrome.sidePanel API
  external JSSidePanel get sidePanel;
}

@JS()
@staticInterop
class JSSidePanel {}

extension JSSidePanelExtension on JSSidePanel {
  /// Configures the side panel.
  /// |options|: The configuration options to apply to the panel.
  /// |callback|: Invoked when the options have been set.
  external void setOptions(
    PanelOptions options,
    JSFunction callback,
  );

  /// Returns the active panel configuration.
  /// |options|: Specifies the context to return the configuration for.
  /// |callback|: Called with the active panel configuration.
  external void getOptions(
    GetPanelOptions options,
    JSFunction callback,
  );

  /// Configures the extension's side panel behavior. This is an upsert
  /// operation.
  /// |behavior|: The new behavior to be set.
  /// |callback|: Called when the new behavior has been set.
  external void setPanelBehavior(
    PanelBehavior behavior,
    JSFunction callback,
  );

  /// Returns the extension's current side panel behavior.
  /// |callback|: Called with the extension's side panel behavior.
  external void getPanelBehavior(JSFunction callback);
}

@JS()
@staticInterop
class SidePanel {}

extension SidePanelExtension on SidePanel {
  /// Developer specified path for side panel display.
  external String get default_path;
}

@JS()
@staticInterop
class ManifestKeys {}

extension ManifestKeysExtension on ManifestKeys {
  external SidePanel get side_panel;
}

@JS()
@staticInterop
class PanelOptions {}

extension PanelOptionsExtension on PanelOptions {
  /// If specified, the side panel options will only apply to the tab with
  /// this id. If omitted, these options set the default behavior (used for any
  /// tab that doesn't have specific settings). Note: if the same path is set
  /// for this tabId and the default tabId, then the panel for this tabId will
  /// be a different instance than the panel for the default tabId.
  external int? get tabId;

  /// The path to the side panel HTML file to use. This must be a local
  /// resource within the extension package.
  external String? get path;

  /// Whether the side panel should be enabled. This is optional. The default
  /// value is true.
  external bool? get enabled;
}

@JS()
@staticInterop
class PanelBehavior {}

extension PanelBehaviorExtension on PanelBehavior {
  /// Whether clicking the extension's icon will toggle showing the extension's
  /// entry in the side panel. Defaults to false.
  external bool? get openPanelOnActionClick;
}

@JS()
@staticInterop
class GetPanelOptions {}

extension GetPanelOptionsExtension on GetPanelOptions {
  /// If specified, the side panel options for the given tab will be returned.
  /// Otherwise, returns the default side panel options (used for any tab that
  /// doesn't have specific settings).
  external int? get tabId;
}
