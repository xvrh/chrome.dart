import 'chrome.dart';

final _Debugger = ChromeDebugger._();

extension ChromeChromeDebuggerExtension on Chrome {
  ChromeDebugger get Debugger => _Debugger;
}

class ChromeDebugger {
  ChromeDebugger._();
}
