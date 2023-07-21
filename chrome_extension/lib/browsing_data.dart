import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/browsing_data.dart' as $js;

export 'src/chrome.dart' show chrome;

final _browsingData = ChromeBrowsingData._();

extension ChromeBrowsingDataExtension on Chrome {
  ChromeBrowsingData get browsingData => _browsingData;
}

class ChromeBrowsingData {
  ChromeBrowsingData._();

  bool get isAvailable => $js.chrome.browsingDataNullable != null;

  /// Reports which types of data are currently selected in the 'Clear browsing
  /// data' settings UI.  Note: some of the data types included in this API are
  /// not available in the settings UI, and some UI settings control more than
  /// one data type listed here.
  Future<SettingsCallbackResult> settings() async {
    var $res = await promiseToFuture<$js.SettingsCallbackResult>(
        $js.chrome.browsingData.settings());
    return SettingsCallbackResult.fromJS($res);
  }

  /// Clears various types of browsing data stored in a user's profile.
  /// [dataToRemove] The set of data types to remove.
  Future<void> remove(
    RemovalOptions options,
    DataTypeSet dataToRemove,
  ) async {
    await promiseToFuture<void>($js.chrome.browsingData.remove(
      options.toJS,
      dataToRemove.toJS,
    ));
  }

  /// Clears websites' appcache data.
  Future<void> removeAppcache(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removeAppcache(options.toJS));
  }

  /// Clears the browser's cache.
  Future<void> removeCache(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removeCache(options.toJS));
  }

  /// Clears websites' cache storage data.
  Future<void> removeCacheStorage(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removeCacheStorage(options.toJS));
  }

  /// Clears the browser's cookies and server-bound certificates modified within
  /// a particular timeframe.
  Future<void> removeCookies(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removeCookies(options.toJS));
  }

  /// Clears the browser's list of downloaded files (_not_ the downloaded files
  /// themselves).
  Future<void> removeDownloads(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removeDownloads(options.toJS));
  }

  /// Clears websites' file system data.
  Future<void> removeFileSystems(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removeFileSystems(options.toJS));
  }

  /// Clears the browser's stored form data (autofill).
  Future<void> removeFormData(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removeFormData(options.toJS));
  }

  /// Clears the browser's history.
  Future<void> removeHistory(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removeHistory(options.toJS));
  }

  /// Clears websites' IndexedDB data.
  Future<void> removeIndexedDB(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removeIndexedDB(options.toJS));
  }

  /// Clears websites' local storage data.
  Future<void> removeLocalStorage(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removeLocalStorage(options.toJS));
  }

  /// Clears plugins' data.
  Future<void> removePluginData(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removePluginData(options.toJS));
  }

  /// Clears the browser's stored passwords.
  Future<void> removePasswords(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removePasswords(options.toJS));
  }

  /// Clears websites' service workers.
  Future<void> removeServiceWorkers(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removeServiceWorkers(options.toJS));
  }

  /// Clears websites' WebSQL data.
  Future<void> removeWebSQL(RemovalOptions options) async {
    await promiseToFuture<void>(
        $js.chrome.browsingData.removeWebSQL(options.toJS));
  }
}

class RemovalOptions {
  RemovalOptions.fromJS(this._wrapped);

  RemovalOptions({
    double? since,
    RemovalOptionsOriginTypes? originTypes,
    List<String>? origins,
    List<String>? excludeOrigins,
  }) : _wrapped = $js.RemovalOptions(
          since: since,
          originTypes: originTypes?.toJS,
          origins: origins?.toJSArray((e) => e),
          excludeOrigins: excludeOrigins?.toJSArray((e) => e),
        );

  final $js.RemovalOptions _wrapped;

  $js.RemovalOptions get toJS => _wrapped;
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
  }) : _wrapped = $js.DataTypeSet(
          appcache: appcache,
          cache: cache,
          cacheStorage: cacheStorage,
          cookies: cookies,
          downloads: downloads,
          fileSystems: fileSystems,
          formData: formData,
          history: history,
          indexedDB: indexedDB,
          localStorage: localStorage,
          serverBoundCertificates: serverBoundCertificates,
          passwords: passwords,
          pluginData: pluginData,
          serviceWorkers: serviceWorkers,
          webSQL: webSQL,
        );

  final $js.DataTypeSet _wrapped;

  $js.DataTypeSet get toJS => _wrapped;
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
  }) : _wrapped = $js.RemovalOptionsOriginTypes(
          unprotectedWeb: unprotectedWeb,
          protectedWeb: protectedWeb,
          extension: extension,
        );

  final $js.RemovalOptionsOriginTypes _wrapped;

  $js.RemovalOptionsOriginTypes get toJS => _wrapped;
}
