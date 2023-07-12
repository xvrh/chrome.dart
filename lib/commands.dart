import 'src/internal_helpers.dart';
import 'tabs.dart';
import 'src/js/commands.dart' as $js;
export 'chrome.dart';

final _commands = ChromeCommands._();

extension ChromeCommandsExtension on Chrome {
  ChromeCommands get commands => _commands;
}

class ChromeCommands {
  ChromeCommands._();

  /// Returns all the registered extension commands for this extension and their
  /// shortcut (if active).
  Future<List<Command>> getAll() => throw UnimplementedError();

  /// Fired when a registered command is activated using a keyboard shortcut.
  Stream<OnCommandEvent> get onCommand => throw UnimplementedError();
}

class Command {
  Command.fromJS(this._wrapped);

  final $js.Command _wrapped;

  $js.Command get toJS => _wrapped;

  /// The name of the Extension Command
  String? get name => _wrapped.name;
  set name(String? v) {
    throw UnimplementedError();
  }

  /// The Extension Command description
  String? get description => _wrapped.description;
  set description(String? v) {
    throw UnimplementedError();
  }

  /// The shortcut active for this command, or blank if not active.
  String? get shortcut => _wrapped.shortcut;
  set shortcut(String? v) {
    throw UnimplementedError();
  }
}

class OnCommandEvent {
  OnCommandEvent({
    required this.command,
    required this.tab,
  });

  final String command;

  final Tab? tab;
}
