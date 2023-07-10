import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSCookiesExtension on JSChrome {
  /// Use the `chrome.cookies` API to query and modify cookies, and to be
  /// notified when they change.
  external JSCookies get cookies;
}

@JS()
@staticInterop
class JSCookies {}

extension JSCookiesExtension on JSCookies {
  /// Retrieves information about a single cookie. If more than one cookie of
  /// the same name exists for the given URL, the one with the longest path will
  /// be returned. For cookies with the same path length, the cookie with the
  /// earliest creation time will be returned.
  external JSPromise get(CookieDetails details);

  /// Retrieves all cookies from a single cookie store that match the given
  /// information.  The cookies returned will be sorted, with those with the
  /// longest path first.  If multiple cookies have the same path length, those
  /// with the earliest creation time will be first.
  external JSPromise getAll(GetAllDetails details);

  /// Sets a cookie with the given cookie data; may overwrite equivalent cookies
  /// if they exist.
  external JSPromise set(SetDetails details);

  /// Deletes a cookie by name.
  external JSPromise remove(CookieDetails details);

  /// Lists all existing cookie stores.
  external JSPromise getAllCookieStores();

  /// Fired when a cookie is set or removed. As a special case, note that
  /// updating a cookie's properties is implemented as a two step process: the
  /// cookie to be updated is first removed entirely, generating a notification
  /// with "cause" of "overwrite" .  Afterwards, a new cookie is written with
  /// the updated values, generating a second notification with "cause"
  /// "explicit".
  external ChromeEvent get onChanged;
}

/// A cookie's 'SameSite' state
/// (https://tools.ietf.org/html/draft-west-first-party-cookies).
/// 'no_restriction' corresponds to a cookie set with 'SameSite=None', 'lax' to
/// 'SameSite=Lax', and 'strict' to 'SameSite=Strict'. 'unspecified' corresponds
/// to a cookie set without the SameSite attribute.
typedef SameSiteStatus = JSString;

/// The underlying reason behind the cookie's change. If a cookie was inserted,
/// or removed via an explicit call to "chrome.cookies.remove", "cause" will be
/// "explicit". If a cookie was automatically removed due to expiry, "cause"
/// will be "expired". If a cookie was removed due to being overwritten with an
/// already-expired expiration date, "cause" will be set to "expired_overwrite".
///  If a cookie was automatically removed due to garbage collection, "cause"
/// will be "evicted".  If a cookie was automatically removed due to a "set"
/// call that overwrote it, "cause" will be "overwrite". Plan your response
/// accordingly.
typedef OnChangedCause = JSString;

@JS()
@staticInterop
class Cookie {
  /// The name of the cookie.
  external String get name;

  /// The value of the cookie.
  external String get value;

  /// The domain of the cookie (e.g. "www.google.com", "example.com").
  external String get domain;

  /// True if the cookie is a host-only cookie (i.e. a request's host must
  /// exactly match the domain of the cookie).
  external bool get hostOnly;

  /// The path of the cookie.
  external String get path;

  /// True if the cookie is marked as Secure (i.e. its scope is limited to
  /// secure channels, typically HTTPS).
  external bool get secure;

  /// True if the cookie is marked as HttpOnly (i.e. the cookie is inaccessible
  /// to client-side scripts).
  external bool get httpOnly;

  /// The cookie's same-site status (i.e. whether the cookie is sent with
  /// cross-site requests).
  external SameSiteStatus get sameSite;

  /// True if the cookie is a session cookie, as opposed to a persistent cookie
  /// with an expiration date.
  external bool get session;

  /// The expiration date of the cookie as the number of seconds since the UNIX
  /// epoch. Not provided for session cookies.
  external num? get expirationDate;

  /// The ID of the cookie store containing this cookie, as provided in
  /// getAllCookieStores().
  external String get storeId;
}

@JS()
@staticInterop
class CookieStore {
  /// The unique identifier for the cookie store.
  external String get id;

  /// Identifiers of all the browser tabs that share this cookie store.
  external JSArray get tabIds;
}

@JS()
@staticInterop
class CookieDetails {
  /// The URL with which the cookie to access is associated. This argument may
  /// be a full URL, in which case any data following the URL path (e.g. the
  /// query string) is simply ignored. If host permissions for this URL are not
  /// specified in the manifest file, the API call will fail.
  external String get url;

  /// The name of the cookie to access.
  external String get name;

  /// The ID of the cookie store in which to look for the cookie. By default,
  /// the current execution context's cookie store will be used.
  external String? get storeId;
}

@JS()
@staticInterop
class GetAllDetails {
  /// Restricts the retrieved cookies to those that would match the given URL.
  external String? get url;

  /// Filters the cookies by name.
  external String? get name;

  /// Restricts the retrieved cookies to those whose domains match or are
  /// subdomains of this one.
  external String? get domain;

  /// Restricts the retrieved cookies to those whose path exactly matches this
  /// string.
  external String? get path;

  /// Filters the cookies by their Secure property.
  external bool? get secure;

  /// Filters out session vs. persistent cookies.
  external bool? get session;

  /// The cookie store to retrieve cookies from. If omitted, the current
  /// execution context's cookie store will be used.
  external String? get storeId;
}

@JS()
@staticInterop
class SetDetails {
  /// The request-URI to associate with the setting of the cookie. This value
  /// can affect the default domain and path values of the created cookie. If
  /// host permissions for this URL are not specified in the manifest file, the
  /// API call will fail.
  external String get url;

  /// The name of the cookie. Empty by default if omitted.
  external String? get name;

  /// The value of the cookie. Empty by default if omitted.
  external String? get value;

  /// The domain of the cookie. If omitted, the cookie becomes a host-only
  /// cookie.
  external String? get domain;

  /// The path of the cookie. Defaults to the path portion of the url parameter.
  external String? get path;

  /// Whether the cookie should be marked as Secure. Defaults to false.
  external bool? get secure;

  /// Whether the cookie should be marked as HttpOnly. Defaults to false.
  external bool? get httpOnly;

  /// The cookie's same-site status. Defaults to "unspecified", i.e., if
  /// omitted, the cookie is set without specifying a SameSite attribute.
  external SameSiteStatus? get sameSite;

  /// The expiration date of the cookie as the number of seconds since the UNIX
  /// epoch. If omitted, the cookie becomes a session cookie.
  external num? get expirationDate;

  /// The ID of the cookie store in which to set the cookie. By default, the
  /// cookie is set in the current execution context's cookie store.
  external String? get storeId;
}
