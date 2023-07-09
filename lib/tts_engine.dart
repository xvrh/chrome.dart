import 'chrome.dart';
export 'chrome.dart';

final _ttsEngine = ChromeTtsEngine._();

extension ChromeChromeTtsEngineExtension on Chrome {
  ChromeTtsEngine get ttsEngine => _ttsEngine;
}

class ChromeTtsEngine {
  ChromeTtsEngine._();
}

enum VoiceGender {
  male('male'),
  female('female');

  const VoiceGender(this.value);

  final String value;
}
