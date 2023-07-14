import 'dart:async';

export 'chrome.dart';
export 'dart:js_interop';
export 'dart:async' show Completer;

extension ScopingFunctions<T extends Object?> on T {
  /// Calls the specified function [block] with `this` value
  /// as its argument and returns its result.
  R let<R>(R Function(T e) block) => block(this);
}

bool checkRuntimeLastError(Completer completer) {
  //TODO: check runtime.lastError and complete the completer with an error if
  // needed
  return true;
}
