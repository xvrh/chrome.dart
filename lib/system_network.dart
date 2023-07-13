import 'src/internal_helpers.dart';
import 'src/js/system_network.dart' as $js;
import 'system.dart';

export 'src/chrome.dart' show chrome;
export 'system.dart' show ChromeSystem, ChromeSystemExtension;

final _systemNetwork = ChromeSystemNetwork._();

extension ChromeSystemNetworkExtension on ChromeSystem {
  ChromeSystemNetwork get network => _systemNetwork;
}

class ChromeSystemNetwork {
  ChromeSystemNetwork._();

  /// Retrieves information about local adapters on this system.
  /// |callback| : Called when local adapter information is available.
  Future<List<NetworkInterface>> getNetworkInterfaces() {
    var $completer = Completer<List<NetworkInterface>>();
    $js.chrome.system.network.getNetworkInterfaces((JSArray networkInterfaces) {
      $completer.complete(networkInterfaces.toDart
          .cast<$js.NetworkInterface>()
          .map((e) => NetworkInterface.fromJS(e))
          .toList());
    }.toJS);
    return $completer.future;
  }
}

class NetworkInterface {
  NetworkInterface.fromJS(this._wrapped);

  NetworkInterface({
    required String name,
    required String address,
    required int prefixLength,
  }) : _wrapped = $js.NetworkInterface()
          ..name = name
          ..address = address
          ..prefixLength = prefixLength;

  final $js.NetworkInterface _wrapped;

  $js.NetworkInterface get toJS => _wrapped;

  /// The underlying name of the adapter. On *nix, this will typically be
  /// "eth0", "wlan0", etc.
  String get name => _wrapped.name;
  set name(String v) {
    _wrapped.name = v;
  }

  /// The available IPv4/6 address.
  String get address => _wrapped.address;
  set address(String v) {
    _wrapped.address = v;
  }

  /// The prefix length
  int get prefixLength => _wrapped.prefixLength;
  set prefixLength(int v) {
    _wrapped.prefixLength = v;
  }
}
