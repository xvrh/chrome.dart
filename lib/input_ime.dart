import 'chrome.dart';

final _InputIme = ChromeInputIme._();

extension ChromeChromeInputImeExtension on Chrome {
  ChromeInputIme get InputIme => _InputIme;
}

class ChromeInputIme {
  ChromeInputIme._();
}
