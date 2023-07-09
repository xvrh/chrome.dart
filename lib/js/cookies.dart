import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSCookiesExtension on JSChrome {
  /// Use the `chrome.cookies` API to query and modify cookies, and to be
  /// notified when they change.
  external JSCookies get Cookies;
}

@JS()
@staticInterop
class JSCookies {}

extension JSCookiesExtension on JSCookies {
  /// Retrieves information about a single cookie. If more than one cookie of
  /// the same name exists for the given URL, the one with the longest path will
  /// be returned. For cookies with the same path length, the cookie with the
  /// earliest creation time will be returned.
  external void get();

  /// Retrieves all cookies from a single cookie store that match the given
  /// information.  The cookies returned will be sorted, with those with the
  /// longest path first.  If multiple cookies have the same path length, those
  /// with the earliest creation time will be first.
  external void getAll();

  /// Sets a cookie with the given cookie data; may overwrite equivalent cookies
  /// if they exist.
  external void set();

  /// Deletes a cookie by name.
  external void remove();

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
