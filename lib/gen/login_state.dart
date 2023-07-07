/* This file has been generated from login_state.idl - do not edit */

/**
 * Use the `chrome.loginState` API to read and monitor the login state.
 */
library chrome.loginState;

import '../src/common.dart';

/**
 * Accessor for the `chrome.loginState` namespace.
 */
final ChromeLoginState loginState = ChromeLoginState._();

class ChromeLoginState extends ChromeApi {
  JsObject get _loginState => chrome['loginState'];

  Stream<SessionState> get onSessionStateChanged => _onSessionStateChanged.stream;
  late ChromeStreamController<SessionState> _onSessionStateChanged;

  ChromeLoginState._() {
    var getApi = () => _loginState;
    _onSessionStateChanged = ChromeStreamController<SessionState>.oneArg(getApi, 'onSessionStateChanged', _createSessionState);
  }

  bool get available => _loginState != null;

  /**
   * Gets the type of the profile the extension is in.
   */
  Future<ProfileType> getProfileType() {
    if (_loginState == null) _throwNotAvailable();

    var completer =  ChromeCompleter<ProfileType>.oneArg(_createProfileType);
    _loginState.callMethod('getProfileType', [completer.callback]);
    return completer.future;
  }

  /**
   * Gets the current session state.
   */
  Future<SessionState> getSessionState() {
    if (_loginState == null) _throwNotAvailable();

    var completer =  ChromeCompleter<SessionState>.oneArg(_createSessionState);
    _loginState.callMethod('getSessionState', [completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.loginState' is not available");
  }
}

class ProfileType extends ChromeEnum {
  static const ProfileType SIGNIN_PROFILE = const ProfileType._('SIGNIN_PROFILE');
  static const ProfileType USER_PROFILE = const ProfileType._('USER_PROFILE');

  static const List<ProfileType> VALUES = const[SIGNIN_PROFILE, USER_PROFILE];

  const ProfileType._(String str): super(str);
}

class SessionState extends ChromeEnum {
  static const SessionState UNKNOWN = const SessionState._('UNKNOWN');
  static const SessionState IN_OOBE_SCREEN = const SessionState._('IN_OOBE_SCREEN');
  static const SessionState IN_LOGIN_SCREEN = const SessionState._('IN_LOGIN_SCREEN');
  static const SessionState IN_SESSION = const SessionState._('IN_SESSION');
  static const SessionState IN_LOCK_SCREEN = const SessionState._('IN_LOCK_SCREEN');
  static const SessionState IN_RMA_SCREEN = const SessionState._('IN_RMA_SCREEN');

  static const List<SessionState> VALUES = const[UNKNOWN, IN_OOBE_SCREEN, IN_LOGIN_SCREEN, IN_SESSION, IN_LOCK_SCREEN, IN_RMA_SCREEN];

  const SessionState._(String str): super(str);
}

SessionState _createSessionState(String value) => SessionState.VALUES.singleWhere((ChromeEnum e) => e.value == value);
ProfileType _createProfileType(String value) => ProfileType.VALUES.singleWhere((ChromeEnum e) => e.value == value);
