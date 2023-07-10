import 'chrome.dart';
import 'dart:js_interop';
import 'tts.dart';
export 'chrome.dart';

extension JSChromeJSTtsEngineExtension on JSChrome {
  /// Use the `chrome.ttsEngine` API to implement a text-to-speech(TTS) engine
  /// using an extension. If your extension registers using this API, it will
  /// receive events containing an utterance to be spoken and other parameters
  /// when any extension or Chrome App uses the <a href='tts'>tts</a> API to
  /// generate speech. Your extension can then use any available web technology
  /// to synthesize and output the speech, and send events back to the calling
  /// function to report the status.
  external JSTtsEngine get ttsEngine;
}

@JS()
@staticInterop
class JSTtsEngine {}

extension JSTtsEngineExtension on JSTtsEngine {
  /// Called by an engine to update its list of voices. This list overrides any
  /// voices declared in this extension's manifest.
  external void updateVoices(JSArray voices);

  /// Routes a TTS event from a speech engine to a client.
  external void sendTtsEvent(
    JSNumber requestId,
    TtsEvent event,
  );

  /// Routes TTS audio from a speech engine to a client.
  external void sendTtsAudio(
    JSNumber requestId,
    AudioBuffer audio,
  );

  /// Called when the user makes a call to tts.speak() and one of the voices
  /// from this extension's manifest is the first to match the options object.
  external ChromeEvent get onSpeak;

  /// Called when the user makes a call to tts.speak() and one of the voices
  /// from this extension's manifest is the first to match the options object.
  /// Differs from ttsEngine.onSpeak in that Chrome provides audio playback
  /// services and handles dispatching tts events.
  external ChromeEvent get onSpeakWithAudioStream;

  /// Fired when a call is made to tts.stop and this extension may be in the
  /// middle of speaking. If an extension receives a call to onStop and speech
  /// is already stopped, it should do nothing (not raise an error). If speech
  /// is in the paused state, this should cancel the paused state.
  external ChromeEvent get onStop;

  /// Optional: if an engine supports the pause event, it should pause the
  /// current utterance being spoken, if any, until it receives a resume event
  /// or stop event. Note that a stop event should also clear the paused state.
  external ChromeEvent get onPause;

  /// Optional: if an engine supports the pause event, it should also support
  /// the resume event, to continue speaking the current utterance, if any. Note
  /// that a stop event should also clear the paused state.
  external ChromeEvent get onResume;
}

typedef VoiceGender = JSString;

@JS()
@staticInterop
class SpeakOptions {}

extension SpeakOptionsExtension on SpeakOptions {
  /// The name of the voice to use for synthesis.
  external JSString? get voiceName;

  /// The language to be used for synthesis, in the form
  /// <em>language</em>-<em>region</em>. Examples: 'en', 'en-US', 'en-GB',
  /// 'zh-CN'.
  external JSString? get lang;

  /// Gender of voice for synthesized speech.
  external VoiceGender? get gender;

  /// Speaking rate relative to the default rate for this voice. 1.0 is the
  /// default rate, normally around 180 to 220 words per minute. 2.0 is twice as
  /// fast, and 0.5 is half as fast. This value is guaranteed to be between 0.1
  /// and 10.0, inclusive. When a voice does not support this full range of
  /// rates, don't return an error. Instead, clip the rate to the range the
  /// voice supports.
  external JSNumber? get rate;

  /// Speaking pitch between 0 and 2 inclusive, with 0 being lowest and 2 being
  /// highest. 1.0 corresponds to this voice's default pitch.
  external JSNumber? get pitch;

  /// Speaking volume between 0 and 1 inclusive, with 0 being lowest and 1 being
  /// highest, with a default of 1.0.
  external JSNumber? get volume;
}

@JS()
@staticInterop
class AudioStreamOptions {}

extension AudioStreamOptionsExtension on AudioStreamOptions {
  /// The sample rate expected in an audio buffer.
  external JSNumber get sampleRate;

  /// The number of samples within an audio buffer.
  external JSNumber get bufferSize;
}

@JS()
@staticInterop
class AudioBuffer {}

extension AudioBufferExtension on AudioBuffer {
  /// The audio buffer from the text-to-speech engine. It should have length
  /// exactly audioStreamOptions.bufferSize and encoded as mono, at
  /// audioStreamOptions.sampleRate, and as linear pcm, 32-bit signed float i.e.
  /// the Float32Array type in javascript.
  external JSAny get audioBuffer;

  /// The character index associated with this audio buffer.
  external JSNumber? get charIndex;

  /// True if this audio buffer is the last for the text being spoken.
  external JSBoolean? get isLastBuffer;
}