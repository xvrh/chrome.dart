import 'chrome.dart';

final _Events = ChromeEvents._();

extension ChromeChromeEventsExtension on Chrome {
  ChromeEvents get Events => _Events;
}

class ChromeEvents {
  ChromeEvents._();
}
