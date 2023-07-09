import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSLoginStateExtension on JSChrome {
  ///  Use the `chrome.loginState` API to read and monitor the login
  ///  state.
  external JSLoginState get LoginState;
}

@JS()
@staticInterop
class JSLoginState {}

extension JSLoginStateExtension on JSLoginState {
  ///  Gets the type of the profile the extension is in.
  external void getProfileType();

  ///  Gets the current session state.
  external void getSessionState();

  ///  Dispatched when the session state changes. `sessionState`
  ///  is the new session state.
  external ChromeEvent get onSessionStateChanged;
}
