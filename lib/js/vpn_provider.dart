import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSVpnProviderExtension on JSChrome {
  ///  Use the `chrome.vpnProvider` API to implement a VPN
  ///  client.
  external JSVpnProvider get VpnProvider;
}

@JS()
@staticInterop
class JSVpnProvider {}

extension JSVpnProviderExtension on JSVpnProvider {
  ///  Creates a new VPN configuration that persists across multiple login
  ///  sessions of the user.
  ///  |name|: The name of the VPN configuration.
  ///  |callback|: Called when the configuration is created or if there is an
  ///  error.
  external void createConfig();

  ///  Destroys a VPN configuration created by the extension.
  ///  |id|: ID of the VPN configuration to destroy.
  ///  |callback|: Called when the configuration is destroyed or if there is an
  ///  error.
  external void destroyConfig();

  ///  Sets the parameters for the VPN session. This should be called
  ///  immediately after `"connected"` is received from the platform.
  ///  This will succeed only when the VPN session is owned by the extension.
  ///  |parameters|: The parameters for the VPN session.
  ///  |callback|: Called when the parameters are set or if there is an error.
  external void setParameters();

  ///  Sends an IP packet through the tunnel created for the VPN session.
  ///  This will succeed only when the VPN session is owned by the extension.
  ///  |data|: The IP packet to be sent to the platform.
  ///  |callback|: Called when the packet is sent or if there is an error.
  external void sendPacket();

  ///  Notifies the VPN session state to the platform.
  ///  This will succeed only when the VPN session is owned by the extension.
  ///  |state|: The VPN session state of the VPN client.
  ///  |callback|: Called when the notification is complete or if there is an
  ///  error.
  external void notifyConnectionStateChanged();

  ///  Triggered when a message is received from the platform for a
  ///  VPN configuration owned by the extension.
  ///  |id|: ID of the configuration the message is intended for.
  ///  |message|: The message received from the platform.  Note that new
  ///  message types may be added in future Chrome versions to support new
  ///  features.
  ///  |error|: Error message when there is an error.
  external ChromeEvent get onPlatformMessage;

  ///  Triggered when an IP packet is received via the tunnel for the VPN
  ///  session owned by the extension.
  ///  |data|: The IP packet received from the platform.
  external ChromeEvent get onPacketReceived;

  ///  Triggered when a configuration created by the extension is removed by the
  ///  platform.
  ///  |id|: ID of the removed configuration.
  external ChromeEvent get onConfigRemoved;

  ///  Triggered when a configuration is created by the platform for the
  ///  extension.
  ///  |id|: ID of the configuration created.
  ///  |name|: Name of the configuration created.
  ///  |data|: Configuration data provided by the administrator.
  external ChromeEvent get onConfigCreated;

  ///  Triggered when there is a UI event for the extension. UI events are
  ///  signals from the platform that indicate to the app that a UI dialog
  ///  needs to be shown to the user.
  ///  |event|: The UI event that is triggered.
  ///  |id|: ID of the configuration for which the UI event was triggered.
  external ChromeEvent get onUIEvent;
}
