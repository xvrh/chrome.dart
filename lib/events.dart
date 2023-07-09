import 'chrome.dart';
export 'chrome.dart';

final _events = ChromeEvents._();

extension ChromeChromeEventsExtension on Chrome {
  ChromeEvents get events => _events;
}

class ChromeEvents {
  ChromeEvents._();
}
