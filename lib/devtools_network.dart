import 'chrome.dart';

final _DevtoolsNetwork = ChromeDevtoolsNetwork._();

extension ChromeChromeDevtoolsNetworkExtension on Chrome {
  ChromeDevtoolsNetwork get DevtoolsNetwork => _DevtoolsNetwork;
}

class ChromeDevtoolsNetwork {
  ChromeDevtoolsNetwork._();
}
