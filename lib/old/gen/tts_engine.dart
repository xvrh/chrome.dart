/* This file has been generated from tts_engine.json - do not edit */

/**
 * Use the `chrome.ttsEngine` API to implement a text-to-speech(TTS) engine
 * using an extension. If your extension registers using this API, it will
 * receive events containing an utterance to be spoken and other parameters when
 * any extension or Chrome App uses the [tts](tts) API to generate speech. Your
 * extension can then use any available web technology to synthesize and output
 * the speech, and send events back to the calling function to report the
 * status.
 */
library chrome.ttsEngine;

import 'tts.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.ttsEngine` namespace.
 */
final ChromeTtsEngine ttsEngine = ChromeTtsEngine._();

class ChromeTtsEngine extends ChromeApi {
  JsObject get _ttsEngine => chrome['ttsEngine'];

  /**
   * Called when the user makes a call to tts.speak() and one of the voices from
   * this extension's manifest is the first to match the options object.
   */
  Stream<OnSpeakEvent> get onSpeak => _onSpeak.stream;
  late ChromeStreamController<OnSpeakEvent> _onSpeak;

  /**
   * Called when the user makes a call to tts.speak() and one of the voices from
   * this extension's manifest is the first to match the options object. Differs
   * from ttsEngine.onSpeak in that Chrome provides audio playback services and
   * handles dispatching tts events.
   */
  Stream<OnSpeakWithAudioStreamEvent> get onSpeakWithAudioStream => _onSpeakWithAudioStream.stream;
  late ChromeStreamController<OnSpeakWithAudioStreamEvent> _onSpeakWithAudioStream;

  /**
   * Fired when a call is made to tts.stop and this extension may be in the
   * middle of speaking. If an extension receives a call to onStop and speech is
   * already stopped, it should do nothing (not raise an error). If speech is in
   * the paused state, this should cancel the paused state.
   */
  Stream get onStop => _onStop.stream;
  late ChromeStreamController _onStop;

  /**
   * Optional: if an engine supports the pause event, it should pause the
   * current utterance being spoken, if any, until it receives a resume event or
   * stop event. Note that a stop event should also clear the paused state.
   */
  Stream get onPause => _onPause.stream;
  late ChromeStreamController _onPause;

  /**
   * Optional: if an engine supports the pause event, it should also support the
   * resume event, to continue speaking the current utterance, if any. Note that
   * a stop event should also clear the paused state.
   */
  Stream get onResume => _onResume.stream;
  late ChromeStreamController _onResume;

  ChromeTtsEngine._() {
    var getApi = () => _ttsEngine;
    _onSpeak = ChromeStreamController<OnSpeakEvent>.threeArgs(getApi, 'onSpeak', _createOnSpeakEvent);
    _onSpeakWithAudioStream = ChromeStreamController<OnSpeakWithAudioStreamEvent>.fiveArgs(getApi, 'onSpeakWithAudioStream', _createOnSpeakWithAudioStreamEvent);
    _onStop = new ChromeStreamController.noArgs(getApi, 'onStop');
    _onPause = new ChromeStreamController.noArgs(getApi, 'onPause');
    _onResume = new ChromeStreamController.noArgs(getApi, 'onResume');
  }

  bool get available => _ttsEngine != null;

  /**
   * Called by an engine to update its list of voices. This list overrides any
   * voices declared in this extension's manifest.
   * 
   * [voices] Array of [tts.TtsVoice] objects representing the available voices
   * for speech synthesis.
   */
  void updateVoices(List<TtsVoice> voices) {
    if (_ttsEngine == null) _throwNotAvailable();

    _ttsEngine.callMethod('updateVoices', [jsify(voices)]);
  }

  /**
   * Routes a TTS event from a speech engine to a client.
   * 
   * [event] The update event from the text-to-speech engine indicating the
   * status of this utterance.
   */
  void sendTtsEvent(int requestId, TtsEvent event) {
    if (_ttsEngine == null) _throwNotAvailable();

    _ttsEngine.callMethod('sendTtsEvent', [requestId, jsify(event)]);
  }

  /**
   * Routes TTS audio from a speech engine to a client.
   * 
   * [audio] An audio buffer from the text-to-speech engine.
   */
  void sendTtsAudio(int requestId, AudioBuffer audio) {
    if (_ttsEngine == null) _throwNotAvailable();

    _ttsEngine.callMethod('sendTtsAudio', [requestId, jsify(audio)]);
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.ttsEngine' is not available");
  }
}

/**
 * Called when the user makes a call to tts.speak() and one of the voices from
 * this extension's manifest is the first to match the options object.
 */
class OnSpeakEvent {
  /**
   * The text to speak, specified as either plain text or an SSML document. If
   * your engine does not support SSML, you should strip out all XML markup and
   * synthesize only the underlying text content. The value of this parameter is
   * guaranteed to be no more than 32,768 characters. If this engine does not
   * support speaking that many characters at a time, the utterance should be
   * split into smaller chunks and queued internally without returning an error.
   */
  final String utterance;

  /**
   * Options specified to the tts.speak() method.
   */
  final SpeakOptions options;

  /**
   * Call this function with events that occur in the process of speaking the
   * utterance.
   */
  final Object sendTtsEvent;

  OnSpeakEvent(this.utterance, this.options, this.sendTtsEvent);
}

/**
 * Called when the user makes a call to tts.speak() and one of the voices from
 * this extension's manifest is the first to match the options object. Differs
 * from ttsEngine.onSpeak in that Chrome provides audio playback services and
 * handles dispatching tts events.
 */
class OnSpeakWithAudioStreamEvent {
  /**
   * The text to speak, specified as either plain text or an SSML document. If
   * your engine does not support SSML, you should strip out all XML markup and
   * synthesize only the underlying text content. The value of this parameter is
   * guaranteed to be no more than 32,768 characters. If this engine does not
   * support speaking that many characters at a time, the utterance should be
   * split into smaller chunks and queued internally without returning an error.
   */
  final String utterance;

  /**
   * Options specified to the tts.speak() method.
   */
  final SpeakOptions options;

  /**
   * Contains the audio stream format expected to be produced by this engine.
   */
  final AudioStreamOptions audioStreamOptions;

  /**
   * Call this function with audio that occur in the process of speaking the
   * utterance.
   */
  final Object sendTtsAudio;

  /**
   * Call this function to indicate an error with rendering this utterance.
   */
  final Object sendError;

  OnSpeakWithAudioStreamEvent(this.utterance, this.options, this.audioStreamOptions, this.sendTtsAudio, this.sendError);
}

class VoiceGender extends ChromeEnum {
  static const VoiceGender MALE = const VoiceGender._('male');
  static const VoiceGender FEMALE = const VoiceGender._('female');

  static const List<VoiceGender> VALUES = const[MALE, FEMALE];

  const VoiceGender._(String str): super(str);
}

/**
 * Options specified to the tts.speak() method.
 */
class SpeakOptions extends ChromeObject {
  SpeakOptions({String? voiceName, String? lang, VoiceGender? gender, Object? rate, Object? pitch, Object? volume}) {
    if (voiceName != null) this.voiceName = voiceName;
    if (lang != null) this.lang = lang;
    if (gender != null) this.gender = gender;
    if (rate != null) this.rate = rate;
    if (pitch != null) this.pitch = pitch;
    if (volume != null) this.volume = volume;
  }
  SpeakOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The name of the voice to use for synthesis.
   */
  String get voiceName => jsProxy['voiceName'];
  set voiceName(String value) => jsProxy['voiceName'] = value;

  /**
   * The language to be used for synthesis, in the form _language_-_region_.
   * Examples: 'en', 'en-US', 'en-GB', 'zh-CN'.
   */
  String get lang => jsProxy['lang'];
  set lang(String value) => jsProxy['lang'] = value;

  /**
   * Gender of voice for synthesized speech.
   */
  VoiceGender get gender => _createVoiceGender(jsProxy['gender']);
  set gender(VoiceGender value) => jsProxy['gender'] = jsify(value);

  /**
   * Speaking rate relative to the default rate for this voice. 1.0 is the
   * default rate, normally around 180 to 220 words per minute. 2.0 is twice as
   * fast, and 0.5 is half as fast. This value is guaranteed to be between 0.1
   * and 10.0, inclusive. When a voice does not support this full range of
   * rates, don't return an error. Instead, clip the rate to the range the voice
   * supports.
   */
  Object get rate => jsProxy['rate'];
  set rate(Object value) => jsProxy['rate'] = jsify(value);

  /**
   * Speaking pitch between 0 and 2 inclusive, with 0 being lowest and 2 being
   * highest. 1.0 corresponds to this voice's default pitch.
   */
  Object get pitch => jsProxy['pitch'];
  set pitch(Object value) => jsProxy['pitch'] = jsify(value);

  /**
   * Speaking volume between 0 and 1 inclusive, with 0 being lowest and 1 being
   * highest, with a default of 1.0.
   */
  Object get volume => jsProxy['volume'];
  set volume(Object value) => jsProxy['volume'] = jsify(value);
}

/**
 * Contains the audio stream format expected to be produced by an engine.
 */
class AudioStreamOptions extends ChromeObject {
  AudioStreamOptions({int? sampleRate, int? bufferSize}) {
    if (sampleRate != null) this.sampleRate = sampleRate;
    if (bufferSize != null) this.bufferSize = bufferSize;
  }
  AudioStreamOptions.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The sample rate expected in an audio buffer.
   */
  int get sampleRate => jsProxy['sampleRate'];
  set sampleRate(int value) => jsProxy['sampleRate'] = value;

  /**
   * The number of samples within an audio buffer.
   */
  int get bufferSize => jsProxy['bufferSize'];
  set bufferSize(int value) => jsProxy['bufferSize'] = value;
}

/**
 * Parameters containing an audio buffer and associated data.
 */
class AudioBuffer extends ChromeObject {
  AudioBuffer({Object? audioBuffer, int? charIndex, bool? isLastBuffer}) {
    if (audioBuffer != null) this.audioBuffer = audioBuffer;
    if (charIndex != null) this.charIndex = charIndex;
    if (isLastBuffer != null) this.isLastBuffer = isLastBuffer;
  }
  AudioBuffer.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The audio buffer from the text-to-speech engine. It should have length
   * exactly audioStreamOptions.bufferSize and encoded as mono, at
   * audioStreamOptions.sampleRate, and as linear pcm, 32-bit signed float i.e.
   * the Float32Array type in javascript.
   */
  Object get audioBuffer => jsProxy['audioBuffer'];
  set audioBuffer(Object value) => jsProxy['audioBuffer'] = jsify(value);

  /**
   * The character index associated with this audio buffer.
   */
  int get charIndex => jsProxy['charIndex'];
  set charIndex(int value) => jsProxy['charIndex'] = value;

  /**
   * True if this audio buffer is the last for the text being spoken.
   */
  bool get isLastBuffer => jsProxy['isLastBuffer'];
  set isLastBuffer(bool value) => jsProxy['isLastBuffer'] = value;
}

OnSpeakEvent _createOnSpeakEvent(String utterance, JsObject options, JsObject sendTtsEvent) =>
    OnSpeakEvent(utterance, _createSpeakOptions(options), sendTtsEvent);
OnSpeakWithAudioStreamEvent _createOnSpeakWithAudioStreamEvent(String utterance, JsObject options, JsObject audioStreamOptions, JsObject sendTtsAudio, JsObject sendError) =>
    OnSpeakWithAudioStreamEvent(utterance, _createSpeakOptions(options), _createAudioStreamOptions(audioStreamOptions), sendTtsAudio, sendError);
VoiceGender _createVoiceGender(String value) => VoiceGender.VALUES.singleWhere((ChromeEnum e) => e.value == value);
SpeakOptions _createSpeakOptions(JsObject jsProxy) => SpeakOptions.fromProxy(jsProxy);
AudioStreamOptions _createAudioStreamOptions(JsObject jsProxy) => AudioStreamOptions.fromProxy(jsProxy);
