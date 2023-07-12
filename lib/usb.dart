import 'src/internal_helpers.dart';
import 'dart:typed_data';
import 'src/js/usb.dart' as $js;
export 'chrome.dart';

final _usb = ChromeUsb._();

extension ChromeUsbExtension on Chrome {
  ChromeUsb get usb => _usb;
}

class ChromeUsb {
  ChromeUsb._();

  /// Enumerates connected USB devices.
  /// |options|: The properties to search for on target devices.
  Future<List<Device>> getDevices(EnumerateDevicesOptions options) =>
      throw UnimplementedError();

  /// Presents a device picker to the user and returns the [Device]s
  /// selected.
  /// If the user cancels the picker devices will be empty. A user gesture
  /// is required for the dialog to display. Without a user gesture, the
  /// callback will run as though the user cancelled.
  /// |options|: Configuration of the device picker dialog box.
  /// |callback|: Invoked with a list of chosen [Device]s.
  Future<List<Device>> getUserSelectedDevices(DevicePromptOptions options) =>
      throw UnimplementedError();

  /// Returns the full set of device configuration descriptors.
  /// |device|: The [Device] to fetch descriptors from.
  Future<List<ConfigDescriptor>> getConfigurations(Device device) =>
      throw UnimplementedError();

  /// Requests access from the permission broker to a device claimed by
  /// Chrome OS if the given interface on the device is not claimed.
  ///
  /// |device|: The [Device] to request access to.
  /// |interfaceId|: The particular interface requested.
  Future<bool> requestAccess(
    Device device,
    int interfaceId,
  ) =>
      throw UnimplementedError();

  /// Opens a USB device returned by [getDevices].
  /// |device|: The [Device] to open.
  Future<ConnectionHandle> openDevice(Device device) =>
      throw UnimplementedError();

  /// Finds USB devices specified by the vendor, product and (optionally)
  /// interface IDs and if permissions allow opens them for use.
  ///
  /// If the access request is rejected or the device fails to be opened a
  /// connection handle will not be created or returned.
  ///
  /// Calling this method is equivalent to calling [getDevices] followed
  /// by [openDevice] for each device.
  ///
  /// |options|: The properties to search for on target devices.
  Future<List<ConnectionHandle>> findDevices(
          EnumerateDevicesAndRequestAccessOptions options) =>
      throw UnimplementedError();

  /// Closes a connection handle. Invoking operations on a handle after it
  /// has been closed is a safe operation but causes no action to be taken.
  /// |handle|: The [ConnectionHandle] to close.
  Future<void> closeDevice(ConnectionHandle handle) =>
      throw UnimplementedError();

  /// Select a device configuration.
  ///
  /// This function effectively resets the device by selecting one of the
  /// device's available configurations. Only configuration values greater
  /// than `0` are valid however some buggy devices have a working
  /// configuration `0` and so this value is allowed.
  /// |handle|: An open connection to the device.
  Future<void> setConfiguration(
    ConnectionHandle handle,
    int configurationValue,
  ) =>
      throw UnimplementedError();

  /// Gets the configuration descriptor for the currently selected
  /// configuration.
  /// |handle|: An open connection to the device.
  Future<ConfigDescriptor> getConfiguration(ConnectionHandle handle) =>
      throw UnimplementedError();

  /// Lists all interfaces on a USB device.
  /// |handle|: An open connection to the device.
  Future<List<InterfaceDescriptor>> listInterfaces(ConnectionHandle handle) =>
      throw UnimplementedError();

  /// Claims an interface on a USB device.
  /// Before data can be transfered to an interface or associated endpoints the
  /// interface must be claimed. Only one connection handle can claim an
  /// interface at any given time. If the interface is already claimed, this
  /// call will fail.
  ///
  /// [releaseInterface] should be called when the interface is no longer
  /// needed.
  ///
  /// |handle|: An open connection to the device.
  /// |interfaceNumber|: The interface to be claimed.
  Future<void> claimInterface(
    ConnectionHandle handle,
    int interfaceNumber,
  ) =>
      throw UnimplementedError();

  /// Releases a claimed interface.
  /// |handle|: An open connection to the device.
  /// |interfaceNumber|: The interface to be released.
  Future<void> releaseInterface(
    ConnectionHandle handle,
    int interfaceNumber,
  ) =>
      throw UnimplementedError();

  /// Selects an alternate setting on a previously claimed interface.
  /// |handle|: An open connection to the device where this interface has been
  ///     claimed.
  /// |interfaceNumber|: The interface to configure.
  /// |alternateSetting|: The alternate setting to configure.
  Future<void> setInterfaceAlternateSetting(
    ConnectionHandle handle,
    int interfaceNumber,
    int alternateSetting,
  ) =>
      throw UnimplementedError();

  /// Performs a control transfer on the specified device.
  ///
  /// Control transfers refer to either the device, an interface or an
  /// endpoint. Transfers to an interface or endpoint require the interface to
  /// be claimed.
  ///
  /// |handle|: An open connection to the device.
  Future<TransferResultInfo> controlTransfer(
    ConnectionHandle handle,
    ControlTransferInfo transferInfo,
  ) =>
      throw UnimplementedError();

  /// Performs a bulk transfer on the specified device.
  /// |handle|: An open connection to the device.
  /// |transferInfo|: The transfer parameters.
  Future<TransferResultInfo> bulkTransfer(
    ConnectionHandle handle,
    GenericTransferInfo transferInfo,
  ) =>
      throw UnimplementedError();

  /// Performs an interrupt transfer on the specified device.
  /// |handle|: An open connection to the device.
  /// |transferInfo|: The transfer parameters.
  Future<TransferResultInfo> interruptTransfer(
    ConnectionHandle handle,
    GenericTransferInfo transferInfo,
  ) =>
      throw UnimplementedError();

  /// Performs an isochronous transfer on the specific device.
  /// |handle|: An open connection to the device.
  Future<TransferResultInfo> isochronousTransfer(
    ConnectionHandle handle,
    IsochronousTransferInfo transferInfo,
  ) =>
      throw UnimplementedError();

  /// Tries to reset the USB device.
  /// If the reset fails, the given connection handle will be closed and the
  /// USB device will appear to be disconnected then reconnected.
  /// In this case [getDevices] or [findDevices] must be called again
  /// to acquire the device.
  ///
  /// |handle|: A connection handle to reset.
  Future<bool> resetDevice(ConnectionHandle handle) =>
      throw UnimplementedError();

  /// Event generated when a device is added to the system. Events are only
  /// broadcast to apps and extensions that have permission to access the
  /// device. Permission may have been granted at install time, when the user
  /// accepted an optional permission (see [permissions.request]), or
  /// through [getUserSelectedDevices].
  Stream<Device> get onDeviceAdded => throw UnimplementedError();

  /// Event generated when a device is removed from the system. See
  /// [onDeviceAdded] for which events are delivered.
  Stream<Device> get onDeviceRemoved => throw UnimplementedError();
}

/// Direction, Recipient, RequestType, and TransferType all map to their
/// namesakes within the USB specification.
enum Direction {
  in$('in'),
  out('out');

  const Direction(this.value);

  final String value;

  String get toJS => value;
  static Direction fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum Recipient {
  device('device'),
  interface('_interface'),
  endpoint('endpoint'),
  other('other');

  const Recipient(this.value);

  final String value;

  String get toJS => value;
  static Recipient fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum RequestType {
  standard('standard'),
  class$('class'),
  vendor('vendor'),
  reserved('reserved');

  const RequestType(this.value);

  final String value;

  String get toJS => value;
  static RequestType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum TransferType {
  control('control'),
  interrupt('interrupt'),
  isochronous('isochronous'),
  bulk('bulk');

  const TransferType(this.value);

  final String value;

  String get toJS => value;
  static TransferType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// For interrupt and isochronous modes, SynchronizationType and UsageType map
/// to their namesakes within the USB specification.
enum SynchronizationType {
  asynchronous('asynchronous'),
  adaptive('adaptive'),
  synchronous('synchronous');

  const SynchronizationType(this.value);

  final String value;

  String get toJS => value;
  static SynchronizationType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum UsageType {
  data('data'),
  feedback('feedback'),
  explicitFeedback('explicitFeedback'),
  periodic('periodic'),
  notification('notification');

  const UsageType(this.value);

  final String value;

  String get toJS => value;
  static UsageType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class Device {
  Device.fromJS(this._wrapped);

  final $js.Device _wrapped;

  $js.Device get toJS => _wrapped;

  /// An opaque ID for the USB device. It remains unchanged until the device is
  /// unplugged.
  int get device => _wrapped.device;
  set device(int v) {
    _wrapped.device = v;
  }

  /// The device vendor ID.
  int get vendorId => _wrapped.vendorId;
  set vendorId(int v) {
    _wrapped.vendorId = v;
  }

  /// The product ID.
  int get productId => _wrapped.productId;
  set productId(int v) {
    _wrapped.productId = v;
  }

  /// The device version (bcdDevice field).
  int get version => _wrapped.version;
  set version(int v) {
    _wrapped.version = v;
  }

  /// The iProduct string read from the device, if available.
  String get productName => _wrapped.productName;
  set productName(String v) {
    _wrapped.productName = v;
  }

  /// The iManufacturer string read from the device, if available.
  String get manufacturerName => _wrapped.manufacturerName;
  set manufacturerName(String v) {
    _wrapped.manufacturerName = v;
  }

  /// The iSerialNumber string read from the device, if available.
  String get serialNumber => _wrapped.serialNumber;
  set serialNumber(String v) {
    _wrapped.serialNumber = v;
  }
}

class ConnectionHandle {
  ConnectionHandle.fromJS(this._wrapped);

  final $js.ConnectionHandle _wrapped;

  $js.ConnectionHandle get toJS => _wrapped;

  /// An opaque handle representing this connection to the USB device and all
  /// associated claimed interfaces and pending transfers. A new handle is
  /// created each time the device is opened. The connection handle is
  /// different from [Device.device].
  int get handle => _wrapped.handle;
  set handle(int v) {
    _wrapped.handle = v;
  }

  /// The device vendor ID.
  int get vendorId => _wrapped.vendorId;
  set vendorId(int v) {
    _wrapped.vendorId = v;
  }

  /// The product ID.
  int get productId => _wrapped.productId;
  set productId(int v) {
    _wrapped.productId = v;
  }
}

class EndpointDescriptor {
  EndpointDescriptor.fromJS(this._wrapped);

  final $js.EndpointDescriptor _wrapped;

  $js.EndpointDescriptor get toJS => _wrapped;

  /// Endpoint address.
  int get address => _wrapped.address;
  set address(int v) {
    _wrapped.address = v;
  }

  /// Transfer type.
  TransferType get type => TransferType.fromJS(_wrapped.type);
  set type(TransferType v) {
    _wrapped.type = v.toJS;
  }

  /// Transfer direction.
  Direction get direction => Direction.fromJS(_wrapped.direction);
  set direction(Direction v) {
    _wrapped.direction = v.toJS;
  }

  /// Maximum packet size.
  int get maximumPacketSize => _wrapped.maximumPacketSize;
  set maximumPacketSize(int v) {
    _wrapped.maximumPacketSize = v;
  }

  /// Transfer synchronization mode (isochronous only).
  SynchronizationType? get synchronization =>
      _wrapped.synchronization?.let(SynchronizationType.fromJS);
  set synchronization(SynchronizationType? v) {
    _wrapped.synchronization = v?.toJS;
  }

  /// Endpoint usage hint.
  UsageType? get usage => _wrapped.usage?.let(UsageType.fromJS);
  set usage(UsageType? v) {
    _wrapped.usage = v?.toJS;
  }

  /// Polling interval (interrupt and isochronous only).
  int? get pollingInterval => _wrapped.pollingInterval;
  set pollingInterval(int? v) {
    _wrapped.pollingInterval = v;
  }

  /// Extra descriptor data associated with this endpoint.
  ByteBuffer get extra_data => _wrapped.extra_data.toDart;
  set extra_data(ByteBuffer v) {
    _wrapped.extra_data = v.toJS;
  }
}

class InterfaceDescriptor {
  InterfaceDescriptor.fromJS(this._wrapped);

  final $js.InterfaceDescriptor _wrapped;

  $js.InterfaceDescriptor get toJS => _wrapped;

  /// The interface number.
  int get interfaceNumber => _wrapped.interfaceNumber;
  set interfaceNumber(int v) {
    _wrapped.interfaceNumber = v;
  }

  /// The interface alternate setting number (defaults to `0</code).
  int get alternateSetting => _wrapped.alternateSetting;
  set alternateSetting(int v) {
    _wrapped.alternateSetting = v;
  }

  /// The USB interface class.
  int get interfaceClass => _wrapped.interfaceClass;
  set interfaceClass(int v) {
    _wrapped.interfaceClass = v;
  }

  /// The USB interface sub-class.
  int get interfaceSubclass => _wrapped.interfaceSubclass;
  set interfaceSubclass(int v) {
    _wrapped.interfaceSubclass = v;
  }

  /// The USB interface protocol.
  int get interfaceProtocol => _wrapped.interfaceProtocol;
  set interfaceProtocol(int v) {
    _wrapped.interfaceProtocol = v;
  }

  /// Description of the interface.
  String? get description => _wrapped.description;
  set description(String? v) {
    _wrapped.description = v;
  }

  /// Available endpoints.
  List<EndpointDescriptor> get endpoints => _wrapped.endpoints.toDart
      .cast<$js.EndpointDescriptor>()
      .map((e) => EndpointDescriptor.fromJS(e))
      .toList();
  set endpoints(List<EndpointDescriptor> v) {
    _wrapped.endpoints = throw UnimplementedError();
  }

  /// Extra descriptor data associated with this interface.
  ByteBuffer get extra_data => _wrapped.extra_data.toDart;
  set extra_data(ByteBuffer v) {
    _wrapped.extra_data = v.toJS;
  }
}

class ConfigDescriptor {
  ConfigDescriptor.fromJS(this._wrapped);

  final $js.ConfigDescriptor _wrapped;

  $js.ConfigDescriptor get toJS => _wrapped;

  /// Is this the active configuration?
  bool get active => _wrapped.active;
  set active(bool v) {
    _wrapped.active = v;
  }

  /// The configuration number.
  int get configurationValue => _wrapped.configurationValue;
  set configurationValue(int v) {
    _wrapped.configurationValue = v;
  }

  /// Description of the configuration.
  String? get description => _wrapped.description;
  set description(String? v) {
    _wrapped.description = v;
  }

  /// The device is self-powered.
  bool get selfPowered => _wrapped.selfPowered;
  set selfPowered(bool v) {
    _wrapped.selfPowered = v;
  }

  /// The device supports remote wakeup.
  bool get remoteWakeup => _wrapped.remoteWakeup;
  set remoteWakeup(bool v) {
    _wrapped.remoteWakeup = v;
  }

  /// The maximum power needed by this device in milliamps (mA).
  int get maxPower => _wrapped.maxPower;
  set maxPower(int v) {
    _wrapped.maxPower = v;
  }

  /// Available interfaces.
  List<InterfaceDescriptor> get interfaces => _wrapped.interfaces.toDart
      .cast<$js.InterfaceDescriptor>()
      .map((e) => InterfaceDescriptor.fromJS(e))
      .toList();
  set interfaces(List<InterfaceDescriptor> v) {
    _wrapped.interfaces = throw UnimplementedError();
  }

  /// Extra descriptor data associated with this configuration.
  ByteBuffer get extra_data => _wrapped.extra_data.toDart;
  set extra_data(ByteBuffer v) {
    _wrapped.extra_data = v.toJS;
  }
}

class ControlTransferInfo {
  ControlTransferInfo.fromJS(this._wrapped);

  final $js.ControlTransferInfo _wrapped;

  $js.ControlTransferInfo get toJS => _wrapped;

  /// The transfer direction (`"in"` or `"out"`).
  Direction get direction => Direction.fromJS(_wrapped.direction);
  set direction(Direction v) {
    _wrapped.direction = v.toJS;
  }

  /// The transfer target. The target given by `index` must be
  /// claimed if `"interface"` or `"endpoint"`.
  Recipient get recipient => Recipient.fromJS(_wrapped.recipient);
  set recipient(Recipient v) {
    _wrapped.recipient = v.toJS;
  }

  /// The request type.
  RequestType get requestType => RequestType.fromJS(_wrapped.requestType);
  set requestType(RequestType v) {
    _wrapped.requestType = v.toJS;
  }

  /// The `bRequest` field, see <i>Universal Serial Bus
  /// Specification Revision 1.1</i> &sect; 9.3.
  int get request => _wrapped.request;
  set request(int v) {
    _wrapped.request = v;
  }

  /// The `wValue` field, see <i>Ibid</i>.
  int get value => _wrapped.value;
  set value(int v) {
    _wrapped.value = v;
  }

  /// The `wIndex` field, see <i>Ibid</i>.
  int get index => _wrapped.index;
  set index(int v) {
    _wrapped.index = v;
  }

  /// The maximum number of bytes to receive (required only by input
  /// transfers).
  int? get length => _wrapped.length;
  set length(int? v) {
    _wrapped.length = v;
  }

  /// The data to transmit (required only by output transfers).
  ByteBuffer? get data => _wrapped.data?.toDart;
  set data(ByteBuffer? v) {
    _wrapped.data = v?.toJS;
  }

  /// Request timeout (in milliseconds). The default value `0`
  /// indicates no timeout.
  int? get timeout => _wrapped.timeout;
  set timeout(int? v) {
    _wrapped.timeout = v;
  }
}

class GenericTransferInfo {
  GenericTransferInfo.fromJS(this._wrapped);

  final $js.GenericTransferInfo _wrapped;

  $js.GenericTransferInfo get toJS => _wrapped;

  /// The transfer direction (`"in"` or `"out"`).
  Direction get direction => Direction.fromJS(_wrapped.direction);
  set direction(Direction v) {
    _wrapped.direction = v.toJS;
  }

  /// The target endpoint address. The interface containing this endpoint must
  /// be claimed.
  int get endpoint => _wrapped.endpoint;
  set endpoint(int v) {
    _wrapped.endpoint = v;
  }

  /// The maximum number of bytes to receive (required only by input
  /// transfers).
  int? get length => _wrapped.length;
  set length(int? v) {
    _wrapped.length = v;
  }

  /// The data to transmit (required only by output transfers).
  ByteBuffer? get data => _wrapped.data?.toDart;
  set data(ByteBuffer? v) {
    _wrapped.data = v?.toJS;
  }

  /// Request timeout (in milliseconds). The default value `0`
  /// indicates no timeout.
  int? get timeout => _wrapped.timeout;
  set timeout(int? v) {
    _wrapped.timeout = v;
  }
}

class IsochronousTransferInfo {
  IsochronousTransferInfo.fromJS(this._wrapped);

  final $js.IsochronousTransferInfo _wrapped;

  $js.IsochronousTransferInfo get toJS => _wrapped;

  /// Transfer parameters. The transfer length or data buffer specified in this
  /// parameter block is split along `packetLength` boundaries to
  /// form the individual packets of the transfer.
  GenericTransferInfo get transferInfo =>
      GenericTransferInfo.fromJS(_wrapped.transferInfo);
  set transferInfo(GenericTransferInfo v) {
    _wrapped.transferInfo = v.toJS;
  }

  /// The total number of packets in this transfer.
  int get packets => _wrapped.packets;
  set packets(int v) {
    _wrapped.packets = v;
  }

  /// The length of each of the packets in this transfer.
  int get packetLength => _wrapped.packetLength;
  set packetLength(int v) {
    _wrapped.packetLength = v;
  }
}

class TransferResultInfo {
  TransferResultInfo.fromJS(this._wrapped);

  final $js.TransferResultInfo _wrapped;

  $js.TransferResultInfo get toJS => _wrapped;

  /// A value of `0` indicates that the transfer was a success.
  /// Other values indicate failure.
  int? get resultCode => _wrapped.resultCode;
  set resultCode(int? v) {
    _wrapped.resultCode = v;
  }

  /// The data returned by an input transfer. `undefined` for output
  /// transfers.
  ByteBuffer? get data => _wrapped.data?.toDart;
  set data(ByteBuffer? v) {
    _wrapped.data = v?.toJS;
  }
}

class DeviceFilter {
  DeviceFilter.fromJS(this._wrapped);

  final $js.DeviceFilter _wrapped;

  $js.DeviceFilter get toJS => _wrapped;

  /// Device vendor ID.
  int? get vendorId => _wrapped.vendorId;
  set vendorId(int? v) {
    _wrapped.vendorId = v;
  }

  /// Device product ID, checked only if the vendor ID matches.
  int? get productId => _wrapped.productId;
  set productId(int? v) {
    _wrapped.productId = v;
  }

  /// USB interface class, matches any interface on the device.
  int? get interfaceClass => _wrapped.interfaceClass;
  set interfaceClass(int? v) {
    _wrapped.interfaceClass = v;
  }

  /// USB interface sub-class, checked only if the interface class matches.
  int? get interfaceSubclass => _wrapped.interfaceSubclass;
  set interfaceSubclass(int? v) {
    _wrapped.interfaceSubclass = v;
  }

  /// USB interface protocol, checked only if the interface sub-class matches.
  int? get interfaceProtocol => _wrapped.interfaceProtocol;
  set interfaceProtocol(int? v) {
    _wrapped.interfaceProtocol = v;
  }
}

class EnumerateDevicesOptions {
  EnumerateDevicesOptions.fromJS(this._wrapped);

  final $js.EnumerateDevicesOptions _wrapped;

  $js.EnumerateDevicesOptions get toJS => _wrapped;

  int? get vendorId => _wrapped.vendorId;
  set vendorId(int? v) {
    _wrapped.vendorId = v;
  }

  int? get productId => _wrapped.productId;
  set productId(int? v) {
    _wrapped.productId = v;
  }

  /// A device matching any given filter will be returned. An empty filter list
  /// will return all devices the app has permission for.
  List<DeviceFilter>? get filters => _wrapped.filters?.toDart
      .cast<$js.DeviceFilter>()
      .map((e) => DeviceFilter.fromJS(e))
      .toList();
  set filters(List<DeviceFilter>? v) {
    _wrapped.filters = throw UnimplementedError();
  }
}

class EnumerateDevicesAndRequestAccessOptions {
  EnumerateDevicesAndRequestAccessOptions.fromJS(this._wrapped);

  final $js.EnumerateDevicesAndRequestAccessOptions _wrapped;

  $js.EnumerateDevicesAndRequestAccessOptions get toJS => _wrapped;

  /// The device vendor ID.
  int get vendorId => _wrapped.vendorId;
  set vendorId(int v) {
    _wrapped.vendorId = v;
  }

  /// The product ID.
  int get productId => _wrapped.productId;
  set productId(int v) {
    _wrapped.productId = v;
  }

  /// The interface ID to request access to.
  /// Only available on Chrome OS. It has no effect on other platforms.
  int? get interfaceId => _wrapped.interfaceId;
  set interfaceId(int? v) {
    _wrapped.interfaceId = v;
  }
}

class DevicePromptOptions {
  DevicePromptOptions.fromJS(this._wrapped);

  final $js.DevicePromptOptions _wrapped;

  $js.DevicePromptOptions get toJS => _wrapped;

  /// Allow the user to select multiple devices.
  bool? get multiple => _wrapped.multiple;
  set multiple(bool? v) {
    _wrapped.multiple = v;
  }

  /// Filter the list of devices presented to the user. If multiple filters are
  /// provided devices matching any filter will be displayed.
  List<DeviceFilter>? get filters => _wrapped.filters?.toDart
      .cast<$js.DeviceFilter>()
      .map((e) => DeviceFilter.fromJS(e))
      .toList();
  set filters(List<DeviceFilter>? v) {
    _wrapped.filters = throw UnimplementedError();
  }
}
