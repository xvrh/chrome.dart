import 'chrome.dart';
export 'chrome.dart';

final _loginState = ChromeLoginState._();

extension ChromeChromeLoginStateExtension on Chrome {
  ChromeLoginState get loginState => _loginState;
}

class ChromeLoginState {
  ChromeLoginState._();

  ///  Gets the type of the profile the extension is in.
  void getProfileType() => throw UnimplementedError();

  ///  Gets the current session state.
  void getSessionState() => throw UnimplementedError();

  ///  Dispatched when the session state changes. `sessionState`
  ///  is the new session state.
  Stream get onSessionStateChanged => throw UnimplementedError();
}

enum ProfileType {
  ///  The extension is in the signin profile.
  signinProfile('SIGNIN_PROFILE'),

  ///  The extension is in the user profile.
  userProfile('USER_PROFILE');

  const ProfileType(this.value);

  final String value;
}

enum SessionState {
  ///  The session state is unknown.
  unknown('UNKNOWN'),

  ///  The user is in the out-of-box-experience screen.
  inOobeScreen('IN_OOBE_SCREEN'),

  ///  The user is in the login screen.
  inLoginScreen('IN_LOGIN_SCREEN'),

  ///  The user is in the session.
  inSession('IN_SESSION'),

  ///  The user is in the lock screen.
  inLockScreen('IN_LOCK_SCREEN'),

  ///  The device is in RMA mode, finalizing repairs.
  inRmaScreen('IN_RMA_SCREEN');

  const SessionState(this.value);

  final String value;
}
