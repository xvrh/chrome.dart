import 'chrome.dart';
export 'chrome.dart';

final _devtoolsNetwork = ChromeDevtoolsNetwork._();

extension ChromeChromeDevtoolsNetworkExtension on Chrome {
  ChromeDevtoolsNetwork get devtoolsNetwork => _devtoolsNetwork;
}

class ChromeDevtoolsNetwork {
  ChromeDevtoolsNetwork._();
}
