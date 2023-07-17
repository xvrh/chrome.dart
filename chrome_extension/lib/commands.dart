import 'src/internal_helpers.dart';
import 'src/js/commands.dart' as $js;
import 'src/js/tabs.dart' as $js_tabs;
import 'tabs.dart';

export 'src/chrome.dart' show chrome;

final _commands = ChromeCommands._();

extension ChromeCommandsExtension on Chrome {
  ChromeCommands get commands => _commands;
}

class ChromeCommands {
  ChromeCommands._();

  /// Returns all the registered extension commands for this extension and their
  /// shortcut (if active).
  Future<List<Command>> getAll() {
    var $completer = Completer<List<Command>>();
    $js.chrome.commands.getAll((JSArray commands) {
      if (checkRuntimeLastError($completer)) {
        $completer.complete(commands.toDart
            .cast<$js.Command>()
            .map((e) => Command.fromJS(e))
            .toList());
      }
    }.toJS);
    return $completer.future;
  }

  /// Fired when a registered command is activated using a keyboard shortcut.
  Stream<OnCommandEvent> get onCommand =>
      $js.chrome.commands.onCommand.asStream(($c) => (
            String command,
            $js_tabs.Tab? tab,
          ) {
            $c.add(OnCommandEvent(
              command: command,
              tab: tab?.let(Tab.fromJS),
            ));
          }.toJS);
}

class Command {
  Command.fromJS(this._wrapped);

  Command({
    String? name,
    String? description,
    String? shortcut,
  }) : _wrapped = $js.Command()
          ..name = name
          ..description = description
          ..shortcut = shortcut;

  final $js.Command _wrapped;

  $js.Command get toJS => _wrapped;

  /// The name of the Extension Command
  String? get name => _wrapped.name;
  set name(String? v) {
    _wrapped.name = v;
  }

  /// The Extension Command description
  String? get description => _wrapped.description;
  set description(String? v) {
    _wrapped.description = v;
  }

  /// The shortcut active for this command, or blank if not active.
  String? get shortcut => _wrapped.shortcut;
  set shortcut(String? v) {
    _wrapped.shortcut = v;
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
