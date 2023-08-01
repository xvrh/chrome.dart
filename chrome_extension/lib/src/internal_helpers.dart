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
  Stream<T> asStream<T>(
      JSFunction Function(StreamController<T>) callbackFactory) {
    var controller = StreamController<T>.broadcast();
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

  Stream<T> asStream2<T>(
      JSFunction Function(void Function(T)) callbackFactory) {
    return _EventStream<T>(this, callbackFactory);
  }
}

class _EventStream<T> extends Stream<T> {
  final js.Event _target;
  final JSFunction Function(void Function(T)) _callbackFactory;

  _EventStream(this._target, this._callbackFactory);

  @override
  Stream<T> asBroadcastStream(
          {void Function(StreamSubscription<T>)? onListen,
          void Function(StreamSubscription<T>)? onCancel}) =>
      this;

  @override
  bool get isBroadcast => true;

  @pragma('dart2js:tryInline')
  @override
  StreamSubscription<T> listen(void Function(T)? onData,
          {Function? onError, void Function()? onDone, bool? cancelOnError}) =>
      _EventStreamSubscription<T>(this._target, onData, _callbackFactory);
}

class _EventStreamSubscription<T> implements StreamSubscription<T> {
  int _pauseCount = 0;
  js.Event? _target;
  void Function(T)? _onData;
  late final JSFunction _callback;

  _EventStreamSubscription(this._target, this._onData,
      JSFunction Function(void Function(T)) callbackFactory) {
    _callback = callbackFactory(_wrapZone(_addData));
    print("Subscribe");
    _tryResume();
  }

  void _addData(T data) {
    print("Add data");
    _onData?.call(data);
  }

  @override
  Future<void> cancel() {
    final emptyFuture = Future<void>.value();
    if (_canceled) return emptyFuture;

    _unlisten();
    // Clear out the target to indicate this is complete.
    _target = null;
    _onData = null;
    return emptyFuture;
  }

  bool get _canceled => _target == null;

  @override
  void onData(void Function(T)? handleData) {
    if (_canceled) {
      throw StateError('Subscription has been canceled.');
    }
    // Remove current event listener.
    _unlisten();
    _onData = handleData;
    _tryResume();
  }

  /// Has no effect.
  @override
  void onError(Function? handleError) {}

  /// Has no effect.
  @override
  void onDone(void Function()? handleDone) {}

  @override
  void pause([Future<dynamic>? resumeSignal]) {
    if (_canceled) return;
    ++_pauseCount;
    _unlisten();

    if (resumeSignal != null) {
      resumeSignal.whenComplete(resume);
    }
  }

  @override
  bool get isPaused => _pauseCount > 0;

  @override
  void resume() {
    if (_canceled || !isPaused) return;
    --_pauseCount;
    _tryResume();
  }

  void _tryResume() {
    print("Try resume $_onData $isPaused");
    if (_onData != null && !isPaused) {
      print("Start listen");
      _target!.addListener(_callback);
    }
  }

  void _unlisten() {
    if (_onData != null) {
      print("Remove listen");
      _target!.removeListener(_callback);
    }
  }

  @override
  Future<E> asFuture<E>([E? futureValue]) =>
      // We just need a future that will never succeed or fail.
      Completer<E>().future;
}

void Function(T) _wrapZone<T>(void Function(T) callback) {
  // For performance reasons avoid wrapping if we are in the root zone.
  if (Zone.current == Zone.root) return callback;
  return Zone.current.bindUnaryCallbackGuarded(callback);
}
