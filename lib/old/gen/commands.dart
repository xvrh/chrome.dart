/* This file has been generated from commands.json - do not edit */

/**
 * Use the commands API to add keyboard shortcuts that trigger actions in your
 * extension, for example, an action to open the browser action or send a
 * command to the extension.
 */
library chrome.commands;

import 'tabs.dart';
import '../src/common.dart';

/**
 * Accessor for the `chrome.commands` namespace.
 */
final ChromeCommands commands = ChromeCommands._();

class ChromeCommands extends ChromeApi {
  JsObject get _commands => chrome['commands'];

  /**
   * Fired when a registered command is activated using a keyboard shortcut.
   */
  Stream<OnCommandEvent> get onCommand => _onCommand.stream;
  late ChromeStreamController<OnCommandEvent> _onCommand;

  ChromeCommands._() {
    var getApi = () => _commands;
    _onCommand = ChromeStreamController<OnCommandEvent>.twoArgs(getApi, 'onCommand', _createOnCommandEvent);
  }

  bool get available => _commands != null;

  /**
   * Returns all the registered extension commands for this extension and their
   * shortcut (if active).
   */
  void getAll() {
    if (_commands == null) _throwNotAvailable();

    _commands.callMethod('getAll');
  }

  void _throwNotAvailable() {
    throw  UnsupportedError("'chrome.commands' is not available");
  }
}

/**
 * Fired when a registered command is activated using a keyboard shortcut.
 */
class OnCommandEvent {
  final String command;

  /**
   * `optional`
   */
  final Tab tab;

  OnCommandEvent(this.command, this.tab);
}

class Command extends ChromeObject {
  Command({String? name, String? description, String? shortcut}) {
    if (name != null) this.name = name;
    if (description != null) this.description = description;
    if (shortcut != null) this.shortcut = shortcut;
  }
  Command.fromProxy(JsObject jsProxy): super.fromProxy(jsProxy);

  /**
   * The name of the Extension Command
   */
  String get name => jsProxy['name'];
  set name(String value) => jsProxy['name'] = value;

  /**
   * The Extension Command description
   */
  String get description => jsProxy['description'];
  set description(String value) => jsProxy['description'] = value;

  /**
   * The shortcut active for this command, or blank if not active.
   */
  String get shortcut => jsProxy['shortcut'];
  set shortcut(String value) => jsProxy['shortcut'] = value;
}

OnCommandEvent _createOnCommandEvent(String command, JsObject tab) =>
    OnCommandEvent(command, _createTab(tab));
Tab _createTab(JsObject jsProxy) => Tab.fromProxy(jsProxy);
