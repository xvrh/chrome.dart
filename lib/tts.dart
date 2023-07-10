import 'chrome.dart';
export 'chrome.dart';

final _tts = ChromeTts._();

extension ChromeTtsExtension on Chrome {
  ChromeTts get tts => _tts;
}

class ChromeTts {
  ChromeTts._();

  /// Speaks text using a text-to-speech engine.
  void speak(
    utterance,
    options,
  ) =>
      throw UnimplementedError();

  /// Stops any current speech and flushes the queue of any pending utterances.
  /// In addition, if speech was paused, it will now be un-paused for the next
  /// call to speak.
  void stop() => throw UnimplementedError();

  /// Pauses speech synthesis, potentially in the middle of an utterance. A call
  /// to resume or stop will un-pause speech.
  void pause() => throw UnimplementedError();

  /// If speech was paused, resumes speaking where it left off.
  void resume() => throw UnimplementedError();

  /// Checks whether the engine is currently speaking. On Mac OS X, the result
  /// is true whenever the system speech engine is speaking, even if the speech
  /// wasn't initiated by Chrome.
  void isSpeaking() => throw UnimplementedError();

  /// Gets an array of all available voices.
  void getVoices() => throw UnimplementedError();

  /// Used to pass events back to the function calling speak().
  Stream get onEvent => throw UnimplementedError();
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
