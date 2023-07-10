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

extension ChromeSettingExtension on ChromeSetting {
  /// Gets the value of a setting.
  external JSPromise get(GetDetails details);

  /// Sets the value of a setting.
  external JSPromise set(SetDetails details);

  /// Clears the setting, restoring any default value.
  external JSPromise clear(ClearDetails details);

  /// Fired after the setting changes.
  external ChromeEvent get onChange;
}

@JS()
@staticInterop
@anonymous
class GetDetails {
  external factory GetDetails(

      /// Whether to return the value that applies to the incognito session (default
      /// false).
      JSBoolean? incognito);
}

@JS()
@staticInterop
@anonymous
class SetDetails {
  external factory SetDetails(
    /// The value of the setting. <br/>Note that every setting has a specific
    /// value type, which is described together with the setting. An extension
    /// should <em>not</em> set a value of a different type.
    JSAny value,

    /// Where to set the setting (default: regular).
    ChromeSettingScope? scope,
  );
}

@JS()
@staticInterop
@anonymous
class ClearDetails {
  external factory ClearDetails(

      /// Where to clear the setting (default: regular).
      ChromeSettingScope? scope);
}
