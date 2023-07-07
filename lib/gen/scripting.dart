/* This file has been generated from scripting.idl - do not edit */

/**
 * Use the `chrome.scripting` API to execute script in different contexts.
 */
library chrome.scripting;

import '../src/common.dart';

/**
 * Accessor for the `chrome.scripting` namespace.
 */
final ChromeScripting scripting = ChromeScripting._();

class ChromeScripting extends ChromeApi {
  JsObject get _scripting => chrome['scripting'];

  ChromeScripting._();

  bool get available => _scripting != null;

  /**
   * An object available for content scripts running in isolated worlds to use
   * and modify as a JS object. One instance exists per frame and is shared
   * between all content scripts for a given extension. This object is
   * initialized when the frame is created, before document_start.
   * todo(crbug.com/1054624): Enable this once implementation is complete.
   */
  int globalParams() {
    if (_scripting == null) _throwNotAvailable();

    return _scripting.callMethod('globalParams');
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.scripting' is not available");
  }
}

/**
 * The origin for a style change. See <a
 * href="https://developer.mozilla.org/en-US/docs/Glossary/Style_origin">style
 * origins</a> for more info.
 */
class StyleOrigin extends ChromeEnum {
  static const StyleOrigin AUTHOR = const StyleOrigin._('AUTHOR');
  static const StyleOrigin USER = const StyleOrigin._('USER');

  static const List<StyleOrigin> VALUES = const[AUTHOR, USER];

  const StyleOrigin._(String str): super(str);
}

/**
 * The JavaScript world for a script to execute within.
 */
class ExecutionWorld extends ChromeEnum {
  static const ExecutionWorld ISOLATED = const ExecutionWorld._('ISOLATED');
  static const ExecutionWorld MAIN = const ExecutionWorld._('MAIN');

  static const List<ExecutionWorld> VALUES = const[ISOLATED, MAIN];

  const ExecutionWorld._(String str): super(str);
}

class InjectionTarget extends ChromeObject {
  InjectionTarget({int? tabId, List<int>? frameIds, List<String>? documentIds, bool? allFrames}) {
    if (tabId != null) this.tabId = tabId;
    if (frameIds != null) this.frameIds = frameIds;
    if (documentIds != null) this.documentIds = documentIds;
    if (allFrames != null) this.allFrames = allFrames;
  }
  InjectionTarget.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  int get tabId => jsProxy['tabId'];
  set tabId(int value) => jsProxy['tabId'] = value;

  List<int> get frameIds => listify(jsProxy['frameIds']);
  set frameIds(List<int> value) => jsProxy['frameIds'] = jsify(value);

  List<String> get documentIds => listify(jsProxy['documentIds']);
  set documentIds(List<String> value) => jsProxy['documentIds'] = jsify(value);

  bool get allFrames => jsProxy['allFrames'];
  set allFrames(bool value) => jsProxy['allFrames'] = value;
}

class ScriptInjection extends ChromeObject {
  ScriptInjection({InjectedFunction? func, List<Object>? args, InjectedFunction? function, List<String>? files, InjectionTarget? target, ExecutionWorld? world, bool? injectImmediately}) {
    if (func != null) this.func = func;
    if (args != null) this.args = args;
    if (function != null) this.function = function;
    if (files != null) this.files = files;
    if (target != null) this.target = target;
    if (world != null) this.world = world;
    if (injectImmediately != null) this.injectImmediately = injectImmediately;
  }
  ScriptInjection.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  InjectedFunction get func => _createInjectedFunction(jsProxy['func']);
  set func(InjectedFunction value) => jsProxy['func'] = jsify(value);

  List<Object> get args => listify(jsProxy['args']);
  set args(List<Object> value) => jsProxy['args'] = jsify(value);

  InjectedFunction get function => _createInjectedFunction(jsProxy['function']);
  set function(InjectedFunction value) => jsProxy['function'] = jsify(value);

  List<String> get files => listify(jsProxy['files']);
  set files(List<String> value) => jsProxy['files'] = jsify(value);

  InjectionTarget get target => _createInjectionTarget(jsProxy['target']);
  set target(InjectionTarget value) => jsProxy['target'] = jsify(value);

  ExecutionWorld get world => _createExecutionWorld(jsProxy['world']);
  set world(ExecutionWorld value) => jsProxy['world'] = jsify(value);

  bool get injectImmediately => jsProxy['injectImmediately'];
  set injectImmediately(bool value) => jsProxy['injectImmediately'] = value;
}

class CSSInjection extends ChromeObject {
  CSSInjection({InjectionTarget? target, String? css, List<String>? files, StyleOrigin? origin}) {
    if (target != null) this.target = target;
    if (css != null) this.css = css;
    if (files != null) this.files = files;
    if (origin != null) this.origin = origin;
  }
  CSSInjection.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  InjectionTarget get target => _createInjectionTarget(jsProxy['target']);
  set target(InjectionTarget value) => jsProxy['target'] = jsify(value);

  String get css => jsProxy['css'];
  set css(String value) => jsProxy['css'] = value;

  List<String> get files => listify(jsProxy['files']);
  set files(List<String> value) => jsProxy['files'] = jsify(value);

  StyleOrigin get origin => _createStyleOrigin(jsProxy['origin']);
  set origin(StyleOrigin value) => jsProxy['origin'] = jsify(value);
}

class InjectionResult extends ChromeObject {
  InjectionResult({Object? result, int? frameId, String? documentId}) {
    if (result != null) this.result = result;
    if (frameId != null) this.frameId = frameId;
    if (documentId != null) this.documentId = documentId;
  }
  InjectionResult.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  Object get result => jsProxy['result'];
  set result(Object value) => jsProxy['result'] = jsify(value);

  int get frameId => jsProxy['frameId'];
  set frameId(int value) => jsProxy['frameId'] = value;

  String get documentId => jsProxy['documentId'];
  set documentId(String value) => jsProxy['documentId'] = value;
}

/**
 * Describes a content script to be injected into a web page registered through
 * this API.
 */
class RegisteredContentScript extends ChromeObject {
  RegisteredContentScript({String? id, List<String>? matches, List<String>? excludeMatches, List<String>? css, List<String>? js, bool? allFrames, bool? matchOriginAsFallback, extensionTypes.RunAt? runAt, bool? persistAcrossSessions, ExecutionWorld? world}) {
    if (id != null) this.id = id;
    if (matches != null) this.matches = matches;
    if (excludeMatches != null) this.excludeMatches = excludeMatches;
    if (css != null) this.css = css;
    if (js != null) this.js = js;
    if (allFrames != null) this.allFrames = allFrames;
    if (matchOriginAsFallback != null) this.matchOriginAsFallback = matchOriginAsFallback;
    if (runAt != null) this.runAt = runAt;
    if (persistAcrossSessions != null) this.persistAcrossSessions = persistAcrossSessions;
    if (world != null) this.world = world;
  }
  RegisteredContentScript.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;

  List<String> get matches => listify(jsProxy['matches']);
  set matches(List<String> value) => jsProxy['matches'] = jsify(value);

  List<String> get excludeMatches => listify(jsProxy['excludeMatches']);
  set excludeMatches(List<String> value) => jsProxy['excludeMatches'] = jsify(value);

  List<String> get css => listify(jsProxy['css']);
  set css(List<String> value) => jsProxy['css'] = jsify(value);

  List<String> get js => listify(jsProxy['js']);
  set js(List<String> value) => jsProxy['js'] = jsify(value);

  bool get allFrames => jsProxy['allFrames'];
  set allFrames(bool value) => jsProxy['allFrames'] = value;

  bool get matchOriginAsFallback => jsProxy['matchOriginAsFallback'];
  set matchOriginAsFallback(bool value) => jsProxy['matchOriginAsFallback'] = value;

  extensionTypes.RunAt get runAt => _createextensionTypes.RunAt(jsProxy['runAt']);
  set runAt(extensionTypes.RunAt value) => jsProxy['runAt'] = jsify(value);

  bool get persistAcrossSessions => jsProxy['persistAcrossSessions'];
  set persistAcrossSessions(bool value) => jsProxy['persistAcrossSessions'] = value;

  ExecutionWorld get world => _createExecutionWorld(jsProxy['world']);
  set world(ExecutionWorld value) => jsProxy['world'] = jsify(value);
}

/**
 * An object used to filter content scripts for
 * ${ref:getRegisteredContentScripts}.
 */
class ContentScriptFilter extends ChromeObject {
  ContentScriptFilter({List<String>? ids}) {
    if (ids != null) this.ids = ids;
  }
  ContentScriptFilter.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  List<String> get ids => listify(jsProxy['ids']);
  set ids(List<String> value) => jsProxy['ids'] = jsify(value);
}

InjectedFunction _createInjectedFunction(JsObject jsProxy) => InjectedFunction.fromProxy(jsProxy);
InjectionTarget _createInjectionTarget(JsObject jsProxy) => InjectionTarget.fromProxy(jsProxy);
ExecutionWorld _createExecutionWorld(String value) => ExecutionWorld.VALUES.singleWhere((ChromeEnum e) => e.value == value);
StyleOrigin _createStyleOrigin(String value) => StyleOrigin.VALUES.singleWhere((ChromeEnum e) => e.value == value);
extensionTypes.RunAt _createextensionTypes.RunAt(JsObject jsProxy) => extensionTypes.RunAt.fromProxy(jsProxy);
