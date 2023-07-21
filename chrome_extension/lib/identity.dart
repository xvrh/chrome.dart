import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/identity.dart' as $js;

export 'src/chrome.dart' show chrome;

final _identity = ChromeIdentity._();

extension ChromeIdentityExtension on Chrome {
  ChromeIdentity get identity => _identity;
}

class ChromeIdentity {
  ChromeIdentity._();

  bool get isAvailable => $js.chrome.identityNullable != null;

  /// Retrieves a list of AccountInfo objects describing the accounts
  /// present on the profile.
  ///
  /// `getAccounts` is only supported on dev channel.
  Future<List<AccountInfo>> getAccounts() async {
    var $res =
        await promiseToFuture<JSArray>($js.chrome.identity.getAccounts());
    return $res.toDart
        .cast<$js.AccountInfo>()
        .map((e) => AccountInfo.fromJS(e))
        .toList();
  }

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
  Future<GetAuthTokenResult> getAuthToken(TokenDetails? details) async {
    var $res = await promiseToFuture<$js.GetAuthTokenResult>(
        $js.chrome.identity.getAuthToken(details?.toJS));
    return GetAuthTokenResult.fromJS($res);
  }

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
  Future<ProfileUserInfo> getProfileUserInfo(ProfileDetails? details) async {
    var $res = await promiseToFuture<$js.ProfileUserInfo>(
        $js.chrome.identity.getProfileUserInfo(details?.toJS));
    return ProfileUserInfo.fromJS($res);
  }

  /// Removes an OAuth2 access token from the Identity API's token cache.
  ///
  /// If an access token is discovered to be invalid, it should be
  /// passed to removeCachedAuthToken to remove it from the
  /// cache. The app may then retrieve a fresh token with
  /// `getAuthToken`.
  ///
  /// |details| : Token information.
  /// |callback| : Called when the token has been removed from the cache.
  Future<void> removeCachedAuthToken(InvalidTokenDetails details) async {
    await promiseToFuture<void>(
        $js.chrome.identity.removeCachedAuthToken(details.toJS));
  }

  /// Resets the state of the Identity API:
  /// <ul>
  ///   <li>Removes all OAuth2 access tokens from the token cache</li>
  ///   <li>Removes user's account preferences</li>
  ///   <li>De-authorizes the user from all auth flows</li>
  /// </ul>
  ///
  /// |callback| : Called when the state has been cleared.
  Future<void> clearAllCachedAuthTokens() async {
    await promiseToFuture<void>($js.chrome.identity.clearAllCachedAuthTokens());
  }

  /// Starts an auth flow at the specified URL.
  ///
  /// This method enables auth flows with non-Google identity
  /// providers by launching a web view and navigating it to the
  /// first URL in the provider's auth flow. When the provider
  /// redirects to a URL matching the pattern
  /// `https://<app-id>.chromiumapp.org/*`, the
  /// window will close, and the final redirect URL will be passed to
  /// the [callback] function.
  ///
  /// For a good user experience it is important interactive auth flows are
  /// initiated by UI in your app explaining what the authorization is for.
  /// Failing to do this will cause your users to get authorization requests
  /// with no context. In particular, do not launch an interactive auth flow
  /// when your app is first launched.
  ///
  /// |details| : WebAuth flow options.
  /// |callback| : Called with the URL redirected back to your application.
  Future<String?> launchWebAuthFlow(WebAuthFlowDetails details) async {
    var $res = await promiseToFuture<String?>(
        $js.chrome.identity.launchWebAuthFlow(details.toJS));
    return $res;
  }

  /// Generates a redirect URL to be used in |launchWebAuthFlow|.
  ///
  /// The generated URLs match the pattern
  /// `https://<app-id>.chromiumapp.org/*`.
  ///
  /// |path| : The path appended to the end of the generated URL.
  String getRedirectURL(String? path) {
    return $js.chrome.identity.getRedirectURL(path);
  }

  /// Fired when signin state changes for an account on the user's profile.
  Stream<OnSignInChangedEvent> get onSignInChanged =>
      $js.chrome.identity.onSignInChanged.asStream(($c) => (
            $js.AccountInfo account,
            bool signedIn,
          ) {
            $c.add(OnSignInChangedEvent(
              account: AccountInfo.fromJS(account),
              signedIn: signedIn,
            ));
          }.toJS);
}

enum AccountStatus {
  /// Sync is enabled for the primary account.
  sync('SYNC'),

  /// Any primary account, if exists.
  any('ANY');

  const AccountStatus(this.value);

  final String value;

  String get toJS => value;
  static AccountStatus fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class AccountInfo {
  AccountInfo.fromJS(this._wrapped);

  AccountInfo({required String id}) : _wrapped = $js.AccountInfo(id: id);

  final $js.AccountInfo _wrapped;

  $js.AccountInfo get toJS => _wrapped;
}

class ProfileDetails {
  ProfileDetails.fromJS(this._wrapped);

  ProfileDetails({AccountStatus? accountStatus})
      : _wrapped = $js.ProfileDetails(accountStatus: accountStatus?.toJS);

  final $js.ProfileDetails _wrapped;

  $js.ProfileDetails get toJS => _wrapped;
}

class ProfileUserInfo {
  ProfileUserInfo.fromJS(this._wrapped);

  ProfileUserInfo({
    required String email,
    required String id,
  }) : _wrapped = $js.ProfileUserInfo()
          ..email = email
          ..id = id;

  final $js.ProfileUserInfo _wrapped;

  $js.ProfileUserInfo get toJS => _wrapped;

  /// An email address for the user account signed into the current
  /// profile. Empty if the user is not signed in or the
  /// `identity.email` manifest permission is not
  /// specified.
  String get email => _wrapped.email;
  set email(String v) {
    _wrapped.email = v;
  }

  /// A unique identifier for the account. This ID will not change
  /// for the lifetime of the account. Empty if the user is not
  /// signed in or (in M41+) the `identity.email`
  /// manifest permission is not specified.
  String get id => _wrapped.id;
  set id(String v) {
    _wrapped.id = v;
  }
}

class TokenDetails {
  TokenDetails.fromJS(this._wrapped);

  TokenDetails({
    bool? interactive,
    AccountInfo? account,
    List<String>? scopes,
    bool? enableGranularPermissions,
  }) : _wrapped = $js.TokenDetails(
          interactive: interactive,
          account: account?.toJS,
          scopes: scopes?.toJSArray((e) => e),
          enableGranularPermissions: enableGranularPermissions,
        );

  final $js.TokenDetails _wrapped;

  $js.TokenDetails get toJS => _wrapped;
}

class InvalidTokenDetails {
  InvalidTokenDetails.fromJS(this._wrapped);

  InvalidTokenDetails({required String token})
      : _wrapped = $js.InvalidTokenDetails(token: token);

  final $js.InvalidTokenDetails _wrapped;

  $js.InvalidTokenDetails get toJS => _wrapped;
}

class WebAuthFlowDetails {
  WebAuthFlowDetails.fromJS(this._wrapped);

  WebAuthFlowDetails({
    required String url,
    bool? interactive,
    bool? abortOnLoadForNonInteractive,
    int? timeoutMsForNonInteractive,
  }) : _wrapped = $js.WebAuthFlowDetails(
          url: url,
          interactive: interactive,
          abortOnLoadForNonInteractive: abortOnLoadForNonInteractive,
          timeoutMsForNonInteractive: timeoutMsForNonInteractive,
        );

  final $js.WebAuthFlowDetails _wrapped;

  $js.WebAuthFlowDetails get toJS => _wrapped;
}

class GetAuthTokenResult {
  GetAuthTokenResult.fromJS(this._wrapped);

  GetAuthTokenResult({
    String? token,
    List<String>? grantedScopes,
  }) : _wrapped = $js.GetAuthTokenResult()
          ..token = token
          ..grantedScopes = grantedScopes?.toJSArray((e) => e);

  final $js.GetAuthTokenResult _wrapped;

  $js.GetAuthTokenResult get toJS => _wrapped;

  /// The specific token associated with the request.
  String? get token => _wrapped.token;
  set token(String? v) {
    _wrapped.token = v;
  }

  /// A list of OAuth2 scopes granted to the extension.
  List<String>? get grantedScopes =>
      _wrapped.grantedScopes?.toDart.cast<String>().map((e) => e).toList();
  set grantedScopes(List<String>? v) {
    _wrapped.grantedScopes = v?.toJSArray((e) => e);
  }
}

class OnSignInChangedEvent {
  OnSignInChangedEvent({
    required this.account,
    required this.signedIn,
  });

  final AccountInfo account;

  final bool signedIn;
}
