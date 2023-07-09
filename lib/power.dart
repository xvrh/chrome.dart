import 'chrome.dart';
export 'chrome.dart';

final _power = ChromePower._();

extension ChromeChromePowerExtension on Chrome {
  ChromePower get power => _power;
}

class ChromePower {
  ChromePower._();

  ///  Requests that power management be temporarily disabled. |level|
  ///  describes the degree to which power management should be disabled.
  ///  If a request previously made by the same app is still active, it
  ///  will be replaced by the new request.
  void requestKeepAwake(level) => throw UnimplementedError();

  ///  Releases a request previously made via requestKeepAwake().
  void releaseKeepAwake() => throw UnimplementedError();

  ///  Reports a user activity in order to awake the screen from a dimmed or
  ///  turned off state or from a screensaver. Exits the screensaver if it is
  ///  currently active.
  void reportActivity(callback) => throw UnimplementedError();
}

enum Level {
  ///  Prevent the system from sleeping in response to user inactivity.
  system('system'),

  ///  Prevent the display from being turned off or dimmed or the system
  ///  from sleeping in response to user inactivity.
  display('display');

  const Level(this.value);

  final String value;
}
