import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDevtoolsPanelsExtension on JSChrome {
  /// Use the `chrome.devtools.panels` API to integrate your extension into
  /// Developer Tools window UI: create your own panels, access existing panels,
  /// and add sidebars.
  external JSDevtoolsPanels get DevtoolsPanels;
}

@JS()
@staticInterop
class JSDevtoolsPanels {}

extension JSDevtoolsPanelsExtension on JSDevtoolsPanels {
  /// Creates an extension panel.
  external void create();

  /// Specifies the function to be called when the user clicks a resource link
  /// in the Developer Tools window. To unset the handler, either call the
  /// method with no parameters or pass null as the parameter.
  external void setOpenResourceHandler();

  /// Requests DevTools to open a URL in a Developer Tools panel.
  external void openResource();
}
