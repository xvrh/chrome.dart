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
  external void clearFont(details);

  /// Gets the font for a given script and generic font family.
  external void getFont(details);

  /// Sets the font for a given script and generic font family.
  external void setFont(details);

  /// Gets a list of fonts on the system.
  external void getFontList();

  /// Clears the default font size set by this extension, if any.
  external void clearDefaultFontSize(details);

  /// Gets the default font size.
  external void getDefaultFontSize(details);

  /// Sets the default font size.
  external void setDefaultFontSize(details);

  /// Clears the default fixed font size set by this extension, if any.
  external void clearDefaultFixedFontSize(details);

  /// Gets the default size for fixed width fonts.
  external void getDefaultFixedFontSize(details);

  /// Sets the default size for fixed width fonts.
  external void setDefaultFixedFontSize(details);

  /// Clears the minimum font size set by this extension, if any.
  external void clearMinimumFontSize(details);

  /// Gets the minimum font size.
  external void getMinimumFontSize(details);

  /// Sets the minimum font size.
  external void setMinimumFontSize(details);

  /// Fired when a font setting changes.
  external ChromeEvent get onFontChanged;

  /// Fired when the default font size setting changes.
  external ChromeEvent get onDefaultFontSizeChanged;

  /// Fired when the default fixed font size setting changes.
  external ChromeEvent get onDefaultFixedFontSizeChanged;

  /// Fired when the minimum font size setting changes.
  external ChromeEvent get onMinimumFontSizeChanged;
}

@JS()
@staticInterop
class FontName {
  /// The font ID.
  external JSAny get fontId;

  /// The display name of the font.
  external JSAny get displayName;
}

@JS()
@staticInterop
class ScriptCode {}

@JS()
@staticInterop
class GenericFamily {}

@JS()
@staticInterop
class LevelOfControl {}
