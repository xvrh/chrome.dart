import 'src/internal_helpers.dart';
import 'src/js/login_state.dart' as $js;

export 'src/chrome.dart' show chrome;

final _loginState = ChromeLoginState._();

extension ChromeLoginStateExtension on Chrome {
  ChromeLoginState get loginState => _loginState;
}

class ChromeLoginState {
  ChromeLoginState._();

  /// Gets the type of the profile the extension is in.
  Future<ProfileType> getProfileType() {
    var $completer = Completer<ProfileType>();
    $js.chrome.loginState.getProfileType((ProfileType result) {
      $completer.complete(null);
    }.toJS);
    return $completer.future;
  }

  /// Gets the current session state.
  Future<SessionState> getSessionState() {
    var $completer = Completer<SessionState>();
    $js.chrome.loginState.getSessionState((SessionState result) {
      $completer.complete(null);
    }.toJS);
    return $completer.future;
  }

  /// Dispatched when the session state changes. `sessionState`
  /// is the new session state.
  Stream<SessionState> get onSessionStateChanged => throw UnimplementedError();
}

enum ProfileType {
  /// The extension is in the signin profile.
  signinProfile('SIGNIN_PROFILE'),

  /// The extension is in the user profile.
  userProfile('USER_PROFILE');

  const ProfileType(this.value);

  final String value;

  String get toJS => value;
  static ProfileType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum SessionState {
  /// The session state is unknown.
  unknown('UNKNOWN'),

  /// The user is in the out-of-box-experience screen.
  inOobeScreen('IN_OOBE_SCREEN'),

  /// The user is in the login screen.
  inLoginScreen('IN_LOGIN_SCREEN'),

  /// The user is in the session.
  inSession('IN_SESSION'),

  /// The user is in the lock screen.
  inLockScreen('IN_LOCK_SCREEN'),

  /// The device is in RMA mode, finalizing repairs.
  inRmaScreen('IN_RMA_SCREEN');

  const SessionState(this.value);

  final String value;

  String get toJS => value;
  static SessionState fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}
