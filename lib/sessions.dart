import 'chrome.dart';
export 'chrome.dart';

final _sessions = ChromeSessions._();

extension ChromeChromeSessionsExtension on Chrome {
  ChromeSessions get sessions => _sessions;
}

class ChromeSessions {
  ChromeSessions._();
}
