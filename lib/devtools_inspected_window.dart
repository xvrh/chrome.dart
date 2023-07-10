import 'chrome.dart';
export 'chrome.dart';

final _devtoolsInspectedWindow = ChromeDevtoolsInspectedWindow._();

extension ChromeDevtoolsInspectedWindowExtension on Chrome {
  ChromeDevtoolsInspectedWindow get devtoolsInspectedWindow =>
      _devtoolsInspectedWindow;
}

class ChromeDevtoolsInspectedWindow {
  ChromeDevtoolsInspectedWindow._();

  /// Evaluates a JavaScript expression in the context of the main frame of the
  /// inspected page. The expression must evaluate to a JSON-compliant object,
  /// otherwise an exception is thrown. The eval function can report either a
  /// DevTools-side error or a JavaScript exception that occurs during
  /// evaluation. In either case, the `result` parameter of the callback is
  /// `undefined`. In the case of a DevTools-side error, the `isException`
  /// parameter is non-null and has `isError` set to true and `code` set to an
  /// error code. In the case of a JavaScript error, `isException` is set to
  /// true and `value` is set to the string value of thrown object.
  void eval(
    expression,
    options,
    callback,
  ) =>
      throw UnimplementedError();

  /// Reloads the inspected page.
  void reload(reloadOptions) => throw UnimplementedError();

  /// Retrieves the list of resources from the inspected page.
  void getResources(callback) => throw UnimplementedError();

  /// Fired when a new resource is added to the inspected page.
  Stream get onResourceAdded => throw UnimplementedError();

  /// Fired when a new revision of the resource is committed (e.g. user saves an
  /// edited version of the resource in the Developer Tools).
  Stream get onResourceContentCommitted => throw UnimplementedError();
}
