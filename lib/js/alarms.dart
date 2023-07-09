import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSAlarmsExtension on JSChrome {
  ///  Use the `chrome.alarms` API to schedule code to run
  ///  periodically or at a specified time in the future.
  external JSAlarms get alarms;
}

@JS()
@staticInterop
class JSAlarms {}

extension JSAlarmsExtension on JSAlarms {
  ///  Creates an alarm.  Near the time(s) specified by <var>alarmInfo</var>,
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
  ///  be specified by either <var>when</var> or <var>delayInMinutes</var> (but
  ///  not both).  If <var>periodInMinutes</var> is set, the alarm will repeat
  ///  every <var>periodInMinutes</var> minutes after the initial event.  If
  ///  neither <var>when</var> or <var>delayInMinutes</var> is set for a
  ///  repeating alarm, <var>periodInMinutes</var> is used as the default for
  ///  <var>delayInMinutes</var>.
  ///  |callback|: Invoked when the alarm has been created.
  external void create(
    name,
    alarmInfo,
    callback,
  );

  ///  Retrieves details about the specified alarm.
  ///  |name|: The name of the alarm to get. Defaults to the empty string.
  external void get(
    name,
    callback,
  );

  ///  Gets an array of all the alarms.
  external void getAll(callback);

  ///  Clears the alarm with the given name.
  ///  |name|: The name of the alarm to clear. Defaults to the empty string.
  external void clear(
    name,
    callback,
  );

  ///  Clears all alarms.
  external void clearAll(callback);

  ///  Fired when an alarm has elapsed. Useful for event pages.
  ///  |alarm|: The alarm that has elapsed.
  external ChromeEvent get onAlarm;
}

@JS()
@staticInterop
class Alarm {
  ///  Name of this alarm.
  external JSAny get name;

  ///  Time at which this alarm was scheduled to fire, in milliseconds past the
  ///  epoch (e.g. `Date.now() + n`).  For performance reasons, the
  ///  alarm may have been delayed an arbitrary amount beyond this.
  external JSAny get scheduledTime;

  ///  If not null, the alarm is a repeating alarm and will fire again in
  ///  <var>periodInMinutes</var> minutes.
  external JSAny? get periodInMinutes;
}

@JS()
@staticInterop
class AlarmCreateInfo {
  ///  Time at which the alarm should fire, in milliseconds past the epoch
  ///  (e.g. `Date.now() + n`).
  external JSAny? get when;

  ///  Length of time in minutes after which the `onAlarm` event
  ///  should fire.
  ///
  ///  <!-- TODO: need minimum=0 -->
  external JSAny? get delayInMinutes;

  ///  If set, the onAlarm event should fire every <var>periodInMinutes</var>
  ///  minutes after the initial event specified by <var>when</var> or
  ///  <var>delayInMinutes</var>.  If not set, the alarm will only fire once.
  ///
  ///  <!-- TODO: need minimum=0 -->
  external JSAny? get periodInMinutes;
}
