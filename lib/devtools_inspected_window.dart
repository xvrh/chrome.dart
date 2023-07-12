import 'src/internal_helpers.dart';
import 'src/js/devtools_inspected_window.dart' as $js;
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
    String expression,
    EvalOptions? options,
    JSAny? callback,
  ) =>
      throw UnimplementedError();

  /// Reloads the inspected page.
  void reload(ReloadOptions? reloadOptions) => throw UnimplementedError();

  /// Retrieves the list of resources from the inspected page.
  void getResources(JSAny callback) => throw UnimplementedError();

  /// The ID of the tab being inspected. This ID may be used with chrome.tabs.*
  /// API.
  int get tabId => $js.chrome.devtoolsInspectedWindow.tabId as dynamic;

  /// Fired when a new resource is added to the inspected page.
  Stream<Resource> get onResourceAdded => throw UnimplementedError();

  /// Fired when a new revision of the resource is committed (e.g. user saves an
  /// edited version of the resource in the Developer Tools).
  Stream<OnResourceContentCommittedEvent> get onResourceContentCommitted =>
      throw UnimplementedError();
}

class Resource {
  Resource.fromJS(this._wrapped);

  final $js.Resource _wrapped;

  $js.Resource get toJS => _wrapped;

  /// The URL of the resource.
  String get url => _wrapped.url;
  set url(String v) {
    throw UnimplementedError();
  }

  /// Gets the content of the resource.
  void getContent(JSAny callback) => throw UnimplementedError();

  /// Sets the content of the resource.
  void setContent(
    String content,
    bool commit,
    JSAny? callback,
  ) =>
      throw UnimplementedError();
}

class EvalOptions {
  EvalOptions.fromJS(this._wrapped);

  final $js.EvalOptions _wrapped;

  $js.EvalOptions get toJS => _wrapped;
}

class ReloadOptions {
  ReloadOptions.fromJS(this._wrapped);

  final $js.ReloadOptions _wrapped;

  $js.ReloadOptions get toJS => _wrapped;
}

class OnResourceContentCommittedEvent {
  OnResourceContentCommittedEvent({
    required this.resource,
    required this.content,
  });

  final Resource resource;

  /// New content of the resource.
  final String content;
}
