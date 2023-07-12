import 'src/internal_helpers.dart';
import 'src/js/i18n.dart' as $js;
export 'chrome.dart';

final _i18N = ChromeI18n._();

extension ChromeI18nExtension on Chrome {
  ChromeI18n get i18N => _i18N;
}

class ChromeI18n {
  ChromeI18n._();

  /// Gets the accept-languages of the browser. This is different from the
  /// locale used by the browser; to get the locale, use [i18n.getUILanguage].
  Future<List<LanguageCode>> getAcceptLanguages() => throw UnimplementedError();

  /// Gets the localized string for the specified message. If the message is
  /// missing, this method returns an empty string (''). If the format of the
  /// `getMessage()` call is wrong - for example, _messageName_ is not a string
  /// or the _substitutions_ array has more than 9 elements - this method
  /// returns `undefined`.
  String getMessage(
    String messageName,
    JSAny? substitutions,
    GetMessageOptions? options,
  ) =>
      throw UnimplementedError();

  /// Gets the browser UI language of the browser. This is different from
  /// [i18n.getAcceptLanguages] which returns the preferred user languages.
  String getUILanguage() => throw UnimplementedError();

  /// Detects the language of the provided text using CLD.
  Future<DetectLanguageCallbackResult> detectLanguage(String text) =>
      throw UnimplementedError();
}

/// An ISO language code such as `en` or `fr`. For a complete list of languages
/// supported by this method, see
/// [kLanguageInfoTable](http://src.chromium.org/viewvc/chrome/trunk/src/third_party/cld/languages/internal/languages.cc).
/// For an unknown language, `und` will be returned, which means that
/// [percentage] of the text is unknown to CLD
typedef LanguageCode = String;

class GetMessageOptions {
  GetMessageOptions.fromJS(this._wrapped);

  final $js.GetMessageOptions _wrapped;

  $js.GetMessageOptions get toJS => _wrapped;
}

class DetectLanguageCallbackResult {
  DetectLanguageCallbackResult.fromJS(this._wrapped);

  final $js.DetectLanguageCallbackResult _wrapped;

  $js.DetectLanguageCallbackResult get toJS => _wrapped;

  /// CLD detected language reliability
  bool get isReliable => _wrapped.isReliable;
  set isReliable(bool v) {
    throw UnimplementedError();
  }

  /// array of detectedLanguage
  DetectLanguageCallbackResultLanguages get languages =>
      DetectLanguageCallbackResultLanguages.fromJS(_wrapped.languages);
  set languages(DetectLanguageCallbackResultLanguages v) {
    throw UnimplementedError();
  }
}

class DetectLanguageCallbackResultLanguages {
  DetectLanguageCallbackResultLanguages.fromJS(this._wrapped);

  final $js.DetectLanguageCallbackResultLanguages _wrapped;

  $js.DetectLanguageCallbackResultLanguages get toJS => _wrapped;

  LanguageCode get language => LanguageCode.fromJS(_wrapped.language);
  set language(LanguageCode v) {
    throw UnimplementedError();
  }

  /// The percentage of the detected language
  int get percentage => _wrapped.percentage;
  set percentage(int v) {
    throw UnimplementedError();
  }
}
