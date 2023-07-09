import 'chrome.dart';
export 'chrome.dart';

final _devtoolsPanels = ChromeDevtoolsPanels._();

extension ChromeChromeDevtoolsPanelsExtension on Chrome {
  ChromeDevtoolsPanels get devtoolsPanels => _devtoolsPanels;
}

class ChromeDevtoolsPanels {
  ChromeDevtoolsPanels._();
}
