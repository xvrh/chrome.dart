import 'dart:async';
import 'dart:js_interop';

export 'chrome.dart';
export 'dart:js_interop';
export 'dart:async' show Completer;
import '../runtime.dart';
import 'js/events.dart' as js;

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

  JSArray toJSArrayString() {
    return toJSArray((e) => e.toString());
  }
}

extension JSAnyExtension on JSAny {
  Map toDartMap() {
    var map = dartify()! as Map;
    // TODO: convert inner map and list?
    return map;
  }
}

extension EventStreamExtension on js.Event {
  Stream<T> asStream<T>(JSFunction Function(StreamController) callbackFactory) {
    var controller = StreamController<T>();
    var listener = callbackFactory(controller);
    controller
      ..onListen = () {
        addListener(listener);
      }
      ..onCancel = () {
        removeListener(listener);
        controller.close();
      };

    return controller.stream;
  }
}
