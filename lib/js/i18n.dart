import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSI18nExtension on JSChrome {
  /// Use the `chrome.i18n` infrastructure to implement internationalization
  /// across your whole app or extension.
  external JSI18n get i18N;
}

@JS()
@staticInterop
class JSI18n {}

extension JSI18nExtension on JSI18n {
  /// Gets the accept-languages of the browser. This is different from the
  /// locale used by the browser; to get the locale, use
  /// $(ref:i18n.getUILanguage).
  external void getAcceptLanguages();

  /// Gets the localized string for the specified message. If the message is
  /// missing, this method returns an empty string (''). If the format of the
  /// `getMessage()` call is wrong &mdash; for example, <em>messageName</em> is
  /// not a string or the <em>substitutions</em> array has more than 9 elements
  /// &mdash; this method returns `undefined`.
  external void getMessage(
    messageName,
    substitutions,
    options,
  );

  /// Gets the browser UI language of the browser. This is different from
  /// $(ref:i18n.getAcceptLanguages) which returns the preferred user languages.
  external void getUILanguage();

  /// Detects the language of the provided text using CLD.
  external void detectLanguage(text);
}

@JS()
@staticInterop
class LanguageCode {}
