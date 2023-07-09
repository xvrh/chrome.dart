import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSidePanelExtension on JSChrome {
  ///  chrome.sidePanel API
  external JSSidePanel get SidePanel;
}

@JS()
@staticInterop
class JSSidePanel {}

extension JSSidePanelExtension on JSSidePanel {
  ///  Configures the side panel.
  ///  |options|: The configuration options to apply to the panel.
  ///  |callback|: Invoked when the options have been set.
  external void setOptions();

  ///  Returns the active panel configuration.
  ///  |options|: Specifies the context to return the configuration for.
  ///  |callback|: Called with the active panel configuration.
  external void getOptions();

  ///  Configures the extension's side panel behavior. This is an upsert
  ///  operation.
  ///  |behavior|: The new behavior to be set.
  ///  |callback|: Called when the new behavior has been set.
  external void setPanelBehavior();

  ///  Returns the extension's current side panel behavior.
  ///  |callback|: Called with the extension's side panel behavior.
  external void getPanelBehavior();
}
