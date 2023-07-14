import 'devtools.dart';
import 'src/internal_helpers.dart';
import 'src/js/devtools_panels.dart' as $js;

export 'devtools.dart' show ChromeDevtools, ChromeDevtoolsExtension;
export 'src/chrome.dart' show chrome;

final _devtoolsPanels = ChromeDevtoolsPanels._();

extension ChromeDevtoolsPanelsExtension on ChromeDevtools {
  ChromeDevtoolsPanels get panels => _devtoolsPanels;
}

class ChromeDevtoolsPanels {
  ChromeDevtoolsPanels._();

  /// Creates an extension panel.
  void create(
    String title,
    String iconPath,
    String pagePath,
    JSFunction? callback,
  ) {
    $js.chrome.devtools.panels.create(
      title,
      iconPath,
      pagePath,
      callback,
    );
  }

  /// Specifies the function to be called when the user clicks a resource link
  /// in the Developer Tools window. To unset the handler, either call the
  /// method with no parameters or pass null as the parameter.
  void setOpenResourceHandler(JSFunction? callback) {
    $js.chrome.devtools.panels.setOpenResourceHandler(callback);
  }

  /// Requests DevTools to open a URL in a Developer Tools panel.
  void openResource(
    String url,
    int lineNumber,
    int? columnNumber,
    JSFunction? callback,
  ) {
    $js.chrome.devtools.panels.openResource(
      url,
      lineNumber,
      columnNumber,
      callback,
    );
  }

  /// Elements panel.
  ElementsPanel get elements =>
      ($js.chrome.devtools.panels.elements as dynamic);

  /// Sources panel.
  SourcesPanel get sources => ($js.chrome.devtools.panels.sources as dynamic);

  /// The name of the color theme set in user's DevTools settings. Possible
  /// values: `default` (the default) and `dark`.
  String get themeName => ($js.chrome.devtools.panels.themeName as dynamic);
}

class ElementsPanel {
  ElementsPanel.fromJS(this._wrapped);

  ElementsPanel() : _wrapped = $js.ElementsPanel();

  final $js.ElementsPanel _wrapped;

  $js.ElementsPanel get toJS => _wrapped;

  /// Creates a pane within panel's sidebar.
  void createSidebarPane(
    String title,
    JSFunction? callback,
  ) {
    _wrapped.createSidebarPane(
      title,
      callback,
    );
  }

  /// Fired when an object is selected in the panel.
  Stream<void> get onSelectionChanged => throw UnimplementedError();
}

class SourcesPanel {
  SourcesPanel.fromJS(this._wrapped);

  SourcesPanel() : _wrapped = $js.SourcesPanel();

  final $js.SourcesPanel _wrapped;

  $js.SourcesPanel get toJS => _wrapped;

  /// Creates a pane within panel's sidebar.
  void createSidebarPane(
    String title,
    JSFunction? callback,
  ) {
    _wrapped.createSidebarPane(
      title,
      callback,
    );
  }

  /// Fired when an object is selected in the panel.
  Stream<void> get onSelectionChanged => throw UnimplementedError();
}

class ExtensionPanel {
  ExtensionPanel.fromJS(this._wrapped);

  ExtensionPanel() : _wrapped = $js.ExtensionPanel();

  final $js.ExtensionPanel _wrapped;

  $js.ExtensionPanel get toJS => _wrapped;

  /// Appends a button to the status bar of the panel.
  Button createStatusBarButton(
    String iconPath,
    String tooltipText,
    bool disabled,
  ) {
    return Button.fromJS(_wrapped.createStatusBarButton(
      iconPath,
      tooltipText,
      disabled,
    ));
  }

  /// Fired upon a search action (start of a new search, search result
  /// navigation, or search being canceled).
  Stream<ExtensionPanelOnSearchEvent> get onSearch =>
      throw UnimplementedError();

  /// Fired when the user switches to the panel.
  Stream<Object> get onShown => throw UnimplementedError();

  /// Fired when the user switches away from the panel.
  Stream<void> get onHidden => throw UnimplementedError();
}

class ExtensionSidebarPane {
  ExtensionSidebarPane.fromJS(this._wrapped);

  ExtensionSidebarPane() : _wrapped = $js.ExtensionSidebarPane();

  final $js.ExtensionSidebarPane _wrapped;

  $js.ExtensionSidebarPane get toJS => _wrapped;

  /// Sets the height of the sidebar.
  void setHeight(String height) {
    _wrapped.setHeight(height);
  }

  /// Sets an expression that is evaluated within the inspected page. The result
  /// is displayed in the sidebar pane.
  void setExpression(
    String expression,
    String? rootTitle,
    JSFunction? callback,
  ) {
    _wrapped.setExpression(
      expression,
      rootTitle,
      callback,
    );
  }

  /// Sets a JSON-compliant object to be displayed in the sidebar pane.
  void setObject(
    String jsonObject,
    String? rootTitle,
    JSFunction? callback,
  ) {
    _wrapped.setObject(
      jsonObject,
      rootTitle,
      callback,
    );
  }

  /// Sets an HTML page to be displayed in the sidebar pane.
  void setPage(String path) {
    _wrapped.setPage(path);
  }

  /// Fired when the sidebar pane becomes visible as a result of user switching
  /// to the panel that hosts it.
  Stream<Object> get onShown => throw UnimplementedError();

  /// Fired when the sidebar pane becomes hidden as a result of the user
  /// switching away from the panel that hosts the sidebar pane.
  Stream<void> get onHidden => throw UnimplementedError();
}

class Button {
  Button.fromJS(this._wrapped);

  Button() : _wrapped = $js.Button();

  final $js.Button _wrapped;

  $js.Button get toJS => _wrapped;

  /// Updates the attributes of the button. If some of the arguments are omitted
  /// or `null`, the corresponding attributes are not updated.
  void update(
    String? iconPath,
    String? tooltipText,
    bool? disabled,
  ) {
    _wrapped.update(
      iconPath,
      tooltipText,
      disabled,
    );
  }

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
