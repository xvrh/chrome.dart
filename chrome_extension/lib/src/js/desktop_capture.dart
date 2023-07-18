import 'dart:js_interop';

import 'chrome.dart';
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
    /// Set of sources that should be shown to the user. The sources order in
    /// the set decides the tab order in the picker.
    JSArray sources,

    /// Optional tab for which the stream is created. If not specified then the
    /// resulting stream can be used only by the calling extension. The stream
    /// can only be used by frames in the given tab whose security origin
    /// matches `tab.url`. The tab's origin must be a secure origin, e.g. HTTPS.
    Tab? targetTab,

    /// Mirrors members of
    /// [DisplayMediaStreamConstraints](https://w3c.github.io/mediacapture-screen-share/#dom-displaymediastreamconstraints)
    /// which need to be applied before the user makes their selection, and must
    /// therefore be provided to chooseDesktopMedia() rather than be deferred to
    /// getUserMedia().
    ChooseDesktopMediaOptions? options,
    JSFunction callback,
  );

  /// Hides desktop media picker dialog shown by chooseDesktopMedia().
  external void cancelChooseDesktopMedia(

      /// Id returned by chooseDesktopMedia()
      int desktopMediaRequestId);
}

/// Enum used to define set of desktop media sources used in
/// chooseDesktopMedia().
typedef DesktopCaptureSourceType = String;

/// Mirrors
/// [SystemAudioPreferenceEnum](https://w3c.github.io/mediacapture-screen-share/#dom-systemaudiopreferenceenum).
typedef SystemAudioPreferenceEnum = String;

/// Mirrors
/// [SelfCapturePreferenceEnum](https://w3c.github.io/mediacapture-screen-share/#dom-selfcapturepreferenceenum).
typedef SelfCapturePreferenceEnum = String;

@JS()
@staticInterop
@anonymous
class ChooseDesktopMediaOptions {
  external factory ChooseDesktopMediaOptions({
    /// Mirrors
    /// [systemAudio](https://w3c.github.io/mediacapture-screen-share/#dom-displaymediastreamconstraints-systemaudio).
    SystemAudioPreferenceEnum? systemAudio,

    /// Mirrors
    /// [selfBrowserSurface](https://w3c.github.io/mediacapture-screen-share/#dom-displaymediastreamconstraints-selfbrowsersurface).
    SelfCapturePreferenceEnum? selfBrowserSurface,

    /// Indicates that the caller intends to perform local audio suppression, and
    /// that the media picker shown to the user should therefore reflect that with
    /// the appropriate warnings, as it does when getDisplayMedia() is invoked.
    bool? suppressLocalAudioPlaybackIntended,
  });
}