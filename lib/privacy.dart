import 'chrome.dart';
export 'chrome.dart';

final _privacy = ChromePrivacy._();

extension ChromeChromePrivacyExtension on Chrome {
  ChromePrivacy get privacy => _privacy;
}

class ChromePrivacy {
  ChromePrivacy._();
}

/// The IP handling policy of WebRTC.
enum IPHandlingPolicy {
  default$('default'),
  defaultPublicAndPrivateInterfaces('default_public_and_private_interfaces'),
  defaultPublicInterfaceOnly('default_public_interface_only'),
  disableNonProxiedUdp('disable_non_proxied_udp');

  const IPHandlingPolicy(this.value);

  final String value;
}
