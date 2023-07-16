import 'dart:js_interop';

import 'chrome.dart';

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
  external void settings(JSFunction callback);

  /// Clears various types of browsing data stored in a user's profile.
  external void remove(
    RemovalOptions options,

    /// The set of data types to remove.
    DataTypeSet dataToRemove,

    /// Called when deletion has completed.
    JSFunction? callback,
  );

  /// Clears websites' appcache data.
  external void removeAppcache(
    RemovalOptions options,

    /// Called when websites' appcache data has been cleared.
    JSFunction? callback,
  );

  /// Clears the browser's cache.
  external void removeCache(
    RemovalOptions options,

    /// Called when the browser's cache has been cleared.
    JSFunction? callback,
  );

  /// Clears websites' cache storage data.
  external void removeCacheStorage(
    RemovalOptions options,

    /// Called when websites' cache storage has been cleared.
    JSFunction? callback,
  );

  /// Clears the browser's cookies and server-bound certificates modified within
  /// a particular timeframe.
  external void removeCookies(
    RemovalOptions options,

    /// Called when the browser's cookies and server-bound certificates have
    /// been cleared.
    JSFunction? callback,
  );

  /// Clears the browser's list of downloaded files (_not_ the downloaded files
  /// themselves).
  external void removeDownloads(
    RemovalOptions options,

    /// Called when the browser's list of downloaded files has been cleared.
    JSFunction? callback,
  );

  /// Clears websites' file system data.
  external void removeFileSystems(
    RemovalOptions options,

    /// Called when websites' file systems have been cleared.
    JSFunction? callback,
  );

  /// Clears the browser's stored form data (autofill).
  external void removeFormData(
    RemovalOptions options,

    /// Called when the browser's form data has been cleared.
    JSFunction? callback,
  );

  /// Clears the browser's history.
  external void removeHistory(
    RemovalOptions options,

    /// Called when the browser's history has cleared.
    JSFunction? callback,
  );

  /// Clears websites' IndexedDB data.
  external void removeIndexedDB(
    RemovalOptions options,

    /// Called when websites' IndexedDB data has been cleared.
    JSFunction? callback,
  );

  /// Clears websites' local storage data.
  external void removeLocalStorage(
    RemovalOptions options,

    /// Called when websites' local storage has been cleared.
    JSFunction? callback,
  );

  /// Clears plugins' data.
  external void removePluginData(
    RemovalOptions options,

    /// Called when plugins' data has been cleared.
    JSFunction? callback,
  );

  /// Clears the browser's stored passwords.
  external void removePasswords(
    RemovalOptions options,

    /// Called when the browser's passwords have been cleared.
    JSFunction? callback,
  );

  /// Clears websites' service workers.
  external void removeServiceWorkers(
    RemovalOptions options,

    /// Called when websites' service workers have been cleared.
    JSFunction? callback,
  );

  /// Clears websites' WebSQL data.
  external void removeWebSQL(
    RemovalOptions options,

    /// Called when websites' WebSQL databases have been cleared.
    JSFunction? callback,
  );
}

@JS()
@staticInterop
class RemovalOptions {}

extension RemovalOptionsExtension on RemovalOptions {
  /// Remove data accumulated on or after this date, represented in milliseconds
  /// since the epoch (accessible via the `getTime` method of the JavaScript
  /// `Date` object). If absent, defaults to 0 (which would remove all browsing
  /// data).
  external double? since;

  /// An object whose properties specify which origin types ought to be cleared.
  /// If this object isn't specified, it defaults to clearing only "unprotected"
  /// origins. Please ensure that you _really_ want to remove application data
  /// before adding 'protectedWeb' or 'extensions'.
  external RemovalOptionsOriginTypes? originTypes;

  /// When present, only data for origins in this list is deleted. Only
  /// supported for cookies, storage and cache. Cookies are cleared for the
  /// whole registrable domain.
  external JSArray? origins;

  /// When present, data for origins in this list is excluded from deletion.
  /// Can't be used together with `origins`. Only supported for cookies, storage
  /// and cache.  Cookies are excluded for the whole registrable domain.
  external JSArray? excludeOrigins;
}

@JS()
@staticInterop
class DataTypeSet {}

extension DataTypeSetExtension on DataTypeSet {
  /// Websites' appcaches.
  external bool? appcache;

  /// The browser's cache.
  external bool? cache;

  /// Cache storage
  external bool? cacheStorage;

  /// The browser's cookies.
  external bool? cookies;

  /// The browser's download list.
  external bool? downloads;

  /// Websites' file systems.
  external bool? fileSystems;

  /// The browser's stored form data.
  external bool? formData;

  /// The browser's history.
  external bool? history;

  /// Websites' IndexedDB data.
  external bool? indexedDB;

  /// Websites' local storage data.
  external bool? localStorage;

  /// Server-bound certificates.
  external bool? serverBoundCertificates;

  /// Stored passwords.
  external bool? passwords;

  /// Plugins' data.
  external bool? pluginData;

  /// Service Workers.
  external bool? serviceWorkers;

  /// Websites' WebSQL data.
  external bool? webSQL;
}

@JS()
@staticInterop
class SettingsCallbackResult {}

extension SettingsCallbackResultExtension on SettingsCallbackResult {
  external RemovalOptions options;

  /// All of the types will be present in the result, with values of `true` if
  /// they are both selected to be removed and permitted to be removed,
  /// otherwise `false`.
  external DataTypeSet dataToRemove;

  /// All of the types will be present in the result, with values of `true` if
  /// they are permitted to be removed (e.g., by enterprise policy) and `false`
  /// if not.
  external DataTypeSet dataRemovalPermitted;
}

@JS()
@staticInterop
class RemovalOptionsOriginTypes {}

extension RemovalOptionsOriginTypesExtension on RemovalOptionsOriginTypes {
  /// Normal websites.
  external bool? unprotectedWeb;

  /// Websites that have been installed as hosted applications (be careful!).
  external bool? protectedWeb;

  /// Extensions and packaged applications a user has installed (be _really_
  /// careful!).
  external bool? extension;
}
