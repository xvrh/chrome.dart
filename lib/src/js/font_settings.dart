import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSFontSettingsExtension on JSChrome {
  /// Use the `chrome.fontSettings` API to manage Chrome's font settings.
  external JSFontSettings get fontSettings;
}

@JS()
@staticInterop
class JSFontSettings {}

extension JSFontSettingsExtension on JSFontSettings {
  /// Clears the font set by this extension, if any.
  external JSPromise clearFont(ClearFontDetails details);

  /// Gets the font for a given script and generic font family.
  external JSPromise getFont(GetFontDetails details);

  /// Sets the font for a given script and generic font family.
  external JSPromise setFont(SetFontDetails details);

  /// Gets a list of fonts on the system.
  external JSPromise getFontList();

  /// Clears the default font size set by this extension, if any.
  external JSPromise clearDefaultFontSize(ClearDefaultFontSizeDetails details);

  /// Gets the default font size.
  external JSPromise getDefaultFontSize(GetDefaultFontSizeDetails details);

  /// Sets the default font size.
  external JSPromise setDefaultFontSize(SetDefaultFontSizeDetails details);

  /// Clears the default fixed font size set by this extension, if any.
  external JSPromise clearDefaultFixedFontSize(
      ClearDefaultFixedFontSizeDetails details);

  /// Gets the default size for fixed width fonts.
  external JSPromise getDefaultFixedFontSize(
      GetDefaultFixedFontSizeDetails details);

  /// Sets the default size for fixed width fonts.
  external JSPromise setDefaultFixedFontSize(
      SetDefaultFixedFontSizeDetails details);

  /// Clears the minimum font size set by this extension, if any.
  external JSPromise clearMinimumFontSize(ClearMinimumFontSizeDetails details);

  /// Gets the minimum font size.
  external JSPromise getMinimumFontSize(GetMinimumFontSizeDetails details);

  /// Sets the minimum font size.
  external JSPromise setMinimumFontSize(SetMinimumFontSizeDetails details);

  /// Fired when a font setting changes.
  external ChromeEvent get onFontChanged;

  /// Fired when the default font size setting changes.
  external ChromeEvent get onDefaultFontSizeChanged;

  /// Fired when the default fixed font size setting changes.
  external ChromeEvent get onDefaultFixedFontSizeChanged;

  /// Fired when the minimum font size setting changes.
  external ChromeEvent get onMinimumFontSizeChanged;
}

/// An ISO 15924 script code. The default, or global, script is represented by
/// script code "Zyyy".
typedef ScriptCode = JSString;

/// A CSS generic font family.
typedef GenericFamily = JSString;

/// One of
/// `not_controllable`: cannot be controlled by any extension
/// `controlled_by_other_extensions`: controlled by extensions with higher
/// precedence
/// `controllable_by_this_extension`: can be controlled by this extension
/// `controlled_by_this_extension`: controlled by this extension
typedef LevelOfControl = JSString;

@JS()
@staticInterop
class FontName {
  /// The font ID.
  external String get fontId;

  /// The display name of the font.
  external String get displayName;
}

@JS()
@staticInterop
class ClearFontDetails {
  /// The script for which the font should be cleared. If omitted, the global
  /// script font setting is cleared.
  external ScriptCode? get script;

  /// The generic font family for which the font should be cleared.
  external GenericFamily get genericFamily;
}

@JS()
@staticInterop
class GetFontDetails {
  /// The script for which the font should be retrieved. If omitted, the font
  /// setting for the global script (script code "Zyyy") is retrieved.
  external ScriptCode? get script;

  /// The generic font family for which the font should be retrieved.
  external GenericFamily get genericFamily;
}

@JS()
@staticInterop
class SetFontDetails {
  /// The script code which the font should be set. If omitted, the font setting
  /// for the global script (script code "Zyyy") is set.
  external ScriptCode? get script;

  /// The generic font family for which the font should be set.
  external GenericFamily get genericFamily;

  /// The font ID. The empty string means to fallback to the global script font
  /// setting.
  external String get fontId;
}

@JS()
@staticInterop
class ClearDefaultFontSizeDetails {}

@JS()
@staticInterop
class GetDefaultFontSizeDetails {}

@JS()
@staticInterop
class SetDefaultFontSizeDetails {
  /// The font size in pixels.
  external int get pixelSize;
}

@JS()
@staticInterop
class ClearDefaultFixedFontSizeDetails {}

@JS()
@staticInterop
class GetDefaultFixedFontSizeDetails {}

@JS()
@staticInterop
class SetDefaultFixedFontSizeDetails {
  /// The font size in pixels.
  external int get pixelSize;
}

@JS()
@staticInterop
class ClearMinimumFontSizeDetails {}

@JS()
@staticInterop
class GetMinimumFontSizeDetails {}

@JS()
@staticInterop
class SetMinimumFontSizeDetails {
  /// The font size in pixels.
  external int get pixelSize;
}
