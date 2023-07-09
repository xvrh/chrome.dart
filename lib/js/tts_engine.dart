import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSTtsEngineExtension on JSChrome {
  /// Use the `chrome.ttsEngine` API to implement a text-to-speech(TTS) engine
  /// using an extension. If your extension registers using this API, it will
  /// receive events containing an utterance to be spoken and other parameters
  /// when any extension or Chrome App uses the <a href='tts'>tts</a> API to
  /// generate speech. Your extension can then use any available web technology
  /// to synthesize and output the speech, and send events back to the calling
  /// function to report the status.
  external JSTtsEngine get TtsEngine;
}

@JS()
@staticInterop
class JSTtsEngine {}

extension JSTtsEngineExtension on JSTtsEngine {
  /// Called by an engine to update its list of voices. This list overrides any
  /// voices declared in this extension's manifest.
  external void updateVoices();

  /// Routes a TTS event from a speech engine to a client.
  external void sendTtsEvent();

  /// Routes TTS audio from a speech engine to a client.
  external void sendTtsAudio();

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
