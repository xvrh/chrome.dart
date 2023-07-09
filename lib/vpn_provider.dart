import 'chrome.dart';

final _VpnProvider = ChromeVpnProvider._();

extension ChromeChromeVpnProviderExtension on Chrome {
  ChromeVpnProvider get VpnProvider => _VpnProvider;
}

class ChromeVpnProvider {
  ChromeVpnProvider._();
}
