import 'chrome.dart';
export 'chrome.dart';

final _identity = ChromeIdentity._();

extension ChromeIdentityExtension on Chrome {
  ChromeIdentity get identity => _identity;
}

class ChromeIdentity {
  ChromeIdentity._();

  /// Retrieves a list of AccountInfo objects describing the accounts
  /// present on the profile.
  ///
  /// `getAccounts` is only supported on dev channel.
  void getAccounts() => throw UnimplementedError();

  /// Gets an OAuth2 access token using the client ID and scopes
  /// specified in the <a
  /// href="app_identity.html#update_manifest">`oauth2`
  /// section of manifest.json</a>.
  ///
  /// The Identity API caches access tokens in memory, so it's ok to
  /// call `getAuthToken` non-interactively any time a token is
  /// required. The token cache automatically handles expiration.
  ///
  /// For a good user experience it is important interactive token requests are
  /// initiated by UI in your app explaining what the authorization is for.
  /// Failing to do this will cause your users to get authorization requests,
  /// or Chrome sign in screens if they are not signed in, with with no
  /// context. In particular, do not use `getAuthToken`
  /// interactively when your app is first launched.
  ///
  /// Note: When called with a callback, instead of returning an object this
  /// function will return the two properties as separate arguments passed to
  /// the callback.
  ///
  /// |details| : Token options.
  /// |callback| : Called with an OAuth2 access token as specified by the
  /// manifest, or undefined if there was an error. The
  /// `grantedScopes` parameter is populated since Chrome 87. When
  /// available, this parameter contains the list of granted scopes
  /// corresponding with the returned token.
  void getAuthToken(details) => throw UnimplementedError();

  /// Retrieves email address and obfuscated gaia id of the user
  /// signed into a profile.
  ///
  /// Requires the `identity.email` manifest permission. Otherwise,
  /// returns an empty result.
  ///
  /// This API is different from identity.getAccounts in two
  /// ways. The information returned is available offline, and it
  /// only applies to the primary account for the profile.
  ///
  /// |details|: Profile options.
  /// |callback|: Called with the `ProfileUserInfo` of the primary
  /// Chrome account, of an empty `ProfileUserInfo` if the account
  /// with given `details` doesn't exist.
  void getProfileUserInfo(details) => throw UnimplementedError();

  /// Removes an OAuth2 access token from the Identity API's token cache.
  ///
  /// If an access token is discovered to be invalid, it should be
  /// passed to removeCachedAuthToken to remove it from the
  /// cache. The app may then retrieve a fresh token with
  /// `getAuthToken`.
  ///
  /// |details| : Token information.
  /// |callback| : Called when the token has been removed from the cache.
  void removeCachedAuthToken(details) => throw UnimplementedError();

  /// Resets the state of the Identity API:
  /// <ul>
  ///   <li>Removes all OAuth2 access tokens from the token cache</li>
  ///   <li>Removes user's account preferences</li>
  ///   <li>De-authorizes the user from all auth flows</li>
  /// </ul>
  ///
  /// |callback| : Called when the state has been cleared.
  void clearAllCachedAuthTokens() => throw UnimplementedError();

  /// Starts an auth flow at the specified URL.
  ///
  /// This method enables auth flows with non-Google identity
  /// providers by launching a web view and navigating it to the
  /// first URL in the provider's auth flow. When the provider
  /// redirects to a URL matching the pattern
  /// `https://<app-id>.chromiumapp.org/*`, the
  /// window will close, and the final redirect URL will be passed to
  /// the `callback` function.
  ///
  /// For a good user experience it is important interactive auth flows are
  /// initiated by UI in your app explaining what the authorization is for.
  /// Failing to do this will cause your users to get authorization requests
  /// with no context. In particular, do not launch an interactive auth flow
  /// when your app is first launched.
  ///
  /// |details| : WebAuth flow options.
  /// |callback| : Called with the URL redirected back to your application.
  void launchWebAuthFlow(details) => throw UnimplementedError();

  /// Generates a redirect URL to be used in |launchWebAuthFlow|.
  ///
  /// The generated URLs match the pattern
  /// `https://<app-id>.chromiumapp.org/*`.
  ///
  /// |path| : The path appended to the end of the generated URL.
  void getRedirectURL(path) => throw UnimplementedError();

  /// Fired when signin state changes for an account on the user's profile.
  Stream get onSignInChanged => throw UnimplementedError();
}

enum AccountStatus {
  /// Sync is enabled for the primary account.
  sync$('SYNC'),

  /// Any primary account, if exists.
  any('ANY');

  const AccountStatus(this.value);

  final String value;
}
