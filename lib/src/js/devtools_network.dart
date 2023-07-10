import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDevtoolsNetworkExtension on JSChrome {
  /// Use the `chrome.devtools.network` API to retrieve the information about
  /// network requests displayed by the Developer Tools in the Network panel.
  external JSDevtoolsNetwork get devtoolsNetwork;
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

extension RequestExtension on Request {}
