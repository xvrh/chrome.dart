import 'chrome.dart';

final _Omnibox = ChromeOmnibox._();

extension ChromeChromeOmniboxExtension on Chrome {
  ChromeOmnibox get Omnibox => _Omnibox;
}

class ChromeOmnibox {
  ChromeOmnibox._();
}
