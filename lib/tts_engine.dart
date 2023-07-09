import 'chrome.dart';

final _TtsEngine = ChromeTtsEngine._();

extension ChromeChromeTtsEngineExtension on Chrome {
  ChromeTtsEngine get TtsEngine => _TtsEngine;
}

class ChromeTtsEngine {
  ChromeTtsEngine._();
}
