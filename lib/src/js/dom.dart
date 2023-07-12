import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDomExtension on JSChrome {
  /// Use the `chrome.dom` API to access special DOM APIs for Extensions
  external JSDom get dom;
}

@JS()
@staticInterop
class JSDom {}

extension JSDomExtension on JSDom {
  /// Gets the open shadow root or the closed shadow root hosted by the
  /// specified element. If the element doesn't attach the shadow root, it will
  /// return null.
  external JSAny openOrClosedShadowRoot(JSObject element);
}
