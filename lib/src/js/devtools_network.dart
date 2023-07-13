import 'dart:js_interop';

import 'chrome.dart';
import 'devtools.dart';

export 'chrome.dart';
export 'devtools.dart';

extension JSChromeJSDevtoolsNetworkExtension on JSChromeDevtools {
  /// Use the `chrome.devtools.network` API to retrieve the information about
  /// network requests displayed by the Developer Tools in the Network panel.
  external JSDevtoolsNetwork get network;
}

@JS()
@staticInterop
class JSDevtoolsNetwork {}

extension JSDevtoolsNetworkExtension on JSDevtoolsNetwork {
  /// Returns HAR log that contains all known network requests.
  external void getHAR(JSFunction callback);

  /// Fired when a network request is finished and all request data are
  /// available.
  external ChromeEvent get onRequestFinished;

  /// Fired when the inspected window navigates to a new page.
  external ChromeEvent get onNavigated;
}

@JS()
@staticInterop
class Request {}

extension RequestExtension on Request {
  /// Returns content of the response body.
  external void getContent(JSFunction callback);
}
