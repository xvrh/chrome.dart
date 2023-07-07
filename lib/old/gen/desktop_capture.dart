/* This file has been generated from desktop_capture.json - do not edit */

/**
 * Desktop Capture API that can be used to capture content of screen, individual
 * windows or tabs.
 */
library chrome.desktopCapture;

import 'tabs.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.desktopCapture` namespace.
 */
final ChromeDesktopCapture desktopCapture = ChromeDesktopCapture._();

class ChromeDesktopCapture extends ChromeApi {
  JsObject get _desktopCapture => chrome['desktopCapture'];

  ChromeDesktopCapture._();

  bool get available => _desktopCapture != null;

  /**
   * Shows desktop media picker UI with the specified set of sources.
   * 
   * [sources] Set of sources that should be shown to the user. The sources
   * order in the set decides the tab order in the picker.
   * 
   * [targetTab] Optional tab for which the stream is created. If not specified
   * then the resulting stream can be used only by the calling extension. The
   * stream can only be used by frames in the given tab whose security origin
   * matches `tab.url`. The tab's origin must be a secure origin, e.g. HTTPS.
   * 
   * [options] Mirrors members of
   * [DisplayMediaStreamConstraints](https://w3c.github.io/mediacapture-screen-share/#dom-displaymediastreamconstraints)
   * which need to be applied before the user makes their selection, and must
   * therefore be provided to chooseDesktopMedia() rather than be deferred to
   * getUserMedia().
   * 
   * Returns:
   * An id that can be passed to cancelChooseDesktopMedia() in case the prompt
   * need to be canceled.
   */
  int chooseDesktopMedia(List<DesktopCaptureSourceType> sources, Object callback, [Tab? targetTab, DesktopCaptureChooseDesktopMediaParams? options]) {
    if (_desktopCapture == null) _throwNotAvailable();

    return _desktopCapture.callMethod('chooseDesktopMedia', [jsify(sources), jsify(targetTab), jsify(options), jsify(callback)]);
  }

  /**
   * Hides desktop media picker dialog shown by chooseDesktopMedia().
   * 
   * [desktopMediaRequestId] Id returned by chooseDesktopMedia()
   */
  void cancelChooseDesktopMedia(int desktopMediaRequestId) {
    if (_desktopCapture == null) _throwNotAvailable();

    _desktopCapture.callMethod('cancelChooseDesktopMedia', [desktopMediaRequestId]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.desktopCapture' is not available");
  }
}

/**
 * Enum used to define set of desktop media sources used in
 * chooseDesktopMedia().
 */
class DesktopCaptureSourceType extends ChromeEnum {
  static const DesktopCaptureSourceType SCREEN = const DesktopCaptureSourceType._('screen');
  static const DesktopCaptureSourceType WINDOW = const DesktopCaptureSourceType._('window');
  static const DesktopCaptureSourceType TAB = const DesktopCaptureSourceType._('tab');
  static const DesktopCaptureSourceType AUDIO = const DesktopCaptureSourceType._('audio');

  static const List<DesktopCaptureSourceType> VALUES = const[SCREEN, WINDOW, TAB, AUDIO];

  const DesktopCaptureSourceType._(String str): super(str);
}

/**
 * Mirrors
 * [SystemAudioPreferenceEnum](https://w3c.github.io/mediacapture-screen-share/#dom-systemaudiopreferenceenum).
 */
class SystemAudioPreferenceEnum extends ChromeEnum {
  static const SystemAudioPreferenceEnum INCLUDE = const SystemAudioPreferenceEnum._('include');
  static const SystemAudioPreferenceEnum EXCLUDE = const SystemAudioPreferenceEnum._('exclude');

  static const List<SystemAudioPreferenceEnum> VALUES = const[INCLUDE, EXCLUDE];

  const SystemAudioPreferenceEnum._(String str): super(str);
}

/**
 * Mirrors
 * [SelfCapturePreferenceEnum](https://w3c.github.io/mediacapture-screen-share/#dom-selfcapturepreferenceenum).
 */
class SelfCapturePreferenceEnum extends ChromeEnum {
  static const SelfCapturePreferenceEnum INCLUDE = const SelfCapturePreferenceEnum._('include');
  static const SelfCapturePreferenceEnum EXCLUDE = const SelfCapturePreferenceEnum._('exclude');

  static const List<SelfCapturePreferenceEnum> VALUES = const[INCLUDE, EXCLUDE];

  const SelfCapturePreferenceEnum._(String str): super(str);
}

class DesktopCaptureChooseDesktopMediaParams extends ChromeObject {
  DesktopCaptureChooseDesktopMediaParams({SystemAudioPreferenceEnum? systemAudio, SelfCapturePreferenceEnum? selfBrowserSurface, bool? suppressLocalAudioPlaybackIntended}) {
    if (systemAudio != null) this.systemAudio = systemAudio;
    if (selfBrowserSurface != null) this.selfBrowserSurface = selfBrowserSurface;
    if (suppressLocalAudioPlaybackIntended != null) this.suppressLocalAudioPlaybackIntended = suppressLocalAudioPlaybackIntended;
  }
  DesktopCaptureChooseDesktopMediaParams.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * Mirrors
   * [systemAudio](https://w3c.github.io/mediacapture-screen-share/#dom-displaymediastreamconstraints-systemaudio).
   */
  SystemAudioPreferenceEnum get systemAudio => _createSystemAudioPreferenceEnum(jsProxy['systemAudio']);
  set systemAudio(SystemAudioPreferenceEnum value) => jsProxy['systemAudio'] = jsify(value);

  /**
   * Mirrors
   * [selfBrowserSurface](https://w3c.github.io/mediacapture-screen-share/#dom-displaymediastreamconstraints-selfbrowsersurface).
   */
  SelfCapturePreferenceEnum get selfBrowserSurface => _createSelfCapturePreferenceEnum(jsProxy['selfBrowserSurface']);
  set selfBrowserSurface(SelfCapturePreferenceEnum value) => jsProxy['selfBrowserSurface'] = jsify(value);

  /**
   * Indicates that the caller intends to perform local audio suppression, and
   * that the media picker shown to the user should therefore reflect that with
   * the appropriate warnings, as it does when getDisplayMedia() is invoked.
   */
  bool get suppressLocalAudioPlaybackIntended => jsProxy['suppressLocalAudioPlaybackIntended'];
  set suppressLocalAudioPlaybackIntended(bool value) => jsProxy['suppressLocalAudioPlaybackIntended'] = value;
}

SystemAudioPreferenceEnum _createSystemAudioPreferenceEnum(String value) => SystemAudioPreferenceEnum.VALUES.singleWhere((ChromeEnum e) => e.value == value);
SelfCapturePreferenceEnum _createSelfCapturePreferenceEnum(String value) => SelfCapturePreferenceEnum.VALUES.singleWhere((ChromeEnum e) => e.value == value);
