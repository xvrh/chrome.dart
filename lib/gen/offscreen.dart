/* This file has been generated from offscreen.idl - do not edit */

/**
 * Use the `offscreen` API to create and manage offscreen documents.
 */
library chrome.offscreen;

import '../src/common.dart';

/**
 * Accessor for the `chrome.offscreen` namespace.
 */
final ChromeOffscreen offscreen = ChromeOffscreen._();

class ChromeOffscreen extends ChromeApi {
  JsObject get _offscreen => chrome['offscreen'];

  ChromeOffscreen._();

  bool get available => _offscreen != null;

  /**
   * Creates a new offscreen document for the extension.
   * [parameters]: The parameters describing the offscreen document to create.
   * [callback]: Invoked when the offscreen document is created and has
   * completed its initial page load.
   */
  Future createDocument(CreateParameters parameters) {
    if (_offscreen == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _offscreen.callMethod('createDocument', [jsify(parameters), completer.callback]);
    return completer.future;
  }

  /**
   * Closes the currently-open offscreen document for the extension.
   * [callback]: Invoked when the offscreen document has been closed.
   */
  Future closeDocument() {
    if (_offscreen == null) _throwNotAvailable();

    var completer =  ChromeCompleter.noArgs();
    _offscreen.callMethod('closeDocument', [completer.callback]);
    return completer.future;
  }

  /**
   * Determines whether the extension has an active document.
   * todo(https://crbug.com/1339382): This probably isn't something we want to
   * ship in its current form (hence the nodoc). Instead of this, we should
   * integrate offscreen documents into a service worker-compatible getViews()
   * alternative. But this is pretty useful in testing environments.
   * [callback]: Invoked with the result of whether the extension has an active
   * offscreen document.
   */
  Future<bool> hasDocument() {
    if (_offscreen == null) _throwNotAvailable();

    var completer =  ChromeCompleter<bool>.oneArg();
    _offscreen.callMethod('hasDocument', [completer.callback]);
    return completer.future;
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.offscreen' is not available");
  }
}

class Reason extends ChromeEnum {
  static const Reason TESTING = const Reason._('TESTING');
  static const Reason AUDIO_PLAYBACK = const Reason._('AUDIO_PLAYBACK');
  static const Reason IFRAME_SCRIPTING = const Reason._('IFRAME_SCRIPTING');
  static const Reason DOM_SCRAPING = const Reason._('DOM_SCRAPING');
  static const Reason BLOBS = const Reason._('BLOBS');
  static const Reason DOM_PARSER = const Reason._('DOM_PARSER');
  static const Reason USER_MEDIA = const Reason._('USER_MEDIA');
  static const Reason DISPLAY_MEDIA = const Reason._('DISPLAY_MEDIA');
  static const Reason WEB_RTC = const Reason._('WEB_RTC');
  static const Reason CLIPBOARD = const Reason._('CLIPBOARD');
  static const Reason LOCAL_STORAGE = const Reason._('LOCAL_STORAGE');
  static const Reason WORKERS = const Reason._('WORKERS');

  static const List<Reason> VALUES = const[TESTING, AUDIO_PLAYBACK, IFRAME_SCRIPTING, DOM_SCRAPING, BLOBS, DOM_PARSER, USER_MEDIA, DISPLAY_MEDIA, WEB_RTC, CLIPBOARD, LOCAL_STORAGE, WORKERS];

  const Reason._(String str): super(str);
}

class CreateParameters extends ChromeObject {
  CreateParameters({List<Reason>? reasons, String? url, String? justification}) {
    if (reasons != null) this.reasons = reasons;
    if (url != null) this.url = url;
    if (justification != null) this.justification = justification;
  }
  CreateParameters.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  List<Reason> get reasons => listify(jsProxy['reasons'], _createReason);
  set reasons(List<Reason> value) => jsProxy['reasons'] = jsify(value);

  String get url => jsProxy['url'];
  set url(String value) => jsProxy['url'] = value;

  String get justification => jsProxy['justification'];
  set justification(String value) => jsProxy['justification'] = value;
}

Reason _createReason(String value) => Reason.VALUES.singleWhere((ChromeEnum e) => e.value == value);
