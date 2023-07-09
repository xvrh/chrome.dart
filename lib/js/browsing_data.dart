import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSBrowsingDataExtension on JSChrome {
  /// Use the `chrome.browsingData` API to remove browsing data from a user's
  /// local profile.
  external JSBrowsingData get BrowsingData;
}

@JS()
@staticInterop
class JSBrowsingData {}

extension JSBrowsingDataExtension on JSBrowsingData {
  /// Reports which types of data are currently selected in the 'Clear browsing
  /// data' settings UI.  Note: some of the data types included in this API are
  /// not available in the settings UI, and some UI settings control more than
  /// one data type listed here.
  external void settings();

  /// Clears various types of browsing data stored in a user's profile.
  external void remove();

  /// Clears websites' appcache data.
  external void removeAppcache();

  /// Clears the browser's cache.
  external void removeCache();

  /// Clears websites' cache storage data.
  external void removeCacheStorage();

  /// Clears the browser's cookies and server-bound certificates modified within
  /// a particular timeframe.
  external void removeCookies();

  /// Clears the browser's list of downloaded files (<em>not</em> the downloaded
  /// files themselves).
  external void removeDownloads();

  /// Clears websites' file system data.
  external void removeFileSystems();

  /// Clears the browser's stored form data (autofill).
  external void removeFormData();

  /// Clears the browser's history.
  external void removeHistory();

  /// Clears websites' IndexedDB data.
  external void removeIndexedDB();

  /// Clears websites' local storage data.
  external void removeLocalStorage();

  /// Clears plugins' data.
  external void removePluginData();

  /// Clears the browser's stored passwords.
  external void removePasswords();

  /// Clears websites' service workers.
  external void removeServiceWorkers();

  /// Clears websites' WebSQL data.
  external void removeWebSQL();
}
