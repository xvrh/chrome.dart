import 'chrome.dart';
export 'chrome.dart';

final _i18N = ChromeI18n._();

extension ChromeChromeI18nExtension on Chrome {
  ChromeI18n get i18N => _i18N;
}

class ChromeI18n {
  ChromeI18n._();

  /// Gets the accept-languages of the browser. This is different from the
  /// locale used by the browser; to get the locale, use
  /// $(ref:i18n.getUILanguage).
  void getAcceptLanguages() => throw UnimplementedError();

  /// Gets the localized string for the specified message. If the message is
  /// missing, this method returns an empty string (''). If the format of the
  /// `getMessage()` call is wrong &mdash; for example, <em>messageName</em> is
  /// not a string or the <em>substitutions</em> array has more than 9 elements
  /// &mdash; this method returns `undefined`.
  void getMessage(
    messageName,
    substitutions,
    options,
  ) =>
      throw UnimplementedError();

  /// Gets the browser UI language of the browser. This is different from
  /// $(ref:i18n.getAcceptLanguages) which returns the preferred user languages.
  void getUILanguage() => throw UnimplementedError();

  /// Detects the language of the provided text using CLD.
  void detectLanguage(text) => throw UnimplementedError();
}
