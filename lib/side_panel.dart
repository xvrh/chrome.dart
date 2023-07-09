import 'chrome.dart';

final _SidePanel = ChromeSidePanel._();

extension ChromeChromeSidePanelExtension on Chrome {
  ChromeSidePanel get SidePanel => _SidePanel;
}

class ChromeSidePanel {
  ChromeSidePanel._();
}
