import 'src/internal_helpers.dart';
import 'src/js/desktop_capture.dart' as $js;
import 'tabs.dart';

export 'src/chrome.dart' show chrome;

final _desktopCapture = ChromeDesktopCapture._();

extension ChromeDesktopCaptureExtension on Chrome {
  ChromeDesktopCapture get desktopCapture => _desktopCapture;
}

class ChromeDesktopCapture {
  ChromeDesktopCapture._();

  /// Shows desktop media picker UI with the specified set of sources.
  int chooseDesktopMedia(
    List<DesktopCaptureSourceType> sources,
    Tab? targetTab,
    ChooseDesktopMediaOptions? options,
    JSFunction callback,
  ) {
    return $js.chrome.desktopCapture.chooseDesktopMedia(
      throw UnimplementedError(),
      targetTab?.toJS,
      options?.toJS,
      callback,
    );
  }

  /// Hides desktop media picker dialog shown by chooseDesktopMedia().
  void cancelChooseDesktopMedia(int desktopMediaRequestId) {
    $js.chrome.desktopCapture.cancelChooseDesktopMedia(desktopMediaRequestId);
  }
}

/// Enum used to define set of desktop media sources used in
/// chooseDesktopMedia().
enum DesktopCaptureSourceType {
  screen('screen'),
  window('window'),
  tab('tab'),
  audio('audio');

  const DesktopCaptureSourceType(this.value);

  final String value;

  String get toJS => value;
  static DesktopCaptureSourceType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Mirrors
/// [SystemAudioPreferenceEnum](https://w3c.github.io/mediacapture-screen-share/#dom-systemaudiopreferenceenum).
enum SystemAudioPreferenceEnum {
  include('include'),
  exclude('exclude');

  const SystemAudioPreferenceEnum(this.value);

  final String value;

  String get toJS => value;
  static SystemAudioPreferenceEnum fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

/// Mirrors
/// [SelfCapturePreferenceEnum](https://w3c.github.io/mediacapture-screen-share/#dom-selfcapturepreferenceenum).
enum SelfCapturePreferenceEnum {
  include('include'),
  exclude('exclude');

  const SelfCapturePreferenceEnum(this.value);

  final String value;

  String get toJS => value;
  static SelfCapturePreferenceEnum fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class ChooseDesktopMediaOptions {
  ChooseDesktopMediaOptions.fromJS(this._wrapped);

  ChooseDesktopMediaOptions({
    SystemAudioPreferenceEnum? systemAudio,
    SelfCapturePreferenceEnum? selfBrowserSurface,
    bool? suppressLocalAudioPlaybackIntended,
  }) : _wrapped = $js.ChooseDesktopMediaOptions(
          systemAudio: systemAudio?.toJS,
          selfBrowserSurface: selfBrowserSurface?.toJS,
          suppressLocalAudioPlaybackIntended:
              suppressLocalAudioPlaybackIntended,
        );

  final $js.ChooseDesktopMediaOptions _wrapped;

  $js.ChooseDesktopMediaOptions get toJS => _wrapped;
}
