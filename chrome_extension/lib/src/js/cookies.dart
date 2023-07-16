import 'dart:js_interop';

import 'chrome.dart';

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
  external void get(
    CookieDetails details,
    JSFunction callback,
  );

  /// Retrieves all cookies from a single cookie store that match the given
  /// information.  The cookies returned will be sorted, with those with the
  /// longest path first.  If multiple cookies have the same path length, those
  /// with the earliest creation time will be first.
  external void getAll(
    /// Information to filter the cookies being retrieved.
    GetAllDetails details,
    JSFunction callback,
  );

  /// Sets a cookie with the given cookie data; may overwrite equivalent cookies
  /// if they exist.
  external void set(
    /// Details about the cookie being set.
    SetDetails details,
    JSFunction? callback,
  );

  /// Deletes a cookie by name.
  external void remove(
    CookieDetails details,
    JSFunction? callback,
  );

  /// Lists all existing cookie stores.
  external void getAllCookieStores(JSFunction callback);

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
typedef SameSiteStatus = String;

/// The underlying reason behind the cookie's change. If a cookie was inserted,
/// or removed via an explicit call to "chrome.cookies.remove", "cause" will be
/// "explicit". If a cookie was automatically removed due to expiry, "cause"
/// will be "expired". If a cookie was removed due to being overwritten with an
/// already-expired expiration date, "cause" will be set to "expired_overwrite".
///  If a cookie was automatically removed due to garbage collection, "cause"
/// will be "evicted".  If a cookie was automatically removed due to a "set"
/// call that overwrote it, "cause" will be "overwrite". Plan your response
/// accordingly.
typedef OnChangedCause = String;

@JS()
@staticInterop
class Cookie {}

extension CookieExtension on Cookie {
  /// The name of the cookie.
  external String name;

  /// The value of the cookie.
  external String value;

  /// The domain of the cookie (e.g. "www.google.com", "example.com").
  external String domain;

  /// True if the cookie is a host-only cookie (i.e. a request's host must
  /// exactly match the domain of the cookie).
  external bool hostOnly;

  /// The path of the cookie.
  external String path;

  /// True if the cookie is marked as Secure (i.e. its scope is limited to
  /// secure channels, typically HTTPS).
  external bool secure;

  /// True if the cookie is marked as HttpOnly (i.e. the cookie is inaccessible
  /// to client-side scripts).
  external bool httpOnly;

  /// The cookie's same-site status (i.e. whether the cookie is sent with
  /// cross-site requests).
  external SameSiteStatus sameSite;

  /// True if the cookie is a session cookie, as opposed to a persistent cookie
  /// with an expiration date.
  external bool session;

  /// The expiration date of the cookie as the number of seconds since the UNIX
  /// epoch. Not provided for session cookies.
  external double? expirationDate;

  /// The ID of the cookie store containing this cookie, as provided in
  /// getAllCookieStores().
  external String storeId;
}

@JS()
@staticInterop
class CookieStore {}

extension CookieStoreExtension on CookieStore {
  /// The unique identifier for the cookie store.
  external String id;

  /// Identifiers of all the browser tabs that share this cookie store.
  external JSArray tabIds;
}

@JS()
@staticInterop
class CookieDetails {}

extension CookieDetailsExtension on CookieDetails {
  /// The URL with which the cookie to access is associated. This argument may
  /// be a full URL, in which case any data following the URL path (e.g. the
  /// query string) is simply ignored. If host permissions for this URL are not
  /// specified in the manifest file, the API call will fail.
  external String url;

  /// The name of the cookie to access.
  external String name;

  /// The ID of the cookie store in which to look for the cookie. By default,
  /// the current execution context's cookie store will be used.
  external String? storeId;
}

@JS()
@staticInterop
class OnChangedChangeInfo {}

extension OnChangedChangeInfoExtension on OnChangedChangeInfo {
  /// True if a cookie was removed.
  external bool removed;

  /// Information about the cookie that was set or removed.
  external Cookie cookie;

  /// The underlying reason behind the cookie's change.
  external OnChangedCause cause;
}

@JS()
@staticInterop
@anonymous
class GetAllDetails {
  external factory GetAllDetails({
    /// Restricts the retrieved cookies to those that would match the given URL.
    String? url,

    /// Filters the cookies by name.
    String? name,

    /// Restricts the retrieved cookies to those whose domains match or are
    /// subdomains of this one.
    String? domain,

    /// Restricts the retrieved cookies to those whose path exactly matches this
    /// string.
    String? path,

    /// Filters the cookies by their Secure property.
    bool? secure,

    /// Filters out session vs. persistent cookies.
    bool? session,

    /// The cookie store to retrieve cookies from. If omitted, the current
    /// execution context's cookie store will be used.
    String? storeId,
  });
}

@JS()
@staticInterop
@anonymous
class SetDetails {
  external factory SetDetails({
    /// The request-URI to associate with the setting of the cookie. This value
    /// can affect the default domain and path values of the created cookie. If
    /// host permissions for this URL are not specified in the manifest file, the
    /// API call will fail.
    String url,

    /// The name of the cookie. Empty by default if omitted.
    String? name,

    /// The value of the cookie. Empty by default if omitted.
    String? value,

    /// The domain of the cookie. If omitted, the cookie becomes a host-only
    /// cookie.
    String? domain,

    /// The path of the cookie. Defaults to the path portion of the url parameter.
    String? path,

    /// Whether the cookie should be marked as Secure. Defaults to false.
    bool? secure,

    /// Whether the cookie should be marked as HttpOnly. Defaults to false.
    bool? httpOnly,

    /// The cookie's same-site status. Defaults to "unspecified", i.e., if
    /// omitted, the cookie is set without specifying a SameSite attribute.
    SameSiteStatus? sameSite,

    /// The expiration date of the cookie as the number of seconds since the UNIX
    /// epoch. If omitted, the cookie becomes a session cookie.
    double? expirationDate,

    /// The ID of the cookie store in which to set the cookie. By default, the
    /// cookie is set in the current execution context's cookie store.
    String? storeId,
  });
}

@JS()
@staticInterop
class RemoveCallbackDetails {}

extension RemoveCallbackDetailsExtension on RemoveCallbackDetails {
  /// The URL associated with the cookie that's been removed.
  external String url;

  /// The name of the cookie that's been removed.
  external String name;

  /// The ID of the cookie store from which the cookie was removed.
  external String storeId;
}
