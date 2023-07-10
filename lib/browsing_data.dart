import 'chrome.dart';
export 'chrome.dart';

final _browsingData = ChromeBrowsingData._();

extension ChromeBrowsingDataExtension on Chrome {
  ChromeBrowsingData get browsingData => _browsingData;
}

class ChromeBrowsingData {
  ChromeBrowsingData._();

  /// Reports which types of data are currently selected in the 'Clear browsing
  /// data' settings UI.  Note: some of the data types included in this API are
  /// not available in the settings UI, and some UI settings control more than
  /// one data type listed here.
  void settings() => throw UnimplementedError();

  /// Clears various types of browsing data stored in a user's profile.
  void remove(
    options,
    dataToRemove,
  ) =>
      throw UnimplementedError();

  /// Clears websites' appcache data.
  void removeAppcache(options) => throw UnimplementedError();

  /// Clears the browser's cache.
  void removeCache(options) => throw UnimplementedError();

  /// Clears websites' cache storage data.
  void removeCacheStorage(options) => throw UnimplementedError();

  /// Clears the browser's cookies and server-bound certificates modified within
  /// a particular timeframe.
  void removeCookies(options) => throw UnimplementedError();

  /// Clears the browser's list of downloaded files (<em>not</em> the downloaded
  /// files themselves).
  void removeDownloads(options) => throw UnimplementedError();

  /// Clears websites' file system data.
  void removeFileSystems(options) => throw UnimplementedError();

  /// Clears the browser's stored form data (autofill).
  void removeFormData(options) => throw UnimplementedError();

  /// Clears the browser's history.
  void removeHistory(options) => throw UnimplementedError();

  /// Clears websites' IndexedDB data.
  void removeIndexedDB(options) => throw UnimplementedError();

  /// Clears websites' local storage data.
  void removeLocalStorage(options) => throw UnimplementedError();

  /// Clears plugins' data.
  void removePluginData(options) => throw UnimplementedError();

  /// Clears the browser's stored passwords.
  void removePasswords(options) => throw UnimplementedError();

  /// Clears websites' service workers.
  void removeServiceWorkers(options) => throw UnimplementedError();

  /// Clears websites' WebSQL data.
  void removeWebSQL(options) => throw UnimplementedError();
}
