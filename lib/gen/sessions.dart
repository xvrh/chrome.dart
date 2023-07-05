/* This file has been generated from sessions.json - do not edit */

/**
 * Use the `chrome.sessions` API to query and restore tabs and windows from a
 * browsing session.
 */
library chrome.sessions;

import 'tabs.dart';
import 'windows.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.sessions` namespace.
 */
final ChromeSessions sessions = ChromeSessions._();

class ChromeSessions extends ChromeApi {
  JsObject get _sessions => chrome['sessions'];

  /**
   * Fired when recently closed tabs and/or windows are changed. This event does
   * not monitor synced sessions changes.
   */
  Stream get onChanged => _onChanged.stream;
  late ChromeStreamController _onChanged;

  ChromeSessions._() {
    var getApi = () => _sessions;
    _onChanged = new ChromeStreamController.noArgs(getApi, 'onChanged');
  }

  bool get available => _sessions != null;

  /**
   * The maximum number of [sessions.Session] that will be included in a
   * requested list.
   */
  int get MAX_SESSION_RESULTS => _sessions['MAX_SESSION_RESULTS'];

  /**
   * Gets the list of recently closed tabs and/or windows.
   */
  void getRecentlyClosed([Filter? filter]) {
    if (_sessions == null) _throwNotAvailable();

    _sessions.callMethod('getRecentlyClosed', [jsify(filter)]);
  }

  /**
   * Retrieves all devices with synced sessions.
   */
  void getDevices([Filter? filter]) {
    if (_sessions == null) _throwNotAvailable();

    _sessions.callMethod('getDevices', [jsify(filter)]);
  }

  /**
   * Reopens a [windows.Window] or [tabs.Tab], with an optional callback to run
   * when the entry has been restored.
   * 
   * [sessionId] The [windows.Window.sessionId], or [tabs.Tab.sessionId] to
   * restore. If this parameter is not specified, the most recently closed
   * session is restored.
   */
  void restore([String? sessionId]) {
    if (_sessions == null) _throwNotAvailable();

    _sessions.callMethod('restore', [sessionId]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.sessions' is not available");
  }
}

class Filter extends ChromeObject {
  Filter({int? maxResults}) {
    if (maxResults != null) this.maxResults = maxResults;
  }
  Filter.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The maximum number of entries to be fetched in the requested list. Omit
   * this parameter to fetch the maximum number of entries
   * ([sessions.MAX_SESSION_RESULTS]).
   */
  int get maxResults => jsProxy['maxResults'];
  set maxResults(int value) => jsProxy['maxResults'] = value;
}

class Session extends ChromeObject {
  Session({int? lastModified, Tab? tab, Window? window}) {
    if (lastModified != null) this.lastModified = lastModified;
    if (tab != null) this.tab = tab;
    if (window != null) this.window = window;
  }
  Session.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The time when the window or tab was closed or modified, represented in
   * milliseconds since the epoch.
   */
  int get lastModified => jsProxy['lastModified'];
  set lastModified(int value) => jsProxy['lastModified'] = value;

  /**
   * The [tabs.Tab], if this entry describes a tab. Either this or
   * [sessions.Session.window] will be set.
   */
  Tab get tab => _createTab(jsProxy['tab']);
  set tab(Tab value) => jsProxy['tab'] = jsify(value);

  /**
   * The [windows.Window], if this entry describes a window. Either this or
   * [sessions.Session.tab] will be set.
   */
  Window get window => _createWindow(jsProxy['window']);
  set window(Window value) => jsProxy['window'] = jsify(value);
}

class Device extends ChromeObject {
  Device({String? deviceName, List<Session>? sessions}) {
    if (deviceName != null) this.deviceName = deviceName;
    if (sessions != null) this.sessions = sessions;
  }
  Device.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The name of the foreign device.
   */
  String get deviceName => jsProxy['deviceName'];
  set deviceName(String value) => jsProxy['deviceName'] = value;

  /**
   * A list of open window sessions for the foreign device, sorted from most
   * recently to least recently modified session.
   */
  List<Session> get sessions => listify(jsProxy['sessions'], _createSession);
  set sessions(List<Session> value) => jsProxy['sessions'] = jsify(value);
}

Tab _createTab(JsObject jsProxy) => Tab.fromProxy(jsProxy);
Window _createWindow(JsObject jsProxy) => Window.fromProxy(jsProxy);
Session _createSession(JsObject jsProxy) => Session.fromProxy(jsProxy);
