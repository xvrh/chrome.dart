import 'chrome.dart';
export 'chrome.dart';

final _alarms = ChromeAlarms._();

extension ChromeChromeAlarmsExtension on Chrome {
  ChromeAlarms get alarms => _alarms;
}

class ChromeAlarms {
  ChromeAlarms._();

  ///  Creates an alarm.  Near the time(s) specified by `alarmInfo`,
  ///  the `onAlarm` event is fired. If there is another alarm with
  ///  the same name (or no name if none is specified), it will be cancelled and
  ///  replaced by this alarm.
  ///
  ///  In order to reduce the load on the user's machine, Chrome limits alarms
  ///  to at most once every 1 minute but may delay them an arbitrary amount
  ///  more.  That is, setting `delayInMinutes` or
  ///  `periodInMinutes` to less than `1` will not be
  ///  honored and will cause a warning.  `when` can be set to less
  ///  than 1 minute after "now" without warning but won't actually cause the
  ///  alarm to fire for at least 1 minute.
  ///
  ///  To help you debug your app or extension, when you've loaded it unpacked,
  ///  there's no limit to how often the alarm can fire.
  ///
  ///  |name|: Optional name to identify this alarm. Defaults to the empty
  ///  string.
  ///  |alarmInfo|: Describes when the alarm should fire.  The initial time must
  ///  be specified by either `when` or `delayInMinutes` (but
  ///  not both).  If `periodInMinutes` is set, the alarm will repeat
  ///  every `periodInMinutes` minutes after the initial event.  If
  ///  neither `when` or `delayInMinutes` is set for a
  ///  repeating alarm, `periodInMinutes` is used as the default for
  ///  `delayInMinutes`.
  ///  |callback|: Invoked when the alarm has been created.
  void create(
    name,
    alarmInfo,
  ) =>
      throw UnimplementedError();

  ///  Retrieves details about the specified alarm.
  ///  |name|: The name of the alarm to get. Defaults to the empty string.
  void get(name) => throw UnimplementedError();

  ///  Gets an array of all the alarms.
  void getAll() => throw UnimplementedError();

  ///  Clears the alarm with the given name.
  ///  |name|: The name of the alarm to clear. Defaults to the empty string.
  void clear(name) => throw UnimplementedError();

  ///  Clears all alarms.
  void clearAll() => throw UnimplementedError();

  ///  Fired when an alarm has elapsed. Useful for event pages.
  ///  |alarm|: The alarm that has elapsed.
  Stream get onAlarm => throw UnimplementedError();
}
