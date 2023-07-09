import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSFontSettingsExtension on JSChrome {
  /// Use the `chrome.fontSettings` API to manage Chrome's font settings.
  external JSFontSettings get FontSettings;
}

@JS()
@staticInterop
class JSFontSettings {}

extension JSFontSettingsExtension on JSFontSettings {
  /// Clears the font set by this extension, if any.
  external void clearFont();

  /// Gets the font for a given script and generic font family.
  external void getFont();

  /// Sets the font for a given script and generic font family.
  external void setFont();

  /// Gets a list of fonts on the system.
  external void getFontList();

  /// Clears the default font size set by this extension, if any.
  external void clearDefaultFontSize();

  /// Gets the default font size.
  external void getDefaultFontSize();

  /// Sets the default font size.
  external void setDefaultFontSize();

  /// Clears the default fixed font size set by this extension, if any.
  external void clearDefaultFixedFontSize();

  /// Gets the default size for fixed width fonts.
  external void getDefaultFixedFontSize();

  /// Sets the default size for fixed width fonts.
  external void setDefaultFixedFontSize();

  /// Clears the minimum font size set by this extension, if any.
  external void clearMinimumFontSize();

  /// Gets the minimum font size.
  external void getMinimumFontSize();

  /// Sets the minimum font size.
  external void setMinimumFontSize();

  /// Fired when a font setting changes.
  external ChromeEvent get onFontChanged;

  /// Fired when the default font size setting changes.
  external ChromeEvent get onDefaultFontSizeChanged;

  /// Fired when the default fixed font size setting changes.
  external ChromeEvent get onDefaultFixedFontSizeChanged;

  /// Fired when the minimum font size setting changes.
  external ChromeEvent get onMinimumFontSizeChanged;
}
