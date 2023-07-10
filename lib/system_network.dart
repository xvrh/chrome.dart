import 'chrome.dart';
export 'chrome.dart';

final _systemNetwork = ChromeSystemNetwork._();

extension ChromeSystemNetworkExtension on Chrome {
  ChromeSystemNetwork get systemNetwork => _systemNetwork;
}

class ChromeSystemNetwork {
  ChromeSystemNetwork._();

  /// Retrieves information about local adapters on this system.
  /// |callback| : Called when local adapter information is available.
  void getNetworkInterfaces() => throw UnimplementedError();
}
