import 'chrome.dart';
export 'chrome.dart';

final _cookies = ChromeCookies._();

extension ChromeChromeCookiesExtension on Chrome {
  ChromeCookies get cookies => _cookies;
}

class ChromeCookies {
  ChromeCookies._();
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
