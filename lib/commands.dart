import 'chrome.dart';
export 'chrome.dart';

final _commands = ChromeCommands._();

extension ChromeChromeCommandsExtension on Chrome {
  ChromeCommands get commands => _commands;
}

class ChromeCommands {
  ChromeCommands._();
}
