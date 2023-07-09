import 'chrome.dart';

final _Idle = ChromeIdle._();

extension ChromeChromeIdleExtension on Chrome {
  ChromeIdle get Idle => _Idle;
}

class ChromeIdle {
  ChromeIdle._();
}
