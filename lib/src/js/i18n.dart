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
  external JSPromise getAcceptLanguages();

  /// Gets the localized string for the specified message. If the message is
  /// missing, this method returns an empty string (''). If the format of the
  /// `getMessage()` call is wrong &mdash; for example, <em>messageName</em> is
  /// not a string or the <em>substitutions</em> array has more than 9 elements
  /// &mdash; this method returns `undefined`.
  external String getMessage(
    String messageName,
    JSAny? substitutions,
    GetMessageOptions? options,
  );

  /// Gets the browser UI language of the browser. This is different from
  /// $(ref:i18n.getAcceptLanguages) which returns the preferred user languages.
  external String getUILanguage();

  /// Detects the language of the provided text using CLD.
  external JSPromise detectLanguage(String text);
}

@JS()
@staticInterop
class LanguageCode {}

extension LanguageCodeExtension on LanguageCode {}

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
