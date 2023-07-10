import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSTypesExtension on JSChrome {
  /// The `chrome.types` API contains type declarations for Chrome.
  external JSTypes get types;
}

@JS()
@staticInterop
class JSTypes {}

extension JSTypesExtension on JSTypes {}

/// The scope of the ChromeSetting. One of<ul><li>`regular`: setting for the
/// regular profile (which is inherited by the incognito profile if not
/// overridden elsewhere),</li><li>`regular_only`: setting for the regular
/// profile only (not inherited by the incognito
/// profile),</li><li>`incognito_persistent`: setting for the incognito profile
/// that survives browser restarts (overrides regular
/// preferences),</li><li>`incognito_session_only`: setting for the incognito
/// profile that can only be set during an incognito session and is deleted when
/// the incognito session ends (overrides regular and incognito_persistent
/// preferences).</li></ul>
typedef ChromeSettingScope = JSString;

/// One of<ul><li>`not_controllable`: cannot be controlled by any
/// extension</li><li>`controlled_by_other_extensions`: controlled by extensions
/// with higher precedence</li><li>`controllable_by_this_extension`: can be
/// controlled by this extension</li><li>`controlled_by_this_extension`:
/// controlled by this extension</li></ul>
typedef LevelOfControl = JSString;

@JS()
@staticInterop
class ChromeSetting {}
