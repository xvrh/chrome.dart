import 'chrome.dart';
export 'chrome.dart';

final _events = ChromeEvents._();

extension ChromeEventsExtension on Chrome {
  ChromeEvents get events => _events;
}

class ChromeEvents {
  ChromeEvents._();
}
