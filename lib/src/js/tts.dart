import 'chrome.dart';
import 'dart:js_interop';
export 'chrome.dart';

extension JSChromeJSTtsExtension on JSChrome {
  /// Use the `chrome.tts` API to play synthesized text-to-speech (TTS). See
  /// also the related <a
  /// href='http://developer.chrome.com/extensions/ttsEngine'>ttsEngine</a> API,
  /// which allows an extension to implement a speech engine.
  external JSTts get tts;
}

@JS()
@staticInterop
class JSTts {}

extension JSTtsExtension on JSTts {
  /// Speaks text using a text-to-speech engine.
  external JSPromise speak(
    JSString utterance,
    TtsOptions? options,
  );

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
  external JSPromise isSpeaking();

  /// Gets an array of all available voices.
  external JSPromise getVoices();

  /// Used to pass events back to the function calling speak().
  external ChromeEvent get onEvent;
}

typedef EventType = JSString;

typedef VoiceGender = JSString;

@JS()
@staticInterop
class TtsOptions {}

extension TtsOptionsExtension on TtsOptions {
  /// If true, enqueues this utterance if TTS is already in progress. If false
  /// (the default), interrupts any current speech and flushes the speech queue
  /// before speaking this new utterance.
  external JSBoolean? get enqueue;

  /// The name of the voice to use for synthesis. If empty, uses any available
  /// voice.
  external JSString? get voiceName;

  /// The extension ID of the speech engine to use, if known.
  external JSString? get extensionId;

  /// The language to be used for synthesis, in the form
  /// <em>language</em>-<em>region</em>. Examples: 'en', 'en-US', 'en-GB',
  /// 'zh-CN'.
  external JSString? get lang;

  /// Gender of voice for synthesized speech.
  external VoiceGender? get gender;

  /// Speaking rate relative to the default rate for this voice. 1.0 is the
  /// default rate, normally around 180 to 220 words per minute. 2.0 is twice as
  /// fast, and 0.5 is half as fast. Values below 0.1 or above 10.0 are strictly
  /// disallowed, but many voices will constrain the minimum and maximum rates
  /// further&mdash;for example a particular voice may not actually speak faster
  /// than 3 times normal even if you specify a value larger than 3.0.
  external JSNumber? get rate;

  /// Speaking pitch between 0 and 2 inclusive, with 0 being lowest and 2 being
  /// highest. 1.0 corresponds to a voice's default pitch.
  external JSNumber? get pitch;

  /// Speaking volume between 0 and 1 inclusive, with 0 being lowest and 1 being
  /// highest, with a default of 1.0.
  external JSNumber? get volume;

  /// The TTS event types the voice must support.
  external JSArray? get requiredEventTypes;

  /// The TTS event types that you are interested in listening to. If missing,
  /// all event types may be sent.
  external JSArray? get desiredEventTypes;

  /// This function is called with events that occur in the process of speaking
  /// the utterance.
  external JSFunction? get onEvent;
}

@JS()
@staticInterop
class TtsEvent {}

extension TtsEventExtension on TtsEvent {
  /// The type can be `start` as soon as speech has started, `word` when a word
  /// boundary is reached, `sentence` when a sentence boundary is reached,
  /// `marker` when an SSML mark element is reached, `end` when the end of the
  /// utterance is reached, `interrupted` when the utterance is stopped or
  /// interrupted before reaching the end, `cancelled` when it's removed from
  /// the queue before ever being synthesized, or `error` when any other error
  /// occurs. When pausing speech, a `pause` event is fired if a particular
  /// utterance is paused in the middle, and `resume` if an utterance resumes
  /// speech. Note that pause and resume events may not fire if speech is paused
  /// in-between utterances.
  external EventType get type;

  /// The index of the current character in the utterance. For word events, the
  /// event fires at the end of one word and before the beginning of the next.
  /// The `charIndex` represents a point in the text at the beginning of the
  /// next word to be spoken.
  external JSNumber? get charIndex;

  /// The error description, if the event type is `error`.
  external JSString? get errorMessage;

  /// An ID unique to the calling function's context so that events can get
  /// routed back to the correct tts.speak call.
  external JSNumber? get srcId;

  /// True if this is the final event that will be sent to this handler.
  external JSBoolean? get isFinalEvent;

  /// The length of the next part of the utterance. For example, in a `word`
  /// event, this is the length of the word which will be spoken next. It will
  /// be set to -1 if not set by the speech engine.
  external JSNumber? get length;
}

@JS()
@staticInterop
class TtsVoice {}

extension TtsVoiceExtension on TtsVoice {
  /// The name of the voice.
  external JSString? get voiceName;

  /// The language that this voice supports, in the form
  /// <em>language</em>-<em>region</em>. Examples: 'en', 'en-US', 'en-GB',
  /// 'zh-CN'.
  external JSString? get lang;

  /// This voice's gender.
  external VoiceGender? get gender;

  /// If true, the synthesis engine is a remote network resource. It may be
  /// higher latency and may incur bandwidth costs.
  external JSBoolean? get remote;

  /// The ID of the extension providing this voice.
  external JSString? get extensionId;

  /// All of the callback event types that this voice is capable of sending.
  external JSArray? get eventTypes;
}