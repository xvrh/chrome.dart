/* This file has been generated from vpn_provider.idl - do not edit */

/**
 * Use the `chrome.vpnProvider` API to implement a VPN client.
 */
library chrome.vpnProvider;

import '../src/common.dart';

/**
 * Accessor for the `chrome.vpnProvider` namespace.
 */
final ChromeVpnProvider vpnProvider = ChromeVpnProvider._();

class ChromeVpnProvider extends ChromeApi {
  JsObject get _vpnProvider => chrome['vpnProvider'];

  Stream<OnPlatformMessageEvent> get onPlatformMessage => _onPlatformMessage.stream;
  late ChromeStreamController<OnPlatformMessageEvent> _onPlatformMessage;

  Stream<ArrayBuffer> get onPacketReceived => _onPacketReceived.stream;
  late ChromeStreamController<ArrayBuffer> _onPacketReceived;

  Stream<String> get onConfigRemoved => _onConfigRemoved.stream;
  late ChromeStreamController<String> _onConfigRemoved;

  Stream<OnConfigCreatedEvent> get onConfigCreated => _onConfigCreated.stream;
  late ChromeStreamController<OnConfigCreatedEvent> _onConfigCreated;

  Stream<OnUIEventEvent> get onUIEvent => _onUIEvent.stream;
  late ChromeStreamController<OnUIEventEvent> _onUIEvent;

  ChromeVpnProvider._() {
    var getApi = () => _vpnProvider;
    _onPlatformMessage = ChromeStreamController<OnPlatformMessageEvent>.threeArgs(getApi, 'onPlatformMessage', _createOnPlatformMessageEvent);
    _onPacketReceived = ChromeStreamController<ArrayBuffer>.oneArg(getApi, 'onPacketReceived', _createArrayBuffer);
    _onConfigRemoved = ChromeStreamController<String>.oneArg(getApi, 'onConfigRemoved', selfConverter);
    _onConfigCreated = ChromeStreamController<OnConfigCreatedEvent>.threeArgs(getApi, 'onConfigCreated', _createOnConfigCreatedEvent);
    _onUIEvent = ChromeStreamController<OnUIEventEvent>.twoArgs(getApi, 'onUIEvent', _createOnUIEventEvent);
  }

  bool get available => _vpnProvider != null;

  /**
   * Creates a new VPN configuration that persists across multiple login
   * sessions of the user.
   * [name]: The name of the VPN configuration.
   * [callback]: Called when the configuration is created or if there is an
   * error.
   * 
   * Returns:
   * The callback is used by `createConfig` to signal completion. The callback
   * is called with `chrome.runtime.lastError` set to an error code if there is
   * an error.
   * [id]: A unique ID for the created configuration, or `undefined` on failure.
   */
  Future<String> createConfig(String name) {
    if (_vpnProvider == null) _throwNotAvailable();

    var completer =  ChromeCompleter<String>.oneArg();
    _vpnProvider.callMethod('createConfig', [name, completer.callback]);
    return completer.future;
  }

  /**
   * Destroys a VPN configuration created by the extension.
   * [id]: ID of the VPN configuration to destroy.
   * [callback]: Called when the configuration is destroyed or if there is an
   * error.
   */
  Future destroyConfig(String id) {
    if (_vpnProvider == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _vpnProvider.callMethod('destroyConfig', [id, completer.callback]);
    return completer.future;
  }

  /**
   * Sets the parameters for the VPN session. This should be called immediately
   * after `"connected"` is received from the platform. This will succeed only
   * when the VPN session is owned by the extension.
   * [parameters]: The parameters for the VPN session.
   * [callback]: Called when the parameters are set or if there is an error.
   */
  Future setParameters(Parameters parameters) {
    if (_vpnProvider == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _vpnProvider.callMethod('setParameters', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Sends an IP packet through the tunnel created for the VPN session. This
   * will succeed only when the VPN session is owned by the extension.
   * [data]: The IP packet to be sent to the platform.
   * [callback]: Called when the packet is sent or if there is an error.
   */
  Future sendPacket(ArrayBuffer data) {
    if (_vpnProvider == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _vpnProvider.callMethod('sendPacket', [jsify(data), completer.callback]);
    return completer.future;
  }

  /**
   * Notifies the VPN session state to the platform. This will succeed only when
   * the VPN session is owned by the extension.
   * [state]: The VPN session state of the VPN client.
   * [callback]: Called when the notification is complete or if there is an
   * error.
   */
  Future notifyConnectionStateChanged(VpnConnectionState state) {
    if (_vpnProvider == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _vpnProvider.callMethod('notifyConnectionStateChanged', [jsify(state), completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.vpnProvider' is not available");
  }
}

class OnPlatformMessageEvent {
  final String id;

  final PlatformMessage message;

  final String error;

  OnPlatformMessageEvent(this.id, this.message, this.error);
}

class OnConfigCreatedEvent {
  final String id;

  final String name;

  final Object data;

  OnConfigCreatedEvent(this.id, this.name, this.data);
}

class OnUIEventEvent {
  final UIEvent event;

  /**
   * `optional`
   */
  final String id;

  OnUIEventEvent(this.event, this.id);
}

/**
 * The enum is used by the platform to notify the client of the VPN session
 * status.
 */
class PlatformMessage extends ChromeEnum {
  static const PlatformMessage CONNECTED = const PlatformMessage._('connected');
  static const PlatformMessage DISCONNECTED = const PlatformMessage._('disconnected');
  static const PlatformMessage ERROR = const PlatformMessage._('error');
  static const PlatformMessage LINK_DOWN = const PlatformMessage._('linkDown');
  static const PlatformMessage LINK_UP = const PlatformMessage._('linkUp');
  static const PlatformMessage LINK_CHANGED = const PlatformMessage._('linkChanged');
  static const PlatformMessage SUSPEND = const PlatformMessage._('suspend');
  static const PlatformMessage RESUME = const PlatformMessage._('resume');

  static const List<PlatformMessage> VALUES = const[CONNECTED, DISCONNECTED, ERROR, LINK_DOWN, LINK_UP, LINK_CHANGED, SUSPEND, RESUME];

  const PlatformMessage._(String str): super(str);
}

/**
 * The enum is used by the VPN client to inform the platform of its current
 * state. This helps provide meaningful messages to the user.
 */
class VpnConnectionState extends ChromeEnum {
  static const VpnConnectionState CONNECTED = const VpnConnectionState._('connected');
  static const VpnConnectionState FAILURE = const VpnConnectionState._('failure');

  static const List<VpnConnectionState> VALUES = const[CONNECTED, FAILURE];

  const VpnConnectionState._(String str): super(str);
}

/**
 * The enum is used by the platform to indicate the event that triggered
 * `onUIEvent`.
 */
class UIEvent extends ChromeEnum {
  static const UIEvent SHOW_ADD_DIALOG = const UIEvent._('showAddDialog');
  static const UIEvent SHOW_CONFIGURE_DIALOG = const UIEvent._('showConfigureDialog');

  static const List<UIEvent> VALUES = const[SHOW_ADD_DIALOG, SHOW_CONFIGURE_DIALOG];

  const UIEvent._(String str): super(str);
}

/**
 * A parameters class for the VPN interface.
 */
class Parameters extends ChromeObject {
  Parameters({String? address, String? broadcastAddress, String? mtu, List<String>? exclusionList, List<String>? inclusionList, List<String>? domainSearch, List<String>? dnsServers, String? reconnect}) {
    if (address != null) this.address = address;
    if (broadcastAddress != null) this.broadcastAddress = broadcastAddress;
    if (mtu != null) this.mtu = mtu;
    if (exclusionList != null) this.exclusionList = exclusionList;
    if (inclusionList != null) this.inclusionList = inclusionList;
    if (domainSearch != null) this.domainSearch = domainSearch;
    if (dnsServers != null) this.dnsServers = dnsServers;
    if (reconnect != null) this.reconnect = reconnect;
  }
  Parameters.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  String get address => jsProxy['address'];
  set address(String value) => jsProxy['address'] = value;

  String get broadcastAddress => jsProxy['broadcastAddress'];
  set broadcastAddress(String value) => jsProxy['broadcastAddress'] = value;

  String get mtu => jsProxy['mtu'];
  set mtu(String value) => jsProxy['mtu'] = value;

  List<String> get exclusionList => listify(jsProxy['exclusionList']);
  set exclusionList(List<String> value) => jsProxy['exclusionList'] = jsify(value);

  List<String> get inclusionList => listify(jsProxy['inclusionList']);
  set inclusionList(List<String> value) => jsProxy['inclusionList'] = jsify(value);

  List<String> get domainSearch => listify(jsProxy['domainSearch']);
  set domainSearch(List<String> value) => jsProxy['domainSearch'] = jsify(value);

  List<String> get dnsServers => listify(jsProxy['dnsServers']);
  set dnsServers(List<String> value) => jsProxy['dnsServers'] = jsify(value);

  String get reconnect => jsProxy['reconnect'];
  set reconnect(String value) => jsProxy['reconnect'] = value;
}

OnPlatformMessageEvent _createOnPlatformMessageEvent(String id, JsObject message, String error) =>
    OnPlatformMessageEvent(id, _createPlatformMessage(message), error);
ArrayBuffer _createArrayBuffer(/*JsObject*/ jsProxy) => ArrayBuffer.fromProxy(jsProxy);
OnConfigCreatedEvent _createOnConfigCreatedEvent(String id, String name, JsObject data) =>
    OnConfigCreatedEvent(id, name, data);
OnUIEventEvent _createOnUIEventEvent(JsObject event, String id) =>
    OnUIEventEvent(_createUIEvent(event), id);
PlatformMessage _createPlatformMessage(String value) => PlatformMessage.VALUES.singleWhere((ChromeEnum e) => e.value == value);
UIEvent _createUIEvent(String value) => UIEvent.VALUES.singleWhere((ChromeEnum e) => e.value == value);
