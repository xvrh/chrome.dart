import 'chrome.dart';
export 'chrome.dart';

final _tts = ChromeTts._();

extension ChromeChromeTtsExtension on Chrome {
  ChromeTts get tts => _tts;
}

class ChromeTts {
  ChromeTts._();
}

enum EventType {
  start('start'),
  end('end'),
  word('word'),
  sentence('sentence'),
  marker('marker'),
  interrupted('interrupted'),
  cancelled('cancelled'),
  error('error'),
  pause('pause'),
  resume('resume');

  const EventType(this.value);

  final String value;
}

enum VoiceGender {
  male('male'),
  female('female');

  const VoiceGender(this.value);

  final String value;
}
