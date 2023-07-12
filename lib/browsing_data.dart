import 'src/internal_helpers.dart';
import 'src/js/browsing_data.dart' as $js;
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
  Future<SettingsCallbackResult> settings() => throw UnimplementedError();

  /// Clears various types of browsing data stored in a user's profile.
  Future<void> remove(
    RemovalOptions options,
    DataTypeSet dataToRemove,
  ) =>
      throw UnimplementedError();

  /// Clears websites' appcache data.
  Future<void> removeAppcache(RemovalOptions options) =>
      throw UnimplementedError();

  /// Clears the browser's cache.
  Future<void> removeCache(RemovalOptions options) =>
      throw UnimplementedError();

  /// Clears websites' cache storage data.
  Future<void> removeCacheStorage(RemovalOptions options) =>
      throw UnimplementedError();

  /// Clears the browser's cookies and server-bound certificates modified within
  /// a particular timeframe.
  Future<void> removeCookies(RemovalOptions options) =>
      throw UnimplementedError();

  /// Clears the browser's list of downloaded files (_not_ the downloaded files
  /// themselves).
  Future<void> removeDownloads(RemovalOptions options) =>
      throw UnimplementedError();

  /// Clears websites' file system data.
  Future<void> removeFileSystems(RemovalOptions options) =>
      throw UnimplementedError();

  /// Clears the browser's stored form data (autofill).
  Future<void> removeFormData(RemovalOptions options) =>
      throw UnimplementedError();

  /// Clears the browser's history.
  Future<void> removeHistory(RemovalOptions options) =>
      throw UnimplementedError();

  /// Clears websites' IndexedDB data.
  Future<void> removeIndexedDB(RemovalOptions options) =>
      throw UnimplementedError();

  /// Clears websites' local storage data.
  Future<void> removeLocalStorage(RemovalOptions options) =>
      throw UnimplementedError();

  /// Clears plugins' data.
  Future<void> removePluginData(RemovalOptions options) =>
      throw UnimplementedError();

  /// Clears the browser's stored passwords.
  Future<void> removePasswords(RemovalOptions options) =>
      throw UnimplementedError();

  /// Clears websites' service workers.
  Future<void> removeServiceWorkers(RemovalOptions options) =>
      throw UnimplementedError();

  /// Clears websites' WebSQL data.
  Future<void> removeWebSQL(RemovalOptions options) =>
      throw UnimplementedError();
}

class RemovalOptions {
  RemovalOptions.fromJS(this._wrapped);

  final $js.RemovalOptions _wrapped;

  $js.RemovalOptions get toJS => _wrapped;

  /// Remove data accumulated on or after this date, represented in milliseconds
  /// since the epoch (accessible via the `getTime` method of the JavaScript
  /// `Date` object). If absent, defaults to 0 (which would remove all browsing
  /// data).
  double? get since => _wrapped.since;
  set since(double? v) {
    throw UnimplementedError();
  }

  /// An object whose properties specify which origin types ought to be cleared.
  /// If this object isn't specified, it defaults to clearing only "unprotected"
  /// origins. Please ensure that you _really_ want to remove application data
  /// before adding 'protectedWeb' or 'extensions'.
  RemovalOptionsOriginTypes? get originTypes =>
      _wrapped.originTypes?.let(RemovalOptionsOriginTypes.fromJS);
  set originTypes(RemovalOptionsOriginTypes? v) {
    throw UnimplementedError();
  }

  /// When present, only data for origins in this list is deleted. Only
  /// supported for cookies, storage and cache. Cookies are cleared for the
  /// whole registrable domain.
  List<String>? get origins => throw UnimplementedError();
  set origins(List<String>? v) {
    throw UnimplementedError();
  }

  /// When present, data for origins in this list is excluded from deletion.
  /// Can't be used together with `origins`. Only supported for cookies, storage
  /// and cache.  Cookies are excluded for the whole registrable domain.
  List<String>? get excludeOrigins => throw UnimplementedError();
  set excludeOrigins(List<String>? v) {
    throw UnimplementedError();
  }
}

class DataTypeSet {
  DataTypeSet.fromJS(this._wrapped);

  final $js.DataTypeSet _wrapped;

  $js.DataTypeSet get toJS => _wrapped;

  /// Websites' appcaches.
  bool? get appcache => _wrapped.appcache;
  set appcache(bool? v) {
    throw UnimplementedError();
  }

  /// The browser's cache.
  bool? get cache => _wrapped.cache;
  set cache(bool? v) {
    throw UnimplementedError();
  }

  /// Cache storage
  bool? get cacheStorage => _wrapped.cacheStorage;
  set cacheStorage(bool? v) {
    throw UnimplementedError();
  }

  /// The browser's cookies.
  bool? get cookies => _wrapped.cookies;
  set cookies(bool? v) {
    throw UnimplementedError();
  }

  /// The browser's download list.
  bool? get downloads => _wrapped.downloads;
  set downloads(bool? v) {
    throw UnimplementedError();
  }

  /// Websites' file systems.
  bool? get fileSystems => _wrapped.fileSystems;
  set fileSystems(bool? v) {
    throw UnimplementedError();
  }

  /// The browser's stored form data.
  bool? get formData => _wrapped.formData;
  set formData(bool? v) {
    throw UnimplementedError();
  }

  /// The browser's history.
  bool? get history => _wrapped.history;
  set history(bool? v) {
    throw UnimplementedError();
  }

  /// Websites' IndexedDB data.
  bool? get indexedDB => _wrapped.indexedDB;
  set indexedDB(bool? v) {
    throw UnimplementedError();
  }

  /// Websites' local storage data.
  bool? get localStorage => _wrapped.localStorage;
  set localStorage(bool? v) {
    throw UnimplementedError();
  }

  /// Server-bound certificates.
  bool? get serverBoundCertificates => _wrapped.serverBoundCertificates;
  set serverBoundCertificates(bool? v) {
    throw UnimplementedError();
  }

  /// Stored passwords.
  bool? get passwords => _wrapped.passwords;
  set passwords(bool? v) {
    throw UnimplementedError();
  }

  /// Plugins' data.
  bool? get pluginData => _wrapped.pluginData;
  set pluginData(bool? v) {
    throw UnimplementedError();
  }

  /// Service Workers.
  bool? get serviceWorkers => _wrapped.serviceWorkers;
  set serviceWorkers(bool? v) {
    throw UnimplementedError();
  }

  /// Websites' WebSQL data.
  bool? get webSQL => _wrapped.webSQL;
  set webSQL(bool? v) {
    throw UnimplementedError();
  }
}

class SettingsCallbackResult {
  SettingsCallbackResult.fromJS(this._wrapped);

  final $js.SettingsCallbackResult _wrapped;

  $js.SettingsCallbackResult get toJS => _wrapped;

  RemovalOptions get options => RemovalOptions.fromJS(_wrapped.options);
  set options(RemovalOptions v) {
    throw UnimplementedError();
  }

  /// All of the types will be present in the result, with values of `true` if
  /// they are both selected to be removed and permitted to be removed,
  /// otherwise `false`.
  DataTypeSet get dataToRemove => DataTypeSet.fromJS(_wrapped.dataToRemove);
  set dataToRemove(DataTypeSet v) {
    throw UnimplementedError();
  }

  /// All of the types will be present in the result, with values of `true` if
  /// they are permitted to be removed (e.g., by enterprise policy) and `false`
  /// if not.
  DataTypeSet get dataRemovalPermitted =>
      DataTypeSet.fromJS(_wrapped.dataRemovalPermitted);
  set dataRemovalPermitted(DataTypeSet v) {
    throw UnimplementedError();
  }
}

class RemovalOptionsOriginTypes {
  RemovalOptionsOriginTypes.fromJS(this._wrapped);

  final $js.RemovalOptionsOriginTypes _wrapped;

  $js.RemovalOptionsOriginTypes get toJS => _wrapped;

  /// Normal websites.
  bool? get unprotectedWeb => _wrapped.unprotectedWeb;
  set unprotectedWeb(bool? v) {
    throw UnimplementedError();
  }

  /// Websites that have been installed as hosted applications (be careful!).
  bool? get protectedWeb => _wrapped.protectedWeb;
  set protectedWeb(bool? v) {
    throw UnimplementedError();
  }

  /// Extensions and packaged applications a user has installed (be _really_
  /// careful!).
  bool? get extension => _wrapped.extension;
  set extension(bool? v) {
    throw UnimplementedError();
  }
}
