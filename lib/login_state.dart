import 'chrome.dart';
export 'chrome.dart';

final _loginState = ChromeLoginState._();

extension ChromeChromeLoginStateExtension on Chrome {
  ChromeLoginState get loginState => _loginState;
}

class ChromeLoginState {
  ChromeLoginState._();

  ///  Gets the type of the profile the extension is in.
  void getProfileType(callback) => throw UnimplementedError();

  ///  Gets the current session state.
  void getSessionState(callback) => throw UnimplementedError();

  ///  Dispatched when the session state changes. `sessionState`
  ///  is the new session state.
  Stream get onSessionStateChanged => throw UnimplementedError();
}

enum ProfileType {
  ///  The extension is in the signin profile.
  signinPROFILE('SIGNIN_PROFILE'),

  ///  The extension is in the user profile.
  userPROFILE('USER_PROFILE');

  const ProfileType(this.value);

  final String value;
}

enum SessionState {
  ///  The session state is unknown.
  unknown('UNKNOWN'),

  ///  The user is in the out-of-box-experience screen.
  inOOBESCREEN('IN_OOBE_SCREEN'),

  ///  The user is in the login screen.
  inLOGINSCREEN('IN_LOGIN_SCREEN'),

  ///  The user is in the session.
  inSESSION('IN_SESSION'),

  ///  The user is in the lock screen.
  inLOCKSCREEN('IN_LOCK_SCREEN'),

  ///  The device is in RMA mode, finalizing repairs.
  inRMASCREEN('IN_RMA_SCREEN');

  const SessionState(this.value);

  final String value;
}
