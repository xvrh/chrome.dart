import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSContentSettingsExtension on JSChrome {
  /// Use the `chrome.contentSettings` API to change settings that control
  /// whether websites can use features such as cookies, JavaScript, and
  /// plugins. More generally speaking, content settings allow you to customize
  /// Chrome's behavior on a per-site basis instead of globally.
  external JSContentSettings get ContentSettings;
}

@JS()
@staticInterop
class JSContentSettings {}

extension JSContentSettingsExtension on JSContentSettings {}
