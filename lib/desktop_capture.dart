import 'chrome.dart';
export 'chrome.dart';

final _desktopCapture = ChromeDesktopCapture._();

extension ChromeChromeDesktopCaptureExtension on Chrome {
  ChromeDesktopCapture get desktopCapture => _desktopCapture;
}

class ChromeDesktopCapture {
  ChromeDesktopCapture._();
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
