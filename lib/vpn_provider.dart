import 'chrome.dart';
export 'chrome.dart';

final _vpnProvider = ChromeVpnProvider._();

extension ChromeChromeVpnProviderExtension on Chrome {
  ChromeVpnProvider get vpnProvider => _vpnProvider;
}

class ChromeVpnProvider {
  ChromeVpnProvider._();

  /// Creates a new VPN configuration that persists across multiple login
  /// sessions of the user.
  /// |name|: The name of the VPN configuration.
  /// |callback|: Called when the configuration is created or if there is an
  /// error.
  void createConfig(name) => throw UnimplementedError();

  /// Destroys a VPN configuration created by the extension.
  /// |id|: ID of the VPN configuration to destroy.
  /// |callback|: Called when the configuration is destroyed or if there is an
  /// error.
  void destroyConfig(id) => throw UnimplementedError();

  /// Sets the parameters for the VPN session. This should be called
  /// immediately after `"connected"` is received from the platform.
  /// This will succeed only when the VPN session is owned by the extension.
  /// |parameters|: The parameters for the VPN session.
  /// |callback|: Called when the parameters are set or if there is an error.
  void setParameters(parameters) => throw UnimplementedError();

  /// Sends an IP packet through the tunnel created for the VPN session.
  /// This will succeed only when the VPN session is owned by the extension.
  /// |data|: The IP packet to be sent to the platform.
  /// |callback|: Called when the packet is sent or if there is an error.
  void sendPacket(data) => throw UnimplementedError();

  /// Notifies the VPN session state to the platform.
  /// This will succeed only when the VPN session is owned by the extension.
  /// |state|: The VPN session state of the VPN client.
  /// |callback|: Called when the notification is complete or if there is an
  /// error.
  void notifyConnectionStateChanged(state) => throw UnimplementedError();

  /// Triggered when a message is received from the platform for a
  /// VPN configuration owned by the extension.
  /// |id|: ID of the configuration the message is intended for.
  /// |message|: The message received from the platform.  Note that new
  /// message types may be added in future Chrome versions to support new
  /// features.
  /// |error|: Error message when there is an error.
  Stream get onPlatformMessage => throw UnimplementedError();

  /// Triggered when an IP packet is received via the tunnel for the VPN
  /// session owned by the extension.
  /// |data|: The IP packet received from the platform.
  Stream get onPacketReceived => throw UnimplementedError();

  /// Triggered when a configuration created by the extension is removed by the
  /// platform.
  /// |id|: ID of the removed configuration.
  Stream get onConfigRemoved => throw UnimplementedError();

  /// Triggered when a configuration is created by the platform for the
  /// extension.
  /// |id|: ID of the configuration created.
  /// |name|: Name of the configuration created.
  /// |data|: Configuration data provided by the administrator.
  Stream get onConfigCreated => throw UnimplementedError();

  /// Triggered when there is a UI event for the extension. UI events are
  /// signals from the platform that indicate to the app that a UI dialog
  /// needs to be shown to the user.
  /// |event|: The UI event that is triggered.
  /// |id|: ID of the configuration for which the UI event was triggered.
  Stream get onUIEvent => throw UnimplementedError();
}

/// The enum is used by the platform to notify the client of the VPN session
/// status.
enum PlatformMessage {
  /// VPN configuration connected.
  connected('connected'),

  /// VPN configuration disconnected.
  disconnected('disconnected'),

  /// An error occurred in VPN connection, for example a timeout. A description
  /// of the error is given as the <a href="#property-onPlatformMessage-error">
  /// error argument to onPlatformMessage</a>.
  error('error'),

  /// The default physical network connection is down.
  linkDown('linkDown'),

  /// The default physical network connection is back up.
  linkUp('linkUp'),

  /// The default physical network connection changed, e.g. wifi->mobile.
  linkChanged('linkChanged'),

  /// The OS is preparing to suspend, so the VPN should drop its connection.
  /// The extension is not guaranteed to receive this event prior to
  /// suspending.
  suspend('suspend'),

  /// The OS has resumed and the user has logged back in, so the VPN should
  /// try to reconnect.
  resume('resume');

  const PlatformMessage(this.value);

  final String value;
}

/// The enum is used by the VPN client to inform the platform
/// of its current state. This helps provide meaningful messages
/// to the user.
enum VpnConnectionState {
  /// VPN connection was successful.
  connected('connected'),

  /// VPN connection failed.
  failure('failure');

  const VpnConnectionState(this.value);

  final String value;
}

/// The enum is used by the platform to indicate the event that triggered
/// `onUIEvent`.
enum UIEvent {
  /// Request the VPN client to show add configuration dialog to the user.
  showAddDialog('showAddDialog'),

  /// Request the VPN client to show configuration settings dialog to the user.
  showConfigureDialog('showConfigureDialog');

  const UIEvent(this.value);

  final String value;
}
