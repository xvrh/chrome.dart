import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSSessionsExtension on JSChrome {
  /// Use the `chrome.sessions` API to query and restore tabs and windows from a
  /// browsing session.
  external JSSessions get Sessions;
}

@JS()
@staticInterop
class JSSessions {}

extension JSSessionsExtension on JSSessions {
  /// Gets the list of recently closed tabs and/or windows.
  external void getRecentlyClosed();

  /// Retrieves all devices with synced sessions.
  external void getDevices();

  /// Reopens a $(ref:windows.Window) or $(ref:tabs.Tab), with an optional
  /// callback to run when the entry has been restored.
  external void restore();

  /// Fired when recently closed tabs and/or windows are changed. This event
  /// does not monitor synced sessions changes.
  external ChromeEvent get onChanged;
}
