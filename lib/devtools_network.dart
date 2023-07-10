import 'chrome.dart';
export 'chrome.dart';

final _devtoolsNetwork = ChromeDevtoolsNetwork._();

extension ChromeDevtoolsNetworkExtension on Chrome {
  ChromeDevtoolsNetwork get devtoolsNetwork => _devtoolsNetwork;
}

class ChromeDevtoolsNetwork {
  ChromeDevtoolsNetwork._();

  /// Returns HAR log that contains all known network requests.
  void getHAR(callback) => throw UnimplementedError();

  /// Fired when a network request is finished and all request data are
  /// available.
  Stream get onRequestFinished => throw UnimplementedError();

  /// Fired when the inspected window navigates to a new page.
  Stream get onNavigated => throw UnimplementedError();
}
