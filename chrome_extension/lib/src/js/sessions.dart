import 'dart:js_interop';

import 'chrome.dart';
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
  external void getRecentlyClosed(
    Filter? filter,
    JSFunction callback,
  );

  /// Retrieves all devices with synced sessions.
  external void getDevices(
    Filter? filter,
    JSFunction callback,
  );

  /// Reopens a [windows.Window] or [tabs.Tab], with an optional callback to run
  /// when the entry has been restored.
  external void restore(
    String? sessionId,
    JSFunction callback,
  );

  /// Fired when recently closed tabs and/or windows are changed. This event
  /// does not monitor synced sessions changes.
  external ChromeEvent get onChanged;

  /// The maximum number of [sessions.Session] that will be included in a
  /// requested list.
  external int get MAX_SESSION_RESULTS;
}

@JS()
@staticInterop
class Filter {}

extension FilterExtension on Filter {
  /// The maximum number of entries to be fetched in the requested list. Omit
  /// this parameter to fetch the maximum number of entries
  /// ([sessions.MAX_SESSION_RESULTS]).
  external int? maxResults;
}

@JS()
@staticInterop
class Session {}

extension SessionExtension on Session {
  /// The time when the window or tab was closed or modified, represented in
  /// milliseconds since the epoch.
  external int lastModified;

  /// The [tabs.Tab], if this entry describes a tab. Either this or
  /// [sessions.Session.window] will be set.
  external Tab? tab;

  /// The [windows.Window], if this entry describes a window. Either this or
  /// [sessions.Session.tab] will be set.
  external Window? window;
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
