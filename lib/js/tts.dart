import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSTtsExtension on JSChrome {
  /// Use the `chrome.tts` API to play synthesized text-to-speech (TTS). See
  /// also the related <a
  /// href='http://developer.chrome.com/extensions/ttsEngine'>ttsEngine</a> API,
  /// which allows an extension to implement a speech engine.
  external JSTts get Tts;
}

@JS()
@staticInterop
class JSTts {}

extension JSTtsExtension on JSTts {
  /// Speaks text using a text-to-speech engine.
  external void speak();

  /// Stops any current speech and flushes the queue of any pending utterances.
  /// In addition, if speech was paused, it will now be un-paused for the next
  /// call to speak.
  external void stop();

  /// Pauses speech synthesis, potentially in the middle of an utterance. A call
  /// to resume or stop will un-pause speech.
  external void pause();

  /// If speech was paused, resumes speaking where it left off.
  external void resume();

  /// Checks whether the engine is currently speaking. On Mac OS X, the result
  /// is true whenever the system speech engine is speaking, even if the speech
  /// wasn't initiated by Chrome.
  external void isSpeaking();

  /// Gets an array of all available voices.
  external void getVoices();

  /// Used to pass events back to the function calling speak().
  external ChromeEvent get onEvent;
}
