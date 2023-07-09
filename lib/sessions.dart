import 'chrome.dart';

final _Sessions = ChromeSessions._();

extension ChromeChromeSessionsExtension on Chrome {
  ChromeSessions get Sessions => _Sessions;
}

class ChromeSessions {
  ChromeSessions._();
}
