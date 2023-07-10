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
    JSString expression,
    EvalOptions? options,
    JSFunction? callback,
  );

  /// Reloads the inspected page.
  external void reload(ReloadOptions? reloadOptions);

  /// Retrieves the list of resources from the inspected page.
  external void getResources(JSFunction callback);

  /// Fired when a new resource is added to the inspected page.
  external ChromeEvent get onResourceAdded;

  /// Fired when a new revision of the resource is committed (e.g. user saves an
  /// edited version of the resource in the Developer Tools).
  external ChromeEvent get onResourceContentCommitted;

  /// The ID of the tab being inspected. This ID may be used with chrome.tabs.*
  /// API.
  external JSNumber get tabId;
}

@JS()
@staticInterop
class Resource {}

extension ResourceExtension on Resource {
  /// The URL of the resource.
  external JSString get url;

  /// Gets the content of the resource.
  external void getContent(JSFunction callback);

  /// Sets the content of the resource.
  external void setContent(
    JSString content,
    JSBoolean commit,
    JSFunction? callback,
  );
}

@JS()
@staticInterop
@anonymous
class EvalOptions {
  external factory EvalOptions({
    /// If specified, the expression is evaluated on the iframe whose URL matches
    /// the one specified. By default, the expression is evaluated in the top
    /// frame of the inspected page.
    JSString? frameURL,

    /// Evaluate the expression in the context of the content script of the
    /// calling extension, provided that the content script is already injected
    /// into the inspected page. If not, the expression is not evaluated and the
    /// callback is invoked with the exception parameter set to an object that has
    /// the `isError` field set to true and the `code` field set to `E_NOTFOUND`.
    JSBoolean? useContentScriptContext,

    /// Evaluate the expression in the context of a content script of an extension
    /// that matches the specified origin. If given, scriptExecutionContext
    /// overrides the 'true' setting on useContentScriptContext.
    JSString? scriptExecutionContext,
  });
}

@JS()
@staticInterop
@anonymous
class ReloadOptions {
  external factory ReloadOptions({
    /// When true, the loader will bypass the cache for all inspected page
    /// resources loaded before the `load` event is fired. The effect is similar
    /// to pressing Ctrl+Shift+R in the inspected window or within the Developer
    /// Tools window.
    JSBoolean? ignoreCache,

    /// If specified, the string will override the value of the `User-Agent` HTTP
    /// header that's sent while loading the resources of the inspected page. The
    /// string will also override the value of the `navigator.userAgent` property
    /// that's returned to any scripts that are running within the inspected page.
    JSString? userAgent,

    /// If specified, the script will be injected into every frame of the
    /// inspected page immediately upon load, before any of the frame's scripts.
    /// The script will not be injected after subsequent reloads&mdash;for
    /// example, if the user presses Ctrl+R.
    JSString? injectedScript,
  });
}
