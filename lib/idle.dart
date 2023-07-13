import 'src/internal_helpers.dart';
import 'src/js/idle.dart' as $js;

export 'src/chrome.dart' show chrome;

final _idle = ChromeIdle._();

extension ChromeIdleExtension on Chrome {
  ChromeIdle get idle => _idle;
}

class ChromeIdle {
  ChromeIdle._();

  /// Returns "locked" if the system is locked, "idle" if the user has not
  /// generated any input for a specified number of seconds, or "active"
  /// otherwise.
  void queryState(
    int detectionIntervalInSeconds,
    JSFunction callback,
  ) {
    $js.chrome.idle.queryState(
      detectionIntervalInSeconds,
      callback,
    );
  }

  /// Sets the interval, in seconds, used to determine when the system is in an
  /// idle state for onStateChanged events. The default interval is 60 seconds.
  void setDetectionInterval(int intervalInSeconds) {
    $js.chrome.idle.setDetectionInterval(intervalInSeconds);
  }

  /// Gets the time, in seconds, it takes until the screen is locked
  /// automatically while idle. Returns a zero duration if the screen is never
  /// locked automatically. Currently supported on Chrome OS only.
  void getAutoLockDelay(JSFunction callback) {
    $js.chrome.idle.getAutoLockDelay(callback);
  }

  /// Fired when the system changes to an active, idle or locked state. The
  /// event fires with "locked" if the screen is locked or the screensaver
  /// activates, "idle" if the system is unlocked and the user has not generated
  /// any input for a specified number of seconds, and "active" when the user
  /// generates input on an idle system.
  Stream<IdleState> get onStateChanged => throw UnimplementedError();
}

enum IdleState {
  active('active'),
  idle('idle'),
  locked('locked');

  const IdleState(this.value);

  final String value;

  String get toJS => value;
  static IdleState fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}
