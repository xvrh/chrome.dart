import 'chrome.dart';

final _Offscreen = ChromeOffscreen._();

extension ChromeChromeOffscreenExtension on Chrome {
  ChromeOffscreen get Offscreen => _Offscreen;
}

class ChromeOffscreen {
  ChromeOffscreen._();
}
