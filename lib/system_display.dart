import 'chrome.dart';

final _SystemDisplay = ChromeSystemDisplay._();

extension ChromeChromeSystemDisplayExtension on Chrome {
  ChromeSystemDisplay get SystemDisplay => _SystemDisplay;
}

class ChromeSystemDisplay {
  ChromeSystemDisplay._();
}
