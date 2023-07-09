import 'chrome.dart';
export 'chrome.dart';

final _offscreen = ChromeOffscreen._();

extension ChromeChromeOffscreenExtension on Chrome {
  ChromeOffscreen get offscreen => _offscreen;
}

class ChromeOffscreen {
  ChromeOffscreen._();
}

enum Reason {
  ///  A reason used for testing purposes only.
  testing('TESTING'),

  ///  The offscreen document is responsible for playing audio.
  audioPLAYBACK('AUDIO_PLAYBACK'),

  ///  The offscreen document needs to embed and script an iframe in order to
  ///  modify the iframe's content.
  iframeSCRIPTING('IFRAME_SCRIPTING'),

  ///  The offscreen document needs to embed an iframe and scrape its DOM to
  ///  extract information.
  domSCRAPING('DOM_SCRAPING'),

  ///  The offscreen document needs to interact with Blob objects (including
  ///  `URL.createObjectURL()`).
  blobs('BLOBS'),

  ///  The offscreen document needs to use the `DOMParser` API.
  domPARSER('DOM_PARSER'),

  ///  The offscreen document needs to interact with media streams from user
  ///  media (e.g. `getUserMedia()`).
  userMEDIA('USER_MEDIA'),

  ///  The offscreen document needs to interact with media streams from display
  ///  media (e.g. `getDisplayMedia()</code).
  displayMEDIA('DISPLAY_MEDIA'),

  ///  The offscreen document needs to use WebRTC APIs.
  webRTC('WEB_RTC'),

  ///  The offscreen document needs to interact with the clipboard APIs
  ///  (e.g. `Navigator.clipboard`).
  clipboard('CLIPBOARD'),

  ///  The offscreen document needs access to <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage">localStorage</a>.
  localSTORAGE('LOCAL_STORAGE'),

  ///  The offscreen document needs to spawn workers.
  workers('WORKERS');

  const Reason(this.value);

  final String value;
}
