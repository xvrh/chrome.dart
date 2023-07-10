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
    ChooseDesktopMediaOptions options,
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

@JS()
@staticInterop
class ChooseDesktopMediaOptions {
  /// Mirrors <a
  /// href="https://w3c.github.io/mediacapture-screen-share/#dom-displaymediastreamconstraints-systemaudio">systemAudio</a>.
  external SystemAudioPreferenceEnum? get systemAudio;

  /// Mirrors <a
  /// href="https://w3c.github.io/mediacapture-screen-share/#dom-displaymediastreamconstraints-selfbrowsersurface">selfBrowserSurface</a>.
  external SelfCapturePreferenceEnum? get selfBrowserSurface;

  /// Indicates that the caller intends to perform local audio suppression, and
  /// that the media picker shown to the user should therefore reflect that with
  /// the appropriate warnings, as it does when getDisplayMedia() is invoked.
  external bool? get suppressLocalAudioPlaybackIntended;
}
