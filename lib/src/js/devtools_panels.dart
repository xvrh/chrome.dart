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
    JSString title,
    JSString iconPath,
    JSString pagePath,
    JSFunction? callback,
  );

  /// Specifies the function to be called when the user clicks a resource link
  /// in the Developer Tools window. To unset the handler, either call the
  /// method with no parameters or pass null as the parameter.
  external void setOpenResourceHandler(JSFunction? callback);

  /// Requests DevTools to open a URL in a Developer Tools panel.
  external void openResource(
    JSString url,
    JSNumber lineNumber,
    JSNumber? columnNumber,
    JSFunction? callback,
  );

  /// Elements panel.
  external ElementsPanel get elements;

  /// Sources panel.
  external SourcesPanel get sources;

  /// The name of the color theme set in user's DevTools settings. Possible
  /// values: `default` (the default) and `dark`.
  external JSString get themeName;
}

@JS()
@staticInterop
class ElementsPanel {}

extension ElementsPanelExtension on ElementsPanel {
  /// Creates a pane within panel's sidebar.
  external void createSidebarPane(
    JSString title,
    JSFunction? callback,
  );
}

@JS()
@staticInterop
class SourcesPanel {}

extension SourcesPanelExtension on SourcesPanel {
  /// Creates a pane within panel's sidebar.
  external void createSidebarPane(
    JSString title,
    JSFunction? callback,
  );
}

@JS()
@staticInterop
class ExtensionPanel {}

extension ExtensionPanelExtension on ExtensionPanel {
  /// Appends a button to the status bar of the panel.
  external Button createStatusBarButton(
    JSString iconPath,
    JSString tooltipText,
    JSBoolean disabled,
  );
}

@JS()
@staticInterop
class ExtensionSidebarPane {}

extension ExtensionSidebarPaneExtension on ExtensionSidebarPane {
  /// Sets the height of the sidebar.
  external void setHeight(JSString height);

  /// Sets an expression that is evaluated within the inspected page. The result
  /// is displayed in the sidebar pane.
  external void setExpression(
    JSString expression,
    JSString? rootTitle,
    JSFunction? callback,
  );

  /// Sets a JSON-compliant object to be displayed in the sidebar pane.
  external void setObject(
    JSString jsonObject,
    JSString? rootTitle,
    JSFunction? callback,
  );

  /// Sets an HTML page to be displayed in the sidebar pane.
  external void setPage(JSString path);
}

@JS()
@staticInterop
class Button {}

extension ButtonExtension on Button {
  /// Updates the attributes of the button. If some of the arguments are omitted
  /// or `null`, the corresponding attributes are not updated.
  external void update(
    JSString? iconPath,
    JSString? tooltipText,
    JSBoolean? disabled,
  );
}
