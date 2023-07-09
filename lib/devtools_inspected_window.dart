import 'chrome.dart';
export 'chrome.dart';

final _devtoolsInspectedWindow = ChromeDevtoolsInspectedWindow._();

extension ChromeChromeDevtoolsInspectedWindowExtension on Chrome {
  ChromeDevtoolsInspectedWindow get devtoolsInspectedWindow =>
      _devtoolsInspectedWindow;
}

class ChromeDevtoolsInspectedWindow {
  ChromeDevtoolsInspectedWindow._();
}
