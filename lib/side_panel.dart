import 'chrome.dart';
export 'chrome.dart';

final _sidePanel = ChromeSidePanel._();

extension ChromeChromeSidePanelExtension on Chrome {
  ChromeSidePanel get sidePanel => _sidePanel;
}

class ChromeSidePanel {
  ChromeSidePanel._();

  /// Configures the side panel.
  /// |options|: The configuration options to apply to the panel.
  /// |callback|: Invoked when the options have been set.
  void setOptions(options) => throw UnimplementedError();

  /// Returns the active panel configuration.
  /// |options|: Specifies the context to return the configuration for.
  /// |callback|: Called with the active panel configuration.
  void getOptions(options) => throw UnimplementedError();

  /// Configures the extension's side panel behavior. This is an upsert
  /// operation.
  /// |behavior|: The new behavior to be set.
  /// |callback|: Called when the new behavior has been set.
  void setPanelBehavior(behavior) => throw UnimplementedError();

  /// Returns the extension's current side panel behavior.
  /// |callback|: Called with the extension's side panel behavior.
  void getPanelBehavior() => throw UnimplementedError();
}
