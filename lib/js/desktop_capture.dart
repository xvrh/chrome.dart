import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDesktopCaptureExtension on JSChrome {
  /// Desktop Capture API that can be used to capture content of screen,
  /// individual windows or tabs.
  external JSDesktopCapture get DesktopCapture;
}

@JS()
@staticInterop
class JSDesktopCapture {}

extension JSDesktopCaptureExtension on JSDesktopCapture {
  /// Shows desktop media picker UI with the specified set of sources.
  external void chooseDesktopMedia();

  /// Hides desktop media picker dialog shown by chooseDesktopMedia().
  external void cancelChooseDesktopMedia();
}
