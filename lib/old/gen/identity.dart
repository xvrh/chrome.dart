/* This file has been generated from identity.idl - do not edit */

/**
 * Use the `chrome.identity` API to get OAuth2 access tokens.
 */
library chrome.identity;

import '../src/common.dart';

/**
 * Accessor for the `chrome.identity` namespace.
 */
final ChromeIdentity identity = ChromeIdentity._();

class ChromeIdentity extends ChromeApi {
  JsObject get _identity => chrome['identity'];

  Stream<OnSignInChangedEvent> get onSignInChanged => _onSignInChanged.stream;
  late ChromeStreamController<OnSignInChangedEvent> _onSignInChanged;

  ChromeIdentity._() {
    var getApi = () => _identity;
    _onSignInChanged = ChromeStreamController<OnSignInChangedEvent>.twoArgs(getApi, 'onSignInChanged', _createOnSignInChangedEvent);
  }

  bool get available => _identity != null;

  /**
   * Retrieves a list of AccountInfo objects describing the accounts present on
   * the profile.
   * 
   * `getAccounts` is only supported on dev channel.
   */
  Future<List<AccountInfo>> getAccounts() {
    if (_identity == null) _throwNotAvailable();

    var completer =  ChromeCompleter<List<AccountInfo>>.oneArg((e) => listify(e, _createAccountInfo));
    _identity.callMethod('getAccounts', [completer.callback]);
    return completer.future;
  }

  /**
   * Gets an OAuth2 access token using the client ID and scopes specified in the
   * <a href="app_identity.html#update_manifest">`oauth2` section of
   * manifest.json</a>.
   * 
   * The Identity API caches access tokens in memory, so it's ok to call
   * `getAuthToken` non-interactively any time a token is required. The token
   * cache automatically handles expiration.
   * 
   * For a good user experience it is important interactive token requests are
   * initiated by UI in your app explaining what the authorization is for.
   * Failing to do this will cause your users to get authorization requests, or
   * Chrome sign in screens if they are not signed in, with with no context. In
   * particular, do not use `getAuthToken` interactively when your app is first
   * launched.
   * 
   * Note: When called with a callback, instead of returning an object this
   * function will return the two properties as separate arguments passed to the
   * callback.
   * 
   * [details]: Token options.
   * [callback]: Called with an OAuth2 access token as specified by the
   * manifest, or undefined if there was an error. The `grantedScopes` parameter
   * is populated since Chrome 87. When available, this parameter contains the
   * list of granted scopes corresponding with the returned token.
   */
  Future<GetAuthTokenResult> getAuthToken([TokenDetails? details]) {
    if (_identity == null) _throwNotAvailable();

    var completer =  ChromeCompleter<GetAuthTokenResult>.oneArg(_createGetAuthTokenResult);
    _identity.callMethod('getAuthToken', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Retrieves email address and obfuscated gaia id of the user signed into a
   * profile.
   * 
   * Requires the `identity.email` manifest permission. Otherwise, returns an
   * empty result.
   * 
   * This API is different from identity.getAccounts in two ways. The
   * information returned is available offline, and it only applies to the
   * primary account for the profile.
   * 
   * [details]: Profile options.
   * [callback]: Called with the `ProfileUserInfo` of the primary Chrome
   * account, of an empty `ProfileUserInfo` if the account with given `details`
   * doesn't exist.
   */
  Future<ProfileUserInfo> getProfileUserInfo([ProfileDetails? details]) {
    if (_identity == null) _throwNotAvailable();

    var completer =  ChromeCompleter<ProfileUserInfo>.oneArg(_createProfileUserInfo);
    _identity.callMethod('getProfileUserInfo', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Removes an OAuth2 access token from the Identity API's token cache.
   * 
   * If an access token is discovered to be invalid, it should be passed to
   * removeCachedAuthToken to remove it from the cache. The app may then
   * retrieve a fresh token with `getAuthToken`.
   * 
   * [details]: Token information.
   * [callback]: Called when the token has been removed from the cache.
   */
  Future removeCachedAuthToken(InvalidTokenDetails details) {
    if (_identity == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _identity.callMethod('removeCachedAuthToken', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Resets the state of the Identity API: <ul> <li>Removes all OAuth2 access
   * tokens from the token cache</li> <li>Removes user's account
   * preferences</li> <li>De-authorizes the user from all auth flows</li> </ul>
   * 
   * [callback]: Called when the state has been cleared.
   */
  Future clearAllCachedAuthTokens() {
    if (_identity == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _identity.callMethod('clearAllCachedAuthTokens', [completer.callback]);
    return completer.future;
  }

  /**
   * Starts an auth flow at the specified URL.
   * 
   * This method enables auth flows with non-Google identity providers by
   * launching a web view and navigating it to the first URL in the provider's
   * auth flow. When the provider redirects to a URL matching the pattern
   * `https://<app-id>.chromiumapp.org/`, the window will close, and the final
   * redirect URL will be passed to the [callback] function.
   * 
   * For a good user experience it is important interactive auth flows are
   * initiated by UI in your app explaining what the authorization is for.
   * Failing to do this will cause your users to get authorization requests with
   * no context. In particular, do not launch an interactive auth flow when your
   * app is first launched.
   * 
   * [details]: WebAuth flow options.
   * [callback]: Called with the URL redirected back to your application.
   */
  Future<String> launchWebAuthFlow(WebAuthFlowDetails details) {
    if (_identity == null) _throwNotAvailable();

    var completer =  ChromeCompleter<String>.oneArg();
    _identity.callMethod('launchWebAuthFlow', [jsify(details), completer.callback]);
    return completer.future;
  }

  /**
   * Generates a redirect URL to be used in [launchWebAuthFlow].
   * 
   * The generated URLs match the pattern `https://<app-id>.chromiumapp.org/`.
   * 
   * [path]: The path appended to the end of the generated URL.
   */
  String getRedirectURL([String? path]) {
    if (_identity == null) _throwNotAvailable();

    return _identity.callMethod('getRedirectURL', [path]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.identity' is not available");
  }
}

class OnSignInChangedEvent {
  final AccountInfo account;

  final bool signedIn;

  OnSignInChangedEvent(this.account, this.signedIn);
}

class AccountStatus extends ChromeEnum {
  static const AccountStatus SYNC = const AccountStatus._('SYNC');
  static const AccountStatus ANY = const AccountStatus._('ANY');

  static const List<AccountStatus> VALUES = const[SYNC, ANY];

  const AccountStatus._(String str): super(str);
}

class AccountInfo extends ChromeObject {
  AccountInfo({String? id}) {
    if (id != null) this.id = id;
  }
  AccountInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;
}

class ProfileDetails extends ChromeObject {
  ProfileDetails({AccountStatus? accountStatus}) {
    if (accountStatus != null) this.accountStatus = accountStatus;
  }
  ProfileDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  AccountStatus get accountStatus => _createAccountStatus(jsProxy['accountStatus']);
  set accountStatus(AccountStatus value) => jsProxy['accountStatus'] = jsify(value);
}

class ProfileUserInfo extends ChromeObject {
  ProfileUserInfo({String? email, String? id}) {
    if (email != null) this.email = email;
    if (id != null) this.id = id;
  }
  ProfileUserInfo.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get email => jsProxy['email'];
  set email(String value) => jsProxy['email'] = value;

  String get id => jsProxy['id'];
  set id(String value) => jsProxy['id'] = value;
}

class TokenDetails extends ChromeObject {
  TokenDetails({bool? interactive, AccountInfo? account, List<String>? scopes, bool? enableGranularPermissions}) {
    if (interactive != null) this.interactive = interactive;
    if (account != null) this.account = account;
    if (scopes != null) this.scopes = scopes;
    if (enableGranularPermissions != null) this.enableGranularPermissions = enableGranularPermissions;
  }
  TokenDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  bool get interactive => jsProxy['interactive'];
  set interactive(bool value) => jsProxy['interactive'] = value;

  AccountInfo get account => _createAccountInfo(jsProxy['account']);
  set account(AccountInfo value) => jsProxy['account'] = jsify(value);

  List<String> get scopes => listify(jsProxy['scopes']);
  set scopes(List<String> value) => jsProxy['scopes'] = jsify(value);

  bool get enableGranularPermissions => jsProxy['enableGranularPermissions'];
  set enableGranularPermissions(bool value) => jsProxy['enableGranularPermissions'] = value;
}

class InvalidTokenDetails extends ChromeObject {
  InvalidTokenDetails({String? token}) {
    if (token != null) this.token = token;
  }
  InvalidTokenDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get token => jsProxy['token'];
  set token(String value) => jsProxy['token'] = value;
}

class WebAuthFlowDetails extends ChromeObject {
  WebAuthFlowDetails({String? url, bool? interactive, bool? abortOnLoadForNonInteractive, int? timeoutMsForNonInteractive}) {
    if (url != null) this.url = url;
    if (interactive != null) this.interactive = interactive;
    if (abortOnLoadForNonInteractive != null) this.abortOnLoadForNonInteractive = abortOnLoadForNonInteractive;
    if (timeoutMsForNonInteractive != null) this.timeoutMsForNonInteractive = timeoutMsForNonInteractive;
  }
  WebAuthFlowDetails.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;

  bool get interactive => jsProxy['interactive'];
  set interactive(bool value) => jsProxy['interactive'] = value;

  bool get abortOnLoadForNonInteractive => jsProxy['abortOnLoadForNonInteractive'];
  set abortOnLoadForNonInteractive(bool value) => jsProxy['abortOnLoadForNonInteractive'] = value;

  int get timeoutMsForNonInteractive => jsProxy['timeoutMsForNonInteractive'];
  set timeoutMsForNonInteractive(int value) => jsProxy['timeoutMsForNonInteractive'] = value;
}

class GetAuthTokenResult extends ChromeObject {
  GetAuthTokenResult({String? token, List<String>? grantedScopes}) {
    if (token != null) this.token = token;
    if (grantedScopes != null) this.grantedScopes = grantedScopes;
  }
  GetAuthTokenResult.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get token => jsProxy['token'];
  set token(String value) => jsProxy['token'] = value;

  List<String> get grantedScopes => listify(jsProxy['grantedScopes']);
  set grantedScopes(List<String> value) => jsProxy['grantedScopes'] = jsify(value);
}

OnSignInChangedEvent _createOnSignInChangedEvent(JsObject account, bool signedIn) =>
    OnSignInChangedEvent(_createAccountInfo(account), signedIn);
AccountInfo _createAccountInfo(JsObject jsProxy) => AccountInfo.fromProxy(jsProxy);
GetAuthTokenResult _createGetAuthTokenResult(JsObject jsProxy) => GetAuthTokenResult.fromProxy(jsProxy);
ProfileUserInfo _createProfileUserInfo(JsObject jsProxy) => ProfileUserInfo.fromProxy(jsProxy);
AccountStatus _createAccountStatus(String value) => AccountStatus.VALUES.singleWhere((ChromeEnum e) => e.value == value);
