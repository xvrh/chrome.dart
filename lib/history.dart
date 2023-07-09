import 'chrome.dart';

final _History = ChromeHistory._();

extension ChromeChromeHistoryExtension on Chrome {
  ChromeHistory get History => _History;
}

class ChromeHistory {
  ChromeHistory._();
}
