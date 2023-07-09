import 'chrome.dart';

final _DevtoolsPanels = ChromeDevtoolsPanels._();

extension ChromeChromeDevtoolsPanelsExtension on Chrome {
  ChromeDevtoolsPanels get DevtoolsPanels => _DevtoolsPanels;
}

class ChromeDevtoolsPanels {
  ChromeDevtoolsPanels._();
}
