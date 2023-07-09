import 'chrome.dart';

final _DevtoolsInspectedWindow = ChromeDevtoolsInspectedWindow._();

extension ChromeChromeDevtoolsInspectedWindowExtension on Chrome {
  ChromeDevtoolsInspectedWindow get DevtoolsInspectedWindow =>
      _DevtoolsInspectedWindow;
}

class ChromeDevtoolsInspectedWindow {
  ChromeDevtoolsInspectedWindow._();
}
