import 'chrome.dart';
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
  void get(details) => throw UnimplementedError();

  /// Retrieves all cookies from a single cookie store that match the given
  /// information.  The cookies returned will be sorted, with those with the
  /// longest path first.  If multiple cookies have the same path length, those
  /// with the earliest creation time will be first.
  void getAll(details) => throw UnimplementedError();

  /// Sets a cookie with the given cookie data; may overwrite equivalent cookies
  /// if they exist.
  void set(details) => throw UnimplementedError();

  /// Deletes a cookie by name.
  void remove(details) => throw UnimplementedError();

  /// Lists all existing cookie stores.
  void getAllCookieStores() => throw UnimplementedError();

  /// Fired when a cookie is set or removed. As a special case, note that
  /// updating a cookie's properties is implemented as a two step process: the
  /// cookie to be updated is first removed entirely, generating a notification
  /// with "cause" of "overwrite" .  Afterwards, a new cookie is written with
  /// the updated values, generating a second notification with "cause"
  /// "explicit".
  Stream get onChanged => throw UnimplementedError();
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
}
