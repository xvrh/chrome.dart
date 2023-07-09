import 'chrome.dart';
export 'chrome.dart';

final _alarms = ChromeAlarms._();

extension ChromeChromeAlarmsExtension on Chrome {
  ChromeAlarms get alarms => _alarms;
}

class ChromeAlarms {
  ChromeAlarms._();
}
