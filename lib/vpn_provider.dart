import 'chrome.dart';
export 'chrome.dart';

final _vpnProvider = ChromeVpnProvider._();

extension ChromeChromeVpnProviderExtension on Chrome {
  ChromeVpnProvider get vpnProvider => _vpnProvider;
}

class ChromeVpnProvider {
  ChromeVpnProvider._();
}

///  The enum is used by the platform to notify the client of the VPN session
///  status.
enum PlatformMessage {
  ///  VPN configuration connected.
  connected('connected'),

  ///  VPN configuration disconnected.
  disconnected('disconnected'),

  ///  An error occurred in VPN connection, for example a timeout. A description
  ///  of the error is given as the <a href="#property-onPlatformMessage-error">
  ///  error argument to onPlatformMessage</a>.
  error('error'),

  ///  The default physical network connection is down.
  linkDown('linkDown'),

  ///  The default physical network connection is back up.
  linkUp('linkUp'),

  ///  The default physical network connection changed, e.g. wifi->mobile.
  linkChanged('linkChanged'),

  ///  The OS is preparing to suspend, so the VPN should drop its connection.
  ///  The extension is not guaranteed to receive this event prior to
  ///  suspending.
  suspend('suspend'),

  ///  The OS has resumed and the user has logged back in, so the VPN should
  ///  try to reconnect.
  resume('resume');

  const PlatformMessage(this.value);

  final String value;
}

///  The enum is used by the VPN client to inform the platform
///  of its current state. This helps provide meaningful messages
///  to the user.
enum VpnConnectionState {
  ///  VPN connection was successful.
  connected('connected'),

  ///  VPN connection failed.
  failure('failure');

  const VpnConnectionState(this.value);

  final String value;
}

///  The enum is used by the platform to indicate the event that triggered
///  `onUIEvent`.
enum UIEvent {
  ///  Request the VPN client to show add configuration dialog to the user.
  showAddDialog('showAddDialog'),

  ///  Request the VPN client to show configuration settings dialog to the user.
  showConfigureDialog('showConfigureDialog');

  const UIEvent(this.value);

  final String value;
}
