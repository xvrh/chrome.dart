import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDevtoolsPanelsExtension on JSChrome {
  /// Use the `chrome.devtools.panels` API to integrate your extension into
  /// Developer Tools window UI: create your own panels, access existing panels,
  /// and add sidebars.
  external JSDevtoolsPanels get devtoolsPanels;
}

@JS()
@staticInterop
class JSDevtoolsPanels {}

extension JSDevtoolsPanelsExtension on JSDevtoolsPanels {
  /// Creates an extension panel.
  external void create(
    String title,
    String iconPath,
    String pagePath,
    JSFunction callback,
  );

  /// Specifies the function to be called when the user clicks a resource link
  /// in the Developer Tools window. To unset the handler, either call the
  /// method with no parameters or pass null as the parameter.
  external void setOpenResourceHandler(JSFunction callback);

  /// Requests DevTools to open a URL in a Developer Tools panel.
  external void openResource(
    String url,
    int lineNumber,
    int columnNumber,
    JSFunction callback,
  );
}

@JS()
@staticInterop
class ElementsPanel {}

extension ElementsPanelExtension on ElementsPanel {}

@JS()
@staticInterop
class SourcesPanel {}

extension SourcesPanelExtension on SourcesPanel {}

@JS()
@staticInterop
class ExtensionPanel {}

extension ExtensionPanelExtension on ExtensionPanel {}

@JS()
@staticInterop
class ExtensionSidebarPane {}

extension ExtensionSidebarPaneExtension on ExtensionSidebarPane {}

@JS()
@staticInterop
class Button {}

extension ButtonExtension on Button {}
