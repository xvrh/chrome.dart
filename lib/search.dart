import 'chrome.dart';

final _Search = ChromeSearch._();

extension ChromeChromeSearchExtension on Chrome {
  ChromeSearch get Search => _Search;
}

class ChromeSearch {
  ChromeSearch._();
}
