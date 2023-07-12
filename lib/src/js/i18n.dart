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
  /// locale used by the browser; to get the locale, use [i18n.getUILanguage].
  external void getAcceptLanguages(JSFunction callback);

  /// Gets the localized string for the specified message. If the message is
  /// missing, this method returns an empty string (''). If the format of the
  /// `getMessage()` call is wrong - for example, _messageName_ is not a string
  /// or the _substitutions_ array has more than 9 elements - this method
  /// returns `undefined`.
  external String getMessage(
    String messageName,
    JSAny? substitutions,
    GetMessageOptions? options,
  );

  /// Gets the browser UI language of the browser. This is different from
  /// [i18n.getAcceptLanguages] which returns the preferred user languages.
  external String getUILanguage();

  /// Detects the language of the provided text using CLD.
  external void detectLanguage(
    String text,
    JSFunction callback,
  );
}

/// An ISO language code such as `en` or `fr`. For a complete list of languages
/// supported by this method, see
/// [kLanguageInfoTable](http://src.chromium.org/viewvc/chrome/trunk/src/third_party/cld/languages/internal/languages.cc).
/// For an unknown language, `und` will be returned, which means that
/// [percentage] of the text is unknown to CLD
typedef LanguageCode = String;

@JS()
@staticInterop
@anonymous
class GetMessageOptions {
  external factory GetMessageOptions(
      {
      /// Escape `<` in translation to `&amp;lt;`. This applies only to the message
      /// itself, not to the placeholders. Developers might want to use this if the
      /// translation is used in an HTML context. Closure Templates used with
      /// Closure Compiler generate this automatically.
      bool? escapeLt});
}

@JS()
@staticInterop
class DetectLanguageCallbackResult {}

extension DetectLanguageCallbackResultExtension
    on DetectLanguageCallbackResult {
  /// CLD detected language reliability
  external bool isReliable;

  /// array of detectedLanguage
  external DetectLanguageCallbackResultLanguages languages;
}

@JS()
@staticInterop
class DetectLanguageCallbackResultLanguages {}

extension DetectLanguageCallbackResultLanguagesExtension
    on DetectLanguageCallbackResultLanguages {
  external LanguageCode language;

  /// The percentage of the detected language
  external int percentage;
}
