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
  external JSPromise clearFont(JSObject details);

  /// Gets the font for a given script and generic font family.
  external JSPromise getFont(JSObject details);

  /// Sets the font for a given script and generic font family.
  external JSPromise setFont(JSObject details);

  /// Gets a list of fonts on the system.
  external JSPromise getFontList();

  /// Clears the default font size set by this extension, if any.
  external JSPromise clearDefaultFontSize(JSObject details);

  /// Gets the default font size.
  external JSPromise getDefaultFontSize(JSObject details);

  /// Sets the default font size.
  external JSPromise setDefaultFontSize(JSObject details);

  /// Clears the default fixed font size set by this extension, if any.
  external JSPromise clearDefaultFixedFontSize(JSObject details);

  /// Gets the default size for fixed width fonts.
  external JSPromise getDefaultFixedFontSize(JSObject details);

  /// Sets the default size for fixed width fonts.
  external JSPromise setDefaultFixedFontSize(JSObject details);

  /// Clears the minimum font size set by this extension, if any.
  external JSPromise clearMinimumFontSize(JSObject details);

  /// Gets the minimum font size.
  external JSPromise getMinimumFontSize(JSObject details);

  /// Sets the minimum font size.
  external JSPromise setMinimumFontSize(JSObject details);

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
