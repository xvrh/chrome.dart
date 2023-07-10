import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSPrivacyExtension on JSChrome {
  /// Use the `chrome.privacy` API to control usage of the features in Chrome
  /// that can affect a user's privacy. This API relies on the <a
  /// href='types#ChromeSetting'>ChromeSetting prototype of the type API</a> for
  /// getting and setting Chrome's configuration.
  external JSPrivacy get privacy;
}

@JS()
@staticInterop
class JSPrivacy {}

extension JSPrivacyExtension on JSPrivacy {}

/// The IP handling policy of WebRTC.
typedef IPHandlingPolicy = JSString;
