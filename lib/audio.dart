import 'chrome.dart';

final _Audio = ChromeAudio._();

extension ChromeChromeAudioExtension on Chrome {
  ChromeAudio get Audio => _Audio;
}

class ChromeAudio {
  ChromeAudio._();
}
