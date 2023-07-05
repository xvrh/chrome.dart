/* This file has been generated from idle.json - do not edit */

/**
 * Use the `chrome.idle` API to detect when the machine's idle state changes.
 */
library chrome.idle;

import '../src/common.dart';

/**
 * Accessor for the `chrome.idle` namespace.
 */
final ChromeIdle idle = ChromeIdle._();

class ChromeIdle extends ChromeApi {
  JsObject get _idle => chrome['idle'];

  /**
   * Fired when the system changes to an active, idle or locked state. The event
   * fires with "locked" if the screen is locked or the screensaver activates,
   * "idle" if the system is unlocked and the user has not generated any input
   * for a specified number of seconds, and "active" when the user generates
   * input on an idle system.
   */
  Stream<IdleState> get onStateChanged => _onStateChanged.stream;
  late ChromeStreamController<IdleState> _onStateChanged;

  ChromeIdle._() {
    var getApi = () => _idle;
    _onStateChanged = ChromeStreamController<IdleState>.oneArg(getApi, 'onStateChanged', _createIdleState);
  }

  bool get available => _idle != null;

  /**
   * Returns "locked" if the system is locked, "idle" if the user has not
   * generated any input for a specified number of seconds, or "active"
   * otherwise.
   * 
   * [detectionIntervalInSeconds] The system is considered idle if
   * detectionIntervalInSeconds seconds have elapsed since the last user input
   * detected.
   */
  Future<IdleState> queryState(int detectionIntervalInSeconds) {
    if (_idle == null) _throwNotAvailable();

    var completer =  ChromeCompleter<IdleState>.oneArg(_createIdleState);
    _idle.callMethod('queryState', [detectionIntervalInSeconds, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the interval, in seconds, used to determine when the system is in an
   * idle state for onStateChanged events. The default interval is 60 seconds.
   * 
   * [intervalInSeconds] Threshold, in seconds, used to determine when the
   * system is in an idle state.
   */
  void setDetectionInterval(int intervalInSeconds) {
    if (_idle == null) _throwNotAvailable();

    _idle.callMethod('setDetectionInterval', [intervalInSeconds]);
  }

  /**
   * Gets the time, in seconds, it takes until the screen is locked
   * automatically while idle. Returns a zero duration if the screen is never
   * locked automatically. Currently supported on Chrome OS only.
   * 
   * Returns:
   * Time, in seconds, until the screen is locked automatically while idle. This
   * is zero if the screen never locks automatically.
   */
  Future<int> getAutoLockDelay() {
    if (_idle == null) _throwNotAvailable();

    var completer =  ChromeCompleter<int>.oneArg();
    _idle.callMethod('getAutoLockDelay', [completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.idle' is not available");
  }
}

class IdleState extends ChromeEnum {
  static const IdleState ACTIVE = const IdleState._('active');
  static const IdleState IDLE = const IdleState._('idle');
  static const IdleState LOCKED = const IdleState._('locked');

  static const List<IdleState> VALUES = const[ACTIVE, IDLE, LOCKED];

  const IdleState._(String str): super(str);
}

IdleState _createIdleState(String value) => IdleState.VALUES.singleWhere((ChromeEnum e) => e.value == value);
