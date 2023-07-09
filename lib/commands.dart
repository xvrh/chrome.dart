import 'chrome.dart';

final _Commands = ChromeCommands._();

extension ChromeChromeCommandsExtension on Chrome {
  ChromeCommands get Commands => _Commands;
}

class ChromeCommands {
  ChromeCommands._();
}
