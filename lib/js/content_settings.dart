import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSContentSettingsExtension on JSChrome {
  /// Use the `chrome.contentSettings` API to change settings that control
  /// whether websites can use features such as cookies, JavaScript, and
  /// plugins. More generally speaking, content settings allow you to customize
  /// Chrome's behavior on a per-site basis instead of globally.
  external JSContentSettings get contentSettings;
}

@JS()
@staticInterop
class JSContentSettings {}

extension JSContentSettingsExtension on JSContentSettings {}

/// The scope of the ContentSetting. One of<br><var>regular</var>: setting for
/// regular profile (which is inherited by the incognito profile if not
/// overridden elsewhere),<br><var>incognito_session_only</var>: setting for
/// incognito profile that can only be set during an incognito session and is
/// deleted when the incognito session ends (overrides regular settings).
typedef Scope = JSString;

typedef AutoVerifyContentSetting = JSString;

typedef CookiesContentSetting = JSString;

typedef ImagesContentSetting = JSString;

typedef JavascriptContentSetting = JSString;

typedef LocationContentSetting = JSString;

typedef PluginsContentSetting = JSString;

typedef PopupsContentSetting = JSString;

typedef NotificationsContentSetting = JSString;

typedef FullscreenContentSetting = JSString;

typedef MouselockContentSetting = JSString;

typedef MicrophoneContentSetting = JSString;

typedef CameraContentSetting = JSString;

typedef PpapiBrokerContentSetting = JSString;

typedef MultipleAutomaticDownloadsContentSetting = JSString;

@JS()
@staticInterop
class ResourceIdentifier {
  /// The resource identifier for the given content type.
  external String get id;

  /// A human readable description of the resource.
  external String? get description;
}

@JS()
@staticInterop
class ContentSetting {}
