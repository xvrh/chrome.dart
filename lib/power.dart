import 'chrome.dart';
export 'chrome.dart';

final _power = ChromePower._();

extension ChromeChromePowerExtension on Chrome {
  ChromePower get power => _power;
}

class ChromePower {
  ChromePower._();
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
