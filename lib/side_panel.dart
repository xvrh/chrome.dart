import 'chrome.dart';
export 'chrome.dart';

final _sidePanel = ChromeSidePanel._();

extension ChromeChromeSidePanelExtension on Chrome {
  ChromeSidePanel get sidePanel => _sidePanel;
}

class ChromeSidePanel {
  ChromeSidePanel._();
}
