import 'dart:js_interop';

import 'chrome.dart';

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
  external void clearFont(
    ClearFontDetails details,
    JSFunction callback,
  );

  /// Gets the font for a given script and generic font family.
  external void getFont(
    GetFontDetails details,
    JSFunction callback,
  );

  /// Sets the font for a given script and generic font family.
  external void setFont(
    SetFontDetails details,
    JSFunction callback,
  );

  /// Gets a list of fonts on the system.
  external void getFontList(JSFunction callback);

  /// Clears the default font size set by this extension, if any.
  external void clearDefaultFontSize(
    ClearDefaultFontSizeDetails? details,
    JSFunction callback,
  );

  /// Gets the default font size.
  external void getDefaultFontSize(
    GetDefaultFontSizeDetails? details,
    JSFunction callback,
  );

  /// Sets the default font size.
  external void setDefaultFontSize(
    SetDefaultFontSizeDetails details,
    JSFunction callback,
  );

  /// Clears the default fixed font size set by this extension, if any.
  external void clearDefaultFixedFontSize(
    ClearDefaultFixedFontSizeDetails? details,
    JSFunction callback,
  );

  /// Gets the default size for fixed width fonts.
  external void getDefaultFixedFontSize(
    GetDefaultFixedFontSizeDetails? details,
    JSFunction callback,
  );

  /// Sets the default size for fixed width fonts.
  external void setDefaultFixedFontSize(
    SetDefaultFixedFontSizeDetails details,
    JSFunction callback,
  );

  /// Clears the minimum font size set by this extension, if any.
  external void clearMinimumFontSize(
    ClearMinimumFontSizeDetails? details,
    JSFunction callback,
  );

  /// Gets the minimum font size.
  external void getMinimumFontSize(
    GetMinimumFontSizeDetails? details,
    JSFunction callback,
  );

  /// Sets the minimum font size.
  external void setMinimumFontSize(
    SetMinimumFontSizeDetails details,
    JSFunction callback,
  );

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
typedef ScriptCode = String;

/// A CSS generic font family.
typedef GenericFamily = String;

/// One of
/// [not_controllable]: cannot be controlled by any extension
/// [controlled_by_other_extensions]: controlled by extensions with higher
/// precedence
/// [controllable_by_this_extension]: can be controlled by this extension
/// [controlled_by_this_extension]: controlled by this extension
typedef LevelOfControl = String;

@JS()
@staticInterop
class FontName {}

extension FontNameExtension on FontName {
  /// The font ID.
  external String fontId;

  /// The display name of the font.
  external String displayName;
}

@JS()
@staticInterop
class OnFontChangedDetails {}

extension OnFontChangedDetailsExtension on OnFontChangedDetails {
  /// The font ID. See the description in `getFont`.
  external String fontId;

  /// The script code for which the font setting has changed.
  external ScriptCode? script;

  /// The generic font family for which the font setting has changed.
  external GenericFamily genericFamily;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}

@JS()
@staticInterop
class OnDefaultFontSizeChangedDetails {}

extension OnDefaultFontSizeChangedDetailsExtension
    on OnDefaultFontSizeChangedDetails {
  /// The font size in pixels.
  external int pixelSize;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}

@JS()
@staticInterop
class OnDefaultFixedFontSizeChangedDetails {}

extension OnDefaultFixedFontSizeChangedDetailsExtension
    on OnDefaultFixedFontSizeChangedDetails {
  /// The font size in pixels.
  external int pixelSize;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}

@JS()
@staticInterop
class OnMinimumFontSizeChangedDetails {}

extension OnMinimumFontSizeChangedDetailsExtension
    on OnMinimumFontSizeChangedDetails {
  /// The font size in pixels.
  external int pixelSize;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}

@JS()
@staticInterop
@anonymous
class ClearFontDetails {
  external factory ClearFontDetails({
    /// The script for which the font should be cleared. If omitted, the global
    /// script font setting is cleared.
    ScriptCode? script,

    /// The generic font family for which the font should be cleared.
    GenericFamily genericFamily,
  });
}

@JS()
@staticInterop
class GetFontCallbackDetails {}

extension GetFontCallbackDetailsExtension on GetFontCallbackDetails {
  /// The font ID. Rather than the literal font ID preference value, this may be
  /// the ID of the font that the system resolves the preference value to. So,
  /// [fontId] can differ from the font passed to `setFont`, if, for example,
  /// the font is not available on the system. The empty string signifies
  /// fallback to the global script font setting.
  external String fontId;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}

@JS()
@staticInterop
@anonymous
class GetFontDetails {
  external factory GetFontDetails({
    /// The script for which the font should be retrieved. If omitted, the font
    /// setting for the global script (script code "Zyyy") is retrieved.
    ScriptCode? script,

    /// The generic font family for which the font should be retrieved.
    GenericFamily genericFamily,
  });
}

@JS()
@staticInterop
@anonymous
class SetFontDetails {
  external factory SetFontDetails({
    /// The script code which the font should be set. If omitted, the font setting
    /// for the global script (script code "Zyyy") is set.
    ScriptCode? script,

    /// The generic font family for which the font should be set.
    GenericFamily genericFamily,

    /// The font ID. The empty string means to fallback to the global script font
    /// setting.
    String fontId,
  });
}

@JS()
@staticInterop
@anonymous
class ClearDefaultFontSizeDetails {
  external factory ClearDefaultFontSizeDetails();
}

@JS()
@staticInterop
class GetDefaultFontSizeCallbackDetails {}

extension GetDefaultFontSizeCallbackDetailsExtension
    on GetDefaultFontSizeCallbackDetails {
  /// The font size in pixels.
  external int pixelSize;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}

@JS()
@staticInterop
@anonymous
class GetDefaultFontSizeDetails {
  external factory GetDefaultFontSizeDetails();
}

@JS()
@staticInterop
@anonymous
class SetDefaultFontSizeDetails {
  external factory SetDefaultFontSizeDetails(
      {
      /// The font size in pixels.
      int pixelSize});
}

@JS()
@staticInterop
@anonymous
class ClearDefaultFixedFontSizeDetails {
  external factory ClearDefaultFixedFontSizeDetails();
}

@JS()
@staticInterop
class GetDefaultFixedFontSizeCallbackDetails {}

extension GetDefaultFixedFontSizeCallbackDetailsExtension
    on GetDefaultFixedFontSizeCallbackDetails {
  /// The font size in pixels.
  external int pixelSize;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}

@JS()
@staticInterop
@anonymous
class GetDefaultFixedFontSizeDetails {
  external factory GetDefaultFixedFontSizeDetails();
}

@JS()
@staticInterop
@anonymous
class SetDefaultFixedFontSizeDetails {
  external factory SetDefaultFixedFontSizeDetails(
      {
      /// The font size in pixels.
      int pixelSize});
}

@JS()
@staticInterop
@anonymous
class ClearMinimumFontSizeDetails {
  external factory ClearMinimumFontSizeDetails();
}

@JS()
@staticInterop
class GetMinimumFontSizeCallbackDetails {}

extension GetMinimumFontSizeCallbackDetailsExtension
    on GetMinimumFontSizeCallbackDetails {
  /// The font size in pixels.
  external int pixelSize;

  /// The level of control this extension has over the setting.
  external LevelOfControl levelOfControl;
}

@JS()
@staticInterop
@anonymous
class GetMinimumFontSizeDetails {
  external factory GetMinimumFontSizeDetails();
}

@JS()
@staticInterop
@anonymous
class SetMinimumFontSizeDetails {
  external factory SetMinimumFontSizeDetails(
      {
      /// The font size in pixels.
      int pixelSize});
}
