import 'dart:js_interop';

import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSCommandsExtension on JSChrome {
  /// Use the commands API to add keyboard shortcuts that trigger actions in
  /// your extension, for example, an action to open the browser action or send
  /// a command to the extension.
  external JSCommands get commands;
}

@JS()
@staticInterop
class JSCommands {}

extension JSCommandsExtension on JSCommands {
  /// Returns all the registered extension commands for this extension and their
  /// shortcut (if active).
  external void getAll(

      /// Called to return the registered commands.
      JSFunction? callback);

  /// Fired when a registered command is activated using a keyboard shortcut.
  external Event get onCommand;
}

@JS()
@staticInterop
class Command {}

extension CommandExtension on Command {
  /// The name of the Extension Command
  external String? name;

  /// The Extension Command description
  external String? description;

  /// The shortcut active for this command, or blank if not active.
  external String? shortcut;
}
