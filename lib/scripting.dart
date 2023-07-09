import 'chrome.dart';

final _Scripting = ChromeScripting._();

extension ChromeChromeScriptingExtension on Chrome {
  ChromeScripting get Scripting => _Scripting;
}

class ChromeScripting {
  ChromeScripting._();
}
