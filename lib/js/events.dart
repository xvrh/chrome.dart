import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSEventsExtension on JSChrome {
  /// The `chrome.events` namespace contains common types used by APIs
  /// dispatching events to notify you when something interesting happens.
  external JSEvents get Events;
}

@JS()
@staticInterop
class JSEvents {}

extension JSEventsExtension on JSEvents {}
