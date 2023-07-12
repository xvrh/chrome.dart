import 'src/internal_helpers.dart';
import 'src/js/devtools_network.dart' as $js;
export 'chrome.dart';

final _devtoolsNetwork = ChromeDevtoolsNetwork._();

extension ChromeDevtoolsNetworkExtension on Chrome {
  ChromeDevtoolsNetwork get devtoolsNetwork => _devtoolsNetwork;
}

class ChromeDevtoolsNetwork {
  ChromeDevtoolsNetwork._();

  /// Returns HAR log that contains all known network requests.
  void getHAR(JSAny callback) => throw UnimplementedError();

  /// Fired when a network request is finished and all request data are
  /// available.
  Stream<Request> get onRequestFinished => throw UnimplementedError();

  /// Fired when the inspected window navigates to a new page.
  Stream<String> get onNavigated => throw UnimplementedError();
}

class Request {
  Request.fromJS(this._wrapped);

  final $js.Request _wrapped;

  $js.Request get toJS => _wrapped;

  /// Returns content of the response body.
  void getContent(JSAny callback) => throw UnimplementedError();
}
