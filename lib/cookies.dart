import 'src/internal_helpers.dart';
import 'src/js/cookies.dart' as $js;
export 'chrome.dart';

final _cookies = ChromeCookies._();

extension ChromeCookiesExtension on Chrome {
  ChromeCookies get cookies => _cookies;
}

class ChromeCookies {
  ChromeCookies._();

  /// Retrieves information about a single cookie. If more than one cookie of
  /// the same name exists for the given URL, the one with the longest path will
  /// be returned. For cookies with the same path length, the cookie with the
  /// earliest creation time will be returned.
  Future<Cookie?> get(CookieDetails details) => throw UnimplementedError();

  /// Retrieves all cookies from a single cookie store that match the given
  /// information.  The cookies returned will be sorted, with those with the
  /// longest path first.  If multiple cookies have the same path length, those
  /// with the earliest creation time will be first.
  Future<List<Cookie>> getAll(GetAllDetails details) =>
      throw UnimplementedError();

  /// Sets a cookie with the given cookie data; may overwrite equivalent cookies
  /// if they exist.
  Future<Cookie?> set(SetDetails details) => throw UnimplementedError();

  /// Deletes a cookie by name.
  Future<RemoveCallbackDetails?> remove(CookieDetails details) =>
      throw UnimplementedError();

  /// Lists all existing cookie stores.
  Future<List<CookieStore>> getAllCookieStores() => throw UnimplementedError();

  /// Fired when a cookie is set or removed. As a special case, note that
  /// updating a cookie's properties is implemented as a two step process: the
  /// cookie to be updated is first removed entirely, generating a notification
  /// with "cause" of "overwrite" .  Afterwards, a new cookie is written with
  /// the updated values, generating a second notification with "cause"
  /// "explicit".
  Stream<OnChangedChangeInfo> get onChanged => throw UnimplementedError();
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
    _wrapped.tabIds = throw UnimplementedError();
  }
}

class CookieDetails {
  CookieDetails.fromJS(this._wrapped);

  final $js.CookieDetails _wrapped;

  $js.CookieDetails get toJS => _wrapped;

  /// The URL with which the cookie to access is associated. This argument may
  /// be a full URL, in which case any data following the URL path (e.g. the
  /// query string) is simply ignored. If host permissions for this URL are not
  /// specified in the manifest file, the API call will fail.
  String get url => _wrapped.url;
  set url(String v) {
    _wrapped.url = v;
  }

  /// The name of the cookie to access.
  String get name => _wrapped.name;
  set name(String v) {
    _wrapped.name = v;
  }

  /// The ID of the cookie store in which to look for the cookie. By default,
  /// the current execution context's cookie store will be used.
  String? get storeId => _wrapped.storeId;
  set storeId(String? v) {
    _wrapped.storeId = v;
  }
}

class OnChangedChangeInfo {
  OnChangedChangeInfo.fromJS(this._wrapped);

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

  final $js.GetAllDetails _wrapped;

  $js.GetAllDetails get toJS => _wrapped;
}

class SetDetails {
  SetDetails.fromJS(this._wrapped);

  final $js.SetDetails _wrapped;

  $js.SetDetails get toJS => _wrapped;
}

class RemoveCallbackDetails {
  RemoveCallbackDetails.fromJS(this._wrapped);

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
