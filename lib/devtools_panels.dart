import 'chrome.dart';
export 'chrome.dart';

final _devtoolsPanels = ChromeDevtoolsPanels._();

extension ChromeDevtoolsPanelsExtension on Chrome {
  ChromeDevtoolsPanels get devtoolsPanels => _devtoolsPanels;
}

class ChromeDevtoolsPanels {
  ChromeDevtoolsPanels._();

  /// Creates an extension panel.
  void create(
    title,
    iconPath,
    pagePath,
    callback,
  ) =>
      throw UnimplementedError();

  /// Specifies the function to be called when the user clicks a resource link
  /// in the Developer Tools window. To unset the handler, either call the
  /// method with no parameters or pass null as the parameter.
  void setOpenResourceHandler(callback) => throw UnimplementedError();

  /// Requests DevTools to open a URL in a Developer Tools panel.
  void openResource(
    url,
    lineNumber,
    columnNumber,
    callback,
  ) =>
      throw UnimplementedError();
}
