import 'devtools.dart';
import 'src/internal_helpers.dart';
import 'src/js/devtools_inspected_window.dart' as $js;

export 'devtools.dart' show ChromeDevtools, ChromeDevtoolsExtension;
export 'src/chrome.dart' show chrome;

final _devtoolsInspectedWindow = ChromeDevtoolsInspectedWindow._();

extension ChromeDevtoolsInspectedWindowExtension on ChromeDevtools {
  ChromeDevtoolsInspectedWindow get inspectedWindow => _devtoolsInspectedWindow;
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
    JSFunction? callback,
  ) {
    $js.chrome.devtools.inspectedWindow.eval(
      expression,
      options?.toJS,
      callback,
    );
  }

  /// Reloads the inspected page.
  void reload(ReloadOptions? reloadOptions) {
    $js.chrome.devtools.inspectedWindow.reload(reloadOptions?.toJS);
  }

  /// Retrieves the list of resources from the inspected page.
  void getResources(JSFunction callback) {
    $js.chrome.devtools.inspectedWindow.getResources(callback);
  }

  /// The ID of the tab being inspected. This ID may be used with chrome.tabs.*
  /// API.
  int get tabId => ($js.chrome.devtools.inspectedWindow.tabId as dynamic);

  /// Fired when a new resource is added to the inspected page.
  Stream<Resource> get onResourceAdded => throw UnimplementedError();

  /// Fired when a new revision of the resource is committed (e.g. user saves an
  /// edited version of the resource in the Developer Tools).
  Stream<OnResourceContentCommittedEvent> get onResourceContentCommitted =>
      throw UnimplementedError();
}

class Resource {
  Resource.fromJS(this._wrapped);

  Resource({required String url}) : _wrapped = $js.Resource()..url = url;

  final $js.Resource _wrapped;

  $js.Resource get toJS => _wrapped;

  /// The URL of the resource.
  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// Gets the content of the resource.
  void getContent(JSFunction callback) {
    _wrapped.getContent(callback);
  }

  /// Sets the content of the resource.
  void setContent(
    String content,
    bool commit,
    JSFunction? callback,
  ) {
    _wrapped.setContent(
      content,
      commit,
      callback,
    );
  }
}

class EvalOptions {
  EvalOptions.fromJS(this._wrapped);

  EvalOptions({
    String? frameURL,
    bool? useContentScriptContext,
    String? scriptExecutionContext,
  }) : _wrapped = $js.EvalOptions(
          frameURL: frameURL,
          useContentScriptContext: useContentScriptContext,
          scriptExecutionContext: scriptExecutionContext,
        );

  final $js.EvalOptions _wrapped;

  $js.EvalOptions get toJS => _wrapped;
}

class ReloadOptions {
  ReloadOptions.fromJS(this._wrapped);

  ReloadOptions({
    bool? ignoreCache,
    String? userAgent,
    String? injectedScript,
  }) : _wrapped = $js.ReloadOptions(
          ignoreCache: ignoreCache,
          userAgent: userAgent,
          injectedScript: injectedScript,
        );

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
