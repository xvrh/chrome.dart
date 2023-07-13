import 'devtools.dart';
import 'src/internal_helpers.dart';
import 'src/js/devtools_network.dart' as $js;

export 'devtools.dart' show ChromeDevtools, ChromeDevtoolsExtension;
export 'src/chrome.dart' show chrome;

final _devtoolsNetwork = ChromeDevtoolsNetwork._();

extension ChromeDevtoolsNetworkExtension on ChromeDevtools {
  ChromeDevtoolsNetwork get network => _devtoolsNetwork;
}

class ChromeDevtoolsNetwork {
  ChromeDevtoolsNetwork._();

  /// Returns HAR log that contains all known network requests.
  void getHAR(JSFunction callback) {
    $js.chrome.devtools.network.getHAR(callback);
  }

  /// Fired when a network request is finished and all request data are
  /// available.
  Stream<Request> get onRequestFinished => throw UnimplementedError();

  /// Fired when the inspected window navigates to a new page.
  Stream<String> get onNavigated => throw UnimplementedError();
}

class Request {
  Request.fromJS(this._wrapped);

  Request() : _wrapped = $js.Request();

  final $js.Request _wrapped;

  $js.Request get toJS => _wrapped;

  /// Returns content of the response body.
  void getContent(JSFunction callback) {
    _wrapped.getContent(callback);
  }
}
