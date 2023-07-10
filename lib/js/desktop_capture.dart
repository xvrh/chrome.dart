import 'chrome.dart';
import 'dart:js_interop';
import 'tabs.dart';
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
  external int chooseDesktopMedia(
    JSArray sources,
    Tab targetTab,
    JSObject options,
    JSFunction callback,
  );

  /// Hides desktop media picker dialog shown by chooseDesktopMedia().
  external void cancelChooseDesktopMedia(int desktopMediaRequestId);
}

/// Enum used to define set of desktop media sources used in
/// chooseDesktopMedia().
typedef DesktopCaptureSourceType = JSString;

/// Mirrors <a
/// href="https://w3c.github.io/mediacapture-screen-share/#dom-systemaudiopreferenceenum">SystemAudioPreferenceEnum</a>.
typedef SystemAudioPreferenceEnum = JSString;

/// Mirrors <a
/// href="https://w3c.github.io/mediacapture-screen-share/#dom-selfcapturepreferenceenum">SelfCapturePreferenceEnum</a>.
typedef SelfCapturePreferenceEnum = JSString;
