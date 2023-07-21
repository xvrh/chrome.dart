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

  bool get isAvailable =>
      $js.chrome.devtoolsNullable?.inspectedWindowNullable != null;

  /// Evaluates a JavaScript expression in the context of the main frame of the
  /// inspected page. The expression must evaluate to a JSON-compliant object,
  /// otherwise an exception is thrown. The eval function can report either a
  /// DevTools-side error or a JavaScript exception that occurs during
  /// evaluation. In either case, the `result` parameter of the callback is
  /// `undefined`. In the case of a DevTools-side error, the `isException`
  /// parameter is non-null and has `isError` set to true and `code` set to an
  /// error code. In the case of a JavaScript error, `isException` is set to
  /// true and `value` is set to the string value of thrown object.
  /// [expression] An expression to evaluate.
  /// [options] The options parameter can contain one or more options.
  Future<EvalResult> eval(
    String expression,
    EvalOptions? options,
  ) {
    var $completer = Completer<EvalResult>();
    $js.chrome.devtools.inspectedWindow.eval(
      expression,
      options?.toJS,
      (
        JSObject result,
        $js.EvalExceptionInfo exceptionInfo,
      ) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete(EvalResult(
            result: (result.dartify() as Map),
            exceptionInfo: EvalExceptionInfo.fromJS(exceptionInfo),
          ));
        }
      }.toJS,
    );
    return $completer.future;
  }

  /// Reloads the inspected page.
  void reload(ReloadOptions? reloadOptions) {
    $js.chrome.devtools.inspectedWindow.reload(reloadOptions?.toJS);
  }

  /// Retrieves the list of resources from the inspected page.
  Future<List<Resource>> getResources() {
    var $completer = Completer<List<Resource>>();
    $js.chrome.devtools.inspectedWindow.getResources((JSArray resources) {
      if (checkRuntimeLastError($completer)) {
        $completer.complete(resources.toDart
            .cast<$js.Resource>()
            .map((e) => Resource.fromJS(e))
            .toList());
      }
    }.toJS);
    return $completer.future;
  }

  /// The ID of the tab being inspected. This ID may be used with chrome.tabs.*
  /// API.
  int get tabId => $js.chrome.devtools.inspectedWindow.tabId;

  /// Fired when a new resource is added to the inspected page.
  Stream<Resource> get onResourceAdded =>
      $js.chrome.devtools.inspectedWindow.onResourceAdded
          .asStream(($c) => ($js.Resource resource) {
                $c.add(Resource.fromJS(resource));
              }.toJS);

  /// Fired when a new revision of the resource is committed (e.g. user saves an
  /// edited version of the resource in the Developer Tools).
  Stream<OnResourceContentCommittedEvent> get onResourceContentCommitted =>
      $js.chrome.devtools.inspectedWindow.onResourceContentCommitted
          .asStream(($c) => (
                $js.Resource resource,
                String content,
              ) {
                $c.add(OnResourceContentCommittedEvent(
                  resource: Resource.fromJS(resource),
                  content: content,
                ));
              }.toJS);
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
  Future<GetContentResult> getContent() {
    var $completer = Completer<GetContentResult>();
    _wrapped.getContent((
      String content,
      String encoding,
    ) {
      if (checkRuntimeLastError($completer)) {
        $completer.complete(GetContentResult(
          content: content,
          encoding: encoding,
        ));
      }
    }.toJS);
    return $completer.future;
  }

  /// Sets the content of the resource.
  /// [content] New content of the resource. Only resources with the text type
  /// are currently supported.
  /// [commit] True if the user has finished editing the resource, and the new
  /// content of the resource should be persisted; false if this is a minor
  /// change sent in progress of the user editing the resource.
  Future<Map?> setContent(
    String content,
    bool commit,
  ) {
    var $completer = Completer<Map?>();
    _wrapped.setContent(
      content,
      commit,
      (JSObject? error) {
        if (checkRuntimeLastError($completer)) {
          $completer.complete((error?.dartify() as Map?));
        }
      }.toJS,
    );
    return $completer.future;
  }
}

class EvalExceptionInfo {
  EvalExceptionInfo.fromJS(this._wrapped);

  EvalExceptionInfo({
    required bool isError,
    required String code,
    required String description,
    required List<Object> details,
    required bool isException,
    required String value,
  }) : _wrapped = $js.EvalExceptionInfo()
          ..isError = isError
          ..code = code
          ..description = description
          ..details = details.toJSArray((e) => e.toJS)
          ..isException = isException
          ..value = value;

  final $js.EvalExceptionInfo _wrapped;

  $js.EvalExceptionInfo get toJS => _wrapped;

  /// Set if the error occurred on the DevTools side before the expression is
  /// evaluated.
  bool get isError => _wrapped.isError;
  set isError(bool v) {
    _wrapped.isError = v;
  }

  /// Set if the error occurred on the DevTools side before the expression is
  /// evaluated.
  String get code => _wrapped.code;
  set code(String v) {
    _wrapped.code = v;
  }

  /// Set if the error occurred on the DevTools side before the expression is
  /// evaluated.
  String get description => _wrapped.description;
  set description(String v) {
    _wrapped.description = v;
  }

  /// Set if the error occurred on the DevTools side before the expression is
  /// evaluated, contains the array of the values that may be substituted into
  /// the description string to provide more information about the cause of the
  /// error.
  List<Object> get details =>
      _wrapped.details.toDart.cast<JSAny>().map((e) => e).toList();
  set details(List<Object> v) {
    _wrapped.details = v.toJSArray((e) => e.toJS);
  }

  /// Set if the evaluated code produces an unhandled exception.
  bool get isException => _wrapped.isException;
  set isException(bool v) {
    _wrapped.isException = v;
  }

  /// Set if the evaluated code produces an unhandled exception.
  String get value => _wrapped.value;
  set value(String v) {
    _wrapped.value = v;
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

class EvalResult {
  EvalResult({
    required this.result,
    required this.exceptionInfo,
  });

  /// The result of evaluation.
  final Map result;

  /// An object providing details if an exception occurred while evaluating the
  /// expression.
  final EvalExceptionInfo exceptionInfo;
}

class GetContentResult {
  GetContentResult({
    required this.content,
    required this.encoding,
  });

  /// Content of the resource (potentially encoded).
  final String content;

  /// Empty if the content is not encoded, encoding name otherwise. Currently,
  /// only base64 is supported.
  final String encoding;
}
