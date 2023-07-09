import 'chrome.dart';

final _LoginState = ChromeLoginState._();

extension ChromeChromeLoginStateExtension on Chrome {
  ChromeLoginState get LoginState => _LoginState;
}

class ChromeLoginState {
  ChromeLoginState._();
}
