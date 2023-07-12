import 'src/internal_helpers.dart';
import 'src/js/system_network.dart' as $js;
export 'chrome.dart';

final _systemNetwork = ChromeSystemNetwork._();

extension ChromeSystemNetworkExtension on Chrome {
  ChromeSystemNetwork get systemNetwork => _systemNetwork;
}

class ChromeSystemNetwork {
  ChromeSystemNetwork._();

  /// Retrieves information about local adapters on this system.
  /// |callback| : Called when local adapter information is available.
  Future<List<NetworkInterface>> getNetworkInterfaces() =>
      throw UnimplementedError();
}

class NetworkInterface {
  NetworkInterface.fromJS(this._wrapped);

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
