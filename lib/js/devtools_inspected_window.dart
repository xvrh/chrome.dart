import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDevtoolsInspectedWindowExtension on JSChrome {
  /// Use the `chrome.devtools.inspectedWindow` API to interact with the
  /// inspected window: obtain the tab ID for the inspected page, evaluate the
  /// code in the context of the inspected window, reload the page, or obtain
  /// the list of resources within the page.
  external JSDevtoolsInspectedWindow get devtoolsInspectedWindow;
}

@JS()
@staticInterop
class JSDevtoolsInspectedWindow {}

extension JSDevtoolsInspectedWindowExtension on JSDevtoolsInspectedWindow {
  /// Evaluates a JavaScript expression in the context of the main frame of the
  /// inspected page. The expression must evaluate to a JSON-compliant object,
  /// otherwise an exception is thrown. The eval function can report either a
  /// DevTools-side error or a JavaScript exception that occurs during
  /// evaluation. In either case, the `result` parameter of the callback is
  /// `undefined`. In the case of a DevTools-side error, the `isException`
  /// parameter is non-null and has `isError` set to true and `code` set to an
  /// error code. In the case of a JavaScript error, `isException` is set to
  /// true and `value` is set to the string value of thrown object.
  external void eval(
    expression,
    options,
    callback,
  );

  /// Reloads the inspected page.
  external void reload(reloadOptions);

  /// Retrieves the list of resources from the inspected page.
  external void getResources(callback);

  /// Fired when a new resource is added to the inspected page.
  external ChromeEvent get onResourceAdded;

  /// Fired when a new revision of the resource is committed (e.g. user saves an
  /// edited version of the resource in the Developer Tools).
  external ChromeEvent get onResourceContentCommitted;
}

@JS()
@staticInterop
class Resource {
  /// The URL of the resource.
  external String get url;
}
