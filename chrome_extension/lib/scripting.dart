import 'dart:js_util';

import 'extension_types.dart';
import 'src/internal_helpers.dart';
import 'src/js/scripting.dart' as $js;

export 'src/chrome.dart' show chrome;

final _scripting = ChromeScripting._();

extension ChromeScriptingExtension on Chrome {
  ChromeScripting get scripting => _scripting;
}

class ChromeScripting {
  ChromeScripting._();

  bool get isAvailable => $js.chrome.scriptingNullable != null;

  /// Injects a script into a target context. The script will be run at
  /// `document_idle`. If the script evaluates to a promise,
  /// the browser will wait for the promise to settle and return the
  /// resulting value.
  /// |injection|: The details of the script which to inject.
  /// |callback|: Invoked upon completion of the injection. The resulting
  /// array contains the result of execution for each frame where the
  /// injection succeeded.
  Future<List<InjectionResult>> executeScript(ScriptInjection injection) async {
    var $res = await promiseToFuture<JSArray>(
        $js.chrome.scripting.executeScript(injection.toJS));
    return $res.toDart
        .cast<$js.InjectionResult>()
        .map((e) => InjectionResult.fromJS(e))
        .toList();
  }

  /// Inserts a CSS stylesheet into a target context.
  /// If multiple frames are specified, unsuccessful injections are ignored.
  /// |injection|: The details of the styles to insert.
  /// |callback|: Invoked upon completion of the insertion.
  Future<void> insertCSS(CSSInjection injection) async {
    await promiseToFuture<void>($js.chrome.scripting.insertCSS(injection.toJS));
  }

  /// Removes a CSS stylesheet that was previously inserted by this extension
  /// from a target context.
  /// |injection|: The details of the styles to remove. Note that the
  /// `css`, `files`, and `origin` properties
  /// must exactly match the stylesheet inserted through [insertCSS].
  /// Attempting to remove a non-existent stylesheet is a no-op.
  /// |callback|: A callback to be invoked upon the completion of the removal.
  Future<void> removeCSS(CSSInjection injection) async {
    await promiseToFuture<void>($js.chrome.scripting.removeCSS(injection.toJS));
  }

  /// Registers one or more content scripts for this extension.
  /// |scripts|: Contains a list of scripts to be registered. If there are
  /// errors during script parsing/file validation, or if the IDs specified
  /// already exist, then no scripts are registered.
  /// |callback|: A callback to be invoked once scripts have been fully
  /// registered or if an error has occurred.
  Future<void> registerContentScripts(
      List<RegisteredContentScript> scripts) async {
    await promiseToFuture<void>($js.chrome.scripting
        .registerContentScripts(scripts.toJSArray((e) => e.toJS)));
  }

  /// Returns all dynamically registered content scripts for this extension
  /// that match the given filter.
  /// |filter|: An object to filter the extension's dynamically registered
  /// scripts.
  Future<List<RegisteredContentScript>> getRegisteredContentScripts(
      ContentScriptFilter? filter) async {
    var $res = await promiseToFuture<JSArray>(
        $js.chrome.scripting.getRegisteredContentScripts(filter?.toJS));
    return $res.toDart
        .cast<$js.RegisteredContentScript>()
        .map((e) => RegisteredContentScript.fromJS(e))
        .toList();
  }

  /// Unregisters content scripts for this extension.
  /// |filter|: If specified, only unregisters dynamic content scripts which
  /// match the filter. Otherwise, all of the extension's dynamic content
  /// scripts are unregistered.
  /// |callback|: A callback to be invoked once scripts have been unregistered
  /// or if an error has occurred.
  Future<void> unregisterContentScripts(ContentScriptFilter? filter) async {
    await promiseToFuture<void>(
        $js.chrome.scripting.unregisterContentScripts(filter?.toJS));
  }

  /// Updates one or more content scripts for this extension.
  /// |scripts|: Contains a list of scripts to be updated. A property is only
  /// updated for the existing script if it is specified in this object. If
  /// there are errors during script parsing/file validation, or if the IDs
  /// specified do not correspond to a fully registered script, then no scripts
  /// are updated.
  /// |callback|: A callback to be invoked once scripts have been updated or
  /// if an error has occurred.
  Future<void> updateContentScripts(
      List<RegisteredContentScript> scripts) async {
    await promiseToFuture<void>($js.chrome.scripting
        .updateContentScripts(scripts.toJSArray((e) => e.toJS)));
  }

  /// An object available for content scripts running in isolated worlds to use
  /// and modify as a JS object. One instance exists per frame and is shared
  /// between all content scripts for a given extension. This object is
  /// initialized when the frame is created, before document_start.
  /// TODO(crbug.com/1054624): Enable this once implementation is complete.
  int get globalParams => $js.chrome.scripting.globalParams;
}

/// The origin for a style change.
/// See [style
/// origins](https://developer.mozilla.org/en-US/docs/Glossary/Style_origin)
/// for more info.
enum StyleOrigin {
  author('AUTHOR'),
  user('USER');

  const StyleOrigin(this.value);

  final String value;

  String get toJS => value;
  static StyleOrigin fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// The JavaScript world for a script to execute within.
enum ExecutionWorld {
  /// The isolated world, unique to this extension.
  isolated('ISOLATED'),

  /// The main world of the DOM, shared with the page's JavaScript.
  main('MAIN');

  const ExecutionWorld(this.value);

  final String value;

  String get toJS => value;
  static ExecutionWorld fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class InjectionTarget {
  InjectionTarget.fromJS(this._wrapped);

  InjectionTarget({
    required int tabId,
    List<int>? frameIds,
    List<String>? documentIds,
    bool? allFrames,
  }) : _wrapped = $js.InjectionTarget(
          tabId: tabId,
          frameIds: frameIds?.toJSArray((e) => e),
          documentIds: documentIds?.toJSArray((e) => e),
          allFrames: allFrames,
        );

  final $js.InjectionTarget _wrapped;

  $js.InjectionTarget get toJS => _wrapped;
}

class ScriptInjection {
  ScriptInjection.fromJS(this._wrapped);

  ScriptInjection({
    Object? func,
    List<Object>? args,
    Object? function,
    List<String>? files,
    required InjectionTarget target,
    ExecutionWorld? world,
    bool? injectImmediately,
  }) : _wrapped = $js.ScriptInjection(
          func: func?.toJS,
          args: args?.toJSArray((e) => e.toJS),
          function: function?.toJS,
          files: files?.toJSArray((e) => e),
          target: target.toJS,
          world: world?.toJS,
          injectImmediately: injectImmediately,
        );

  final $js.ScriptInjection _wrapped;

  $js.ScriptInjection get toJS => _wrapped;
}

class CSSInjection {
  CSSInjection.fromJS(this._wrapped);

  CSSInjection({
    required InjectionTarget target,
    String? css,
    List<String>? files,
    StyleOrigin? origin,
  }) : _wrapped = $js.CSSInjection(
          target: target.toJS,
          css: css,
          files: files?.toJSArray((e) => e),
          origin: origin?.toJS,
        );

  final $js.CSSInjection _wrapped;

  $js.CSSInjection get toJS => _wrapped;
}

class InjectionResult {
  InjectionResult.fromJS(this._wrapped);

  InjectionResult({
    Object? result,
    required int frameId,
    required String documentId,
  }) : _wrapped = $js.InjectionResult()
          ..result = result?.toJS
          ..frameId = frameId
          ..documentId = documentId;

  final $js.InjectionResult _wrapped;

  $js.InjectionResult get toJS => _wrapped;

  /// The result of the script execution.
  Object? get result => _wrapped.result;
  set result(Object? v) {
    _wrapped.result = v?.toJS;
  }

  /// The frame associated with the injection.
  int get frameId => _wrapped.frameId;
  set frameId(int v) {
    _wrapped.frameId = v;
  }

  /// The document associated with the injection.
  String get documentId => _wrapped.documentId;
  set documentId(String v) {
    _wrapped.documentId = v;
  }
}

class RegisteredContentScript {
  RegisteredContentScript.fromJS(this._wrapped);

  RegisteredContentScript({
    required String id,
    List<String>? matches,
    List<String>? excludeMatches,
    List<String>? css,
    List<String>? js,
    bool? allFrames,
    bool? matchOriginAsFallback,
    RunAt? runAt,
    bool? persistAcrossSessions,
    ExecutionWorld? world,
  }) : _wrapped = $js.RegisteredContentScript(
          id: id,
          matches: matches?.toJSArray((e) => e),
          excludeMatches: excludeMatches?.toJSArray((e) => e),
          css: css?.toJSArray((e) => e),
          js: js?.toJSArray((e) => e),
          allFrames: allFrames,
          matchOriginAsFallback: matchOriginAsFallback,
          runAt: runAt?.toJS,
          persistAcrossSessions: persistAcrossSessions,
          world: world?.toJS,
        );

  final $js.RegisteredContentScript _wrapped;

  $js.RegisteredContentScript get toJS => _wrapped;
}

class ContentScriptFilter {
  ContentScriptFilter.fromJS(this._wrapped);

  ContentScriptFilter({List<String>? ids})
      : _wrapped = $js.ContentScriptFilter(ids: ids?.toJSArray((e) => e));

  final $js.ContentScriptFilter _wrapped;

  $js.ContentScriptFilter get toJS => _wrapped;
}
