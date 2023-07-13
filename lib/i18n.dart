import 'src/internal_helpers.dart';
import 'src/js/i18n.dart' as $js;

export 'src/chrome.dart' show chrome;

final _i18n = ChromeI18n._();

extension ChromeI18nExtension on Chrome {
  ChromeI18n get i18n => _i18n;
}

class ChromeI18n {
  ChromeI18n._();

  /// Gets the accept-languages of the browser. This is different from the
  /// locale used by the browser; to get the locale, use [i18n.getUILanguage].
  Future<List<LanguageCode>> getAcceptLanguages() {
    var $completer = Completer<List<LanguageCode>>();
    $js.chrome.i18n.getAcceptLanguages((JSArray languages) {
      $completer.complete(null);
    }.toJS);
    return $completer.future;
  }

  /// Gets the localized string for the specified message. If the message is
  /// missing, this method returns an empty string (''). If the format of the
  /// `getMessage()` call is wrong - for example, _messageName_ is not a string
  /// or the _substitutions_ array has more than 9 elements - this method
  /// returns `undefined`.
  String getMessage(
    String messageName,
    JSAny? substitutions,
    GetMessageOptions? options,
  ) {
    return $js.chrome.i18n.getMessage(
      messageName,
      substitutions,
      options?.toJS,
    );
  }

  /// Gets the browser UI language of the browser. This is different from
  /// [i18n.getAcceptLanguages] which returns the preferred user languages.
  String getUILanguage() {
    return $js.chrome.i18n.getUILanguage();
  }

  /// Detects the language of the provided text using CLD.
  Future<DetectLanguageCallbackResult> detectLanguage(String text) {
    var $completer = Completer<DetectLanguageCallbackResult>();
    $js.chrome.i18n.detectLanguage(
      text,
      (DetectLanguageCallbackResult result) {
        $completer.complete(null);
      }.toJS,
    );
    return $completer.future;
  }
}

/// An ISO language code such as `en` or `fr`. For a complete list of languages
/// supported by this method, see
/// [kLanguageInfoTable](http://src.chromium.org/viewvc/chrome/trunk/src/third_party/cld/languages/internal/languages.cc).
/// For an unknown language, `und` will be returned, which means that
/// [percentage] of the text is unknown to CLD
typedef LanguageCode = String;

class GetMessageOptions {
  GetMessageOptions.fromJS(this._wrapped);

  GetMessageOptions({bool? escapeLt})
      : _wrapped = $js.GetMessageOptions(escapeLt: escapeLt);

  final $js.GetMessageOptions _wrapped;

  $js.GetMessageOptions get toJS => _wrapped;
}

class DetectLanguageCallbackResult {
  DetectLanguageCallbackResult.fromJS(this._wrapped);

  DetectLanguageCallbackResult({
    required bool isReliable,
    required DetectLanguageCallbackResultLanguages languages,
  }) : _wrapped = $js.DetectLanguageCallbackResult()
          ..isReliable = isReliable
          ..languages = languages.toJS;

  final $js.DetectLanguageCallbackResult _wrapped;

  $js.DetectLanguageCallbackResult get toJS => _wrapped;

  /// CLD detected language reliability
  bool get isReliable => _wrapped.isReliable;
  set isReliable(bool v) {
    _wrapped.isReliable = v;
  }

  /// array of detectedLanguage
  DetectLanguageCallbackResultLanguages get languages =>
      DetectLanguageCallbackResultLanguages.fromJS(_wrapped.languages);
  set languages(DetectLanguageCallbackResultLanguages v) {
    _wrapped.languages = v.toJS;
  }
}

class DetectLanguageCallbackResultLanguages {
  DetectLanguageCallbackResultLanguages.fromJS(this._wrapped);

  DetectLanguageCallbackResultLanguages({
    required LanguageCode language,
    required int percentage,
  }) : _wrapped = $js.DetectLanguageCallbackResultLanguages()
          ..language = language
          ..percentage = percentage;

  final $js.DetectLanguageCallbackResultLanguages _wrapped;

  $js.DetectLanguageCallbackResultLanguages get toJS => _wrapped;

  LanguageCode get language => _wrapped.language;
  set language(LanguageCode v) {
    _wrapped.language = v;
  }

  /// The percentage of the detected language
  int get percentage => _wrapped.percentage;
  set percentage(int v) {
    _wrapped.percentage = v;
  }
}
