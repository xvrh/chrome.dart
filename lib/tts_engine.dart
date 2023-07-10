import 'chrome.dart';
export 'chrome.dart';

final _ttsEngine = ChromeTtsEngine._();

extension ChromeTtsEngineExtension on Chrome {
  ChromeTtsEngine get ttsEngine => _ttsEngine;
}

class ChromeTtsEngine {
  ChromeTtsEngine._();

  /// Called by an engine to update its list of voices. This list overrides any
  /// voices declared in this extension's manifest.
  void updateVoices(voices) => throw UnimplementedError();

  /// Routes a TTS event from a speech engine to a client.
  void sendTtsEvent(
    requestId,
    event,
  ) =>
      throw UnimplementedError();

  /// Routes TTS audio from a speech engine to a client.
  void sendTtsAudio(
    requestId,
    audio,
  ) =>
      throw UnimplementedError();

  /// Called when the user makes a call to tts.speak() and one of the voices
  /// from this extension's manifest is the first to match the options object.
  Stream get onSpeak => throw UnimplementedError();

  /// Called when the user makes a call to tts.speak() and one of the voices
  /// from this extension's manifest is the first to match the options object.
  /// Differs from ttsEngine.onSpeak in that Chrome provides audio playback
  /// services and handles dispatching tts events.
  Stream get onSpeakWithAudioStream => throw UnimplementedError();

  /// Fired when a call is made to tts.stop and this extension may be in the
  /// middle of speaking. If an extension receives a call to onStop and speech
  /// is already stopped, it should do nothing (not raise an error). If speech
  /// is in the paused state, this should cancel the paused state.
  Stream get onStop => throw UnimplementedError();

  /// Optional: if an engine supports the pause event, it should pause the
  /// current utterance being spoken, if any, until it receives a resume event
  /// or stop event. Note that a stop event should also clear the paused state.
  Stream get onPause => throw UnimplementedError();

  /// Optional: if an engine supports the pause event, it should also support
  /// the resume event, to continue speaking the current utterance, if any. Note
  /// that a stop event should also clear the paused state.
  Stream get onResume => throw UnimplementedError();
}

enum VoiceGender {
  male('male'),
  female('female');

  const VoiceGender(this.value);

  final String value;
}
