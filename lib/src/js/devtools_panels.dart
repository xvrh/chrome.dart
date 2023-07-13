import 'dart:js_interop';

import 'chrome.dart';
import 'devtools.dart';

export 'chrome.dart';
export 'devtools.dart';

extension JSChromeJSDevtoolsPanelsExtension on JSChromeDevtools {
  /// Use the `chrome.devtools.panels` API to integrate your extension into
  /// Developer Tools window UI: create your own panels, access existing panels,
  /// and add sidebars.
  external JSDevtoolsPanels get panels;
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
    JFFunction? callback,
  );

  /// Specifies the function to be called when the user clicks a resource link
  /// in the Developer Tools window. To unset the handler, either call the
  /// method with no parameters or pass null as the parameter.
  external void setOpenResourceHandler(JFFunction? callback);

  /// Requests DevTools to open a URL in a Developer Tools panel.
  external void openResource(
    String url,
    int lineNumber,
    int? columnNumber,
    JFFunction? callback,
  );

  /// Elements panel.
  external ElementsPanel get elements;

  /// Sources panel.
  external SourcesPanel get sources;

  /// The name of the color theme set in user's DevTools settings. Possible
  /// values: `default` (the default) and `dark`.
  external String get themeName;
}

@JS()
@staticInterop
class ElementsPanel {}

extension ElementsPanelExtension on ElementsPanel {
  /// Creates a pane within panel's sidebar.
  external void createSidebarPane(
    String title,
    JFFunction? callback,
  );

  /// Fired when an object is selected in the panel.
  external ChromeEvent get onSelectionChanged;
}

@JS()
@staticInterop
class SourcesPanel {}

extension SourcesPanelExtension on SourcesPanel {
  /// Creates a pane within panel's sidebar.
  external void createSidebarPane(
    String title,
    JFFunction? callback,
  );

  /// Fired when an object is selected in the panel.
  external ChromeEvent get onSelectionChanged;
}

@JS()
@staticInterop
class ExtensionPanel {}

extension ExtensionPanelExtension on ExtensionPanel {
  /// Appends a button to the status bar of the panel.
  external Button createStatusBarButton(
    String iconPath,
    String tooltipText,
    bool disabled,
  );

  /// Fired upon a search action (start of a new search, search result
  /// navigation, or search being canceled).
  external ChromeEvent get onSearch;

  /// Fired when the user switches to the panel.
  external ChromeEvent get onShown;

  /// Fired when the user switches away from the panel.
  external ChromeEvent get onHidden;
}

@JS()
@staticInterop
class ExtensionSidebarPane {}

extension ExtensionSidebarPaneExtension on ExtensionSidebarPane {
  /// Sets the height of the sidebar.
  external void setHeight(String height);

  /// Sets an expression that is evaluated within the inspected page. The result
  /// is displayed in the sidebar pane.
  external void setExpression(
    String expression,
    String? rootTitle,
    JFFunction? callback,
  );

  /// Sets a JSON-compliant object to be displayed in the sidebar pane.
  external void setObject(
    String jsonObject,
    String? rootTitle,
    JFFunction? callback,
  );

  /// Sets an HTML page to be displayed in the sidebar pane.
  external void setPage(String path);

  /// Fired when the sidebar pane becomes visible as a result of user switching
  /// to the panel that hosts it.
  external ChromeEvent get onShown;

  /// Fired when the sidebar pane becomes hidden as a result of the user
  /// switching away from the panel that hosts the sidebar pane.
  external ChromeEvent get onHidden;
}

@JS()
@staticInterop
class Button {}

extension ButtonExtension on Button {
  /// Updates the attributes of the button. If some of the arguments are omitted
  /// or `null`, the corresponding attributes are not updated.
  external void update(
    String? iconPath,
    String? tooltipText,
    bool? disabled,
  );

  /// Fired when the button is clicked.
  external ChromeEvent get onClicked;
}
