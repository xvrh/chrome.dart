import 'src/internal_helpers.dart';
import 'tabs.dart';
import 'windows.dart';
import 'src/js/sessions.dart' as $js;
export 'chrome.dart';

final _sessions = ChromeSessions._();

extension ChromeSessionsExtension on Chrome {
  ChromeSessions get sessions => _sessions;
}

class ChromeSessions {
  ChromeSessions._();

  /// Gets the list of recently closed tabs and/or windows.
  Future<List<Session>> getRecentlyClosed(Filter? filter) =>
      throw UnimplementedError();

  /// Retrieves all devices with synced sessions.
  Future<List<Device>> getDevices(Filter? filter) => throw UnimplementedError();

  /// Reopens a [windows.Window] or [tabs.Tab], with an optional callback to run
  /// when the entry has been restored.
  Future<Session> restore(String? sessionId) => throw UnimplementedError();

  /// The maximum number of [sessions.Session] that will be included in a
  /// requested list.
  int get maxSessionResults =>
      $js.chrome.sessions.MAX_SESSION_RESULTS as dynamic;

  /// Fired when recently closed tabs and/or windows are changed. This event
  /// does not monitor synced sessions changes.
  Stream<void> get onChanged => throw UnimplementedError();
}

class Filter {
  Filter.fromJS(this._wrapped);

  final $js.Filter _wrapped;

  $js.Filter get toJS => _wrapped;

  /// The maximum number of entries to be fetched in the requested list. Omit
  /// this parameter to fetch the maximum number of entries
  /// ([sessions.MAX_SESSION_RESULTS]).
  int? get maxResults => _wrapped.maxResults;
  set maxResults(int? v) {
    _wrapped.maxResults = v;
  }
}

class Session {
  Session.fromJS(this._wrapped);

  final $js.Session _wrapped;

  $js.Session get toJS => _wrapped;

  /// The time when the window or tab was closed or modified, represented in
  /// milliseconds since the epoch.
  int get lastModified => _wrapped.lastModified;
  set lastModified(int v) {
    _wrapped.lastModified = v;
  }

  /// The [tabs.Tab], if this entry describes a tab. Either this or
  /// [sessions.Session.window] will be set.
  Tab? get tab => _wrapped.tab?.let(Tab.fromJS);
  set tab(Tab? v) {
    _wrapped.tab = v?.toJS;
  }

  /// The [windows.Window], if this entry describes a window. Either this or
  /// [sessions.Session.tab] will be set.
  Window? get window => _wrapped.window?.let(Window.fromJS);
  set window(Window? v) {
    _wrapped.window = v?.toJS;
  }
}

class Device {
  Device.fromJS(this._wrapped);

  final $js.Device _wrapped;

  $js.Device get toJS => _wrapped;

  String get info => _wrapped.info;
  set info(String v) {
    _wrapped.info = v;
  }

  /// The name of the foreign device.
  String get deviceName => _wrapped.deviceName;
  set deviceName(String v) {
    _wrapped.deviceName = v;
  }

  /// A list of open window sessions for the foreign device, sorted from most
  /// recently to least recently modified session.
  List<Session> get sessions => throw UnimplementedError();
  set sessions(List<Session> v) {
    _wrapped.sessions = throw UnimplementedError();
  }
}
