import 'dart:async';
import 'dart:js_interop';

export 'chrome.dart';
export 'dart:js_interop';
export 'dart:async' show Completer;
import '../runtime.dart';

extension ScopingFunctions<T extends Object?> on T {
  /// Calls the specified function [block] with `this` value
  /// as its argument and returns its result.
  R let<R>(R Function(T e) block) => block(this);
}

bool checkRuntimeLastError(Completer completer) {
  if (chrome.runtime.lastError case var error?) {
    completer.completeError(Exception('RuntimeLastError: ${error.message}'));
    return false;
  }
  return true;
}

extension ListToJsExtension<T> on List<T> {
  JSArray toJSArray(Object Function(T) mapper) {
    return map(mapper).cast<JSAny>().toList().toJS;
  }
}