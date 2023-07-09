import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSBrowsingDataExtension on JSChrome {
  /// Use the `chrome.browsingData` API to remove browsing data from a user's
  /// local profile.
  external JSBrowsingData get browsingData;
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
  external void remove(
    options,
    dataToRemove,
  );

  /// Clears websites' appcache data.
  external void removeAppcache(options);

  /// Clears the browser's cache.
  external void removeCache(options);

  /// Clears websites' cache storage data.
  external void removeCacheStorage(options);

  /// Clears the browser's cookies and server-bound certificates modified within
  /// a particular timeframe.
  external void removeCookies(options);

  /// Clears the browser's list of downloaded files (<em>not</em> the downloaded
  /// files themselves).
  external void removeDownloads(options);

  /// Clears websites' file system data.
  external void removeFileSystems(options);

  /// Clears the browser's stored form data (autofill).
  external void removeFormData(options);

  /// Clears the browser's history.
  external void removeHistory(options);

  /// Clears websites' IndexedDB data.
  external void removeIndexedDB(options);

  /// Clears websites' local storage data.
  external void removeLocalStorage(options);

  /// Clears plugins' data.
  external void removePluginData(options);

  /// Clears the browser's stored passwords.
  external void removePasswords(options);

  /// Clears websites' service workers.
  external void removeServiceWorkers(options);

  /// Clears websites' WebSQL data.
  external void removeWebSQL(options);
}

@JS()
@staticInterop
class RemovalOptions {
  /// Remove data accumulated on or after this date, represented in milliseconds
  /// since the epoch (accessible via the `getTime` method of the JavaScript
  /// `Date` object). If absent, defaults to 0 (which would remove all browsing
  /// data).
  external JSAny? get since;

  /// An object whose properties specify which origin types ought to be cleared.
  /// If this object isn't specified, it defaults to clearing only "unprotected"
  /// origins. Please ensure that you <em>really</em> want to remove application
  /// data before adding 'protectedWeb' or 'extensions'.
  external JSAny? get originTypes;

  /// When present, only data for origins in this list is deleted. Only
  /// supported for cookies, storage and cache. Cookies are cleared for the
  /// whole registrable domain.
  external JSArray? get origins;

  /// When present, data for origins in this list is excluded from deletion.
  /// Can't be used together with `origins`. Only supported for cookies, storage
  /// and cache.  Cookies are excluded for the whole registrable domain.
  external JSArray? get excludeOrigins;
}

@JS()
@staticInterop
class DataTypeSet {
  /// Websites' appcaches.
  external JSAny? get appcache;

  /// The browser's cache.
  external JSAny? get cache;

  /// Cache storage
  external JSAny? get cacheStorage;

  /// The browser's cookies.
  external JSAny? get cookies;

  /// The browser's download list.
  external JSAny? get downloads;

  /// Websites' file systems.
  external JSAny? get fileSystems;

  /// The browser's stored form data.
  external JSAny? get formData;

  /// The browser's history.
  external JSAny? get history;

  /// Websites' IndexedDB data.
  external JSAny? get indexedDB;

  /// Websites' local storage data.
  external JSAny? get localStorage;

  /// Server-bound certificates.
  external JSAny? get serverBoundCertificates;

  /// Stored passwords.
  external JSAny? get passwords;

  /// Plugins' data.
  external JSAny? get pluginData;

  /// Service Workers.
  external JSAny? get serviceWorkers;

  /// Websites' WebSQL data.
  external JSAny? get webSQL;
}
