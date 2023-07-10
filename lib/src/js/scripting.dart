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
  ///  Injects a script into a target context. The script will be run at
  ///  `document_idle`. If the script evaluates to a promise,
  ///  the browser will wait for the promise to settle and return the
  ///  resulting value.
  ///  |injection|: The details of the script which to inject.
  ///  |callback|: Invoked upon completion of the injection. The resulting
  ///  array contains the result of execution for each frame where the
  ///  injection succeeded.
  external void executeScript(
    ScriptInjection injection,
    JSFunction callback,
  );

  ///  Inserts a CSS stylesheet into a target context.
  ///  If multiple frames are specified, unsuccessful injections are ignored.
  ///  |injection|: The details of the styles to insert.
  ///  |callback|: Invoked upon completion of the insertion.
  external void insertCSS(
    CSSInjection injection,
    JSFunction callback,
  );

  ///  Removes a CSS stylesheet that was previously inserted by this extension
  ///  from a target context.
  ///  |injection|: The details of the styles to remove. Note that the
  ///  `css`, `files`, and `origin` properties
  ///  must exactly match the stylesheet inserted through $(ref:insertCSS).
  ///  Attempting to remove a non-existent stylesheet is a no-op.
  ///  |callback|: A callback to be invoked upon the completion of the removal.
  external void removeCSS(
    CSSInjection injection,
    JSFunction callback,
  );

  ///  Registers one or more content scripts for this extension.
  ///  |scripts|: Contains a list of scripts to be registered. If there are
  ///  errors during script parsing/file validation, or if the IDs specified
  ///  already exist, then no scripts are registered.
  ///  |callback|: A callback to be invoked once scripts have been fully
  ///  registered or if an error has occurred.
  external void registerContentScripts(
    JSArray scripts,
    JSFunction callback,
  );

  ///  Returns all dynamically registered content scripts for this extension
  ///  that match the given filter.
  ///  |filter|: An object to filter the extension's dynamically registered
  ///  scripts.
  external void getRegisteredContentScripts(
    ContentScriptFilter? filter,
    JSFunction callback,
  );

  ///  Unregisters content scripts for this extension.
  ///  |filter|: If specified, only unregisters dynamic content scripts which
  ///  match the filter. Otherwise, all of the extension's dynamic content
  ///  scripts are unregistered.
  ///  |callback|: A callback to be invoked once scripts have been unregistered
  ///  or if an error has occurred.
  external void unregisterContentScripts(
    ContentScriptFilter? filter,
    JSFunction callback,
  );

  ///  Updates one or more content scripts for this extension.
  ///  |scripts|: Contains a list of scripts to be updated. A property is only
  ///  updated for the existing script if it is specified in this object. If
  ///  there are errors during script parsing/file validation, or if the IDs
  ///  specified do not correspond to a fully registered script, then no scripts
  ///  are updated.
  ///  |callback|: A callback to be invoked once scripts have been updated or
  ///  if an error has occurred.
  external void updateContentScripts(
    JSArray scripts,
    JSFunction callback,
  );

  ///  An object available for content scripts running in isolated worlds to use
  ///  and modify as a JS object. One instance exists per frame and is shared
  ///  between all content scripts for a given extension. This object is
  ///  initialized when the frame is created, before document_start.
  ///  TODO(crbug.com/1054624): Enable this once implementation is complete.
  external JSNumber get globalParams;
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
class InjectionTarget {}

extension InjectionTargetExtension on InjectionTarget {
  ///  The ID of the tab into which to inject.
  external JSNumber get tabId;

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
  external JSBoolean? get allFrames;
}

@JS()
@staticInterop
class ScriptInjection {}

extension ScriptInjectionExtension on ScriptInjection {
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
  external JSBoolean? get injectImmediately;
}

@JS()
@staticInterop
class CSSInjection {}

extension CSSInjectionExtension on CSSInjection {
  ///  Details specifying the target into which to insert the CSS.
  external InjectionTarget get target;

  ///  A string containing the CSS to inject.
  ///  Exactly one of `files` and `css` must be
  ///  specified.
  external JSString? get css;

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
class InjectionResult {}

extension InjectionResultExtension on InjectionResult {
  ///  The result of the script execution.
  external JSAny? get result;

  ///  The frame associated with the injection.
  external JSNumber get frameId;

  ///  The document associated with the injection.
  external JSString get documentId;
}

@JS()
@staticInterop
class RegisteredContentScript {}

extension RegisteredContentScriptExtension on RegisteredContentScript {
  ///  The id of the content script, specified in the API call. Must not start
  ///  with a '_' as it's reserved as a prefix for generated script IDs.
  external JSString get id;

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
  external JSBoolean? get allFrames;

  ///  TODO(devlin): Add documentation once the implementation is complete. See
  ///  crbug.com/55084.
  external JSBoolean? get matchOriginAsFallback;

  ///  Specifies when JavaScript files are injected into the web page. The
  ///  preferred and default value is `document_idle`.
  external RunAt? get runAt;

  ///  Specifies if this content script will persist into future sessions. The
  ///  default is true.
  external JSBoolean? get persistAcrossSessions;

  ///  The JavaScript "world" to run the script in. Defaults to
  ///  `ISOLATED`.
  external ExecutionWorld? get world;
}

@JS()
@staticInterop
class ContentScriptFilter {}

extension ContentScriptFilterExtension on ContentScriptFilter {
  ///  If specified, $(ref:getRegisteredContentScripts) will only return scripts
  ///  with an id specified in this list.
  external JSArray? get ids;
}