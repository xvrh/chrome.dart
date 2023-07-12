import 'src/internal_helpers.dart';
import 'src/js/content_settings.dart' as $js;
export 'chrome.dart';

final _contentSettings = ChromeContentSettings._();

extension ChromeContentSettingsExtension on Chrome {
  ChromeContentSettings get contentSettings => _contentSettings;
}

class ChromeContentSettings {
  ChromeContentSettings._();

  /// Whether to allow sites to use the [Private State Tokens
  /// API](https://developer.chrome.com/docs/privacy-sandbox/trust-tokens/). One
  /// of
  /// [allow]: Allow sites to use the Private State Tokens API,
  /// [block]: Block sites from using the Private State Tokens API.
  /// Default is [allow].
  ///  The primary URL is the URL of the top-level frame. The secondary URL is
  /// not used. NOTE: When calling `set()`, the primary pattern must be
  /// `<all_urls>`.
  ContentSetting get autoVerify =>
      $js.chrome.contentSettings.autoVerify as dynamic;

  /// Whether to allow cookies and other local data to be set by websites. One
  /// of
  /// [allow]: Accept cookies,
  /// [block]: Block cookies,
  /// [session_only]: Accept cookies only for the current session.
  /// Default is [allow].
  /// The primary URL is the URL representing the cookie origin. The secondary
  /// URL is the URL of the top-level frame.
  ContentSetting get cookies => $js.chrome.contentSettings.cookies as dynamic;

  /// Whether to show images. One of
  /// [allow]: Show images,
  /// [block]: Don't show images.
  /// Default is [allow].
  /// The primary URL is the URL of the top-level frame. The secondary URL is
  /// the URL of the image.
  ContentSetting get images => $js.chrome.contentSettings.images as dynamic;

  /// Whether to run JavaScript. One of
  /// [allow]: Run JavaScript,
  /// [block]: Don't run JavaScript.
  /// Default is [allow].
  /// The primary URL is the URL of the top-level frame. The secondary URL is
  /// not used.
  ContentSetting get javascript =>
      $js.chrome.contentSettings.javascript as dynamic;

  /// Whether to allow Geolocation. One of
  /// [allow]: Allow sites to track your physical location,
  /// [block]: Don't allow sites to track your physical location,
  /// [ask]: Ask before allowing sites to track your physical location.
  /// Default is [ask].
  /// The primary URL is the URL of the document which requested location data.
  /// The secondary URL is the URL of the top-level frame (which may or may not
  /// differ from the requesting URL).
  ContentSetting get location => $js.chrome.contentSettings.location as dynamic;

  /// <i>Deprecated.</i> With Flash support removed in Chrome 88, this
  /// permission no longer has any effect. Value is always [block]. Calls to
  /// `set()` and `clear()` will be ignored.
  ContentSetting get plugins => $js.chrome.contentSettings.plugins as dynamic;

  /// Whether to allow sites to show pop-ups. One of
  /// [allow]: Allow sites to show pop-ups,
  /// [block]: Don't allow sites to show pop-ups.
  /// Default is [block].
  /// The primary URL is the URL of the top-level frame. The secondary URL is
  /// not used.
  ContentSetting get popups => $js.chrome.contentSettings.popups as dynamic;

  /// Whether to allow sites to show desktop notifications. One of
  /// [allow]: Allow sites to show desktop notifications,
  /// [block]: Don't allow sites to show desktop notifications,
  /// [ask]: Ask when a site wants to show desktop notifications.
  /// Default is [ask].
  /// The primary URL is the URL of the document which wants to show the
  /// notification. The secondary URL is not used.
  ContentSetting get notifications =>
      $js.chrome.contentSettings.notifications as dynamic;

  /// <i>Deprecated.</i> No longer has any effect. Fullscreen permission is now
  /// automatically granted for all sites. Value is always [allow].
  ContentSetting get fullscreen =>
      $js.chrome.contentSettings.fullscreen as dynamic;

  /// <i>Deprecated.</i> No longer has any effect. Mouse lock permission is now
  /// automatically granted for all sites. Value is always [allow].
  ContentSetting get mouselock =>
      $js.chrome.contentSettings.mouselock as dynamic;

  /// Whether to allow sites to access the microphone. One of
  /// [allow]: Allow sites to access the microphone,
  /// [block]: Don't allow sites to access the microphone,
  /// [ask]: Ask when a site wants to access the microphone.
  /// Default is [ask].
  /// The primary URL is the URL of the document which requested microphone
  /// access. The secondary URL is not used.
  /// NOTE: The 'allow' setting is not valid if both patterns are '<all_urls>'.
  ContentSetting get microphone =>
      $js.chrome.contentSettings.microphone as dynamic;

  /// Whether to allow sites to access the camera. One of
  /// [allow]: Allow sites to access the camera,
  /// [block]: Don't allow sites to access the camera,
  /// [ask]: Ask when a site wants to access the camera.
  /// Default is [ask].
  /// The primary URL is the URL of the document which requested camera access.
  /// The secondary URL is not used.
  /// NOTE: The 'allow' setting is not valid if both patterns are '<all_urls>'.
  ContentSetting get camera => $js.chrome.contentSettings.camera as dynamic;

  /// <i>Deprecated.</i> Previously, controlled whether to allow sites to run
  /// plugins unsandboxed, however, with the Flash broker process removed in
  /// Chrome 88, this permission no longer has any effect. Value is always
  /// [block]. Calls to `set()` and `clear()` will be ignored.
  ContentSetting get unsandboxedPlugins =>
      $js.chrome.contentSettings.unsandboxedPlugins as dynamic;

  /// Whether to allow sites to download multiple files automatically. One of
  /// [allow]: Allow sites to download multiple files automatically,
  /// [block]: Don't allow sites to download multiple files automatically,
  /// [ask]: Ask when a site wants to download files automatically after the
  /// first file.
  /// Default is [ask].
  /// The primary URL is the URL of the top-level frame. The secondary URL is
  /// not used.
  ContentSetting get automaticDownloads =>
      $js.chrome.contentSettings.automaticDownloads as dynamic;
}

/// The scope of the ContentSetting. One of
/// [regular]: setting for regular profile (which is inherited by the incognito
/// profile if not overridden elsewhere),
/// [incognito_session_only]: setting for incognito profile that can only be set
/// during an incognito session and is deleted when the incognito session ends
/// (overrides regular settings).
enum Scope {
  regular('regular'),
  incognitoSessionOnly('incognito_session_only');

  const Scope(this.value);

  final String value;

  String get toJS => value;
  static Scope fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum AutoVerifyContentSetting {
  allow('allow'),
  block('block');

  const AutoVerifyContentSetting(this.value);

  final String value;

  String get toJS => value;
  static AutoVerifyContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum CookiesContentSetting {
  allow('allow'),
  block('block'),
  sessionOnly('session_only');

  const CookiesContentSetting(this.value);

  final String value;

  String get toJS => value;
  static CookiesContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum ImagesContentSetting {
  allow('allow'),
  block('block');

  const ImagesContentSetting(this.value);

  final String value;

  String get toJS => value;
  static ImagesContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum JavascriptContentSetting {
  allow('allow'),
  block('block');

  const JavascriptContentSetting(this.value);

  final String value;

  String get toJS => value;
  static JavascriptContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum LocationContentSetting {
  allow('allow'),
  block('block'),
  ask('ask');

  const LocationContentSetting(this.value);

  final String value;

  String get toJS => value;
  static LocationContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum PluginsContentSetting {
  block('block');

  const PluginsContentSetting(this.value);

  final String value;

  String get toJS => value;
  static PluginsContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum PopupsContentSetting {
  allow('allow'),
  block('block');

  const PopupsContentSetting(this.value);

  final String value;

  String get toJS => value;
  static PopupsContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum NotificationsContentSetting {
  allow('allow'),
  block('block'),
  ask('ask');

  const NotificationsContentSetting(this.value);

  final String value;

  String get toJS => value;
  static NotificationsContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum FullscreenContentSetting {
  allow('allow');

  const FullscreenContentSetting(this.value);

  final String value;

  String get toJS => value;
  static FullscreenContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum MouselockContentSetting {
  allow('allow');

  const MouselockContentSetting(this.value);

  final String value;

  String get toJS => value;
  static MouselockContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum MicrophoneContentSetting {
  allow('allow'),
  block('block'),
  ask('ask');

  const MicrophoneContentSetting(this.value);

  final String value;

  String get toJS => value;
  static MicrophoneContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum CameraContentSetting {
  allow('allow'),
  block('block'),
  ask('ask');

  const CameraContentSetting(this.value);

  final String value;

  String get toJS => value;
  static CameraContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum PpapiBrokerContentSetting {
  block('block');

  const PpapiBrokerContentSetting(this.value);

  final String value;

  String get toJS => value;
  static PpapiBrokerContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

enum MultipleAutomaticDownloadsContentSetting {
  allow('allow'),
  block('block'),
  ask('ask');

  const MultipleAutomaticDownloadsContentSetting(this.value);

  final String value;

  String get toJS => value;
  static MultipleAutomaticDownloadsContentSetting fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class ResourceIdentifier {
  ResourceIdentifier.fromJS(this._wrapped);

  final $js.ResourceIdentifier _wrapped;

  $js.ResourceIdentifier get toJS => _wrapped;

  /// The resource identifier for the given content type.
  String get id => _wrapped.id;
  set id(String v) {
    throw UnimplementedError();
  }

  /// A human readable description of the resource.
  String? get description => _wrapped.description;
  set description(String? v) {
    throw UnimplementedError();
  }
}

class ContentSetting {
  ContentSetting.fromJS(this._wrapped);

  final $js.ContentSetting _wrapped;

  $js.ContentSetting get toJS => _wrapped;

  /// Clear all content setting rules set by this extension.
  Future<void> clear(ClearDetails details) => throw UnimplementedError();

  /// Gets the current content setting for a given pair of URLs.
  Future<GetCallbackDetails> get(GetDetails details) =>
      throw UnimplementedError();

  /// Applies a new content setting rule.
  Future<void> set(SetDetails details) => throw UnimplementedError();

  Future<List<ResourceIdentifier>?> getResourceIdentifiers() =>
      throw UnimplementedError();
}

class ClearDetails {
  ClearDetails.fromJS(this._wrapped);

  final $js.ClearDetails _wrapped;

  $js.ClearDetails get toJS => _wrapped;
}

class GetCallbackDetails {
  GetCallbackDetails.fromJS(this._wrapped);

  final $js.GetCallbackDetails _wrapped;

  $js.GetCallbackDetails get toJS => _wrapped;

  /// The content setting. See the description of the individual ContentSetting
  /// objects for the possible values.
  JSAny get setting => _wrapped.setting;
  set setting(JSAny v) {
    throw UnimplementedError();
  }
}

class GetDetails {
  GetDetails.fromJS(this._wrapped);

  final $js.GetDetails _wrapped;

  $js.GetDetails get toJS => _wrapped;
}

class SetDetails {
  SetDetails.fromJS(this._wrapped);

  final $js.SetDetails _wrapped;

  $js.SetDetails get toJS => _wrapped;
}
