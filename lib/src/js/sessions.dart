import 'chrome.dart';
import 'dart:js_interop';
import 'tabs.dart';
import 'windows.dart';
export 'chrome.dart';

extension JSChromeJSSessionsExtension on JSChrome {
  /// Use the `chrome.sessions` API to query and restore tabs and windows from a
  /// browsing session.
  external JSSessions get sessions;
}

@JS()
@staticInterop
class JSSessions {}

extension JSSessionsExtension on JSSessions {
  /// Gets the list of recently closed tabs and/or windows.
  external JSPromise getRecentlyClosed(Filter? filter);

  /// Retrieves all devices with synced sessions.
  external JSPromise getDevices(Filter? filter);

  /// Reopens a $(ref:windows.Window) or $(ref:tabs.Tab), with an optional
  /// callback to run when the entry has been restored.
  external JSPromise restore(String? sessionId);

  /// Fired when recently closed tabs and/or windows are changed. This event
  /// does not monitor synced sessions changes.
  external ChromeEvent get onChanged;

  /// The maximum number of $(ref:sessions.Session) that will be included in a
  /// requested list.
  external int get MAX_SESSION_RESULTS;
}

@JS()
@staticInterop
class Filter {}

extension FilterExtension on Filter {
  /// The maximum number of entries to be fetched in the requested list. Omit
  /// this parameter to fetch the maximum number of entries
  /// ($(ref:sessions.MAX_SESSION_RESULTS)).
  external int? maxResults;
}

@JS()
@staticInterop
class Session {}

extension SessionExtension on Session {
  /// The time when the window or tab was closed or modified, represented in
  /// milliseconds since the epoch.
  external int lastModified;

  /// The $(ref:tabs.Tab), if this entry describes a tab. Either this or
  /// $(ref:sessions.Session.window) will be set.
  external Tab? tab;

  /// The $(ref:windows.Window), if this entry describes a window. Either this
  /// or $(ref:sessions.Session.tab) will be set.
  external JSObject? window;
}

@JS()
@staticInterop
class Device {}

extension DeviceExtension on Device {
  external String info;

  /// The name of the foreign device.
  external String deviceName;

  /// A list of open window sessions for the foreign device, sorted from most
  /// recently to least recently modified session.
  external JSArray sessions;
}
