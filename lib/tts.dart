import 'chrome.dart';

final _Tts = ChromeTts._();

extension ChromeChromeTtsExtension on Chrome {
  ChromeTts get Tts => _Tts;
}

class ChromeTts {
  ChromeTts._();
}
