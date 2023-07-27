import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/cookies.dart' as $js;

export 'src/chrome.dart' show chrome;

final _cookies = ChromeCookies._();

extension ChromeCookiesExtension on Chrome {
  /// Use the `chrome.cookies` API to query and modify cookies, and to be
  /// notified when they change.
  ChromeCookies get cookies => _cookies;
}

class ChromeCookies {
  ChromeCookies._();

  bool get isAvailable => $js.chrome.cookiesNullable != null;

  /// Retrieves information about a single cookie. If more than one cookie of
  /// the same name exists for the given URL, the one with the longest path will
  /// be returned. For cookies with the same path length, the cookie with the
  /// earliest creation time will be returned.
  Future<Cookie?> get(CookieDetails details) async {
    var $res = await promiseToFuture<$js.Cookie?>(
        $js.chrome.cookies.get(details.toJS));
    return $res?.let(Cookie.fromJS);
  }

  /// Retrieves all cookies from a single cookie store that match the given
  /// information.  The cookies returned will be sorted, with those with the
  /// longest path first.  If multiple cookies have the same path length, those
  /// with the earliest creation time will be first.
  /// [details] Information to filter the cookies being retrieved.
  Future<List<Cookie>> getAll(GetAllDetails details) async {
    var $res =
        await promiseToFuture<JSArray>($js.chrome.cookies.getAll(details.toJS));
    return $res.toDart.cast<$js.Cookie>().map((e) => Cookie.fromJS(e)).toList();
  }

  /// Sets a cookie with the given cookie data; may overwrite equivalent cookies
  /// if they exist.
  /// [details] Details about the cookie being set.
  Future<Cookie?> set(SetDetails details) async {
    var $res = await promiseToFuture<$js.Cookie?>(
        $js.chrome.cookies.set(details.toJS));
    return $res?.let(Cookie.fromJS);
  }

  /// Deletes a cookie by name.
  Future<RemoveCallbackDetails?> remove(CookieDetails details) async {
    var $res = await promiseToFuture<$js.RemoveCallbackDetails?>(
        $js.chrome.cookies.remove(details.toJS));
    return $res?.let(RemoveCallbackDetails.fromJS);
  }

  /// Lists all existing cookie stores.
  Future<List<CookieStore>> getAllCookieStores() async {
    var $res =
        await promiseToFuture<JSArray>($js.chrome.cookies.getAllCookieStores());
    return $res.toDart
        .cast<$js.CookieStore>()
        .map((e) => CookieStore.fromJS(e))
        .toList();
  }

  /// Fired when a cookie is set or removed. As a special case, note that
  /// updating a cookie's properties is implemented as a two step process: the
  /// cookie to be updated is first removed entirely, generating a notification
  /// with "cause" of "overwrite" .  Afterwards, a new cookie is written with
  /// the updated values, generating a second notification with "cause"
  /// "explicit".
  Stream<OnChangedChangeInfo> get onChanged => $js.chrome.cookies.onChanged
      .asStream(($c) => ($js.OnChangedChangeInfo changeInfo) {
            $c.add(OnChangedChangeInfo.fromJS(changeInfo));
          }.toJS);
}

/// A cookie's 'SameSite' state
/// (https://tools.ietf.org/html/draft-west-first-party-cookies).
/// 'no_restriction' corresponds to a cookie set with 'SameSite=None', 'lax' to
/// 'SameSite=Lax', and 'strict' to 'SameSite=Strict'. 'unspecified' corresponds
/// to a cookie set without the SameSite attribute.
enum SameSiteStatus {
  noRestriction('no_restriction'),
  lax('lax'),
  strict('strict'),
  unspecified('unspecified');

  const SameSiteStatus(this.value);

  final String value;

  String get toJS => value;
  static SameSiteStatus fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// The underlying reason behind the cookie's change. If a cookie was inserted,
/// or removed via an explicit call to "chrome.cookies.remove", "cause" will be
/// "explicit". If a cookie was automatically removed due to expiry, "cause"
/// will be "expired". If a cookie was removed due to being overwritten with an
/// already-expired expiration date, "cause" will be set to "expired_overwrite".
///  If a cookie was automatically removed due to garbage collection, "cause"
/// will be "evicted".  If a cookie was automatically removed due to a "set"
/// call that overwrote it, "cause" will be "overwrite". Plan your response
/// accordingly.
enum OnChangedCause {
  evicted('evicted'),
  expired('expired'),
  explicit('explicit'),
  expiredOverwrite('expired_overwrite'),
  overwrite('overwrite');

  const OnChangedCause(this.value);

  final String value;

  String get toJS => value;
  static OnChangedCause fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class Cookie {
  Cookie.fromJS(this._wrapped);

  Cookie({
    required String name,
    required String value,
    required String domain,
    required bool hostOnly,
    required String path,
    required bool secure,
    required bool httpOnly,
    required SameSiteStatus sameSite,
    required bool session,
    double? expirationDate,
    required String storeId,
  }) : _wrapped = $js.Cookie()
          ..name = name
          ..value = value
          ..domain = domain
          ..hostOnly = hostOnly
          ..path = path
          ..secure = secure
          ..httpOnly = httpOnly
          ..sameSite = sameSite.toJS
          ..session = session
          ..expirationDate = expirationDate
          ..storeId = storeId;

  final $js.Cookie _wrapped;

  $js.Cookie get toJS => _wrapped;

  /// The name of the cookie.
  String get name => _wrapped.name;
  set name(String v) {
    _wrapped.name = v;
  }

  /// The value of the cookie.
  String get value => _wrapped.value;
  set value(String v) {
    _wrapped.value = v;
  }

  /// The domain of the cookie (e.g. "www.google.com", "example.com").
  String get domain => _wrapped.domain;
  set domain(String v) {
    _wrapped.domain = v;
  }

  /// True if the cookie is a host-only cookie (i.e. a request's host must
  /// exactly match the domain of the cookie).
  bool get hostOnly => _wrapped.hostOnly;
  set hostOnly(bool v) {
    _wrapped.hostOnly = v;
  }

  /// The path of the cookie.
  String get path => _wrapped.path;
  set path(String v) {
    _wrapped.path = v;
  }

  /// True if the cookie is marked as Secure (i.e. its scope is limited to
  /// secure channels, typically HTTPS).
  bool get secure => _wrapped.secure;
  set secure(bool v) {
    _wrapped.secure = v;
  }

  /// True if the cookie is marked as HttpOnly (i.e. the cookie is inaccessible
  /// to client-side scripts).
  bool get httpOnly => _wrapped.httpOnly;
  set httpOnly(bool v) {
    _wrapped.httpOnly = v;
  }

  /// The cookie's same-site status (i.e. whether the cookie is sent with
  /// cross-site requests).
  SameSiteStatus get sameSite => SameSiteStatus.fromJS(_wrapped.sameSite);
  set sameSite(SameSiteStatus v) {
    _wrapped.sameSite = v.toJS;
  }

  /// True if the cookie is a session cookie, as opposed to a persistent cookie
  /// with an expiration date.
  bool get session => _wrapped.session;
  set session(bool v) {
    _wrapped.session = v;
  }

  /// The expiration date of the cookie as the number of seconds since the UNIX
  /// epoch. Not provided for session cookies.
  double? get expirationDate => _wrapped.expirationDate;
  set expirationDate(double? v) {
    _wrapped.expirationDate = v;
  }

  /// The ID of the cookie store containing this cookie, as provided in
  /// getAllCookieStores().
  String get storeId => _wrapped.storeId;
  set storeId(String v) {
    _wrapped.storeId = v;
  }
}

class CookieStore {
  CookieStore.fromJS(this._wrapped);

  CookieStore({
    required String id,
    required List<int> tabIds,
  }) : _wrapped = $js.CookieStore()
          ..id = id
          ..tabIds = tabIds.toJSArray((e) => e);

  final $js.CookieStore _wrapped;

  $js.CookieStore get toJS => _wrapped;

  /// The unique identifier for the cookie store.
  String get id => _wrapped.id;
  set id(String v) {
    _wrapped.id = v;
  }

  /// Identifiers of all the browser tabs that share this cookie store.
  List<int> get tabIds =>
      _wrapped.tabIds.toDart.cast<int>().map((e) => e).toList();
  set tabIds(List<int> v) {
    _wrapped.tabIds = v.toJSArray((e) => e);
  }
}

class CookieDetails {
  CookieDetails.fromJS(this._wrapped);

  CookieDetails({
    required String url,
    required String name,
    String? storeId,
  }) : _wrapped = $js.CookieDetails(
          url: url,
          name: name,
          storeId: storeId,
        );

  final $js.CookieDetails _wrapped;

  $js.CookieDetails get toJS => _wrapped;
}

class OnChangedChangeInfo {
  OnChangedChangeInfo.fromJS(this._wrapped);

  OnChangedChangeInfo({
    required bool removed,
    required Cookie cookie,
    required OnChangedCause cause,
  }) : _wrapped = $js.OnChangedChangeInfo()
          ..removed = removed
          ..cookie = cookie.toJS
          ..cause = cause.toJS;

  final $js.OnChangedChangeInfo _wrapped;

  $js.OnChangedChangeInfo get toJS => _wrapped;

  /// True if a cookie was removed.
  bool get removed => _wrapped.removed;
  set removed(bool v) {
    _wrapped.removed = v;
  }

  /// Information about the cookie that was set or removed.
  Cookie get cookie => Cookie.fromJS(_wrapped.cookie);
  set cookie(Cookie v) {
    _wrapped.cookie = v.toJS;
  }

  /// The underlying reason behind the cookie's change.
  OnChangedCause get cause => OnChangedCause.fromJS(_wrapped.cause);
  set cause(OnChangedCause v) {
    _wrapped.cause = v.toJS;
  }
}

class GetAllDetails {
  GetAllDetails.fromJS(this._wrapped);

  GetAllDetails({
    String? url,
    String? name,
    String? domain,
    String? path,
    bool? secure,
    bool? session,
    String? storeId,
  }) : _wrapped = $js.GetAllDetails(
          url: url,
          name: name,
          domain: domain,
          path: path,
          secure: secure,
          session: session,
          storeId: storeId,
        );

  final $js.GetAllDetails _wrapped;

  $js.GetAllDetails get toJS => _wrapped;
}

class SetDetails {
  SetDetails.fromJS(this._wrapped);

  SetDetails({
    required String url,
    String? name,
    String? value,
    String? domain,
    String? path,
    bool? secure,
    bool? httpOnly,
    SameSiteStatus? sameSite,
    double? expirationDate,
    String? storeId,
  }) : _wrapped = $js.SetDetails(
          url: url,
          name: name,
          value: value,
          domain: domain,
          path: path,
          secure: secure,
          httpOnly: httpOnly,
          sameSite: sameSite?.toJS,
          expirationDate: expirationDate,
          storeId: storeId,
        );

  final $js.SetDetails _wrapped;

  $js.SetDetails get toJS => _wrapped;
}

class RemoveCallbackDetails {
  RemoveCallbackDetails.fromJS(this._wrapped);

  RemoveCallbackDetails({
    required String url,
    required String name,
    required String storeId,
  }) : _wrapped = $js.RemoveCallbackDetails()
          ..url = url
          ..name = name
          ..storeId = storeId;

  final $js.RemoveCallbackDetails _wrapped;

  $js.RemoveCallbackDetails get toJS => _wrapped;

  /// The URL associated with the cookie that's been removed.
  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// The name of the cookie that's been removed.
  String get name => _wrapped.name;
  set name(String v) {
    _wrapped.name = v;
  }

  /// The ID of the cookie store from which the cookie was removed.
  String get storeId => _wrapped.storeId;
  set storeId(String v) {
    _wrapped.storeId = v;
  }
}
