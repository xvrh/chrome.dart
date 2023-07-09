import 'chrome.dart';
export 'chrome.dart';

final _commands = ChromeCommands._();

extension ChromeChromeCommandsExtension on Chrome {
  ChromeCommands get commands => _commands;
}

class ChromeCommands {
  ChromeCommands._();

  /// Returns all the registered extension commands for this extension and their
  /// shortcut (if active).
  void getAll() => throw UnimplementedError();

  /// Fired when a registered command is activated using a keyboard shortcut.
  Stream get onCommand => throw UnimplementedError();
}
