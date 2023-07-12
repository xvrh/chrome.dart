import 'src/internal_helpers.dart';
import 'tts.dart';
import 'src/js/tts_engine.dart' as $js;
export 'chrome.dart';

final _ttsEngine = ChromeTtsEngine._();

extension ChromeTtsEngineExtension on Chrome {
  ChromeTtsEngine get ttsEngine => _ttsEngine;
}

class ChromeTtsEngine {
  ChromeTtsEngine._();

  /// Called by an engine to update its list of voices. This list overrides any
  /// voices declared in this extension's manifest.
  void updateVoices(List<TtsVoice> voices) => throw UnimplementedError();

  /// Routes a TTS event from a speech engine to a client.
  void sendTtsEvent(
    int requestId,
    TtsEvent event,
  ) =>
      throw UnimplementedError();

  /// Routes TTS audio from a speech engine to a client.
  void sendTtsAudio(
    int requestId,
    AudioBuffer audio,
  ) =>
      throw UnimplementedError();

  /// Called when the user makes a call to tts.speak() and one of the voices
  /// from this extension's manifest is the first to match the options object.
  Stream<OnSpeakEvent> get onSpeak => throw UnimplementedError();

  /// Called when the user makes a call to tts.speak() and one of the voices
  /// from this extension's manifest is the first to match the options object.
  /// Differs from ttsEngine.onSpeak in that Chrome provides audio playback
  /// services and handles dispatching tts events.
  Stream<OnSpeakWithAudioStreamEvent> get onSpeakWithAudioStream =>
      throw UnimplementedError();

  /// Fired when a call is made to tts.stop and this extension may be in the
  /// middle of speaking. If an extension receives a call to onStop and speech
  /// is already stopped, it should do nothing (not raise an error). If speech
  /// is in the paused state, this should cancel the paused state.
  Stream<void> get onStop => throw UnimplementedError();

  /// Optional: if an engine supports the pause event, it should pause the
  /// current utterance being spoken, if any, until it receives a resume event
  /// or stop event. Note that a stop event should also clear the paused state.
  Stream<void> get onPause => throw UnimplementedError();

  /// Optional: if an engine supports the pause event, it should also support
  /// the resume event, to continue speaking the current utterance, if any. Note
  /// that a stop event should also clear the paused state.
  Stream<void> get onResume => throw UnimplementedError();
}

enum VoiceGender {
  male('male'),
  female('female');

  const VoiceGender(this.value);

  final String value;

  String get toJS => value;
  static VoiceGender fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
}

class SpeakOptions {
  SpeakOptions.fromJS(this._wrapped);

  final $js.SpeakOptions _wrapped;

  $js.SpeakOptions get toJS => _wrapped;

  /// The name of the voice to use for synthesis.
  String? get voiceName => _wrapped.voiceName;
  set voiceName(String? v) {
    throw UnimplementedError();
  }

  /// The language to be used for synthesis, in the form _language_-_region_.
  /// Examples: 'en', 'en-US', 'en-GB', 'zh-CN'.
  String? get lang => _wrapped.lang;
  set lang(String? v) {
    throw UnimplementedError();
  }

  /// Gender of voice for synthesized speech.
  VoiceGender? get gender => _wrapped.gender?.let(VoiceGender.fromJS);
  set gender(VoiceGender? v) {
    throw UnimplementedError();
  }

  /// Speaking rate relative to the default rate for this voice. 1.0 is the
  /// default rate, normally around 180 to 220 words per minute. 2.0 is twice as
  /// fast, and 0.5 is half as fast. This value is guaranteed to be between 0.1
  /// and 10.0, inclusive. When a voice does not support this full range of
  /// rates, don't return an error. Instead, clip the rate to the range the
  /// voice supports.
  double? get rate => _wrapped.rate;
  set rate(double? v) {
    throw UnimplementedError();
  }

  /// Speaking pitch between 0 and 2 inclusive, with 0 being lowest and 2 being
  /// highest. 1.0 corresponds to this voice's default pitch.
  double? get pitch => _wrapped.pitch;
  set pitch(double? v) {
    throw UnimplementedError();
  }

  /// Speaking volume between 0 and 1 inclusive, with 0 being lowest and 1 being
  /// highest, with a default of 1.0.
  double? get volume => _wrapped.volume;
  set volume(double? v) {
    throw UnimplementedError();
  }
}

class AudioStreamOptions {
  AudioStreamOptions.fromJS(this._wrapped);

  final $js.AudioStreamOptions _wrapped;

  $js.AudioStreamOptions get toJS => _wrapped;

  /// The sample rate expected in an audio buffer.
  int get sampleRate => _wrapped.sampleRate;
  set sampleRate(int v) {
    throw UnimplementedError();
  }

  /// The number of samples within an audio buffer.
  int get bufferSize => _wrapped.bufferSize;
  set bufferSize(int v) {
    throw UnimplementedError();
  }
}

class AudioBuffer {
  AudioBuffer.fromJS(this._wrapped);

  final $js.AudioBuffer _wrapped;

  $js.AudioBuffer get toJS => _wrapped;

  /// The audio buffer from the text-to-speech engine. It should have length
  /// exactly audioStreamOptions.bufferSize and encoded as mono, at
  /// audioStreamOptions.sampleRate, and as linear pcm, 32-bit signed float i.e.
  /// the Float32Array type in javascript.
  JSAny get audioBuffer => _wrapped.audioBuffer;
  set audioBuffer(JSAny v) {
    throw UnimplementedError();
  }

  /// The character index associated with this audio buffer.
  int? get charIndex => _wrapped.charIndex;
  set charIndex(int? v) {
    throw UnimplementedError();
  }

  /// True if this audio buffer is the last for the text being spoken.
  bool? get isLastBuffer => _wrapped.isLastBuffer;
  set isLastBuffer(bool? v) {
    throw UnimplementedError();
  }
}

class OnSpeakEvent {
  OnSpeakEvent({
    required this.utterance,
    required this.options,
    required this.sendTtsEvent,
  });

  /// The text to speak, specified as either plain text or an SSML document. If
  /// your engine does not support SSML, you should strip out all XML markup and
  /// synthesize only the underlying text content. The value of this parameter
  /// is guaranteed to be no more than 32,768 characters. If this engine does
  /// not support speaking that many characters at a time, the utterance should
  /// be split into smaller chunks and queued internally without returning an
  /// error.
  final String utterance;

  /// Options specified to the tts.speak() method.
  final SpeakOptions options;

  /// Call this function with events that occur in the process of speaking the
  /// utterance.
  final JSAny sendTtsEvent;
}

class OnSpeakWithAudioStreamEvent {
  OnSpeakWithAudioStreamEvent({
    required this.utterance,
    required this.options,
    required this.audioStreamOptions,
    required this.sendTtsAudio,
    required this.sendError,
  });

  /// The text to speak, specified as either plain text or an SSML document. If
  /// your engine does not support SSML, you should strip out all XML markup and
  /// synthesize only the underlying text content. The value of this parameter
  /// is guaranteed to be no more than 32,768 characters. If this engine does
  /// not support speaking that many characters at a time, the utterance should
  /// be split into smaller chunks and queued internally without returning an
  /// error.
  final String utterance;

  /// Options specified to the tts.speak() method.
  final SpeakOptions options;

  /// Contains the audio stream format expected to be produced by this engine.
  final AudioStreamOptions audioStreamOptions;

  /// Call this function with audio that occur in the process of speaking the
  /// utterance.
  final JSAny sendTtsAudio;

  /// Call this function to indicate an error with rendering this utterance.
  final JSAny sendError;
}
