import 'src/internal_helpers.dart';
import 'tabs.dart';
import 'src/js/desktop_capture.dart' as $js;
export 'chrome.dart';

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
    JSAny callback,
  ) =>
      throw UnimplementedError();

  /// Hides desktop media picker dialog shown by chooseDesktopMedia().
  void cancelChooseDesktopMedia(int desktopMediaRequestId) =>
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

  final $js.ChooseDesktopMediaOptions _wrapped;

  $js.ChooseDesktopMediaOptions get toJS => _wrapped;
}
