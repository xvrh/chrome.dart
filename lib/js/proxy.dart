import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSProxyExtension on JSChrome {
  /// Use the `chrome.proxy` API to manage Chrome's proxy settings. This API
  /// relies on the <a href='types#ChromeSetting'>ChromeSetting prototype of the
  /// type API</a> for getting and setting the proxy configuration.
  external JSProxy get Proxy;
}

@JS()
@staticInterop
class JSProxy {}

extension JSProxyExtension on JSProxy {
  /// Notifies about proxy errors.
  external ChromeEvent get onProxyError;
}
