import 'chrome.dart';

final _Alarms = ChromeAlarms._();

extension ChromeChromeAlarmsExtension on Chrome {
  ChromeAlarms get Alarms => _Alarms;
}

class ChromeAlarms {
  ChromeAlarms._();
}
