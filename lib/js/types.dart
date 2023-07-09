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

/// The scope of the ChromeSetting. One of<ul><li><var>regular</var>: setting
/// for the regular profile (which is inherited by the incognito profile if not
/// overridden elsewhere),</li><li><var>regular_only</var>: setting for the
/// regular profile only (not inherited by the incognito
/// profile),</li><li><var>incognito_persistent</var>: setting for the incognito
/// profile that survives browser restarts (overrides regular
/// preferences),</li><li><var>incognito_session_only</var>: setting for the
/// incognito profile that can only be set during an incognito session and is
/// deleted when the incognito session ends (overrides regular and
/// incognito_persistent preferences).</li></ul>
typedef ChromeSettingScope = JSString;

/// One of<ul><li><var>not_controllable</var>: cannot be controlled by any
/// extension</li><li><var>controlled_by_other_extensions</var>: controlled by
/// extensions with higher
/// precedence</li><li><var>controllable_by_this_extension</var>: can be
/// controlled by this
/// extension</li><li><var>controlled_by_this_extension</var>: controlled by
/// this extension</li></ul>
typedef LevelOfControl = JSString;

@JS()
@staticInterop
class ChromeSetting {}
