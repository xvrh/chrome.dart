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

@JS()
@staticInterop
class ResourceIdentifier {
  /// The resource identifier for the given content type.
  external JSAny get id;

  /// A human readable description of the resource.
  external JSAny? get description;
}

@JS()
@staticInterop
class Scope {}

@JS()
@staticInterop
class ContentSetting {}

@JS()
@staticInterop
class AutoVerifyContentSetting {}

@JS()
@staticInterop
class CookiesContentSetting {}

@JS()
@staticInterop
class ImagesContentSetting {}

@JS()
@staticInterop
class JavascriptContentSetting {}

@JS()
@staticInterop
class LocationContentSetting {}

@JS()
@staticInterop
class PluginsContentSetting {}

@JS()
@staticInterop
class PopupsContentSetting {}

@JS()
@staticInterop
class NotificationsContentSetting {}

@JS()
@staticInterop
class FullscreenContentSetting {}

@JS()
@staticInterop
class MouselockContentSetting {}

@JS()
@staticInterop
class MicrophoneContentSetting {}

@JS()
@staticInterop
class CameraContentSetting {}

@JS()
@staticInterop
class PpapiBrokerContentSetting {}

@JS()
@staticInterop
class MultipleAutomaticDownloadsContentSetting {}
