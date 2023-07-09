import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSDesktopCaptureExtension on JSChrome {
  /// Desktop Capture API that can be used to capture content of screen,
  /// individual windows or tabs.
  external JSDesktopCapture get desktopCapture;
}

@JS()
@staticInterop
class JSDesktopCapture {}

extension JSDesktopCaptureExtension on JSDesktopCapture {
  /// Shows desktop media picker UI with the specified set of sources.
  external void chooseDesktopMedia(
    sources,
    targetTab,
    options,
    callback,
  );

  /// Hides desktop media picker dialog shown by chooseDesktopMedia().
  external void cancelChooseDesktopMedia(desktopMediaRequestId);
}

@JS()
@staticInterop
class DesktopCaptureSourceType {}

@JS()
@staticInterop
class SystemAudioPreferenceEnum {}

@JS()
@staticInterop
class SelfCapturePreferenceEnum {}
