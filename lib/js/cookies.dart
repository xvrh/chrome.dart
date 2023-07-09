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
  external void get(details);

  /// Retrieves all cookies from a single cookie store that match the given
  /// information.  The cookies returned will be sorted, with those with the
  /// longest path first.  If multiple cookies have the same path length, those
  /// with the earliest creation time will be first.
  external void getAll(details);

  /// Sets a cookie with the given cookie data; may overwrite equivalent cookies
  /// if they exist.
  external void set(details);

  /// Deletes a cookie by name.
  external void remove(details);

  /// Lists all existing cookie stores.
  external void getAllCookieStores();

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
  external JSAny get name;

  /// The value of the cookie.
  external JSAny get value;

  /// The domain of the cookie (e.g. "www.google.com", "example.com").
  external JSAny get domain;

  /// True if the cookie is a host-only cookie (i.e. a request's host must
  /// exactly match the domain of the cookie).
  external JSAny get hostOnly;

  /// The path of the cookie.
  external JSAny get path;

  /// True if the cookie is marked as Secure (i.e. its scope is limited to
  /// secure channels, typically HTTPS).
  external JSAny get secure;

  /// True if the cookie is marked as HttpOnly (i.e. the cookie is inaccessible
  /// to client-side scripts).
  external JSAny get httpOnly;

  /// The cookie's same-site status (i.e. whether the cookie is sent with
  /// cross-site requests).
  external JSAny get sameSite;

  /// True if the cookie is a session cookie, as opposed to a persistent cookie
  /// with an expiration date.
  external JSAny get session;

  /// The expiration date of the cookie as the number of seconds since the UNIX
  /// epoch. Not provided for session cookies.
  external JSAny? get expirationDate;

  /// The ID of the cookie store containing this cookie, as provided in
  /// getAllCookieStores().
  external JSAny get storeId;
}

@JS()
@staticInterop
class CookieStore {
  /// The unique identifier for the cookie store.
  external JSAny get id;

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
  external JSAny get url;

  /// The name of the cookie to access.
  external JSAny get name;

  /// The ID of the cookie store in which to look for the cookie. By default,
  /// the current execution context's cookie store will be used.
  external JSAny? get storeId;
}
