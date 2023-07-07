/* This file has been generated from browsing_data.json - do not edit */

/**
 * Use the `chrome.browsingData` API to remove browsing data from a user's local
 * profile.
 */
library chrome.browsingData;

import '../src/common.dart';

/**
 * Accessor for the `chrome.browsingData` namespace.
 */
final ChromeBrowsingData browsingData = ChromeBrowsingData._();

class ChromeBrowsingData extends ChromeApi {
  JsObject get _browsingData => chrome['browsingData'];

  ChromeBrowsingData._();

  bool get available => _browsingData != null;

  /**
   * Reports which types of data are currently selected in the 'Clear browsing
   * data' settings UI.  Note: some of the data types included in this API are
   * not available in the settings UI, and some UI settings control more than
   * one data type listed here.
   */
  void settings() {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('settings');
  }

  /**
   * Clears various types of browsing data stored in a user's profile.
   * 
   * [dataToRemove] The set of data types to remove.
   */
  void remove(RemovalOptions options, DataTypeSet dataToRemove) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('remove', [jsify(options), jsify(dataToRemove)]);
  }

  /**
   * Clears websites' appcache data.
   */
  void removeAppcache(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removeAppcache', [jsify(options)]);
  }

  /**
   * Clears the browser's cache.
   */
  void removeCache(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removeCache', [jsify(options)]);
  }

  /**
   * Clears websites' cache storage data.
   */
  void removeCacheStorage(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removeCacheStorage', [jsify(options)]);
  }

  /**
   * Clears the browser's cookies and server-bound certificates modified within
   * a particular timeframe.
   */
  void removeCookies(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removeCookies', [jsify(options)]);
  }

  /**
   * Clears the browser's list of downloaded files (_not_ the downloaded files
   * themselves).
   */
  void removeDownloads(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removeDownloads', [jsify(options)]);
  }

  /**
   * Clears websites' file system data.
   */
  void removeFileSystems(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removeFileSystems', [jsify(options)]);
  }

  /**
   * Clears the browser's stored form data (autofill).
   */
  void removeFormData(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removeFormData', [jsify(options)]);
  }

  /**
   * Clears the browser's history.
   */
  void removeHistory(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removeHistory', [jsify(options)]);
  }

  /**
   * Clears websites' IndexedDB data.
   */
  void removeIndexedDB(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removeIndexedDB', [jsify(options)]);
  }

  /**
   * Clears websites' local storage data.
   */
  void removeLocalStorage(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removeLocalStorage', [jsify(options)]);
  }

  /**
   * Clears plugins' data.
   */
  void removePluginData(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removePluginData', [jsify(options)]);
  }

  /**
   * Clears the browser's stored passwords.
   */
  void removePasswords(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removePasswords', [jsify(options)]);
  }

  /**
   * Clears websites' service workers.
   */
  void removeServiceWorkers(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removeServiceWorkers', [jsify(options)]);
  }

  /**
   * Clears websites' WebSQL data.
   */
  void removeWebSQL(RemovalOptions options) {
    if (_browsingData == null) _throwNotAvailable();

    _browsingData.callMethod('removeWebSQL', [jsify(options)]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.browsingData' is not available");
  }
}

class OriginTypesBrowsingData extends ChromeObject {
  OriginTypesBrowsingData({bool? unprotectedWeb, bool? protectedWeb, bool? extension}) {
    if (unprotectedWeb != null) this.unprotectedWeb = unprotectedWeb;
    if (protectedWeb != null) this.protectedWeb = protectedWeb;
    if (extension != null) this.extension = extension;
  }
  OriginTypesBrowsingData.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Normal websites.
   */
  bool get unprotectedWeb => jsProxy['unprotectedWeb'];
  set unprotectedWeb(bool value) => jsProxy['unprotectedWeb'] = value;

  /**
   * Websites that have been installed as hosted applications (be careful!).
   */
  bool get protectedWeb => jsProxy['protectedWeb'];
  set protectedWeb(bool value) => jsProxy['protectedWeb'] = value;

  /**
   * Extensions and packaged applications a user has installed (be _really_
   * careful!).
   */
  bool get extension => jsProxy['extension'];
  set extension(bool value) => jsProxy['extension'] = value;
}

/**
 * Options that determine exactly what data will be removed.
 */
class RemovalOptions extends ChromeObject {
  RemovalOptions({Object? since, OriginTypesBrowsingData? originTypes, List<String>? origins, List<String>? excludeOrigins}) {
    if (since != null) this.since = since;
    if (originTypes != null) this.originTypes = originTypes;
    if (origins != null) this.origins = origins;
    if (excludeOrigins != null) this.excludeOrigins = excludeOrigins;
  }
  RemovalOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Remove data accumulated on or after this date, represented in milliseconds
   * since the epoch (accessible via the `getTime` method of the JavaScript
   * `Date` object). If absent, defaults to 0 (which would remove all browsing
   * data).
   */
  Object get since => jsProxy['since'];
  set since(Object value) => jsProxy['since'] = jsify(value);

  /**
   * An object whose properties specify which origin types ought to be cleared.
   * If this object isn't specified, it defaults to clearing only "unprotected"
   * origins. Please ensure that you _really_ want to remove application data
   * before adding 'protectedWeb' or 'extensions'.
   */
  OriginTypesBrowsingData get originTypes => _createOriginTypesBrowsingData(jsProxy['originTypes']);
  set originTypes(OriginTypesBrowsingData value) => jsProxy['originTypes'] = jsify(value);

  /**
   * When present, only data for origins in this list is deleted. Only supported
   * for cookies, storage and cache. Cookies are cleared for the whole
   * registrable domain.
   */
  List<String> get origins => listify(jsProxy['origins']);
  set origins(List<String> value) => jsProxy['origins'] = jsify(value);

  /**
   * When present, data for origins in this list is excluded from deletion.
   * Can't be used together with `origins`. Only supported for cookies, storage
   * and cache.  Cookies are excluded for the whole registrable domain.
   */
  List<String> get excludeOrigins => listify(jsProxy['excludeOrigins']);
  set excludeOrigins(List<String> value) => jsProxy['excludeOrigins'] = jsify(value);
}

/**
 * A set of data types. Missing data types are interpreted as `false`.
 */
class DataTypeSet extends ChromeObject {
  DataTypeSet({bool? appcache, bool? cache, bool? cacheStorage, bool? cookies, bool? downloads, bool? fileSystems, bool? formData, bool? history, bool? indexedDB, bool? localStorage, bool? serverBoundCertificates, bool? passwords, bool? pluginData, bool? serviceWorkers, bool? webSQL}) {
    if (appcache != null) this.appcache = appcache;
    if (cache != null) this.cache = cache;
    if (cacheStorage != null) this.cacheStorage = cacheStorage;
    if (cookies != null) this.cookies = cookies;
    if (downloads != null) this.downloads = downloads;
    if (fileSystems != null) this.fileSystems = fileSystems;
    if (formData != null) this.formData = formData;
    if (history != null) this.history = history;
    if (indexedDB != null) this.indexedDB = indexedDB;
    if (localStorage != null) this.localStorage = localStorage;
    if (serverBoundCertificates != null) this.serverBoundCertificates = serverBoundCertificates;
    if (passwords != null) this.passwords = passwords;
    if (pluginData != null) this.pluginData = pluginData;
    if (serviceWorkers != null) this.serviceWorkers = serviceWorkers;
    if (webSQL != null) this.webSQL = webSQL;
  }
  DataTypeSet.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Websites' appcaches.
   */
  bool get appcache => jsProxy['appcache'];
  set appcache(bool value) => jsProxy['appcache'] = value;

  /**
   * The browser's cache.
   */
  bool get cache => jsProxy['cache'];
  set cache(bool value) => jsProxy['cache'] = value;

  /**
   * Cache storage
   */
  bool get cacheStorage => jsProxy['cacheStorage'];
  set cacheStorage(bool value) => jsProxy['cacheStorage'] = value;

  /**
   * The browser's cookies.
   */
  bool get cookies => jsProxy['cookies'];
  set cookies(bool value) => jsProxy['cookies'] = value;

  /**
   * The browser's download list.
   */
  bool get downloads => jsProxy['downloads'];
  set downloads(bool value) => jsProxy['downloads'] = value;

  /**
   * Websites' file systems.
   */
  bool get fileSystems => jsProxy['fileSystems'];
  set fileSystems(bool value) => jsProxy['fileSystems'] = value;

  /**
   * The browser's stored form data.
   */
  bool get formData => jsProxy['formData'];
  set formData(bool value) => jsProxy['formData'] = value;

  /**
   * The browser's history.
   */
  bool get history => jsProxy['history'];
  set history(bool value) => jsProxy['history'] = value;

  /**
   * Websites' IndexedDB data.
   */
  bool get indexedDB => jsProxy['indexedDB'];
  set indexedDB(bool value) => jsProxy['indexedDB'] = value;

  /**
   * Websites' local storage data.
   */
  bool get localStorage => jsProxy['localStorage'];
  set localStorage(bool value) => jsProxy['localStorage'] = value;

  /**
   * Server-bound certificates.
   */
  bool get serverBoundCertificates => jsProxy['serverBoundCertificates'];
  set serverBoundCertificates(bool value) => jsProxy['serverBoundCertificates'] = value;

  /**
   * Stored passwords.
   */
  bool get passwords => jsProxy['passwords'];
  set passwords(bool value) => jsProxy['passwords'] = value;

  /**
   * Plugins' data.
   */
  bool get pluginData => jsProxy['pluginData'];
  set pluginData(bool value) => jsProxy['pluginData'] = value;

  /**
   * Service Workers.
   */
  bool get serviceWorkers => jsProxy['serviceWorkers'];
  set serviceWorkers(bool value) => jsProxy['serviceWorkers'] = value;

  /**
   * Websites' WebSQL data.
   */
  bool get webSQL => jsProxy['webSQL'];
  set webSQL(bool value) => jsProxy['webSQL'] = value;
}

OriginTypesBrowsingData _createOriginTypesBrowsingData(JsObject jsProxy) => OriginTypesBrowsingData.fromProxy(jsProxy);
