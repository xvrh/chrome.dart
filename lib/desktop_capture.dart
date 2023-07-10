import 'chrome.dart';
export 'chrome.dart';

final _desktopCapture = ChromeDesktopCapture._();

extension ChromeDesktopCaptureExtension on Chrome {
  ChromeDesktopCapture get desktopCapture => _desktopCapture;
}

class ChromeDesktopCapture {
  ChromeDesktopCapture._();

  /// Shows desktop media picker UI with the specified set of sources.
  void chooseDesktopMedia(
    sources,
    targetTab,
    options,
    callback,
  ) =>
      throw UnimplementedError();

  /// Hides desktop media picker dialog shown by chooseDesktopMedia().
  void cancelChooseDesktopMedia(desktopMediaRequestId) =>
      throw UnimplementedError();
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
}

/// Mirrors <a
/// href="https://w3c.github.io/mediacapture-screen-share/#dom-systemaudiopreferenceenum">SystemAudioPreferenceEnum</a>.
enum SystemAudioPreferenceEnum {
  include('include'),
  exclude('exclude');

  const SystemAudioPreferenceEnum(this.value);

  final String value;
}

/// Mirrors <a
/// href="https://w3c.github.io/mediacapture-screen-share/#dom-selfcapturepreferenceenum">SelfCapturePreferenceEnum</a>.
enum SelfCapturePreferenceEnum {
  include('include'),
  exclude('exclude');

  const SelfCapturePreferenceEnum(this.value);

  final String value;
}
