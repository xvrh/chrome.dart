import 'chrome.dart';

final _Power = ChromePower._();

extension ChromeChromePowerExtension on Chrome {
  ChromePower get Power => _Power;
}

class ChromePower {
  ChromePower._();
}
