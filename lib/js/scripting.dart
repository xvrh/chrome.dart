import 'chrome.dart';
import 'dart:js_interop';
import 'extension_types.dart';
export 'chrome.dart';

extension JSChromeJSScriptingExtension on JSChrome {
  ///  Use the `chrome.scripting` API to execute script in different
  ///  contexts.
  external JSScripting get scripting;
}

@JS()
@staticInterop
class JSScripting {}

extension JSScriptingExtension on JSScripting {
  ///  An object available for content scripts running in isolated worlds to use
  ///  and modify as a JS object. One instance exists per frame and is shared
  ///  between all content scripts for a given extension. This object is
  ///  initialized when the frame is created, before document_start.
  ///  TODO(crbug.com/1054624): Enable this once implementation is complete.
  external void globalParams();
}

///  The origin for a style change.
///  See <a
/// href="https://developer.mozilla.org/en-US/docs/Glossary/Style_origin">style
/// origins</a>
///  for more info.
typedef StyleOrigin = JSString;

///  The JavaScript world for a script to execute within.
typedef ExecutionWorld = JSString;

@JS()
@staticInterop
class InjectionTarget {
  ///  The ID of the tab into which to inject.
  external int get tabId;

  ///  The <a
  /// href="https://developer.chrome.com/extensions/webNavigation#frame_ids">IDs</a>
  ///  of specific frames to inject into.
  external JSArray? get frameIds;

  ///  The <a
  /// href="https://developer.chrome.com/extensions/webNavigation#document_ids">IDs</a>
  ///  of specific documentIds to inject into. This must not be set if
  ///  `frameIds` is set.
  external JSArray? get documentIds;

  ///  Whether the script should inject into all frames within the tab. Defaults
  ///  to false.
  ///  This must not be true if `frameIds` is specified.
  external bool? get allFrames;
}

@JS()
@staticInterop
class ScriptInjection {
  ///  A JavaScript function to inject. This function will be serialized, and
  ///  then deserialized for injection. This means that any bound parameters
  ///  and execution context will be lost.
  ///  Exactly one of `files` and `func` must be
  ///  specified.
  external JSFunction? get func;

  ///  The arguments to curry into a provided function. This is only valid if
  ///  the `func` parameter is specified. These arguments must be
  ///  JSON-serializable.
  external JSArray? get args;

  ///  We used to call the injected function `function`, but this is
  ///  incompatible with JavaScript's object declaration shorthand (see
  ///  https://crbug.com/1166438). We leave this silently in for backwards
  ///  compatibility.
  ///  TODO(devlin): Remove this in M95.
  external JSFunction? get function;

  ///  The path of the JS or CSS files to inject, relative to the extension's
  ///  root directory.
  ///  Exactly one of `files` and `func` must be
  ///  specified.
  external JSArray? get files;

  ///  Details specifying the target into which to inject the script.
  external InjectionTarget get target;

  ///  The JavaScript "world" to run the script in. Defaults to
  ///  `ISOLATED`.
  external ExecutionWorld? get world;

  ///  Whether the injection should be triggered in the target as soon as
  ///  possible. Note that this is not a guarantee that injection will occur
  ///  prior to page load, as the page may have already loaded by the time the
  ///  script reaches the target.
  external bool? get injectImmediately;
}

@JS()
@staticInterop
class CSSInjection {
  ///  Details specifying the target into which to insert the CSS.
  external InjectionTarget get target;

  ///  A string containing the CSS to inject.
  ///  Exactly one of `files` and `css` must be
  ///  specified.
  external String? get css;

  ///  The path of the CSS files to inject, relative to the extension's root
  ///  directory.
  ///  Exactly one of `files` and `css` must be
  ///  specified.
  external JSArray? get files;

  ///  The style origin for the injection. Defaults to `'AUTHOR'`.
  external StyleOrigin? get origin;
}

@JS()
@staticInterop
class InjectionResult {
  ///  The result of the script execution.
  external JSAny? get result;

  ///  The frame associated with the injection.
  external int get frameId;

  ///  The document associated with the injection.
  external String get documentId;
}

@JS()
@staticInterop
class RegisteredContentScript {
  ///  The id of the content script, specified in the API call. Must not start
  ///  with a '_' as it's reserved as a prefix for generated script IDs.
  external String get id;

  ///  Specifies which pages this content script will be injected into. See
  ///  <a href="match_patterns">Match Patterns</a> for more details on the
  ///  syntax of these strings. Must be specified for
  ///  $(ref:registerContentScripts).
  external JSArray? get matches;

  ///  Excludes pages that this content script would otherwise be injected into.
  ///  See <a href="match_patterns">Match Patterns</a> for more details on the
  ///  syntax of these strings.
  external JSArray? get excludeMatches;

  ///  The list of CSS files to be injected into matching pages. These are
  ///  injected in the order they appear in this array, before any DOM is
  ///  constructed or displayed for the page.
  external JSArray? get css;

  ///  The list of JavaScript files to be injected into matching pages. These
  ///  are injected in the order they appear in this array.
  external JSArray? get js;

  ///  If specified true, it will inject into all frames, even if the frame is
  ///  not the top-most frame in the tab. Each frame is checked independently
  ///  for URL requirements; it will not inject into child frames if the URL
  ///  requirements are not met. Defaults to false, meaning that only the top
  ///  frame is matched.
  external bool? get allFrames;

  ///  TODO(devlin): Add documentation once the implementation is complete. See
  ///  crbug.com/55084.
  external bool? get matchOriginAsFallback;

  ///  Specifies when JavaScript files are injected into the web page. The
  ///  preferred and default value is `document_idle`.
  external RunAt? get runAt;

  ///  Specifies if this content script will persist into future sessions. The
  ///  default is true.
  external bool? get persistAcrossSessions;

  ///  The JavaScript "world" to run the script in. Defaults to
  ///  `ISOLATED`.
  external ExecutionWorld? get world;
}

@JS()
@staticInterop
class ContentScriptFilter {
  ///  If specified, $(ref:getRegisteredContentScripts) will only return scripts
  ///  with an id specified in this list.
  external JSArray? get ids;
}
