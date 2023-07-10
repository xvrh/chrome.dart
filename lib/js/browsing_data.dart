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
  external JSPromise settings();

  /// Clears various types of browsing data stored in a user's profile.
  external JSPromise remove(
    RemovalOptions options,
    DataTypeSet dataToRemove,
  );

  /// Clears websites' appcache data.
  external JSPromise removeAppcache(RemovalOptions options);

  /// Clears the browser's cache.
  external JSPromise removeCache(RemovalOptions options);

  /// Clears websites' cache storage data.
  external JSPromise removeCacheStorage(RemovalOptions options);

  /// Clears the browser's cookies and server-bound certificates modified within
  /// a particular timeframe.
  external JSPromise removeCookies(RemovalOptions options);

  /// Clears the browser's list of downloaded files (<em>not</em> the downloaded
  /// files themselves).
  external JSPromise removeDownloads(RemovalOptions options);

  /// Clears websites' file system data.
  external JSPromise removeFileSystems(RemovalOptions options);

  /// Clears the browser's stored form data (autofill).
  external JSPromise removeFormData(RemovalOptions options);

  /// Clears the browser's history.
  external JSPromise removeHistory(RemovalOptions options);

  /// Clears websites' IndexedDB data.
  external JSPromise removeIndexedDB(RemovalOptions options);

  /// Clears websites' local storage data.
  external JSPromise removeLocalStorage(RemovalOptions options);

  /// Clears plugins' data.
  external JSPromise removePluginData(RemovalOptions options);

  /// Clears the browser's stored passwords.
  external JSPromise removePasswords(RemovalOptions options);

  /// Clears websites' service workers.
  external JSPromise removeServiceWorkers(RemovalOptions options);

  /// Clears websites' WebSQL data.
  external JSPromise removeWebSQL(RemovalOptions options);
}

@JS()
@staticInterop
class RemovalOptions {
  /// Remove data accumulated on or after this date, represented in milliseconds
  /// since the epoch (accessible via the `getTime` method of the JavaScript
  /// `Date` object). If absent, defaults to 0 (which would remove all browsing
  /// data).
  external num? get since;

  /// An object whose properties specify which origin types ought to be cleared.
  /// If this object isn't specified, it defaults to clearing only "unprotected"
  /// origins. Please ensure that you <em>really</em> want to remove application
  /// data before adding 'protectedWeb' or 'extensions'.
  external RemovalOptionsOriginTypes? get originTypes;

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
  external bool? get appcache;

  /// The browser's cache.
  external bool? get cache;

  /// Cache storage
  external bool? get cacheStorage;

  /// The browser's cookies.
  external bool? get cookies;

  /// The browser's download list.
  external bool? get downloads;

  /// Websites' file systems.
  external bool? get fileSystems;

  /// The browser's stored form data.
  external bool? get formData;

  /// The browser's history.
  external bool? get history;

  /// Websites' IndexedDB data.
  external bool? get indexedDB;

  /// Websites' local storage data.
  external bool? get localStorage;

  /// Server-bound certificates.
  external bool? get serverBoundCertificates;

  /// Stored passwords.
  external bool? get passwords;

  /// Plugins' data.
  external bool? get pluginData;

  /// Service Workers.
  external bool? get serviceWorkers;

  /// Websites' WebSQL data.
  external bool? get webSQL;
}

@JS()
@staticInterop
class RemovalOptionsOriginTypes {
  /// Normal websites.
  external bool? get unprotectedWeb;

  /// Websites that have been installed as hosted applications (be careful!).
  external bool? get protectedWeb;

  /// Extensions and packaged applications a user has installed (be _really_
  /// careful!).
  external bool? get extension;
}
