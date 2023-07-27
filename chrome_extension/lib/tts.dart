import 'dart:js_util';

import 'src/internal_helpers.dart';
import 'src/js/tts.dart' as $js;

export 'src/chrome.dart' show chrome;

final _tts = ChromeTts._();

extension ChromeTtsExtension on Chrome {
  /// Use the `chrome.tts` API to play synthesized text-to-speech (TTS). See
  /// also the related
  /// [ttsEngine](http://developer.chrome.com/extensions/ttsEngine) API, which
  /// allows an extension to implement a speech engine.
  ChromeTts get tts => _tts;
}

class ChromeTts {
  ChromeTts._();

  bool get isAvailable => $js.chrome.ttsNullable != null;

  /// Speaks text using a text-to-speech engine.
  /// [utterance] The text to speak, either plain text or a complete,
  /// well-formed SSML document. Speech engines that do not support SSML will
  /// strip away the tags and speak the text. The maximum length of the text
  /// is 32,768 characters.
  /// [options] The speech options.
  Future<void> speak(
    String utterance,
    TtsOptions? options,
  ) async {
    await promiseToFuture<void>($js.chrome.tts.speak(
      utterance,
      options?.toJS,
    ));
  }

  /// Stops any current speech and flushes the queue of any pending utterances.
  /// In addition, if speech was paused, it will now be un-paused for the next
  /// call to speak.
  void stop() {
    $js.chrome.tts.stop();
  }

  /// Pauses speech synthesis, potentially in the middle of an utterance. A call
  /// to resume or stop will un-pause speech.
  void pause() {
    $js.chrome.tts.pause();
  }

  /// If speech was paused, resumes speaking where it left off.
  void resume() {
    $js.chrome.tts.resume();
  }

  /// Checks whether the engine is currently speaking. On Mac OS X, the result
  /// is true whenever the system speech engine is speaking, even if the speech
  /// wasn't initiated by Chrome.
  Future<bool> isSpeaking() async {
    var $res = await promiseToFuture<bool>($js.chrome.tts.isSpeaking());
    return $res;
  }

  /// Gets an array of all available voices.
  Future<List<TtsVoice>> getVoices() async {
    var $res = await promiseToFuture<JSArray>($js.chrome.tts.getVoices());
    return $res.toDart
        .cast<$js.TtsVoice>()
        .map((e) => TtsVoice.fromJS(e))
        .toList();
  }

  /// Used to pass events back to the function calling speak().
  Stream<TtsEvent> get onEvent =>
      $js.chrome.tts.onEvent.asStream(($c) => ($js.TtsEvent event) {
            $c.add(TtsEvent.fromJS(event));
          }.toJS);
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

  String get toJS => value;
  static EventType fromJS(String value) =>
      values.firstWhere((e) => e.value == value);
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

class TtsOptions {
  TtsOptions.fromJS(this._wrapped);

  TtsOptions({
    bool? enqueue,
    String? voiceName,
    String? extensionId,
    String? lang,
    VoiceGender? gender,
    double? rate,
    double? pitch,
    double? volume,
    List<String>? requiredEventTypes,
    List<String>? desiredEventTypes,
    JSFunction? onEvent,
  }) : _wrapped = $js.TtsOptions(
          enqueue: enqueue,
          voiceName: voiceName,
          extensionId: extensionId,
          lang: lang,
          gender: gender?.toJS,
          rate: rate,
          pitch: pitch,
          volume: volume,
          requiredEventTypes: requiredEventTypes?.toJSArray((e) => e),
          desiredEventTypes: desiredEventTypes?.toJSArray((e) => e),
          onEvent: onEvent,
        );

  final $js.TtsOptions _wrapped;

  $js.TtsOptions get toJS => _wrapped;
}

class TtsEvent {
  TtsEvent.fromJS(this._wrapped);

  TtsEvent({
    required EventType type,
    int? charIndex,
    String? errorMessage,
    double? srcId,
    bool? isFinalEvent,
    int? length,
  }) : _wrapped = $js.TtsEvent()
          ..type = type.toJS
          ..charIndex = charIndex
          ..errorMessage = errorMessage
          ..srcId = srcId
          ..isFinalEvent = isFinalEvent
          ..length = length;

  final $js.TtsEvent _wrapped;

  $js.TtsEvent get toJS => _wrapped;

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
  EventType get type => EventType.fromJS(_wrapped.type);
  set type(EventType v) {
    _wrapped.type = v.toJS;
  }

  /// The index of the current character in the utterance. For word events, the
  /// event fires at the end of one word and before the beginning of the next.
  /// The `charIndex` represents a point in the text at the beginning of the
  /// next word to be spoken.
  int? get charIndex => _wrapped.charIndex;
  set charIndex(int? v) {
    _wrapped.charIndex = v;
  }

  /// The error description, if the event type is `error`.
  String? get errorMessage => _wrapped.errorMessage;
  set errorMessage(String? v) {
    _wrapped.errorMessage = v;
  }

  /// An ID unique to the calling function's context so that events can get
  /// routed back to the correct tts.speak call.
  double? get srcId => _wrapped.srcId;
  set srcId(double? v) {
    _wrapped.srcId = v;
  }

  /// True if this is the final event that will be sent to this handler.
  bool? get isFinalEvent => _wrapped.isFinalEvent;
  set isFinalEvent(bool? v) {
    _wrapped.isFinalEvent = v;
  }

  /// The length of the next part of the utterance. For example, in a `word`
  /// event, this is the length of the word which will be spoken next. It will
  /// be set to -1 if not set by the speech engine.
  int? get length => _wrapped.length;
  set length(int? v) {
    _wrapped.length = v;
  }
}

class TtsVoice {
  TtsVoice.fromJS(this._wrapped);

  TtsVoice({
    String? voiceName,
    String? lang,
    VoiceGender? gender,
    bool? remote,
    String? extensionId,
    List<EventType>? eventTypes,
  }) : _wrapped = $js.TtsVoice()
          ..voiceName = voiceName
          ..lang = lang
          ..gender = gender?.toJS
          ..remote = remote
          ..extensionId = extensionId
          ..eventTypes = eventTypes?.toJSArray((e) => e.toJS);

  final $js.TtsVoice _wrapped;

  $js.TtsVoice get toJS => _wrapped;

  /// The name of the voice.
  String? get voiceName => _wrapped.voiceName;
  set voiceName(String? v) {
    _wrapped.voiceName = v;
  }

  /// The language that this voice supports, in the form _language_-_region_.
  /// Examples: 'en', 'en-US', 'en-GB', 'zh-CN'.
  String? get lang => _wrapped.lang;
  set lang(String? v) {
    _wrapped.lang = v;
  }

  /// This voice's gender.
  VoiceGender? get gender => _wrapped.gender?.let(VoiceGender.fromJS);
  set gender(VoiceGender? v) {
    _wrapped.gender = v?.toJS;
  }

  /// If true, the synthesis engine is a remote network resource. It may be
  /// higher latency and may incur bandwidth costs.
  bool? get remote => _wrapped.remote;
  set remote(bool? v) {
    _wrapped.remote = v;
  }

  /// The ID of the extension providing this voice.
  String? get extensionId => _wrapped.extensionId;
  set extensionId(String? v) {
    _wrapped.extensionId = v;
  }

  /// All of the callback event types that this voice is capable of sending.
  List<EventType>? get eventTypes => _wrapped.eventTypes?.toDart
      .cast<$js.EventType>()
      .map((e) => EventType.fromJS(e))
      .toList();
  set eventTypes(List<EventType>? v) {
    _wrapped.eventTypes = v?.toJSArray((e) => e.toJS);
  }
}
