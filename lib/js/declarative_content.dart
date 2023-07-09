import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDeclarativeContentExtension on JSChrome {
  /// Use the `chrome.declarativeContent` API to take actions depending on the
  /// content of a page, without requiring permission to read the page's
  /// content.
  external JSDeclarativeContent get DeclarativeContent;
}

@JS()
@staticInterop
class JSDeclarativeContent {}

extension JSDeclarativeContentExtension on JSDeclarativeContent {
  external ChromeEvent get onPageChanged;
}
