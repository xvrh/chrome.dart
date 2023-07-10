import 'chrome.dart';
export 'chrome.dart';

final _contentSettings = ChromeContentSettings._();

extension ChromeChromeContentSettingsExtension on Chrome {
  ChromeContentSettings get contentSettings => _contentSettings;
}

class ChromeContentSettings {
  ChromeContentSettings._();
}

/// The scope of the ContentSetting. One of
/// `regular`: setting for regular profile (which is inherited by the incognito
/// profile if not overridden elsewhere),
/// `incognito_session_only`: setting for incognito profile that can only be set
/// during an incognito session and is deleted when the incognito session ends
/// (overrides regular settings).
enum Scope {
  regular('regular'),
  incognitoSessionOnly('incognito_session_only');

  const Scope(this.value);

  final String value;
}

enum AutoVerifyContentSetting {
  allow('allow'),
  block('block');

  const AutoVerifyContentSetting(this.value);

  final String value;
}

enum CookiesContentSetting {
  allow('allow'),
  block('block'),
  sessionOnly('session_only');

  const CookiesContentSetting(this.value);

  final String value;
}

enum ImagesContentSetting {
  allow('allow'),
  block('block');

  const ImagesContentSetting(this.value);

  final String value;
}

enum JavascriptContentSetting {
  allow('allow'),
  block('block');

  const JavascriptContentSetting(this.value);

  final String value;
}

enum LocationContentSetting {
  allow('allow'),
  block('block'),
  ask('ask');

  const LocationContentSetting(this.value);

  final String value;
}

enum PluginsContentSetting {
  block('block');

  const PluginsContentSetting(this.value);

  final String value;
}

enum PopupsContentSetting {
  allow('allow'),
  block('block');

  const PopupsContentSetting(this.value);

  final String value;
}

enum NotificationsContentSetting {
  allow('allow'),
  block('block'),
  ask('ask');

  const NotificationsContentSetting(this.value);

  final String value;
}

enum FullscreenContentSetting {
  allow('allow');

  const FullscreenContentSetting(this.value);

  final String value;
}

enum MouselockContentSetting {
  allow('allow');

  const MouselockContentSetting(this.value);

  final String value;
}

enum MicrophoneContentSetting {
  allow('allow'),
  block('block'),
  ask('ask');

  const MicrophoneContentSetting(this.value);

  final String value;
}

enum CameraContentSetting {
  allow('allow'),
  block('block'),
  ask('ask');

  const CameraContentSetting(this.value);

  final String value;
}

enum PpapiBrokerContentSetting {
  block('block');

  const PpapiBrokerContentSetting(this.value);

  final String value;
}

enum MultipleAutomaticDownloadsContentSetting {
  allow('allow'),
  block('block'),
  ask('ask');

  const MultipleAutomaticDownloadsContentSetting(this.value);

  final String value;
}
