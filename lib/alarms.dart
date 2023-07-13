import 'src/internal_helpers.dart';
import 'src/js/alarms.dart' as $js;

export 'src/chrome.dart' show chrome;

final _alarms = ChromeAlarms._();

extension ChromeAlarmsExtension on Chrome {
  ChromeAlarms get alarms => _alarms;
}

class ChromeAlarms {
  ChromeAlarms._();

  /// Creates an alarm.  Near the time(s) specified by [alarmInfo],
  /// the `onAlarm` event is fired. If there is another alarm with
  /// the same name (or no name if none is specified), it will be cancelled and
  /// replaced by this alarm.
  ///
  /// In order to reduce the load on the user's machine, Chrome limits alarms
  /// to at most once every 1 minute but may delay them an arbitrary amount
  /// more.  That is, setting `delayInMinutes` or
  /// `periodInMinutes` to less than `1` will not be
  /// honored and will cause a warning.  `when` can be set to less
  /// than 1 minute after "now" without warning but won't actually cause the
  /// alarm to fire for at least 1 minute.
  ///
  /// To help you debug your app or extension, when you've loaded it unpacked,
  /// there's no limit to how often the alarm can fire.
  ///
  /// |name|: Optional name to identify this alarm. Defaults to the empty
  /// string.
  /// |alarmInfo|: Describes when the alarm should fire.  The initial time must
  /// be specified by either [when] or [delayInMinutes] (but
  /// not both).  If [periodInMinutes] is set, the alarm will repeat
  /// every [periodInMinutes] minutes after the initial event.  If
  /// neither [when] or [delayInMinutes] is set for a
  /// repeating alarm, [periodInMinutes] is used as the default for
  /// [delayInMinutes].
  /// |callback|: Invoked when the alarm has been created.
  Future<void> create(
    String? name,
    AlarmCreateInfo alarmInfo,
  ) {
    var $completer = Completer<void>();
    $js.chrome.alarms.create(
      name,
      alarmInfo.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Retrieves details about the specified alarm.
  /// |name|: The name of the alarm to get. Defaults to the empty string.
  Future<Alarm?> get(String? name) {
    var $completer = Completer<Alarm?>();
    $js.chrome.alarms.get(
      name,
      ($js.Alarm? alarm) {
        $completer.complete(alarm?.let(Alarm.fromJS));
      }.toJS,
    );
    return $completer.future;
  }

  /// Gets an array of all the alarms.
  Future<List<Alarm>> getAll() {
    var $completer = Completer<List<Alarm>>();
    $js.chrome.alarms.getAll((JSArray alarms) {
      $completer.complete(
          alarms.toDart.cast<$js.Alarm>().map((e) => Alarm.fromJS(e)).toList());
    }.toJS);
    return $completer.future;
  }

  /// Clears the alarm with the given name.
  /// |name|: The name of the alarm to clear. Defaults to the empty string.
  Future<bool> clear(String? name) {
    var $completer = Completer<bool>();
    $js.chrome.alarms.clear(
      name,
      (bool wasCleared) {
        $completer.complete(wasCleared);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears all alarms.
  Future<bool> clearAll() {
    var $completer = Completer<bool>();
    $js.chrome.alarms.clearAll((bool wasCleared) {
      $completer.complete(wasCleared);
    }.toJS);
    return $completer.future;
  }

  /// Fired when an alarm has elapsed. Useful for event pages.
  /// |alarm|: The alarm that has elapsed.
  Stream<Alarm> get onAlarm => throw UnimplementedError();
}

class Alarm {
  Alarm.fromJS(this._wrapped);

  Alarm({
    required String name,
    required double scheduledTime,
    double? periodInMinutes,
  }) : _wrapped = $js.Alarm()
          ..name = name
          ..scheduledTime = scheduledTime
          ..periodInMinutes = periodInMinutes;

  final $js.Alarm _wrapped;

  $js.Alarm get toJS => _wrapped;

  /// Name of this alarm.
  String get name => _wrapped.name;
  set name(String v) {
    _wrapped.name = v;
  }

  /// Time at which this alarm was scheduled to fire, in milliseconds past the
  /// epoch (e.g. `Date.now() + n`).  For performance reasons, the
  /// alarm may have been delayed an arbitrary amount beyond this.
  double get scheduledTime => _wrapped.scheduledTime;
  set scheduledTime(double v) {
    _wrapped.scheduledTime = v;
  }

  /// If not null, the alarm is a repeating alarm and will fire again in
  /// [periodInMinutes] minutes.
  double? get periodInMinutes => _wrapped.periodInMinutes;
  set periodInMinutes(double? v) {
    _wrapped.periodInMinutes = v;
  }
}

class AlarmCreateInfo {
  AlarmCreateInfo.fromJS(this._wrapped);

  AlarmCreateInfo({
    double? when,
    double? delayInMinutes,
    double? periodInMinutes,
  }) : _wrapped = $js.AlarmCreateInfo()
          ..when = when
          ..delayInMinutes = delayInMinutes
          ..periodInMinutes = periodInMinutes;

  final $js.AlarmCreateInfo _wrapped;

  $js.AlarmCreateInfo get toJS => _wrapped;

  /// Time at which the alarm should fire, in milliseconds past the epoch
  /// (e.g. `Date.now() + n`).
  double? get when => _wrapped.when;
  set when(double? v) {
    _wrapped.when = v;
  }

  /// Length of time in minutes after which the `onAlarm` event
  /// should fire.
  ///
  /// <!-- TODO: need minimum=0 -->
  double? get delayInMinutes => _wrapped.delayInMinutes;
  set delayInMinutes(double? v) {
    _wrapped.delayInMinutes = v;
  }

  /// If set, the onAlarm event should fire every [periodInMinutes]
  /// minutes after the initial event specified by [when] or
  /// [delayInMinutes].  If not set, the alarm will only fire once.
  ///
  /// <!-- TODO: need minimum=0 -->
  double? get periodInMinutes => _wrapped.periodInMinutes;
  set periodInMinutes(double? v) {
    _wrapped.periodInMinutes = v;
  }
}
