import 'chrome.dart';

final _SystemNetwork = ChromeSystemNetwork._();

extension ChromeChromeSystemNetworkExtension on Chrome {
  ChromeSystemNetwork get SystemNetwork => _SystemNetwork;
}

class ChromeSystemNetwork {
  ChromeSystemNetwork._();
}
