import 'src/internal_helpers.dart';
import 'src/js/devtools_panels.dart' as $js;
export 'chrome.dart';

final _devtoolsPanels = ChromeDevtoolsPanels._();

extension ChromeDevtoolsPanelsExtension on Chrome {
  ChromeDevtoolsPanels get devtoolsPanels => _devtoolsPanels;
}

class ChromeDevtoolsPanels {
  ChromeDevtoolsPanels._();

  /// Creates an extension panel.
  void create(
    String title,
    String iconPath,
    String pagePath,
    JSAny? callback,
  ) =>
      throw UnimplementedError();

  /// Specifies the function to be called when the user clicks a resource link
  /// in the Developer Tools window. To unset the handler, either call the
  /// method with no parameters or pass null as the parameter.
  void setOpenResourceHandler(JSAny? callback) => throw UnimplementedError();

  /// Requests DevTools to open a URL in a Developer Tools panel.
  void openResource(
    String url,
    int lineNumber,
    int? columnNumber,
    JSAny? callback,
  ) =>
      throw UnimplementedError();

  /// Elements panel.
  ElementsPanel get elements => $js.chrome.devtoolsPanels.elements as dynamic;

  /// Sources panel.
  SourcesPanel get sources => $js.chrome.devtoolsPanels.sources as dynamic;

  /// The name of the color theme set in user's DevTools settings. Possible
  /// values: `default` (the default) and `dark`.
  String get themeName => $js.chrome.devtoolsPanels.themeName as dynamic;
}

class ElementsPanel {
  ElementsPanel.fromJS(this._wrapped);

  final $js.ElementsPanel _wrapped;

  $js.ElementsPanel get toJS => _wrapped;

  /// Creates a pane within panel's sidebar.
  void createSidebarPane(
    String title,
    JSAny? callback,
  ) =>
      throw UnimplementedError();

  /// Fired when an object is selected in the panel.
  Stream<void> get onSelectionChanged => throw UnimplementedError();
}

class SourcesPanel {
  SourcesPanel.fromJS(this._wrapped);

  final $js.SourcesPanel _wrapped;

  $js.SourcesPanel get toJS => _wrapped;

  /// Creates a pane within panel's sidebar.
  void createSidebarPane(
    String title,
    JSAny? callback,
  ) =>
      throw UnimplementedError();

  /// Fired when an object is selected in the panel.
  Stream<void> get onSelectionChanged => throw UnimplementedError();
}

class ExtensionPanel {
  ExtensionPanel.fromJS(this._wrapped);

  final $js.ExtensionPanel _wrapped;

  $js.ExtensionPanel get toJS => _wrapped;

  /// Appends a button to the status bar of the panel.
  Button createStatusBarButton(
    String iconPath,
    String tooltipText,
    bool disabled,
  ) =>
      throw UnimplementedError();

  /// Fired upon a search action (start of a new search, search result
  /// navigation, or search being canceled).
  Stream<ExtensionPanelOnSearchEvent> get onSearch =>
      throw UnimplementedError();

  /// Fired when the user switches to the panel.
  Stream<JSAny> get onShown => throw UnimplementedError();

  /// Fired when the user switches away from the panel.
  Stream<void> get onHidden => throw UnimplementedError();
}

class ExtensionSidebarPane {
  ExtensionSidebarPane.fromJS(this._wrapped);

  final $js.ExtensionSidebarPane _wrapped;

  $js.ExtensionSidebarPane get toJS => _wrapped;

  /// Sets the height of the sidebar.
  void setHeight(String height) => throw UnimplementedError();

  /// Sets an expression that is evaluated within the inspected page. The result
  /// is displayed in the sidebar pane.
  void setExpression(
    String expression,
    String? rootTitle,
    JSAny? callback,
  ) =>
      throw UnimplementedError();

  /// Sets a JSON-compliant object to be displayed in the sidebar pane.
  void setObject(
    String jsonObject,
    String? rootTitle,
    JSAny? callback,
  ) =>
      throw UnimplementedError();

  /// Sets an HTML page to be displayed in the sidebar pane.
  void setPage(String path) => throw UnimplementedError();

  /// Fired when the sidebar pane becomes visible as a result of user switching
  /// to the panel that hosts it.
  Stream<JSAny> get onShown => throw UnimplementedError();

  /// Fired when the sidebar pane becomes hidden as a result of the user
  /// switching away from the panel that hosts the sidebar pane.
  Stream<void> get onHidden => throw UnimplementedError();
}

class Button {
  Button.fromJS(this._wrapped);

  final $js.Button _wrapped;

  $js.Button get toJS => _wrapped;

  /// Updates the attributes of the button. If some of the arguments are omitted
  /// or `null`, the corresponding attributes are not updated.
  void update(
    String? iconPath,
    String? tooltipText,
    bool? disabled,
  ) =>
      throw UnimplementedError();

  /// Fired when the button is clicked.
  Stream<void> get onClicked => throw UnimplementedError();
}

class ExtensionPanelOnSearchEvent {
  ExtensionPanelOnSearchEvent({
    required this.action,
    required this.queryString,
  });

  /// Type of search action being performed.
  final String action;

  /// Query string (only for 'performSearch').
  final String? queryString;
}
