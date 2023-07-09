import 'chrome.dart';
export 'chrome.dart';

final _systemNetwork = ChromeSystemNetwork._();

extension ChromeChromeSystemNetworkExtension on Chrome {
  ChromeSystemNetwork get systemNetwork => _systemNetwork;
}

class ChromeSystemNetwork {
  ChromeSystemNetwork._();
}
