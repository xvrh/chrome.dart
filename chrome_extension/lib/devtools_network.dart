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
  Future<Map> getHAR() {
    var $completer = Completer<Map>();
    $js.chrome.devtools.network.getHAR((JSObject harLog) {
      if (checkRuntimeLastError($completer)) {
        $completer.complete((harLog.dartify() as Map));
      }
    }.toJS);
    return $completer.future;
  }

  /// Fired when a network request is finished and all request data are
  /// available.
  Stream<Request> get onRequestFinished =>
      $js.chrome.devtools.network.onRequestFinished
          .asStream(($c) => ($js.Request request) {
                $c.add(Request.fromJS(request));
              }.toJS);

  /// Fired when the inspected window navigates to a new page.
  Stream<String> get onNavigated =>
      $js.chrome.devtools.network.onNavigated.asStream(($c) => (String url) {
            $c.add(url);
          }.toJS);
}

class Request {
  Request.fromJS(this._wrapped);

  Request() : _wrapped = $js.Request();

  final $js.Request _wrapped;

  $js.Request get toJS => _wrapped;

  /// Returns content of the response body.
  Future<GetContentResult> getContent() {
    var $completer = Completer<GetContentResult>();
    _wrapped.getContent((
      String content,
      String encoding,
    ) {
      if (checkRuntimeLastError($completer)) {
        $completer.complete(GetContentResult(
          content: content,
          encoding: encoding,
        ));
      }
    }.toJS);
    return $completer.future;
  }
}

class GetContentResult {
  GetContentResult({
    required this.content,
    required this.encoding,
  });

  /// Content of the response body (potentially encoded).
  final String content;

  /// Empty if content is not encoded, encoding name otherwise. Currently, only
  /// base64 is supported.
  final String encoding;
}
