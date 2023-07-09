import 'chrome.dart';

final _Windows = ChromeWindows._();

extension ChromeChromeWindowsExtension on Chrome {
  ChromeWindows get Windows => _Windows;
}

class ChromeWindows {
  ChromeWindows._();
}
