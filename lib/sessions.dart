import 'chrome.dart';
export 'chrome.dart';

final _sessions = ChromeSessions._();

extension ChromeChromeSessionsExtension on Chrome {
  ChromeSessions get sessions => _sessions;
}

class ChromeSessions {
  ChromeSessions._();

  /// Gets the list of recently closed tabs and/or windows.
  void getRecentlyClosed(filter) => throw UnimplementedError();

  /// Retrieves all devices with synced sessions.
  void getDevices(filter) => throw UnimplementedError();

  /// Reopens a $(ref:windows.Window) or $(ref:tabs.Tab), with an optional
  /// callback to run when the entry has been restored.
  void restore(sessionId) => throw UnimplementedError();

  /// Fired when recently closed tabs and/or windows are changed. This event
  /// does not monitor synced sessions changes.
  Stream get onChanged => throw UnimplementedError();
}
