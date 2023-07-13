import 'src/internal_helpers.dart';
import 'src/js/browsing_data.dart' as $js;

export 'src/chrome.dart' show chrome;

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
  Future<SettingsCallbackResult> settings() {
    var $completer = Completer<SettingsCallbackResult>();
    $js.chrome.browsingData.settings((SettingsCallbackResult result) {
      $completer.complete(null);
    }.toJS);
    return $completer.future;
  }

  /// Clears various types of browsing data stored in a user's profile.
  Future<void> remove(
    RemovalOptions options,
    DataTypeSet dataToRemove,
  ) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.remove(
      options.toJS,
      dataToRemove.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears websites' appcache data.
  Future<void> removeAppcache(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removeAppcache(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears the browser's cache.
  Future<void> removeCache(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removeCache(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears websites' cache storage data.
  Future<void> removeCacheStorage(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removeCacheStorage(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears the browser's cookies and server-bound certificates modified within
  /// a particular timeframe.
  Future<void> removeCookies(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removeCookies(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears the browser's list of downloaded files (_not_ the downloaded files
  /// themselves).
  Future<void> removeDownloads(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removeDownloads(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears websites' file system data.
  Future<void> removeFileSystems(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removeFileSystems(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears the browser's stored form data (autofill).
  Future<void> removeFormData(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removeFormData(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears the browser's history.
  Future<void> removeHistory(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removeHistory(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears websites' IndexedDB data.
  Future<void> removeIndexedDB(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removeIndexedDB(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears websites' local storage data.
  Future<void> removeLocalStorage(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removeLocalStorage(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears plugins' data.
  Future<void> removePluginData(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removePluginData(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears the browser's stored passwords.
  Future<void> removePasswords(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removePasswords(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears websites' service workers.
  Future<void> removeServiceWorkers(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removeServiceWorkers(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }

  /// Clears websites' WebSQL data.
  Future<void> removeWebSQL(RemovalOptions options) {
    var $completer = Completer<void>();
    $js.chrome.browsingData.removeWebSQL(
      options.toJS,
      () {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }
}

class RemovalOptions {
  RemovalOptions.fromJS(this._wrapped);

  RemovalOptions({
    double? since,
    RemovalOptionsOriginTypes? originTypes,
    List<String>? origins,
    List<String>? excludeOrigins,
  }) : _wrapped = $js.RemovalOptions()
          ..since = since
          ..originTypes = originTypes?.toJS
          ..origins = throw UnimplementedError()
          ..excludeOrigins = throw UnimplementedError();

  final $js.RemovalOptions _wrapped;

  $js.RemovalOptions get toJS => _wrapped;

  /// Remove data accumulated on or after this date, represented in milliseconds
  /// since the epoch (accessible via the `getTime` method of the JavaScript
  /// `Date` object). If absent, defaults to 0 (which would remove all browsing
  /// data).
  double? get since => _wrapped.since;
  set since(double? v) {
    _wrapped.since = v;
  }

  /// An object whose properties specify which origin types ought to be cleared.
  /// If this object isn't specified, it defaults to clearing only "unprotected"
  /// origins. Please ensure that you _really_ want to remove application data
  /// before adding 'protectedWeb' or 'extensions'.
  RemovalOptionsOriginTypes? get originTypes =>
      _wrapped.originTypes?.let(RemovalOptionsOriginTypes.fromJS);
  set originTypes(RemovalOptionsOriginTypes? v) {
    _wrapped.originTypes = v?.toJS;
  }

  /// When present, only data for origins in this list is deleted. Only
  /// supported for cookies, storage and cache. Cookies are cleared for the
  /// whole registrable domain.
  List<String>? get origins =>
      _wrapped.origins?.toDart.cast<String>().map((e) => e).toList();
  set origins(List<String>? v) {
    _wrapped.origins = throw UnimplementedError();
  }

  /// When present, data for origins in this list is excluded from deletion.
  /// Can't be used together with `origins`. Only supported for cookies, storage
  /// and cache.  Cookies are excluded for the whole registrable domain.
  List<String>? get excludeOrigins =>
      _wrapped.excludeOrigins?.toDart.cast<String>().map((e) => e).toList();
  set excludeOrigins(List<String>? v) {
    _wrapped.excludeOrigins = throw UnimplementedError();
  }
}

class DataTypeSet {
  DataTypeSet.fromJS(this._wrapped);

  DataTypeSet({
    bool? appcache,
    bool? cache,
    bool? cacheStorage,
    bool? cookies,
    bool? downloads,
    bool? fileSystems,
    bool? formData,
    bool? history,
    bool? indexedDB,
    bool? localStorage,
    bool? serverBoundCertificates,
    bool? passwords,
    bool? pluginData,
    bool? serviceWorkers,
    bool? webSQL,
  }) : _wrapped = $js.DataTypeSet()
          ..appcache = appcache
          ..cache = cache
          ..cacheStorage = cacheStorage
          ..cookies = cookies
          ..downloads = downloads
          ..fileSystems = fileSystems
          ..formData = formData
          ..history = history
          ..indexedDB = indexedDB
          ..localStorage = localStorage
          ..serverBoundCertificates = serverBoundCertificates
          ..passwords = passwords
          ..pluginData = pluginData
          ..serviceWorkers = serviceWorkers
          ..webSQL = webSQL;

  final $js.DataTypeSet _wrapped;

  $js.DataTypeSet get toJS => _wrapped;

  /// Websites' appcaches.
  bool? get appcache => _wrapped.appcache;
  set appcache(bool? v) {
    _wrapped.appcache = v;
  }

  /// The browser's cache.
  bool? get cache => _wrapped.cache;
  set cache(bool? v) {
    _wrapped.cache = v;
  }

  /// Cache storage
  bool? get cacheStorage => _wrapped.cacheStorage;
  set cacheStorage(bool? v) {
    _wrapped.cacheStorage = v;
  }

  /// The browser's cookies.
  bool? get cookies => _wrapped.cookies;
  set cookies(bool? v) {
    _wrapped.cookies = v;
  }

  /// The browser's download list.
  bool? get downloads => _wrapped.downloads;
  set downloads(bool? v) {
    _wrapped.downloads = v;
  }

  /// Websites' file systems.
  bool? get fileSystems => _wrapped.fileSystems;
  set fileSystems(bool? v) {
    _wrapped.fileSystems = v;
  }

  /// The browser's stored form data.
  bool? get formData => _wrapped.formData;
  set formData(bool? v) {
    _wrapped.formData = v;
  }

  /// The browser's history.
  bool? get history => _wrapped.history;
  set history(bool? v) {
    _wrapped.history = v;
  }

  /// Websites' IndexedDB data.
  bool? get indexedDB => _wrapped.indexedDB;
  set indexedDB(bool? v) {
    _wrapped.indexedDB = v;
  }

  /// Websites' local storage data.
  bool? get localStorage => _wrapped.localStorage;
  set localStorage(bool? v) {
    _wrapped.localStorage = v;
  }

  /// Server-bound certificates.
  bool? get serverBoundCertificates => _wrapped.serverBoundCertificates;
  set serverBoundCertificates(bool? v) {
    _wrapped.serverBoundCertificates = v;
  }

  /// Stored passwords.
  bool? get passwords => _wrapped.passwords;
  set passwords(bool? v) {
    _wrapped.passwords = v;
  }

  /// Plugins' data.
  bool? get pluginData => _wrapped.pluginData;
  set pluginData(bool? v) {
    _wrapped.pluginData = v;
  }

  /// Service Workers.
  bool? get serviceWorkers => _wrapped.serviceWorkers;
  set serviceWorkers(bool? v) {
    _wrapped.serviceWorkers = v;
  }

  /// Websites' WebSQL data.
  bool? get webSQL => _wrapped.webSQL;
  set webSQL(bool? v) {
    _wrapped.webSQL = v;
  }
}

class SettingsCallbackResult {
  SettingsCallbackResult.fromJS(this._wrapped);

  SettingsCallbackResult({
    required RemovalOptions options,
    required DataTypeSet dataToRemove,
    required DataTypeSet dataRemovalPermitted,
  }) : _wrapped = $js.SettingsCallbackResult()
          ..options = options.toJS
          ..dataToRemove = dataToRemove.toJS
          ..dataRemovalPermitted = dataRemovalPermitted.toJS;

  final $js.SettingsCallbackResult _wrapped;

  $js.SettingsCallbackResult get toJS => _wrapped;

  RemovalOptions get options => RemovalOptions.fromJS(_wrapped.options);
  set options(RemovalOptions v) {
    _wrapped.options = v.toJS;
  }

  /// All of the types will be present in the result, with values of `true` if
  /// they are both selected to be removed and permitted to be removed,
  /// otherwise `false`.
  DataTypeSet get dataToRemove => DataTypeSet.fromJS(_wrapped.dataToRemove);
  set dataToRemove(DataTypeSet v) {
    _wrapped.dataToRemove = v.toJS;
  }

  /// All of the types will be present in the result, with values of `true` if
  /// they are permitted to be removed (e.g., by enterprise policy) and `false`
  /// if not.
  DataTypeSet get dataRemovalPermitted =>
      DataTypeSet.fromJS(_wrapped.dataRemovalPermitted);
  set dataRemovalPermitted(DataTypeSet v) {
    _wrapped.dataRemovalPermitted = v.toJS;
  }
}

class RemovalOptionsOriginTypes {
  RemovalOptionsOriginTypes.fromJS(this._wrapped);

  RemovalOptionsOriginTypes({
    bool? unprotectedWeb,
    bool? protectedWeb,
    bool? extension,
  }) : _wrapped = $js.RemovalOptionsOriginTypes()
          ..unprotectedWeb = unprotectedWeb
          ..protectedWeb = protectedWeb
          ..extension = extension;

  final $js.RemovalOptionsOriginTypes _wrapped;

  $js.RemovalOptionsOriginTypes get toJS => _wrapped;

  /// Normal websites.
  bool? get unprotectedWeb => _wrapped.unprotectedWeb;
  set unprotectedWeb(bool? v) {
    _wrapped.unprotectedWeb = v;
  }

  /// Websites that have been installed as hosted applications (be careful!).
  bool? get protectedWeb => _wrapped.protectedWeb;
  set protectedWeb(bool? v) {
    _wrapped.protectedWeb = v;
  }

  /// Extensions and packaged applications a user has installed (be _really_
  /// careful!).
  bool? get extension => _wrapped.extension;
  set extension(bool? v) {
    _wrapped.extension = v;
  }
}
