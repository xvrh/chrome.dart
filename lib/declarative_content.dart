import 'chrome.dart';

final _DeclarativeContent = ChromeDeclarativeContent._();

extension ChromeChromeDeclarativeContentExtension on Chrome {
  ChromeDeclarativeContent get DeclarativeContent => _DeclarativeContent;
}

class ChromeDeclarativeContent {
  ChromeDeclarativeContent._();
}
