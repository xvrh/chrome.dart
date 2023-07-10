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

extension JSPrivacyExtension on JSPrivacy {
  /// Settings that influence Chrome's handling of network connections in
  /// general.
  external JSObject get network;

  /// Settings that enable or disable features that require third-party network
  /// services provided by Google and your default search provider.
  external JSObject get services;

  /// Settings that determine what information Chrome makes available to
  /// websites.
  external JSObject get websites;
}

/// The IP handling policy of WebRTC.
typedef IPHandlingPolicy = String;
